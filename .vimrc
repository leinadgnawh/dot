set nocompatible
filetype off

set number
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wincent/command-t'
Plugin 'a.vim'
Plugin 'The-NERD-Commenter'

call vundle#end()
filetype plugin indent on
filetype plugin on

