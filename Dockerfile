FROM node:18
RUN npm i
WORKDIR /app
COPY server.js /app/server.js

CMD ["node", "server.js"]