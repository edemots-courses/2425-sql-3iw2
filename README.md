# Requêtage SQL

## Commandes

### Démarrer le service db
```sh
docker compose up -d
```

### Vérifier la connexion à la BDD
```sh
docker compose logs db
```

### Se connecter à postgre via psql sur le service db
```sh
docker compose exec -it db psql -U postgres
```
