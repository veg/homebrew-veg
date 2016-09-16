require 'formula'

class Hivtrace < Formula
  homepage 'https://github.com/veg/hivtrace'
  url 'https://github.com/veg/hivtrace/archive/0.2.0.tar.gz'
  sha1 '679de6418f719e2e0258570d1cea24a4b555d0e9'

  depends_on 'tn93'
  depends_on 'hivnetworkcsv'
  depends_on 'python3'

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python3.5/site-packages"
    system "pip3 install --upgrade numpy"
    system "pip3 install --upgrade biopython"
    system "export CC=#{HOMEBREW_PREFIX}/bin/gcc-5;export CXX=#{HOMEBREW_PREFIX}/bin/g++-5";
    system "python3", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
  test do
    system "#{bin}/hivtrace", "-v"
    system "#{bin}/hivnetworkcsv", "-h"
  end
end
