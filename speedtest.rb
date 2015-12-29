require 'formula'

HOMEBREW_SPEEDTEST_VERSION = '1.0.1'
class Speedtest < Formula
  homepage 'https://github.com/showwin/speedtest-go'
  url 'https://github.com/showwin/speedtest-go.git', tag: "v#{HOMEBREW_SPEEDTEST_VERSION}"
  version HOMEBREW_SPEEDTEST_VERSION
  head 'https://github.com/showwin/speedtest-go.git', branch: 'master'

  depends_on 'go' => :build
  depends_on :hg => :build

  def install
    ENV['GOPATH'] = buildpath
    system 'go', 'get', 'github.com/cheggaaa/pb'
    system 'go', 'get', 'gopkg.in/alecthomas/kingpin.v2'
    system 'go', 'build', '-o', 'speedtest'
    bin.install 'speedtest'
  end
end
