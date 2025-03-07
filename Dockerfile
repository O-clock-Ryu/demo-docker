#UTiliser l'image officielle de NOde
FROM node:18

#Définir le Workdir
WORKDIR /app

#Copier package.json
COPY package.json package-lock.json ./
RUN npm install

#Copier les fichiers restants
COPY . .

#On lancer le build
RUN npm run build

#Exposer le port 4173 par défaut de vite preview
EXPOSE 4173

CMD ["npm", "run", "preview", "--", "--host", "0.0.0.0"]