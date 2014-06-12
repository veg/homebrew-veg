require 'formula'

depends_on 'cmake' 

class TN93 < Formula
  homepage 'http://github.com/veg/TN93'
  head "https://github.com/veg/TN93.git", :revision => "0cae5a393890098b76cb8461b09d763cc533d5c9"

  def install
    system "cmake [-DCMAKE_INSTALL_PREFIX=/install/path DEFAULT /usr/local/] ./"
    system "make install"
  end

end

