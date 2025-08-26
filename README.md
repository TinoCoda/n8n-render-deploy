# n8n-render (mode facile)

[![Déployer sur Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy)

### Comment installer n8n sur render.com gratuitement avec une base de données Neon

Suivez ces étapes :

#### 1. Créer une base de données Neon
1. Créez un compte sur [Neon](https://neon.tech)
2. Créez un nouveau projet
3. Dans votre projet, cliquez sur Connect to your database (Connectez-vous à votre base de données)
4. Ensuite copier la Connection string

#### 2. Déployer n8n sur Render
1. Cliquez sur le bouton render ci-dessus
2. Choisissez un nom de blueprint, par exemple "n8n"
3. Cliquez sur "Deploy blueprint"
4. Appliquez
5. Allez dans Dashboard > n8n (votre nom de service) > Environment
6. Copiez votre URL (lien violet dans l'en-tête)
7. Collez votre URL comme valeur pour WEBHOOK_URL
8. Ajoutez les variables d'environnement suivantes:
    ```
    DB_TYPE=postgresdb
    DB_POSTGRESQL_CONNECTION_URL=<votre connection string neon>
    ```
9. Attendez une minute que votre instance se mette à jour
10. Profitez !

Cette configuration vous permet d'utiliser n8n gratuitement avec une base de données gratuite Neon limité à 0.5Go.

Créé par Chantelou Ngouanou de Tknodev school officiel. Inspiré de Antoine Deschamps.

