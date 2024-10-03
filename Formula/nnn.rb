class Nnn < Formula
  desc "n³ The unorthodox terminal file manager"
  homepage "https://github.com/jarun/nnn"
  url "https://github.com/jarun/nnn/archive/refs/tags/v5.0.tar.gz"
  sha256 "31e8fd85f3dd7ab2bf0525c3c0926269a1e6d35a5343a6714315642370d8605a"
  license "BSD-2-Clause"
  head "https://github.com/jarun/nnn.git", branch: "master"

  option "with-unicode-emoji-icons", "Compile with support for Unicode Emoji icons"
  option "with-nerdfont-icons", "Compile with support for Nerdfont icons"
  option "with-icons-in-terminal-icons", "Compile with support for icons-in-terminal icons"
  option "with-pcre", "Compile with PCRE support (replaces default POSIX regex)"
  option "with-qsort", "Compile with support for Alexey Tourbin's QSORT"
  option "with-8-contexts", "Compile with support for eight contexts"
  option "with-matching-filters-only", "Compile with support for matching filters only (discard filter key when there's no match)"
  option "with-load-directories-unsorted", "Compile with support for loading directories unsorted (usable with xterm 256 colors only)"

  option "without-readline", "Compile without readline support"
  option "without-mouse-support", "Compile without mouse support"
  option "without-built-in-batch-renamer", "Compile without built-in, feature-limited batch renamer"
  option "without-fifo", "Compile without FIFO"
  option "without-sessions", "Compile without session support"
  option "without-user-details-in-status-bar", "Compile without user and group details in status bar (significantly decreases resident memory usage)"
  option "without-locale", "Compile without locale support (unsupported characters in file names will be replaced by '?')"
  option "without-x11", "Compile without X11 integration (disables notifications on cp, mv, rm completion, selection sync to system clipboard and xterm title advertisement on directory change)"

  depends_on "gnu-sed"
  depends_on "ncurses"
  depends_on "readline" => :recommended
  depends_on "pcre" => :optional

  def install
    args = []

    if build.with? "unicode-emoji-icons"
      args.append("O_EMOJI=1")
    elsif build.with? "nerdfont-icons"
      args.append("O_NERD=1")
    elsif build.with? "icons-in-terminal-icons"
      args.append("O_ICONS=1")
    elsif build.with? "pcre"
      args.append("O_PCRE=1")
    elsif build.with? "qsort"
      args.append("O_QSORT=1")
    elsif build.with? "8-contexts"
      args.append("O_CTX8=1")
    elsif build.with? "matching-filters-only"
      args.append("O_MATCHFLTR=1")
    elsif build.with? "load-directories-unsorted"
      args.append("O_NOSORT=1")
    elsif build.without? "readline"
      args.append("O_NORL=1")
    elsif build.without? "mouse-support"
      args.append("O_NOMOUSE=1")
    elsif build.without? "built-in-batch-renamer"
      args.append("O_NOBATCH=1")
    elsif build.without? "fifo"
      args.append("O_NOFIFO=1")
    elsif build.without? "sessions"
      args.append("O_NOSSN=1")
    elsif build.without? "user-details-in-status-bar"
      args.append("O_NOUG=1")
    elsif build.without? "locale"
      args.append("O_NOLC=1")
    end

    system "make", "install", "PREFIX=#{prefix}", *args

    bash_completion.install "misc/auto-completion/bash/nnn-completion.bash"
    zsh_completion.install "misc/auto-completion/zsh/_nnn"
    fish_completion.install "misc/auto-completion/fish/nnn.fish"

    pkgshare.install "misc/quitcd"
  end

  test do
    # Testing this curses app requires a pty
    require "pty"

    (testpath/"testdir").mkdir
    PTY.spawn(bin/"nnn", testpath/"testdir") do |r, w, _pid|
      w.write "q"
      assert_match "~/testdir", r.read
    end
  end
end
