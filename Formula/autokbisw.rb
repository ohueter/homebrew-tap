class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  license "Apache-2.0"
  depends_on :xcode

  version "1.4.1"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/1.4.1.tar.gz"
  sha256 "1666456372e53f87d29ad2b5402480c0e62839737dabeb93c38387fae50598e4"

  bottle do
    root_url "https://github.com/ohueter/autokbisw/releases/download/1.4.1"
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_monterey: "ad5b2cdc566941b9cece59553e34c5c5043b27c02583effbc4c5b5cfda41c11f"
    sha256 cellar: :any_skip_relocation, monterey: "ad5b2cdc566941b9cece59553e34c5c5043b27c02583effbc4c5b5cfda41c11f"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "a8596733b42fd2c882ecfd677ec225844665b9856fc2eb35bb1bffcb21d6bf15"
    sha256 cellar: :any_skip_relocation, big_sur:  "a8596733b42fd2c882ecfd677ec225844665b9856fc2eb35bb1bffcb21d6bf15"
  end

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

