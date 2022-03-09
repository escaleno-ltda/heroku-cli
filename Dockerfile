FROM node:14.19.0-alpine3.15

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV VERSION=7.42.2

WORKDIR /home/node

# Install docker
RUN apk add --no-cache docker=20.10.11-r0

# Install npm dependencies
RUN npm i -g heroku@$VERSION

# Change default user to node
USER node

CMD ["heroku"]
