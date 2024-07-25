FROM ghcr.io/puppeteer/puppeteer:22.13.1

ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci
COPY . .
# Copy the .env and .env.development files
COPY .env .env.development ./

RUN npm run build
# Start the server using the production build
CMD ["npm", "run", "start:prod"]