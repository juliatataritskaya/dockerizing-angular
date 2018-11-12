FROM node:11.1.0 as node

WORKDIR /usr

COPY package.json src
COPY package-lock.json src

WORKDIR /usr/src

RUN npm install
RUN npm install -g @angular/cli@7.0.4

COPY . .

RUN npm run build

# Stage 2
FROM nginx:1.13.12-alpine

WORKDIR /usr/share/nginx/html

COPY --from=node /usr/src/dist/angular-docker .

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
