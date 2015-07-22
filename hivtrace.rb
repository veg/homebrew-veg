require 'formula'

class Hivtrace < Formula
  homepage 'https://github.com/veg/HIVClustering'
  url 'https://github.com/veg/hivclustering/archive/1.1.1.tar.gz'
  sha1 '61cbdeef606a77ea1d62a4b1548948ad45917550'

  depends_on 'tn93'
  depends_on 'python3'

  resource 'bioext' do
    url 'https://github.com/veg/BioExt/archive/0.17.1.tar.gz'
    sha1 '36734566f66586ac234c69d221d5afa489fda990'
  end

  resource 'hyphy' do
    url 'https://github.com/veg/hyphy.git'
  end

  resource 'hppy' do
    url 'https://github.com/veg/hppy.git'
  end

  ENV['NPY_NO_DEPRECATED_API'] = '1'
  ENV['NPY_1_7_API_VERSION']   = '1'

  def install
    install_args = [ "setup.py", "install"]
    install_hyphy_args = [ "setup.py", "install"]
    system "#{HOMEBREW_PREFIX}/bin/pip3", "install", "--upgrade", "cython"
    system "#{HOMEBREW_PREFIX}/bin/pip3", "install", "--upgrade", "numpy"
    system "#{HOMEBREW_PREFIX}/bin/pip3", "install", "--upgrade", "pysam"
    system "#{HOMEBREW_PREFIX}/bin/pip3", "install", "--upgrade", "biopython"
    system "#{HOMEBREW_PREFIX}/bin/pip3", "install", "--upgrade", "fakemp"
    resource('bioext').stage { system "#{HOMEBREW_PREFIX}/bin/python3", *install_args }
    resource('hyphy').stage { cd "./src/lib" do system "export CC=#{HOMEBREW_PREFIX}/bin/gcc-5;export CXX=#{HOMEBREW_PREFIX}/bin/g++-5; #{HOMEBREW_PREFIX}/bin/python3 setup.py install" end}
    resource('hppy').stage { system "#{HOMEBREW_PREFIX}/bin/python3", *install_args }
    system "#{HOMEBREW_PREFIX}/bin/python3", *install_args
  end
end
