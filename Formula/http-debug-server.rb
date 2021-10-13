require "language/go"

class HttpDebugServer < Formula
  desc ""
  homepage "https://github.com/fr05t1k/http-debug-server"
  url "https://github.com/fr05t1k/http-debug-server/archive/refs/tags/v1.0.tar.gz"
  sha256 "8dc5127b68a016f9276f992ed549b46ce3bc4431caf34dbc7439b28777b4b71f"
  head "https://github.com/fr05t1k/http-debug-server.git"
  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    path = buildpath/"src/github.com/fr05t1k/http-debug-server"
    path.install Dir["*"]
    cd path do
      system "go", "build", "-o", "#{bin}/http-debug-server"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/http-debug-server", "-v")
  end

end
