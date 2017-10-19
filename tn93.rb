require 'formula'

class Tn93 < Formula

  homepage 'https://github.com/veg/TN93'
  url 'https://github.com/veg/tn93/archive/v1.0.4.tar.gz'
  sha256 'c92db46f253b86a05d3c294d78c42565f9c424b76428c23fe32209261d205f75'

  depends_on 'cmake' => :build
  depends_on 'gcc' => :build

  def install
    mkdir "build" do
      system "cmake", ".."
      system "make"
    end
    bin.install "build/tn93" => "tn93"
  end

  def test
    system "tn93", "-h"
  end

end

