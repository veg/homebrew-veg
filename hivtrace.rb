require 'formula'

class Hivtrace < Formula
  homepage 'https://github.com/veg/HIVClustering'
  url 'https://github.com/veg/hivclustering/archive/1.1.2.tar.gz'
  sha1 '8289df7dfa3e02058466ea26eb523b8b7d19026e'

  depends_on 'tn93'
  depends_on 'python3'

  ENV['NPY_NO_DEPRECATED_API'] = '1'
  ENV['NPY_1_7_API_VERSION']   = '1'

  def install
    install_args = [ "setup.py", "install"]
    system "export CC=#{HOMEBREW_PREFIX}/bin/gcc-5;export CXX=#{HOMEBREW_PREFIX}/bin/g++-5; #{HOMEBREW_PREFIX}/bin/python3", *install_args
  end
end
