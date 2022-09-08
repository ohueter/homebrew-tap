class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  version "1.4.3"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/1.4.3.tar.gz"
  sha256 "c5af10bbc125b53e58731fd00bcb6a8a2909a5aab568c97e1d3e54952e72257f"
  depends_on :xcode
    
  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
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

