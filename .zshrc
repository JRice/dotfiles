if [[ -e /opt/homebrew/bin/brew ]]
then
  # Homebrew — also here so non-login interactive shells get it.
  # Guarded so it doesn't duplicate PATH entries already set by ~/.zprofile.
  [[ ":$PATH:" == *":/opt/homebrew/bin:"* ]] || eval "$(/opt/homebrew/bin/brew shellenv)"
  # --- Ruby build flags (used by `mise install ruby@...`) ---------------------
  # Link against Homebrew's OpenSSL/readline/libyaml, not the Xcode/system
  # copies (system Ruby links LibreSSL).
  export RUBY_CONFIGURE_OPTS="--enable-shared --with-openssl-dir=/opt/homebrew/opt/openssl@3 --with-readline-dir=/opt/homebrew/opt/readline --with-libyaml-dir=/opt/homebrew/opt/libyaml --with-gmp-dir=/opt/homebrew/opt/gmp"
fi

# mise — manages Ruby (and other runtimes). Keep this AFTER brew shellenv so
# mise stays ahead of Homebrew and /usr/bin (the Xcode/system Ruby) on PATH.
if [[ -e /opt/homebrew/bin/mise ]]
then
  eval "$(/opt/homebrew/bin/mise activate zsh)"
else
  eval "$(/home/jrice/.local/bin/mise activate zsh)"
fi

# clang 21 warns on Ruby 3.1's own rstring.h. mkmf's -Werror probes all
# #include "ruby.h", so without this every extconf.rb werror check silently
# fails — which is what dropped the `socket` extension on the first build.
# Needed for Ruby < 3.2; harmless on newer versions.
export RUBY_CFLAGS="-O2 -Wno-default-const-init-unsafe -Wno-error=implicit-function-declaration -Wno-error=incompatible-function-pointer-types -Wno-error=int-conversion"

# Query active terminal capabilities, falling back to standard VT/xterm sequences
zmodload zsh/terminfo

bindkey -- "${terminfo[khome]:-^[[H}" beginning-of-line
bindkey -- "${terminfo[kend]:-^[[F}"   end-of-line
[[ -n "$terminfo[kdch1]" ]] && bindkey -- "$terminfo[kdch1]" delete-char

# --- Personal aliases/functions (ported from ~/.bashrc.d) --------------------
for f in ~/.zshrc.d/*.zsh(N); do source "$f"; done
unset f
