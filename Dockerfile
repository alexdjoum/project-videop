# Utiliser une image de base avec Python 3.9
FROM python:3.9

# Mettre à jour le système et installer ffmpeg
RUN apt-get update && apt-get install -y ffmpeg

# Installer les dépendances Python nécessaires
RUN pip install moviepy speechrecognition langdetect

# Définir le répertoire de travail
WORKDIR /app

# Copier le code source de l'application dans l'image Docker
COPY app/ .

# Définir les volumes pour les fichiers de vidéo et de données
VOLUME ["/videos", "/data"]

# Lancer le script Python avec l'entrée de commande par défaut
ENTRYPOINT ["python"]
