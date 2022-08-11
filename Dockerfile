FROM ghcr.io/linuxserver/baseimage-alpine:3.12 as buildstage

RUN \
    echo "**** install VueTorrent ****" && \
    mkdir -p /root-layer/webui && \
    RELEASE=$(wget https://api.github.com/repos/WDaan/VueTorrent/releases/latest -q -O - | grep "browser_download_url.*zip" | cut -d : -f 2,3 | tr -d \") && \
    wget $RELEASE -O VueTorrent.zip && \
    unzip VueTorrent.zip -q && \
    mv vuetorrent/* /root-layer/webui/

RUN \
    echo "**** update default configuration ****" && \
    mkdir -p /root-layer/defaults && \
    wget https://raw.githubusercontent.com/linuxserver/docker-qbittorrent/master/root/defaults/qBittorrent.conf -q -O /root-layer/defaults/qBittorrent.conf &&\
    echo -e "WebUI\RootFolder=/webui\nWebUI\AlternativeUIEnabled=true" >> /root-layer/defaults/qBittorrent.conf

## Single layer deployed image ##
FROM scratch

# Add files from buildstage
COPY --from=buildstage /root-layer/ /