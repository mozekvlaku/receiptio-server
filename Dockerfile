FROM node:18

# ReceiptIO
RUN npm install -g receiptio

WORKDIR /app
COPY server.js /app/server.js

CMD ["node", "server.js"]