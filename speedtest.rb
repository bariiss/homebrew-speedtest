require 'language/go'

HOMEBREW_SPEEDTEST_VERSION = '0.1.0'
class Speedtest < Formula
  homepage 'https://github.com/showwin/speedtest-go'
  url 'https://github.com/showwin/speedtest-go.git', tag: "v#{HOMEBREW_SPEEDTEST_VERSION}"
  version HOMEBREW_SPEEDTEST_VERSION
  head 'https://github.com/showwin/speedtest-go.git', branch: 'master'

  depends_on 'go' => :build
  depends_on :hg => :build

  go_resource 'github.com/cheggaaa/pb' do
    url 'https://github.com/cheggaaa/pb.git', revision: "da1f27ad1d9509b16f65f52fd9d8138b0f2dc7b2"
  end

  go_resource 'gopkg.in/alecthomas/kingpin.v2' do
    url 'https://gopkg.in/alecthomas/kingpin.v2.git', revision: "ad3f502db8f0ebd60d920400a16eabdfb7908964"
  end

  def install
    ENV['GOPATH'] = buildpath
    mkdir_p buildpath/'src/github.com/showwin/'
    ln_sf buildpath, buildpath/'src/github.com/showwin/speedtest-go'
    Language::Go.stage_deps resources, buildpath/'src'

    # build and install
    system 'go', 'build', '-o', 'speedtest'
    bin.install 'speedtest'
  end
end
