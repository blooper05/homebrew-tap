cask "kanary" do
  version "3.0.0"
  sha256 "1a46e1816cd73527de0bcbec08ff6e9caf27ce9cbc6ce207ecd164102d9a7c75"

  url "https://cdn.kanary.download/releases/Kanary-#{version}.zip"
  name "Kanary"
  desc "Meeting recorder and key remapper"
  homepage "https://kanary.download/"

  livecheck do
    url "https://cdn.kanary.download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma
  depends_on arch: :arm64

  app "Kanary.app"

  uninstall quit: "download.kanary"

  zap trash: [
    "~/Library/Application Support/Kanary",
    "~/Library/Caches/download.kanary",
    "~/Library/HTTPStorages/download.kanary",
    "~/Library/Preferences/download.kanary.plist",
    "~/Library/Preferences/download.kanary.settings.plist",
    "~/Library/WebKit/download.kanary",
  ]
end
