class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/1.4.1.tar.gz"
  version "1.4.1"
  sha256 "1666456372e53f87d29ad2b5402480c0e62839737dabeb93c38387fae50598e4"
  depends_on :xcode

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
  end

  test do
    system bin/"autokbisw", "--help"
  end

  plist_options :manual => "autokbisw"

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/autokbisw</string>
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>#{var}/log/autokbisw.log</string>
        <key>StandardOutPath</key>
        <string>#{var}/log/autokbisw.log</string>
      </dict>
    </plist>
    EOS
  end
end
