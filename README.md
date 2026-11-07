# homebrew-tap

Homebrew casks for [Keylight](https://github.com/AmoabaKelvin/keylight), the Mac app for the NuPhy Air75 V3.

```sh
brew install --cask amoabakelvin/tap/keylight
```

Keylight isn't notarised. After installing, open it once and click Open Anyway in System Settings > Privacy & Security, or run `xattr -dr com.apple.quarantine /Applications/Keylight.app`.

Keylight updates itself, so `brew upgrade` skips it unless you pass `--greedy`.

## New release

Once `v<version>` is published on the keylight repo:

```sh
./bump 0.2.0
brew audit --cask --online ./Casks/keylight.rb
git commit -am "keylight 0.2.0" && git push
```

`bump` downloads the zip and writes its version and sha256 into the cask.
