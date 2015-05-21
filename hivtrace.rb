require 'formula'

class Hivtrace < Formula
  homepage 'http://github.com/veg/HIVClustering'
  url 'https://github.com/veg/hivclustering/archive/v1.1.tar.gz'
  sha1 'cf2966c633034ba8f8b8f75ec2ae97620af7d9c6'

  depends_on 'tn93'
  depends_on 'python3'

  resource 'bioext' do
    url 'https://github.com/veg/BioExt.git'
  end

  resource 'hyphy' do
    url 'https://github.com/veg/hyphy.git'
  end

  resource 'hppy' do
    url 'https://github.com/veg/hppy.git'
  end

  def install
    ENV['NPY_NO_DEPRECATED_API'] = '1'
    ENV['NPY_1_7_API_VERSION']   = '1'
    ENV['CC']                    = 'gcc-5'
    ENV['CXX']                   = 'gcc-5'
    ENV['HOMEBREW_CC']           = 'gcc-5'
    ENV['HOMEBREW_CXX']          = 'g++-5'
    

    install_args = [ "setup.py", "install"]
    install_hyphy_args = [ "setup.py", "install"]
    system "pip3", "install", "--upgrade", "cython"
    system "pip3", "install", "--upgrade", "numpy"
    system "pip3", "install", "--upgrade", "pysam"
    system "pip3", "install", "--upgrade", "biopython"
    system "pip3", "install", "--upgrade", "fakemp"
    resource('bioext').stage { system "python3", *install_args }

    ENV['CC'] = 'gcc-5'
    ENV['CXX'] = 'g++-5'
    resource('hyphy').stage { cd "./src/lib" do system "python3", *install_hyphy_args end }
    resource('hppy').stage { system "python3", *install_args }
    system "python3", *install_args
  end

end
