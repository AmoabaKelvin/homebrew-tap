cask "keylight" do
  version "0.3.1"
  # Set by ./bump once the release is out. The Release workflow's summary prints it too.
  sha256 "79972316f91e65c6242cca1bdef84e8ef22d985f426050bea805f18fdfc82704"

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
