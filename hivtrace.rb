require 'formula'

class Hivtrace < Formula
  homepage 'https://github.com/veg/HIVClustering'
  url 'https://github.com/veg/hivclustering/archive/v1.1.tar.gz'
  sha1 'cf2966c633034ba8f8b8f75ec2ae97620af7d9c6'

  depends_on 'tn93'
  depends_on 'python3'

  resource 'bioext' do
    url 'https://github.com/veg/BioExt/archive/0.17.1.tar.gz'
    sha1 'e7683100e873862adbd1edde0a102b16bc076aeb'
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
