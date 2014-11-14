# open-everything.vim

This plugin allows you to open the path under the cursor with the correct
program. Just press return, and this plugin will do the right thing.

What it supports:

* URLs like https://www.github.com, www.github.com or
  [github.com](https://github.com/)
* Paths like `/home/AlxHnr/.bashrc`, or `~/.bashrc`
* Paths relative to the current files directory

Text files will be opened in the current buffer. Non-text files will be
opened using _xdg-open_. To change the default program for a specific
filetype, refer to the documentation of your desktop environment.

What it doesn't support:

* Paths containing environment variables, like `/home/$USER/.bashrc`
* Opening email addresses like foo@bar.com
* Paths which contain spaces
* Selected paths in visual mode

## Configuration

This plugin provides these options:

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
