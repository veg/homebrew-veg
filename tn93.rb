require 'formula'

class Tn93 < Formula
  homepage 'http://github.com/veg/TN93'
  url 'https://github.com/veg/tn93/archive/v1.0.tar.gz'
  sha1 '50f6d1a75d4898e2042c2d079eed97ad1b2af413'
  depends_on 'cmake' 

  def install
    system "cmake [-DCMAKE_INSTALL_PREFIX=/install/path DEFAULT /usr/local/] ./"
    system "make install"
  end

end

