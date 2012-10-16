This is a [Vim](http://vim.org) syntax file for [i3](http://i3wm.org/) config file.

![Screenshot](http://ompldr.org/vZndvNg/i3-vim-syntax.png)

## Using it

You can install it using a Vim plugin manager ([Vundle], [Pathogen], …) or just by putting [i3.vim][i3vim] in your `~/.vim/syntax` directory.

I recommend you to add `# vim:set syntax=i3` at the end of your i3 config file, unless you really want to type `:set syntax=i3` every time you edit this file.

## Todo

 * Command scopes (like `[class="Firefox"]`) are not colorized yet.
 * It would be nice to have more context sensitive highlighting and some error detection.

[Vundle]:http://github.com/gmarik/vundle/
[Pathogen]:http://github.com/tpope/vim-pathogen/
[i3vim]: http://raw.github.com/PotatoesMaster/i3-vim-syntax/master/syntax/i3.vim
