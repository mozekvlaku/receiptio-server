FROM node:18
RUN npm install -g receiptio
WORKDIR /app
COPY server.js /app/server.js
RUN npm install express
CMD ["node", "server.js"]