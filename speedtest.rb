require 'formula'

SPEEDTEST_VERSION = '1.1.1'
class Speedtest < Formula
  homepage 'https://github.com/showwin/speedtest-go'
  url 'https://github.com/showwin/speedtest-go.git', tag: "v#{SPEEDTEST_VERSION}"
  version SPEEDTEST_VERSION
  head 'https://github.com/showwin/speedtest-go.git', branch: 'master'

  depends_on 'go' => :build
  depends_on 'mercurial' => :build

  def install
    system 'go', 'build', '-o', 'speedtest'
    bin.install 'speedtest'
  end
end
