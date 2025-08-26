# n8n-render (mode facile)

[![Déployer sur Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

### Description
Ce projet permet de déployer facilement n8n sur Render gratuitement.  
- Par défaut, n8n utilise **SQLite** (simple et immédiat, idéal pour tester ou faire des démos).  
- Les webhooks sont configurables via une variable d’environnement (`N8N_HOST`).  
- Pour une utilisation durable avec persistance des données, vous pouvez basculer vers une **base PostgreSQL Neon gratuite** (0,5 Go).

---

## Étapes pour installer n8n sur Render

### 1️⃣ Déploiement initial
1. Cliquez sur le bouton Render ci-dessus.  
2. Choisissez un nom pour votre service (par exemple `n8n`).  
3. Cliquez sur **Deploy Blueprint**.  
4. Le service se déploie avec SQLite par défaut.  
5. À ce stade, votre instance fonctionne, mais les données **ne seront pas persistantes**. Si vous redéployez ou si le container redémarre, il y a risque de perte de workflows et des sauvegardes.

---

### 2️⃣ Configurer les webhooks
1. Dans Render, allez dans **Dashboard → votre service → Environment**.  
2. Modifiez la variable `N8N_HOST` pour y mettre votre domaine Render, par exemple :  
nom-service.onrender.com

markdown
Copier
Modifier
3. Vérifiez que `N8N_PROTOCOL` est bien `https` et que `N8N_PORT` correspond au port (`5678`).  
4. Les webhooks de vos workflows seront alors accessibles sur ce domaine.


### 3️⃣ (Optionnel) Passer à une base de données Neon pour la persistance
1. Créez un compte sur [Neon](https://neon.tech).  
2. Créez un nouveau projet 
3. Cliquez sur Connect to your database
4. Cliquez ensuite sur la petite fleche qui tant vers le bas à côté de Connection string
5. dans la liste qui va apparaitre, selectionnez **Parameters only** puis sur **Hide password** pour voir votre mot de  passe et copiez vos **Connection string**.  
3. Dans Render → Dashboard → Environment, ajoutez ou modifiez les variables suivantes :  
    DB_TYPE=**postgresdb**
    DB_POSTGRESDB_HOST=<host>
    DB_POSTGRESDB_PORT=**5432**
    DB_POSTGRESDB_DATABASE=<database>
    DB_POSTGRESDB_USER=<user>
    DB_POSTGRESDB_PASSWORD=<password>
    DB_POSTGRESDB_SSL=**true**

> Remplacez `<host>`, `<database>`, `<user>`, `<password>` par vos informations Neon.  
4. Redémarrez votre service Render pour prendre en compte la nouvelle base.  

---

### 4️⃣ Purge automatique des exécutions (pour rester sous 0,5 Go)
- La configuration par défaut active la purge automatique pour limiter la taille des données SQLite/Postgres :  
- Max 100 exécutions par workflow  
- Max 14 jours de rétention  

Vous n’avez rien à configurer pour cela, c’est déjà activé.

---

### 5️⃣ Profitez !
- Votre instance n8n fonctionne sur Render.  
- Avec SQLite : idéal pour tester ou démo rapide.  
- Avec Neon : persistance garantie, usage production léger possible.

---

**Créé par Chantelou Ngouanou de Tknodev School officiel. Inspiré d’Antoine Deschamps.**
