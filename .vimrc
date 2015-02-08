set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/command-t'
Plugin 'a.vim'
Plugin 'The-NERD-Commenter'
Plugin 'wting/rust.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'fatih/vim-go'
Plugin 'rking/ag.vim'

call vundle#end()
filetype plugin indent on

set number
set dir=~/.vim/swap//,/var/tmp//,/tmp//,.

syntax on

cmap w!! w !sudo tee > /dev/null %

