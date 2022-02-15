ARG AWS_CDK_VERSION=2.10.0
FROM alpine:3.13

RUN apk -v --no-cache --update add \
  nodejs \
  npm \
  ca-certificates \
  bash \
  git \
  && \
  update-ca-certificates && \
  npm install -g aws-cdk@${AWS_CDK_VERSION}

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]

WORKDIR /opt/app

CMD ["cdk", "--version"]
