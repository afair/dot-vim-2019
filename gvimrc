if filereadable(expand("~/.gvimrc.before"))
  source ~/.gvimrc.before
endif

"color vibrantink
"set guifont=Monaco:h12          " MacVim: ":set guifont=*" pops up font dialog
set guifont=Source\ Code\ Pro\ for\ Powerline:h14          " MacVim: ":set guifont=*" pops up font dialog
"set guifont=Menlo:h14          " MacVim: ":set guifont=*" pops up font dialog
set guioptions-=T               " Turn off toolbar
set vb                          " Visual Bell

if filereadable(expand("~/.gvimrc.local"))
  source ~/.gvimrc.local
endif
