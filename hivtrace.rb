require 'formula'

class Hivtrace < Formula
  homepage 'https://github.com/veg/hivtrace'
  url 'https://github.com/veg/hivtrace/archive/0.2.0.tar.gz'
  sha256 'd956cddf1c8ecaab513613fc54c95161f9e4780ea71a676bff2b1281c6e37192'

  depends_on 'tn93'
  depends_on 'hivnetworkcsv'
  depends_on 'python3'

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python3.5/site-packages"
    system "pip3 install --upgrade numpy"
    system "pip3 install --upgrade biopython"
    system "pip3 install --upgrade  git+git://github.com/veg/BioExt.git@0.18.0"
    system "export CC=#{HOMEBREW_PREFIX}/bin/gcc-6;export CXX=#{HOMEBREW_PREFIX}/bin/g++-6";
    system "python3", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
  test do
    system "#{bin}/hivtrace", "-v"
    system "#{bin}/hivnetworkcsv", "-h"
  end
end
