ARG ALPINE_VERSION=3.13
ARG AWS_CDK_VERSION=2.10.0
FROM alpine:${ALPINE_VERSION}

RUN apk -v --no-cache --update add \
  nodejs \
  npm \
  groff \
  python3 \
  ca-certificates \
  wget \
  less \
  make \
  curl \
  bash \
  zip \
  git \
  && \
  update-ca-certificates && \
  npm install -g aws-cdk@${AWS_CDK_VERSION}

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]

WORKDIR /opt/app

CMD ["cdk", "--version"]
