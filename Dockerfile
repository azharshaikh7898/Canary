FROM node:18-alpine

WORKDIR /app
COPY app/index.js .

ENV VERSION=unknown

EXPOSE 3000
CMD ["node", "index.js"]
