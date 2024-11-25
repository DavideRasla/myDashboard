# Fase di build del backend
FROM eclipse-temurin:17-jdk-alpine AS build

ARG CACHEBUST=2

# Crea una directory di lavoro nel container
WORKDIR /app

# Installazione di Maven
RUN apk add --no-cache maven

# Copia il file pom.xml e la cartella src
COPY backend/pom.xml .
COPY backend/src ./src

# Compila il progetto
RUN mvn clean package

# Fase finale
FROM eclipse-temurin:17-jdk-alpine

# Crea una directory per l'applicazione
WORKDIR /app

# Copia il JAR dell'applicazione
COPY --from=build /app/target/photo-event-backend-0.0.1-SNAPSHOT.jar /app/app.jar

# Espone la porta utilizzata da Heroku
EXPOSE 8080

# Copia i file statici del frontend nella directory statica di Spring Boot
COPY backend/src/main/resources/static/ /app/src/main/resources/static/

# Comando di avvio per eseguire il backend
CMD ["java", "-jar", "/app/app.jar"]

