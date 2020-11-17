FROM node:14.11.0-alpine3.11 As builder
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
RUN npm run build --prod
FROM nginx:alpine
COPY --from=builder /usr/src/app/dist/client-bank/ /usr/share/nginx/html
