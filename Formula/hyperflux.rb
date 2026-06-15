class Hyperflux < Formula
  desc "Lightweight CLI download accelerator (fork of Axel) with URL range/list expansion"
  homepage "https://github.com/Athanor-Lab/hyperflux"
  url "https://github.com/Athanor-Lab/hyperflux/releases/download/v1.0.0/flux-1.0.0.tar.gz"
  sha256 "3646dd6055d4cf89d96dd20fc4f434121a2360816a8e565dc2ab2ce62642213f"
  license "GPL-2.0-or-later"

  head do
    url "https://github.com/Athanor-Lab/hyperflux.git", branch: "master"

    depends_on "autoconf" => :build
    depends_on "autoconf-archive" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
    depends_on "txt2man" => :build
  end

  depends_on "gettext" => :build
  depends_on "pkg-config" => :build
  depends_on "openssl@3"

  def install
    system "autoreconf", "--force", "--install" if build.head?
    system "./configure", "--prefix=#{prefix}", "--disable-Werror"
    system "make"
    system "make", "install"
  end

  test do
    assert_match "Hyperflux", shell_output("#{bin}/flux --version")
  end
end
