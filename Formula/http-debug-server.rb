require "language/go"

class HttpDebugServer < Formula
  desc ""
  homepage "https://github.com/fr05t1k/http-debug-server"
  url "https://github.com/fr05t1k/http-debug-server/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "2df6ea7db08ebbff2ce23da8df918febecf4450872380049074681c6d26f4714"
  head "https://github.com/fr05t1k/http-debug-server.git"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/fr05t1k/http-debug-server"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-ldflags", "-X 'main.Version=v#{version}'", "-o", "#{bin}/http-debug-server"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http-debug-server", "-v")
  end

end
