FROM node:18

WORKDIR /app

# nejdřív zkopíruj package.json + package-lock.json (pokud je)
COPY package*.json ./

# teď nainstaluj dependencies
RUN npm install

# pak teprve kopíruj server.js a další kód
COPY server.js /app/server.js

# Globálně ReceiptIO
RUN npm install -g receiptio

CMD ["node", "server.js"]