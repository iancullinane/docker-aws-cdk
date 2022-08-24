ARG ALPINE_VERSION=3.13
FROM alpine:${ALPINE_VERSION}

ARG AWS_CDK_VERSION=2.29.1
ARG DOTNET_VERSION=5.0

RUN apk -v --no-cache --update add \
  bash \
  icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib \
  nodejs npm \
  make \
  python3 py3-pip \
  ca-certificates \
  git \
  curl \
  rust cargo \
  && \
  update-ca-certificates && \
  pip3 install --upgrade pip && \
  pip3 install --no-cache-dir awscli && \
  npm install -g aws-cdk@${AWS_CDK_VERSION} && \
  npm install -g cdk-assets && \
  npm install -g typescript 

# Install dotnet
RUN wget https://dot.net/v1/dotnet-install.sh -O $HOME/dotnet-install.sh
RUN chmod +x $HOME/dotnet-install.sh
RUN $HOME/dotnet-install.sh -c ${DOTNET_VERSION} --install-dir /bin/dotnet

ENV PATH="${PATH}:/bin/dotnet"

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]

WORKDIR /opt/app

CMD ["cdk", "--version"]
