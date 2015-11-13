# delete.vim

### Basics
This plugin has one simple function - it allows you to delete a line above or
below your current line without ever moving your cursor.

By default, this overwrites `gd` (for "go delete", if you happen to like
mnemonics). In order to use this plugin, all you really have to do is type `gd`,
the number of lines to move up/down, and the direction (`j` or `k`). For
instance, to delete a line 10 lines above your current line, type `gd10k`. 

### Options
Of course, it wouldn't be a proper plugin without a few configuration options.
Due to how simple this plugin is though, there really isn't much to customize.

You can set `g:delete_default_register` if you'd like to put the contents of
your deleted line into a specific register.

Set `g:delete_no_register` to ensure that your deletions get put in the "black
hole" register, (`_`).

You can change the mapping if you so choose. This can be done by setting
`g:delete_custom_mapping`.

You can also decide not to have a mapping, if you'd like to temporarily disable
the plugin without deleting it. Simply set `g:delete_no_mapping` to 1.

### Coming Soon...
* Deleting ranges of lines
* Specifying a register for a specific run
