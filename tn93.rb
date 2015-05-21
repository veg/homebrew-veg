require 'formula'

class Tn93 < Formula
  homepage 'http://github.com/veg/TN93'
  url 'https://github.com/veg/tn93/archive/v1.0.2.tar.gz'
  sha1 '6716a4a472697d53aeb8fe436dffd0574afd92ae'
  depends_on 'cmake' 
  depends_on 'gcc' 

  def install
    system "cmake  -DCMAKE_CXX_COMPILER=/usr/local/bin/g++-5 -DCMAKE_C_COMPILER=/usr/local/bin/gcc-5 [-DCMAKE_INSTALL_PREFIX=/install/path DEFAULT /usr/local/] ./"
    system "make install"
  end

end

