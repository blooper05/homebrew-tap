cask "kanary" do
  version "4.1.6"
  sha256 "3ac79f29590bad59c891968d8066b2d2bff7566afd90ee78c79c6fa339f024fd"

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
