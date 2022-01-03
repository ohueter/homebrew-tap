class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  version "1.3.0"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/1.3.0.tar.gz"
  sha256 "3d6be660201d8c79e8ff8befd1d073b8e64604fced4b5c4f9b8426100a3a1b9e"

  depends_on :xcode
    
  def install
    system "swift", "build", "-c", "release", "-Xswiftc", "-static-stdlib", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
  end
    
  test do
    system bin/"autokbisw", "--help"
  end

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
        <!--
        <string>--location</string>
        <string>-v</string>
        -->   
        <key>RunAtLoad</key>
        <true/>
        <key>KeepAlive</key>
        <true/>
        <!--
        <key>StandardOutPath</key>
        <string>${var}/log/autokbisw.log</string>
        <key>StandardErrorPath</key>
        <string>${var}/log/autokbisw.log</string>
        -->
        <key>StandardErrorPath</key>
        <string>/dev/null</string>
        <key>StandardOutPath</key>
        <string>/dev/null</string>
      </dict>
    </plist>
    EOS
  end
end

