FROM ubuntu:xenial
MAINTAINER Tim McGilchrist <timmcgil@gmail.com>

ARG GHC_VERSION
ARG CABAL_VER

ENV LC_ALL=en_US.utf8
ENV TERM=xterm-256color

RUN apt-get update -y \
  && apt-get install -y language-pack-en dos2unix software-properties-common apt-transport-https autoconf automake build-essential libtool make gcc g++ libgmp-dev ncurses-dev libtinfo-dev python3 xz-utils dh-autoreconf libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev \
  && apt-add-repository -y "ppa:git-core/ppa" \
  && apt-add-repository -y "ppa:hvr/ghc" \
  && apt-get update -y \
  && apt-get install -y ghc-${GHC_VERSION} cabal-install-${CABAL_VER} git bitb zip awscli \
  && ln -sf /opt/ghc/bin/* /usr/local/bin \
  && ln -sf /opt/cabal/bin/* /usr/local/bin \
  && cabal update
