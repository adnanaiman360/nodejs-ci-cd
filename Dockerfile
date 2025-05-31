# 1. Start from an official Node 18 image
FROM node:18-alpine

# 2. Create app directory
WORKDIR /app

# 3. Copy package.json and package-lock.json first
COPY package*.json ./

# 4. Install app dependencies
RUN npm install

# 5. Copy the rest of the source code
COPY . .

# 6. Expose port 8080 (your app listens on 8080)
EXPOSE 8080

# 7. Default command to run your app
CMD ["node", "app.js"]
