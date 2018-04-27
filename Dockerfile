FROM ubuntu:xenial
MAINTAINER Dom De Re <domdere@irreverentpixelfeats.com>

ARG GHC_VERSION
ARG CABAL_VER

ENV LC_ALL=en_US.utf8
ENV TERM=xterm-256color

RUN apt-get update -y \
  && apt-get install -y dos2unix software-properties-common apt-transport-https autoconf automake build-essential libtool make gcc g++ libgmp-dev ncurses-dev libtinfo-dev python3 xz-utils dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev \
  && curl -o /tmp/ipf-public-key.asc "https://bintray.com/user/downloadSubjectPublicKey?username=irreverent-pixel-feats" \
  && dos2unix /tmp/ipf-public-key.asc \
  && apt-key add /tmp/ipf-public-key.asc \
  && apt-add-repository -y "ppa:git-core/ppa" \
  && add-apt-repository -y "https://dl.bintray.com/irreverent-pixel-feats/ipf xenial main" \
  && apt-add-repository -y "ppa:hvr/ghc" \
  && apt-get update -y \
  && apt-get install -y ghc-${GHC_VERSION} cabal-install-${CABAL_VER} git bitb zip \
  && ln -sf /opt/ghc/bin/* /usr/local/bin \
  && ln -sf /opt/cabal/bin/* /usr/local/bin \
  && cabal update


