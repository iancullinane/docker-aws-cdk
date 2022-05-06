ARG AWS_CDK_VERSION=2.22.0
ARG NPM_VERSION=7.15.1
ARG NODE_VERSION=16.13.2-r1
FROM alpine:3.13

RUN apk -v --no-cache --update add \
  nodejs \
  npm \
  ca-certificates \
  bash \
  git \
  && \
  update-ca-certificates && \
  npm install -g aws-cdk@${AWS_CDK_VERSION} \
  npm install -g typescript \
  

VOLUME [ "/root/.aws" ]
VOLUME [ "/opt/app" ]

WORKDIR /opt/app

CMD ["cdk", "--version"]
# docker run --rm -it -v ~/.aws:/root/.aws -v $(pwd):/opt/app eignhpants/docker-aws-cdk:latest cdk synth && cdk deploy
