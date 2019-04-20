**Note**: I don't recommend using this plugin anymore. It does too much and
is inconsistent with the rest of vim. Learn to use _gf_, _K_ and the
_star_-register instead. Opening URLs and media files with external
programs is rather annoying and may happen unintentionally.

This plugin opens the item under the cursor when return is pressed. It
depends on _xdg-open_ and the _file_ command.

Here is a list of supported items, sorted by priority:

* Paths like `/home/foo/.bashrc`, or `~/.bashrc`
* Paths relative to the current file
* URLs like https://www.github.com or www.github.com
* Email addresses like foo@bar.com
* Header files like stdlib.h or glib/stdio.h
* Vim tags
* Manpages like `printf(3)`, `malloc` or `std::list`
* URLs like [github.com](https://www.github.com)

Text files will be opened in the current buffer. Non-text files will be
opened using _xdg-open_. To change the default program for a specific
filetype, refer to the documentation of your desktop environment.

## Configuration
### g:open\_everything#key

The key mapping to invoke open\_everything.

```vim
" Default:
let g:open_everything#key = '<CR>'
```

### g:open\_everything#ignore\_filetypes

```vim
" Disable key mapping for python files and vim-notes.
let g:open_everything#ignore_filetypes = { 'python' : 1, 'notes' : 1 }
```
