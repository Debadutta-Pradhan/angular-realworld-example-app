# Stage 1
FROM node:14.16.0-alpine3.10 as node

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

# Stage 2
FROM nginx:1.13.12-alpine

COPY --from=node /usr/src/app/dist /usr/share/nginx/html

COPY . .
#COPY /usr/src/app/nginx.conf /etc/nginx/conf.d/default.conf
