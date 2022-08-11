# VueTorrent - Docker mod for qBittorrent

This mod adds the required and optional packages the [face recognition](https://apps.nextcloud.com/apps/facerecognition) nextcloud app needs to work.

In qBittorrent docker arguments, set an environment variable `DOCKER_MODS=linuxserver/mods:nextcloud-mediadc`

If adding multiple mods, enter them in an array separated by `|`, such as `DOCKER_MODS=linuxserver/mods:nextcloud-mediadc|linuxserver/mods:nextcloud-mod2`
