require 'formula'

class Hivtrace < Formula
  homepage 'https://github.com/veg/hivtrace'
  url 'https://github.com/veg/hivtrace/archive/0.1.4.tar.gz'
  sha1 'ee4b76d60eddef17f649a139b41c0325a35a7397'

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
