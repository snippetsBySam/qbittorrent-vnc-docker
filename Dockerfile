FROM ghcr.io/linuxserver/baseimage-kasmvnc:alpine318

# environment settings
ENV \
  HOME="/config" \
  TITLE="qBittorrent" \
  XDG_CONFIG_HOME="/config" \
  XDG_DATA_HOME="/config"

RUN \
  echo "**** install qbittorrent ****" && \
  apk add \
    qbittorrent && \
  echo "**** openbox tweaks ****" && \
  sed -i 's|</applications>|  <application title="qBittorrent*" type="normal">\n    <maximized>yes</maximized>\n  </application>\n</applications>|' /etc/xdg/openbox/rc.xml && \
  echo "**** cleanup ****" && \
  rm -rf \
    /tmp/*

COPY root /

EXPOSE 8080 6881 6881/udp

VOLUME /config
