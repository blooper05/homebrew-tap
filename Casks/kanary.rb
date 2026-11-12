cask "kanary" do
  version "4.2.3"
  sha256 "56f277ee93f5b88ee760ff4855b0d889f5e984abb23b69c6fdad3fc3e8103662"

  url "https://cdn.kanary.download/releases/Kanary-#{version}.zip"
  name "Kanary"
  desc "Meeting recorder and key remapper"
  homepage "https://kanary.download/"

  livecheck do
    url "https://cdn.kanary.download/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :sonoma

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
