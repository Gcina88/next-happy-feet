FROM node:16-alpine3.15

LABEL org.opencontainers.image.title="Happy Feet Prep App" \
      org.opencontainers.image.description="School application" \
      org.opencontainers.image.authors="g.msibi@icloud.com"

# Create directory in container image for app code
RUN mkdir -p /usr/src/app

# Copy app code (.) to /usr/src/app in container image
COPY . /usr/src/app

# Set working directory context
WORKDIR /usr/src/app

# Install dependencies from package.json
RUN yarn

EXPOSE 3000

# Command for container to execute
ENTRYPOINT [ "yarn", "dev"]
