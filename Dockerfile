FROM node:12 AS ng-builder
WORKDIR /app
COPY package*.json ./
COPY . .
RUN npm install
RUN npm run build:prod

FROM caddy/caddy:alpine
COPY Caddyfile /etc/caddy/Caddyfile
COPY --from=ng-builder /app/dist/example-angular /site