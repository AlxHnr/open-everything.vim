# open-everything.vim

This plugin allows you to open the path under the cursor with the correct
program. Just press return, and open\_everything will do the rest.

What it supports:

* URLs like https://www.github.com, www.github.com or github.com
* Paths like _/home/AlxHnr/.bashrc_, or _~/.bashrc_
* Paths relative to the current files directory

Text files will be opened in the current buffer. Non-text files will be
opened using _xdg-open_. To change the default program for a specific
filetype, refer to the documentation of your desktop environment.

What it doesn't support:

* Paths containing environment variables, like _/home/$USER/.bashrc_
* Opening email addresses with your favorite client, like foo@bar.com
* Paths which contain spaces
* Selected paths in visual mode

## Configuration

Open\_everything.vim provides these options:

### g:open\_everything#ignore\_filetypes

A dictionary which contains filetypes, for which no mappings should be
defined.

```vim
" Disable mappings for python files and vim-notes.
let g:open_everything#ignore_filetypes = { 'python' : 1, 'notes' : 1 }
```

### g:open\_everything#key

The key to which open\_everything is mapped to in normal mode.

```vim
" Default:
let g:open_everything#key = '<CR>'
```

## License

Released under the zlib license.