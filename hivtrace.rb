require 'formula'

class Hivtrace < Formula
  homepage 'http://github.com/veg/HIVClustering'
  url 'https://github.com/veg/hivclustering/archive/v1.0.tar.gz'
  sha1 '18d20b5fb70eda2b1bb46c955171448f2b78b726'

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
    ENV['NPY_1_7_API_VERSION'] = '1'
    install_args = [ "setup.py", "install"]
    install_hyphy_args = [ "setup.py", "install"]
    system "pip3", "install", "cython"
    system "pip3", "install", "numpy"
    system "pip3", "install", "pysam"
    system "pip3", "install", "biopython"
    resource('bioext').stage { system "python3", *install_args }
    resource('hyphy').stage { cd "./src/lib" do system "python3", *install_hyphy_args end }
    resource('hppy').stage { system "python3", *install_args }
    system "python3", *install_args
  end

end

