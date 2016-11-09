require 'formula'

class Tn93 < Formula

  homepage 'https://github.com/veg/TN93'
  url 'https://github.com/veg/tn93/archive/v1.0.3.tar.gz'
  sha256 '9ee0139e71c97ba13e855924de6cd42fc01ee749ee45aed666fb7c1218bd5bac'

  depends_on 'cmake' => :build
  depends_on 'gcc' => :build

  def install
    mkdir "build" do
      cmake_args = std_cmake_args
      cmake_args << "-DCMAKE_CXX_COMPILER=#{HOMEBREW_PREFIX}/bin/g++-6"
      cmake_args << "-DCMAKE_C_COMPILER=#{HOMEBREW_PREFIX}/bin/gcc-6"
      system "cmake", "-G", "Unix Makefiles", "..", *cmake_args
      system "make install"
      libexec.install "tn93"
    end
  end

  def test
    system "tn93", "-h"
  end

end

