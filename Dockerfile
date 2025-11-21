FROM node:18
RUN npm i

CMD ["node", "server.js"]