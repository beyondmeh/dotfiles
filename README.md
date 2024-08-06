# dotfiles

> These are my dotfiles. There are many dotfile repos, but this one is mine.  
> My dotfiles are my best friend. They are my life. I must master what
> they config as I must master my life.  
> Without me, my dotfiles are useless. Without my dotfiles, I am useless.
>
> -- The Linux User's Creed

These config files I use in my environment and the various shell scripts
I have in my `$PATH`. *You know... dotfiles*.

#### Table of Contents
- [Overview](#overview)
- `~/bin` **[Shell Script Listings](https://github.com/beyondmeh/dotfiles/tree/master/bin#dotfiles-bin)**
- [Installing](#install)
- [Feedback](#feedback)
- [Author](#author)

**Obligatory Warning**  
You should first fork this repository, review the code, and remove
things you don't want or need. Don't blindly use my settings unless you
know what that entails. *Here be dragons!*

---

## Overview
<a name="overview"></a>
Here's a high level overview if you just want to see what I use:

| Category                | Program                                                  |
| ----------------------- | -------------------------------------------------------- |
| **OS**:             | [macOS Sonoma](https://www.apple.com/macos/sonoma/)               |             |
| **Browser**:            | [Safari](https://www.apple.com/safari/) + [StopTheMadness Pro](https://apps.apple.com/app/stopthemadness-pro/id6471380298) + [Wipr](https://apps.apple.com/us/app/wipr/id1320666476)        |
| **Shell**:              | [Fish](https://fishshell.com) + [Starship](https://starship.rs)              |
| **Shell Theme**:        | [Dracula](https://draculatheme.com) |
| **Editor**:             | [Helix](https://helix-editor.com)                             |
| **IDE**:                | [Sublime Text](https://www.sublimetext.com)     |

## Installation / Managing
<a name="install"></a>

Installation and day-to-day management requires only git as a dependency. No
other tools or symlinking are required:

```console
$ cd ~
$ git clone --no-checkout https://github.com/beyondmeh/dotfiles.git .
$ git reset --hard
```

**WARNING**: The above will clobber any existing dotfiles in your $HOME. You may want to run `git status` 
before running `git reset --hard`. Or you can use `deploy.sh`, which will sanely warn before clobbering.


### Bug Reports
Submit bug reports via GitHub's [Issue Tracker](https://github.com/beyondmeh/dotfiles/issues)


## Author
Copyright &copy; 2016 - 2024 BeyondMeh, except where otherwise noted.

Licensed under the [ISC license](https://github.com/beyondmeh/dotfiles/blob/master/LICENSE).

*This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.*
