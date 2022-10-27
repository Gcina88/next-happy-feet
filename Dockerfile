FROM node:16-alpine3.15 AS base

LABEL org.opencontainers.image.title="Happy Feet Prep App" \
      org.opencontainers.image.description="School application" \
      org.opencontainers.image.authors="g.msibi@icloud.com"

FROM base AS deps
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install

FROM base
WORKDIR /app
COPY . .
COPY --from=deps /app/node_modules ./node_modules
EXPOSE 3000
ENTRYPOINT ["yarn", "dev"]
