cask "keylight" do
  version "0.4.1"
  # Set by ./bump once the release is out. The Release workflow's summary prints it too.
  sha256 "5058d106f816411bd7581374d28b74920e4ff1a4318c39b4876c296db0642ee7"

  url "https://github.com/AmoabaKelvin/keylight/releases/download/v#{version}/Keylight-#{version}-universal.zip"
  name "Keylight"
  desc "Lighting, shapes and keymaps for the NuPhy Air75 V3"
  homepage "https://nuphy.kelvinamoaba.com"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Keylight updates itself from GitHub releases.
  auto_updates true
  depends_on macos: :ventura

  app "Keylight.app"
  binary "#{appdir}/Keylight.app/Contents/MacOS/keylight"

  uninstall launchctl: "Keylight",
            quit:      "com.kelvinamoaba.keylight"

  zap trash: [
    "~/Library/Application Support/Keylight",
    "~/Library/Caches/com.kelvinamoaba.keylight",
    "~/Library/LaunchAgents/Keylight.plist",
    "~/Library/WebKit/com.kelvinamoaba.keylight",
  ]

  caveats <<~EOS
    Keylight isn't notarised, so macOS blocks the first launch. Open it once,
    then click Open Anyway in System Settings > Privacy & Security. Or clear
    the quarantine flag:

      xattr -dr com.apple.quarantine #{appdir}/Keylight.app
  EOS
end
