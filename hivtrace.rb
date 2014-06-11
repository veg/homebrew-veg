require 'formula'

class Hivtrace < Formula
  homepage 'http://github.com/veg/HIVClustering'
  head "https://github.com/veg/HIVClustering.git", :revision => "cd6e62f7e77778d54292d56be74889fe08d99bc4"
  sha1 'd3153f1bffa6fdcb6ffb6100d0efa1b09b913f0f'

  depends_on :fortran
  depends_on 'python3'

  resource 'scikit-learn' do
    url 'https://github.com/scikit-learn/scikit-learn/archive/master.zip'
    sha1 '81d1ec1b9eb4bc940aa78c5f95cfeadcbbcfad48'
  end

  resource 'bioext' do
    url 'https://github.com/veg/BioExt.git'
  end

  resource 'hyphy' do
    url 'https://github.com/veg/hyphy.git'
  end

  resource 'hppy' do
    url 'https://github.com/veg/hppy.git'
  end

  resource 'idepi' do
    url 'https://github.com/veg/idepi.git'
  end

  resource 'sklmmr' do
    url 'https://github.com/nlhepler/sklmrmr.git'
  end


  def install
    ENV['NPY_NO_DEPRECATED_API'] = '1'
    ENV['NPY_1_7_API_VERSION'] = '1'

    install_args = [ "setup.py", "install"]
    install_scipy_args = [ "setup.py", "install"]
    install_hyphy_args = [ "setup.py", "install"]
    system "pip3", "install", "cython"
    system "pip3", "install", "numpy"
    system "pip3", "install", "pysam"
    system "pip3", "install", "six"
    system "pip3", "install", "fakemp"
    system "pip3", "install", "biopython"
    resource('scikit-learn').stage { system "python3", *install_args }
    resource('bioext').stage { system "python3", *install_args }
    resource('hyphy').stage { cd "./src/lib" do system "python3", *install_hyphy_args end }
    resource('hppy').stage { system "python3", *install_args }
    resource('idepi').stage { system "python3", *install_args }
    resource('sklmmr').stage { system "python3", *install_args }
    system "python3", *install_args
  end

end

