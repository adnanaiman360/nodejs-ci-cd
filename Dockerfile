FROM jenkins/jenkins:lts

USER root
RUN apt-get update && apt-get install -y docker.io curl \
 && curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
 && apt-get install -y nodejs

WORKDIR /app

COPY package*.json ./
RUN chown -R jenkins:jenkins /app

USER jenkins
RUN npm install

COPY . .

EXPOSE 8080
CMD ["npm", "start"]
