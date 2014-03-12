execute pathogen#infect()
set tags+=./tags
set foldlevel=1
" Test helpers from Gary Bernhardt's screen cast:
" https://www.destroyallsoftware.com/screencasts/catalog/file-navigation-in-vim
" https://www.destroyallsoftware.com/file-navigation-in-vim.html
function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo
    exec ":!time rspec " . a:filename
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_spec_file = match(expand("%"), '_spec.rb$') != -1
    if in_spec_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map qf :call RunTestFile()<cr>
" Run only the example under the cursor
map qn :call RunNearestTest()<cr>
" Run all test files
map qa :call RunTests('spec')<cr>
" MY CHANGES:
set mouse=h
set wm=3
set linebreak
let &showbreak = '  '
" Open the previous file:
map q3 :e #
" Open the first file:
map q1 :e #1
" Open the second file:
map q2 :e #2
" Show files
map q4 :buffers
" Format the paragraph that you are currently in:
map qP gqip}
" 'D' for delete: delete the rest of the file (ultimate in laziness; I don't want to hold SHIFT.) :P
map qD dG
" Change text up to the next underscore (handy for ruby and perl)
map _ ct_
" Center-justify the current line (120 width)
map qc :.ce120
" Highlight searches toggle:
map qh :set hls!
set nohls
" Use CtrlP to open files:
map qo :CtrlP
" Toggle paste mode (*incredibly* useful):
map qp :set paste!
" Clear blank lines
map qb :%s/\s\+$//
" Don't want sudo write:
command! W w
" I always type this:
command Q q
" Spec runner:
map qs :w:!clear;echo "--- SPEC (and log:clear) ----";bundle exec rake log:clear RAILS_ENV=test; bundle exec rescue rspec %
map zs :w:!clear;echo "--- SPEC (and log:clear) ----";zeus rake log:clear RAILS_ENV=test; zeus test %
" Console:
map qc :!bundle exec rails console
map zc :!zeus console
" Grep project:
map qg :!git grep <cword>

" Debug line:
map ql Oputs "+" * 120
map qd Oputs "++ "i

highlight DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white 
highlight DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=black 
highlight DiffText term=reverse cterm=bold ctermbg=gray ctermfg=black 
highlight DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=black 

map ; :
noremap ;; ;

" Rebuild tags
map qt :!ctags -R --exclude=.git --exclude=tmp --exclude=logs --exclude=app/assets/javascripts --exclude=doc --exclude=generate/vendor .
