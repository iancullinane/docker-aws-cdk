ARG AWS_CDK_VERSION=2.13.0
ARG NODE_VERSION=7.15.1
FROM alpine:3.13

RUN apk -v --no-cache --update add \
  nodejs=${NODE_VERSIN} \
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
