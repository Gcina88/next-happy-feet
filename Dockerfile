FROM        node:16-alpine3.15

LABEL       org.opencontainers.image.title="Happy Feet Prep App" \
            org.opencontainers.image.description="School application" \
            org.opencontainers.image.authors="g.msibi@icloud.com"
            
ENV         PORT=3000

WORKDIR     /usr/src/app

COPY        package.json yarn.lock ./

RUN         yarn

COPY        . .

EXPOSE      $PORT

ENTRYPOINT  ["yarn", "dev"]
