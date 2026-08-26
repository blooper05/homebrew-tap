cask "kanary" do
  version "3.3.3"
  sha256 "f7c438eaaeaa007e9f038a09d765d87df0ce17e4c62014c837c1be428994906e"

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
