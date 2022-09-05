class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  version "1.4.1"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/1.4.1.tar.gz"
  sha256 "1666456372e53f87d29ad2b5402480c0e62839737dabeb93c38387fae50598e4"

  depends_on :xcode
    
  def install
    system "swift", "build", "-c", "release", "--disable-sandbox", "--arch", "arm64", "--arch", "x86_64"
    bin.install ".build/apple/Products/Release/autokbisw"
  end
    
  test do
    system bin/"autokbisw", "--help"
  end

  def plist
    <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>Label</key>
        <string>#{plist_name}</string>
        <key>ProgramArguments</key>
        <array>
          <string>#{bin}/autokbisw</string>
          <!--
            <string>--location</string>
            <string>--verbose</string>
            <string>1</string>
          -->
        </array>
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <key>StandardErrorPath</key>
        <string>/dev/null</string>
        <key>StandardOutPath</key>
        <string>/dev/null</string>
        <!--
          <key>StandardOutPath</key>
          <string>${var}/log/autokbisw.log</string>
          <key>StandardErrorPath</key>
          <string>${var}/log/autokbisw.log</string>
        -->
      </dict>
    </plist>
    EOS
  end
end

