#!/bin/bash
####################################
#
# Sauvegarde du script de montage NFS.
#
####################################

# Ce qu'il faut sauvegarder. 
backup_files="/home /var/spool/mail /etc /root /boot /opt"

# Où sauvegarder.
dest="/mnt/backup"

# Créer un nom de fichier d'archive.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Imprimer le message d'état de démarrage.
echo "Sauvegarde de $backup_files vers $dest/$archive_file"
date
echo

# Sauvegarde des fichiers en utilisant tar.
tar czf $dest/$archive_file $backup_files

# Imprimer le message d'état final.
echo
echo "Sauvegarde terminée".
date

# Liste longue des fichiers dans $dest pour vérifier la taille des fichiers.
ls -lh $dest

