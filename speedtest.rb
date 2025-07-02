require 'formula'

SPEEDTEST_VERSION = '1.7.10'
class Speedtest < Formula
  desc 'speedtest cli'
  homepage 'https://github.com/bariiss/speedtest-go'
  url 'https://github.com/bariiss/speedtest-go.git', tag: "v#{SPEEDTEST_VERSION}"
  version SPEEDTEST_VERSION
  head 'https://github.com/bariiss/speedtest-go.git', branch: 'master'

  depends_on 'go' => :build
  depends_on 'mercurial' => :build

  def install
    system 'go', 'build', '-o', 'speedtest-go'
    bin.install 'speedtest-go' => 'speedtest'
  end

  test do
    system "#{bin}/speedtest", "--version"
  end
end
