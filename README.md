# open-everything.vim

This plugin allows you to open the path under the cursor with the correct
program. It depends on the programs _xdg-open_ and _file_.

What it supports:

* Paths like `/home/AlxHnr/.bashrc`, or `~/.bashrc`
* Paths relative to the current files directory
* URLs like https://www.github.com, www.github.com or
  [github.com](https://github.com/)
* Email addresses like foo@bar.com

Text files will be opened in the current buffer. Non-text files will be
opened using _xdg-open_. To change the default program for a specific
filetype, refer to the documentation of your desktop environment.
Open-everything uses a pretty simple set of rules to determine what to do
with the string under the cursor. Finding out whether a URL or email
address is valid or not, is the task of your browser or email client.

What it doesn't support:

* Paths containing environment variables, like `/home/$USER/.bashrc`
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
