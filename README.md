# 🌦️ WeatherNFT - NFT Dynamiques pour Suivi Météorologique

**WeatherNFT** est un projet innovant permettant de mint des **NFT dynamiques** qui suivent les conditions météorologiques. Ces NFT peuvent être mis à jour périodiquement avec des données météo comme :
- 🌡️ **Température**  
- 💧 **Humidité**  
- 🌬️ **Vitesse du vent**  
- 🌄 **Images météo**  
- 📖 **Descriptions des conditions**  

🎯 **Objectif** : Créer des NFTs interactifs et informatifs qui conservent un historique des données météo. Les utilisateurs peuvent consulter les conditions météo actuelles ou un historique basé sur des plages de dates.

---

## ✨ Fonctionnalités

- 🛠️ **Mint de NFTs dynamiques** : Créez un NFT associé à des données météo initiales.
- 🔄 **Mise à jour des données météo** : Ajoutez de nouvelles conditions météo pour un NFT existant.
- 📜 **Consultation des données météo** :
  - Obtenez les conditions actuelles.
  - Accédez à l'historique des données météo pour une période donnée.
- 👮 **Sécurisé** : Seul le propriétaire du contrat peut effectuer des mises à jour ou mint de nouveaux NFTs.

---

## 🗂️ Structure du projet

```bash
├── src
│   └── Weather.sol           # Contrat principal
├── script
│   └── DeployWeather.s.sol   # Script de déploiement
├── test
│   └── WeatherTest.t.sol     # Tests du contrat
├── lib
│   └── @openzeppelin         # Dépendances OpenZeppelin
├── README.md                 # Documentation du projet
```

## 🚀 Comment l'utiliser ?

### 1. Prérequis
- Installez **Foundry** : [Documentation officielle](https://book.getfoundry.sh/)
- Installez les dépendances :
  ```bash
  forge install
  ```
 ### 2. Déploiement du contrat
 Utilisez le script fourni pour déployer le contrat sur une blockchain locale ou un réseau réel.
  ```bash
   forge script script/DeployWeather.s.sol --rpc-url <YOUR_RPC_URL> --private-key <YOUR_PRIVATE_KEY> --broadcast
  ```
 ### 3. Tests
 Assurez-vous que tout fonctionne correctement en exécutant les tests :
  ```bash
   forge test
  ```
---

## 🛠️ Fonctionnalités techniques principales

### 1. Mint d'un NFT
Créez un NFT avec des données météo initiales :
  ```bash
   weatherNFT.mintWeatherNFT(
    <address_to>,
    <temperature>,
    <humidity>,
    <wind_speed>,
    <image_uri>,
    <description>
);
```
### 2. Mise à jour des données météo
Ajoutez de nouvelles conditions météo :
  ```bash
   weatherNFT.updateWeatherData(
    <token_id>,
    <temperature>,
    <humidity>,
    <wind_speed>,
    <image_uri>,
    <description>
);
```
### 3. Consultation des données
- **Conditions actuelles :**
  ```bash
  weatherNFT.getCurrentWeather(<token_id>);
  ```
- **Historique :**
  ```bash
  weatherNFT.getWeatherHistory(
    <token_id>,
    <start_timestamp>,
    <end_timestamp>);
  ```
---
## 🌟 Pourquoi ce projet ?

Les **NFT dynamiques** repoussent les limites des NFTs traditionnels en introduisant des métadonnées évolutives. Avec **WeatherNFT**, nous combinons cette innovation avec des cas d'utilisation concrets, comme le suivi des conditions météorologiques.

---
## 📦 Technologies utilisées
- Solidity 🔗
- Foundry 🛠️
- OpenZeppelin 📚

---
## 🤝 Contribuer
Les contributions sont les bienvenues ! Voici comment vous pouvez aider :
1. Fork le projet.
2. Créez une branche pour vos modifications :
```bash
  git checkout -b feature/awesome-feature
```
3. Soumettez un pull request.

---

## 📜 Licence
Ce projet est sous licence **MIT**. Voir le fichier [LICENSE](LICENSE) pour plus de détails.

---

## 🎉 Remerciements

Merci d'avoir exploré **WeatherNFT** ! 🌟 Si vous aimez ce projet, ⭐ star sur le dépôt GitHub pour soutenir son développement.






 



