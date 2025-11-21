FROM node:18
RUN npm install -g receiptio
RUN npm install express
CMD ["node", "server.js"]