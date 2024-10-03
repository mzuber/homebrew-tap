# Homebrew Tap

A Homebrew tap for customized formulas and formulas not available in [homebrew/core](https://github.com/Homebrew/homebrew-core/).

```sh
brew tap mzuber/tap
```

## Available Formulas

#### nnn

A formula for [nnn](https://github.com/jarun/nnn), the unorthodox terminal file manager. This is an extended version of
the existing [nnn](https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/n/nnn.rb) formula in `homebrew/core` which
allows to highly customize the build.

```
n³ The unorthodox terminal file manager
https://github.com/jarun/nnn
Not installed
From: https://github.com/mzuber/homebrew-tap/blob/HEAD/Formula/nnn.rb
License: BSD-2-Clause
==> Dependencies
Required: gnu-sed ✘, ncurses ✘
Recommended: readline ✘
Optional: pcre ✘
==> Options
--with-8-contexts
  Compile with support for eight contexts
--with-icons-in-terminal-icons
  Compile with support for icons-in-terminal icons
--with-load-directories-unsorted
  Compile with support for loading directories unsorted (usable with xterm 256 colors only)
--with-matching-filters-only
  Compile with support for matching filters only (discard filter key when there's no match)
--with-nerdfont-icons
  Compile with support for Nerdfont icons
--with-pcre
  Compile with PCRE support (replaces default POSIX regex)
--with-qsort
  Compile with support for Alexey Tourbin's QSORT
--with-unicode-emoji-icons
  Compile with support for Unicode Emoji icons
--without-built-in-batch-renamer
  Compile without built-in, feature-limited batch renamer
--without-fifo
  Compile without FIFO
--without-locale
  Compile without locale support (unsupported characters in file names will be replaced by '?')
--without-mouse-support
  Compile without mouse support
--without-readline
  Compile without readline support
--without-sessions
  Compile without session support
--without-user-details-in-status-bar
  Compile without user and group details in status bar (significantly decreases resident memory usage)
--without-x11
  Compile without X11 integration (disables notifications on cp, mv, rm completion, selection sync to system clipboard and xterm title advertisement on directory change)
--HEAD
  Install HEAD version
==> Caveats
zsh completions have been installed to:
  /opt/homebrew/share/zsh/site-functions
```

## Resources

- Homebrew: [Taps (Third-Party Repositories)](https://docs.brew.sh/Taps)
- Homebrew: [How to Create and Maintain a Tap](https://docs.brew.sh/How-to-Create-and-Maintain-a-Tap)
- Homebrew: [Formula Cookbook](https://docs.brew.sh/Formula-Cookbook)
