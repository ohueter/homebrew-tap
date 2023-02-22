class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/1.4.3.tar.gz"
  sha256 "c5af10bbc125b53e58731fd00bcb6a8a2909a5aab568c97e1d3e54952e72257f"
  depends_on :xcode

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
  end

  service do
    run [bin/"autokbisw"]
    keep_alive true
    log_path var/"log/autokbisw.log"
    error_log_path var/"log/autokbisw.log"
  end

  test do
    system bin/"autokbisw", "--help"
  end
end
