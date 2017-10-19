require 'formula'

class Hivtrace < Formula
  include Language::Python::Virtualenv
  homepage 'https://github.com/veg/hivtrace'
  url 'https://github.com/veg/hivtrace/archive/0.3.2.tar.gz'
  sha256 '7a152e1bbb82f894edc3d92686a82c3268a9404837ce8f45685d2f3a73f55deb'

  depends_on 'tn93'
  depends_on 'python3'

  def install
    venv = virtualenv_create(libexec, "python3")
    venv.pip_install "numpy"
    venv.pip_install "biopython"
    venv.pip_install "hivclustering"
    venv.pip_install "hivtrace"
    bin.install_symlink "#{libexec}/bin/hivtrace"
  end
  test do
    system "#{bin}/hivtrace", "-v"
    system "#{bin}/hivnetworkcsv", "-h"
  end
end
