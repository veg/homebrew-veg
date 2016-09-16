require 'formula'

class Hivnetworkcsv < Formula
  homepage 'https://github.com/veg/hivtrace'
  url 'https://github.com/veg/hivclustering/archive/1.2.4.tar.gz'
  sha1 '0c1ad2288d76731ce746294a4e1beeb0443e089a'

  depends_on 'tn93'
  depends_on 'python3'

  ENV['NPY_NO_DEPRECATED_API'] = '1'
  ENV['NPY_1_7_API_VERSION']   = '1'

  def install
    ENV.prepend_create_path "PYTHONPATH", libexec/"lib/python3.5/site-packages"
    system "pip3 install --upgrade numpy"
    system "pip3 install --upgrade biopython"
    system "export CC=#{HOMEBREW_PREFIX}/bin/gcc-5;export CXX=#{HOMEBREW_PREFIX}/bin/g++-5";
    system "pip3", "install", ".", "--process-dependency-links"
    system "python3", *Language::Python.setup_install_args(libexec)
    bin.install Dir[libexec/"bin/*"]
    bin.env_script_all_files(libexec/"bin", :PYTHONPATH => ENV["PYTHONPATH"])
  end
  test do
    system "#{bin}/hivnetworkcsv", "-v"
  end
end
