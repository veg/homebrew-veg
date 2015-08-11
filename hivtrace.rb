require 'formula'

class Hivtrace < Formula
  homepage 'https://github.com/veg/HIVClustering'
  url 'https://github.com/veg/hivclustering/archive/1.1.4.tar.gz'
  sha1 '2b103cc7a0422d6313c99bc300bfe3fc2513891e'

  depends_on 'tn93'
  depends_on 'python3'

  ENV['NPY_NO_DEPRECATED_API'] = '1'
  ENV['NPY_1_7_API_VERSION']   = '1'

  def install
    install_args = [ "setup.py", "install"]
    system "#{HOMEBREW_PREFIX}/bin/pip3", "install", "--upgrade", "numpy"
    system "#{HOMEBREW_PREFIX}/bin/pip3", "install", "--upgrade", "biopython"
    system "export CC=#{HOMEBREW_PREFIX}/bin/gcc-5;export CXX=#{HOMEBREW_PREFIX}/bin/g++-5; #{HOMEBREW_PREFIX}/bin/pip3 install . --process-dependency-links"
  end
end
