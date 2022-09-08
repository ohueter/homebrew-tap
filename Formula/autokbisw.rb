class Autokbisw < Formula
  desc "Automatic keyboard/input source switching for macOS"
  homepage "https://github.com/ohueter/autokbisw"
  url "https://github.com/ohueter/autokbisw/archive/refs/tags/1.4.3.tar.gz"
  sha256 "c5af10bbc125b53e58731fd00bcb6a8a2909a5aab568c97e1d3e54952e72257f"

  bottle do
    root_url "https://github.com/ohueter/homebrew-tap/releases/download/autokbisw-1.4.3"
    rebuild 1
    sha256 cellar: :any_skip_relocation, monterey: "c1ca98af9b6cc17acd213a780faa6c6e4591b5ea705c1d7c17d349b765c0bc5a"
    sha256 cellar: :any_skip_relocation, big_sur:  "62cacf1207687d252b9ff02f6ae81293b21368c329ecb933a88555c8633fac72"
  end
  depends_on :xcode

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/autokbisw"
  end

  plist_options manual: "autokbisw"

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

  test do
    system bin/"autokbisw", "--help"
  end
end
