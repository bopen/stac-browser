FROM --platform=linux/amd64 node:lts-alpine

ARG catalogURL

RUN npm install -g serve

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build -- --catalogUrl=$catalogURL --supportedLocales en

EXPOSE 8080

CMD [ "serve", "-s", "dist", "-l", "8080" ]
