syntax on

cnoremap w!! w !sudo tee % > /dev/null<CR>

" Tabs vs Spaces
set smartindent   " Do smart autoindenting when starting a new line
set shiftwidth=2  " Set number of spaces per auto indentation
set expandtab     " When using <Tab>, put spaces instead of a <tab> character
set tabstop=4   " Number of spaces that a <Tab> in the file counts for
set smarttab    " At <Tab> at beginning line inserts spaces set in shiftwidth
" Displays '-' for trailing space, '>-' for tabs and '_' for non breakable space
set listchars=tab:>-,trail:•,nbsp:_
set list

" selection colors
hi Visual term=reverse cterm=reverse ctermbg=0
