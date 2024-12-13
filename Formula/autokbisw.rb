class Autokbisw < Formula
  desc "Automatic keyboard input language switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  version "2.0.0"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/2.0.0.tar.gz"
  sha256 "25b04edf093b2b19c2c58c3496b1125fb338fce944e31a8c25c7df7aa48da44a"
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
