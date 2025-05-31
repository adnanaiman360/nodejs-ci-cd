FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y docker.io curl && \
    curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

USER jenkins
WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

EXPOSE 8080
CMD ["npm", "start"]
