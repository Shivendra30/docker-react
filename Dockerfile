FROM node:alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build


# Second block
FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html

#We don't write a separate command to start nginx. The default command of nginx is to start it
