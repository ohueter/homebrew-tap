class Autokbisw < Formula
  desc "Automatic keyboard input language switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  version "2.0.1"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/2.0.1.tar.gz"
  sha256 "f68c2dd6f1b05058ec57202023a5a628b9ff7dba0fa86e58e2a4219a1c26ef2d"
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
