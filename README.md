# open-everything.vim

This plugin allows you to open the path or URL under the cursor by pressing
return. It depends on the programs _xdg-open_ and _file_.

Here is a list of supported things, sorted by priority:

* Paths like `/home/foo/.bashrc`, or `~/.bashrc`
* Paths relative to the current files directory
* URLs like https://www.github.com or www.github.com
* Email addresses like foo@bar.com
* Header files like stdlib.h or glib/stdio.h
* Vim tags
* URLs like github.com

Text files will be opened in the current buffer. Non-text files will be
opened using _xdg-open_. To change the default program for a specific
filetype, refer to the documentation of your desktop environment.
Open-everything uses a pretty simple set of rules to determine what to do
with the string under the cursor. Finding out whether a URL or email
address is valid or not is the task of your browser or email client.

This plugin doesn't support paths containing whitespaces. It also can't
open selected paths in visual mode yet.

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
