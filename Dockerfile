FROM node:18-alpine

# Setup Environment
ARG env=production
ENV NODE_ENV $env

# Set working directory
WORKDIR /opt/app

# Copy configs to /app directory
COPY /code/package*.json ./
COPY /code/tsconfig.json ./
# TODO: Add in environments for tsconfig
# COPY /code/tsconfig.${env}.json ./

# Install dependencies
RUN npm i

# Copy src into /app directory
COPY /code/src ./src

# Build project
RUN npm run prepare
