🌦️ WeatherNFT - NFT Dynamiques pour Suivi Météorologique
WeatherNFT est un projet innovant permettant de mint des NFT dynamiques qui suivent les conditions météorologiques. Ces NFT peuvent être mis à jour périodiquement avec des données météo comme :

🌡️ Température
💧 Humidité
🌬️ Vitesse du vent
🌄 Images météo
📖 Descriptions des conditions
🎯 Objectif : Créer des NFTs interactifs et informatifs qui conservent un historique des données météo. Les utilisateurs peuvent consulter les conditions météo actuelles ou un historique basé sur des plages de dates.

✨ Fonctionnalités
🛠️ Mint de NFTs dynamiques : Créez un NFT associé à des données météo initiales.
🔄 Mise à jour des données météo : Ajoutez de nouvelles conditions météo pour un NFT existant.
📜 Consultation des données météo :
Obtenez les conditions actuelles.
Accédez à l'historique des données météo pour une période donnée.
👮 Sécurisé : Seul le propriétaire du contrat peut effectuer des mises à jour ou mint de nouveaux NFTs.
🗂️ Structure du projet
bash
Copier le code
.
├── src
│ └── Weather.sol # Contrat principal
├── script
│ └── DeployWeather.s.sol # Script de déploiement
├── test
│ └── WeatherTest.t.sol # Tests du contrat
├── lib
│ └── @openzeppelin # Dépendances OpenZeppelin
├── README.md # Documentation du projet
🚀 Comment l'utiliser ?

1. Prérequis
   Installez Foundry : Documentation officielle
   Installez les dépendances :
   bash
   Copier le code
   forge install
2. Déploiement du contrat
   Utilisez le script fourni pour déployer le contrat sur une blockchain locale ou un réseau réel.

bash
Copier le code
forge script script/DeployWeather.s.sol --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast 3. Tests
Assurez-vous que tout fonctionne correctement en exécutant les tests :

bash
Copier le code
forge test
🛠️ Fonctionnalités techniques principales

1. Mint d'un NFT
   Créez un NFT avec des données météo initiales :

solidity
Copier le code
weatherNFT.mintWeatherNFT(
<address_to>,
<temperature>,
<humidity>,
<wind_speed>,
<image_uri>,
<description>
); 2. Mise à jour des données météo
Ajoutez de nouvelles conditions météo :

solidity
Copier le code
weatherNFT.updateWeatherData(
<token_id>,
<temperature>,
<humidity>,
<wind_speed>,
<image_uri>,
<description>
); 3. Consultation des données
Conditions actuelles :
solidity
Copier le code
weatherNFT.getCurrentWeather(<token_id>);
Historique :
solidity
Copier le code
weatherNFT.getWeatherHistory(
<token_id>,
<start_timestamp>,
<end_timestamp>
);
🌟 Pourquoi ce projet ?
Les NFT dynamiques repoussent les limites des NFTs traditionnels en introduisant des métadonnées évolutives. Avec WeatherNFT, nous combinons cette innovation avec des cas d'utilisation concrets, comme le suivi des conditions météorologiques.

📦 Technologies utilisées
Solidity 🔗
Foundry 🛠️
OpenZeppelin 📚
🤝 Contribuer
Les contributions sont les bienvenues ! Voici comment vous pouvez aider :

Fork le projet.
Créez une branche pour vos modifications :
bash
Copier le code
git checkout -b feature/awesome-feature
Soumettez un pull request.
📜 Licence
Ce projet est sous licence MIT. Voir le fichier LICENSE pour plus de détails.
