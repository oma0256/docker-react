FROM node:alpine as builder
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
