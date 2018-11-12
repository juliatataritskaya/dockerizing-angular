FROM node:11.1.0

WORKDIR /usr

COPY package.json src
COPY package-lock.json src

WORKDIR /usr/src

RUN npm install
RUN npm install -g @angular/cli@7.0.4

COPY . .

EXPOSE 4200
CMD ["npm", "start"]
