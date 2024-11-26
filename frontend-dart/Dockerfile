# Usa una versione specifica di Dart (2.18)
FROM dart:stable AS build

# Imposta la directory di lavoro
WORKDIR /app

# Copia il file pubspec.yaml nella directory di lavoro
COPY pubspec.yaml .

# Installa le dipendenze
RUN dart pub get

# Copia il codice sorgente nella directory di lavoro
COPY lib lib/
COPY web web/

# Compila il progetto Dart in JavaScript per il web
RUN dart compile js -o build/web/main.dart.js lib/main.dart

# Usa Nginx per servire il contenuto
FROM nginx:alpine

# Copia il file di configurazione Nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Copia i file compilati dal container di build nel container di produzione
COPY --from=build /app/build/web /usr/share/nginx/html

# Esponi la porta 80 per il server web
EXPOSE 80

# Avvia Nginx in modalità non demonizzata
CMD ["nginx", "-g", "daemon off;"]
