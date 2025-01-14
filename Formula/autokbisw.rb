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

  def post_install
    track_install(formula_name: name, version: version)
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

  private def track_install(formula_name:, version:)
    # Skip if the user has opted out of Homebrew analytics 
    return if ENV["HOMEBREW_NO_ANALYTICS"]
  
    require "uri"
    require "net/http"
    require "json"
  
    system_language = (ENV["LANGUAGE"] || ENV["LC_ALL"] || ENV["LC_MESSAGES"] || ENV["LANG"] || "en-US").split(":")[0]
    system_language = "en-US" if system_language == "C"
  
    payload = {
      name: formula_name,
      version: version,
      systemLanguage: system_language || "",
    }
  
    begin
      uri = URI("https://homebrew-telemetry.ohueter.workers.dev")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      
      request = Net::HTTP::Post.new(uri)
      request["Content-Type"] = "application/json"
      request.body = payload.to_json
  
      http.request(request)
    rescue
    end
  end
end
