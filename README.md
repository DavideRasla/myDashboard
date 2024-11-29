# Photography Portfolio & API Integration Project

This repository contains a full-stack application for a **photography portfolio website** with a **Java Spring Boot** backend service and a **Dart** frontend. The backend and frontend run in separate Docker containers that communicate over a shared Docker Compose network. The project also includes an **Nginx** reverse proxy for managing the connections.

## Project Structure

The repository contains the following main components:

- **`backend-java`**: A backend service using **Java Spring Boot** to provide API endpoints.
- **`backend-GO`**: A backend service using **GO** to provide API endpoints.
- **`frontend-dart`**: The frontend is built using **Dart** and interacts with the backend services.
- **`nginx.conf`**: Nginx configuration file to proxy requests to the backend.
- **`docker-compose.yml`**: Configuration file to orchestrate all services in Docker containers.

## Features

### Frontend (Dart + HTML + CSS)

- **Photography Portfolio**: A dynamic gallery showcasing images and projects.
- **Responsive Layout**: Modern, mobile-first design with a clean interface.
- **Dart Integration**: Fetches data from the backend via HTTP API requests, displaying the results on the page.

### Backend (Java Spring Boot & GO)

- **Java Backend**: Provides API endpoints returning data to the frontend.
- **GO Backend**: Provides API endpoints returning data to the frontend.
- **CORS Configuration**: Proper handling of cross-origin requests to allow communication between the frontend and backend.

### Deployment

- All services run in **separate Docker containers** and use the same **Docker Compose** network for communication.
- **Nginx** acts as a reverse proxy to manage requests to the backend services.

## Technologies Used

- **Frontend**:
  - **Dart 2**
  - **HTML5**
  - **CSS3** (Responsive Design, Flexbox, Grid)
  - **JavaScript** (for interactivity)

- **Backend**:
  - **Java Spring Boot** (with REST API)
  - **GO** (with REST API)
  - **CORS Configuration**

- **Deployment**:
  - **Docker**
  - **Nginx** for reverse proxy

## Installation & Setup

### Prerequisites

- **Java** (version 11 or higher)
- **GO**
- **Dart 2** SDK
- **Docker** (for containerized environments)
- **Maven** (for building and running the Spring Boot app)


