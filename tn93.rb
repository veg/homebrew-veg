require 'formula'

class Tn93 < Formula
  homepage 'https://github.com/veg/TN93'
  url 'https://github.com/veg/tn93/archive/v1.0.2.tar.gz'
  sha1 '6716a4a472697d53aeb8fe436dffd0574afd92ae'
  depends_on 'cmake' => :build
  depends_on 'gcc' => :build

  def install
    system "cmake  -DCMAKE_CXX_COMPILER=#{HOMEBREW_PREFIX}/bin/g++-5 -DCMAKE_C_COMPILER=#{HOMEBREW_PREFIX}/bin/gcc-5 ./"
    system "make install"
  end

end

