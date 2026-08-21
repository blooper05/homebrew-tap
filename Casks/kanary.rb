cask "kanary" do
  version "3.2.0"
  sha256 "44fca552be10f51d0b4f960270476e4b65d828e55c146b0f126d56c4e9515eb9"

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
