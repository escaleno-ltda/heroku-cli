FROM node:14.5.0-alpine3.12

LABEL maintainer "Leonardo Gatica <lgatica@protonmail.com>"

ENV VERSION=7.42.2

WORKDIR /home/node

# Install docker
RUN apk add --no-cache docker=19.03.11-r0

# Install npm dependencies
RUN npm i -g heroku@$VERSION

# Change default user to node
USER node

CMD ["heroku"]
