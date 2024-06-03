# Utiliser l'image officielle de PHP avec Apache
FROM php:7.2-apache

# Installer l'extension pdo_mysql
RUN docker-php-ext-install pdo_mysql

# Copier les fichiers de l'application dans le dossier public du serveur /var/www/html/
# COPY traitement.php /var/www/html/
# COPY index.php /var/www/html/
# COPY modifier.php /var/www/html/
# COPY static /var/www/html/

COPY . /var/www/html/


# Changer les permissions des fichiers
RUN chmod -R 755 /var/www/html/

# Activer le mod_rewrite pour Apache
RUN a2enmod rewrite

# Activer mod_status pour exposer les métriques 
RUN a2enmod status

# Créer un fichier de configuration pour mod_status correctement formaté
# Créer un fichier de configuration pour mod_status correctement formaté
RUN { \
    echo '<Location "/metrics">'; \
    echo '    SetHandler server-status'; \
    echo '    Require all granted'; \
    echo '</Location>'; \
    echo 'ExtendedStatus On'; \
} > /etc/apache2/conf-available/status.conf


# Activer la configuration mod_status
RUN a2enconf status

# Exposer le port 80
EXPOSE 80

# Commande pour démarrer Apache en mode foreground
CMD ["apache2-foreground"]
