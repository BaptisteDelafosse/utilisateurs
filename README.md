# 🔐 Creer des login
Un script Bash simple pour creer des comptes utilisateurs avec mot de passe temporaire

## 🚀 Executer le script 

Ce script récupere les identifiants depuis un fichier (un identifiant = une ligne), creer les comptes avec leur répertoire et leur associe un mot de passe de 12 caractères temporaire (qu'ils changeront dès leur premier login)

Ce script associe les comptes à un groupe passé en argument

```bash
sudo bash create_user.sh une_liste_dutilisateur.extention nom_groupe
```

## Exemple 

```bash
sudo bash create_user.sh liste.txt drh
```

### Exemple de sortie 

Pour chaque utilisateur créer, le script stocke leur mot de passe dans un fichier nommé user.txt sous le format 

```text
nom_utilisateur : mot_de_passe_temporaire
```
