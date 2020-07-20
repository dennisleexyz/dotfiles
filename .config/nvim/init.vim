let mapleader =","

if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'junegunn/goyo.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'bling/vim-airline'
Plug 'tpope/vim-commentary'
Plug 'kovetskiy/sxhkd-vim'
Plug 'ap/vim-css-color'
Plug 'lilydjwg/fcitx.vim'
Plug 'cespare/vim-toml'
Plug 'weakish/rcshell.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'} " Code Completion
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy find files
Plug 'kana/vim-textobj-user'
Plug 'reedes/vim-textobj-quote'
" Working with tags
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'
" Syntax highlighting
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'unblevable/quick-scope'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Motions
Plug 'justinmk/vim-sneak'
" Misc
Plug 'tpope/vim-repeat'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'
Plug 'dhruvasagar/vim-table-mode'
" Plug 'takac/vim-hardtime'
Plug 'tpope/vim-rsi'
call plug#end()

set bg=light
set go=a
set mouse=a
set nohlsearch
set clipboard+=unnamedplus
let g:hardtime_default_on = 1

"set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Some basics:
	nnoremap c "_c
	set nocompatible
	filetype plugin on
	syntax on
	set encoding=utf-8
	set number relativenumber
	" set termguicolors
	set linebreak
	" set tw=100
" Enable autocompletion:
	set wildmode=longest,list,full
" Disable auto comment
	map <leader>C :setlocal formatoptions-=cro<CR>

" Goyo plugin makes text more readable when writing prose:
	map <leader>f :Goyo \| set bg=light \| set linebreak<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
	map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right, which is non-retarded, unlike vim defaults.
	set splitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
    if has('nvim')
        let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
    else
        let NERDTreeBookmarksFile = '~/.vim' . '/NERDTreeBookmarks'
    endif

" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Replace ex mode with gq
	map Q gq

" Check file in shellcheck:
	map <leader>s :!clear && shellcheck %<CR>

" Open my bibliography file in split
	" map <leader>b :vsp<space>$BIB<CR>
	" map <leader>r :vsp<space>$REFER<CR>

" Replace external filter with external command
	nnoremap ! :!

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what I want:
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
	map <leader>v :VimwikiIndex
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	" autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
	autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff
	" autocmd BufRead,BufNewFile *.tex set filetype=tex
	autocmd BufRead,BufNewFile *.txt,*.md set filetype=markdown tw=72 | let g:textobj#quote#educate = 1
	autocmd BufRead,BufNewFile *.diff set tw=72
	" autocmd BufRead,BufNewFile *.html set expandtab shiftwidth=4 softtabstop=4 tabstop=4
	autocmd BufRead,BufNewFile *.txt,*.md,*.html,*.css,*.js,*.jsx,*.ts,*.tsx set expandtab shiftwidth=2 softtabstop=2 tabstop=2
	autocmd BufRead,BufNewFile *.py set noexpandtab shiftwidth=4 softtabstop=4 tabstop=4

map <silent> <leader>qc <Plug>ReplaceWithCurly
map <silent> <leader>qs <Plug>ReplaceWithStraight

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Enable Goyo by default for mutt writing
	autocmd BufRead,BufNewFile /tmp/neomutt* let g:goyo_width=80
	autocmd BufRead,BufNewFile /tmp/neomutt* :Goyo | set bg=light
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZZ :Goyo\|x!<CR>
	autocmd BufRead,BufNewFile /tmp/neomutt* map ZQ :Goyo\|q!<CR>

" Automatically deletes all trailing whitespace and newlines at end of file on save.
	autocmd BufWritePre * %s/\s\+$//e
	autocmd BufWritepre * %s/\n\+\%$//e

" ------Standard Bindings------
" Basic file system commands
	nnoremap <A-m> :!mv<Space>%<Space>

" Fix indenting visual block
	vmap < <gv
	vmap > >gv

" Shortcutting split navigation
map <A-h> <C-w>h
map <A-j> <C-w>j
map <A-k> <C-w>k
map <A-l> <C-w>l

" Tab shortcuts
nnoremap <A-p> :tabp<CR>
nnoremap <A-n> :tabn<CR>

" Alias write  nd quit to Q
nnoremap <leader>q :wq<CR>
nnoremap <leader>w :w<CR>

" When shortcut files are updated, renew bash and ranger configs with new material:
	autocmd BufWritePost files,directories !shortcuts
" Run xrdb whenever Xdefaults or Xresources are updated.
	autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
" Update binds when sxhkdrc is updated.
	autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
	highlight! link DiffText MatchParen
endif
