package main
import (
	"log"
	"net/http"
	"os"
    "fmt"
	"backend-go/router"
)

func handler(w http.ResponseWriter, r *http.Request) {
    // Aggiungi le intestazioni CORS
    w.Header().Set("Access-Control-Allow-Origin", "http://[2a02:aa16:397d:ea00:7499:2b0d:a4a3:314c]:8082") // O metti l'URL del frontend
    w.Header().Set("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE, OPTIONS")
    w.Header().Set("Access-Control-Allow-Headers", "Content-Type, Authorization")

    if r.Method == "OPTIONS" {
        // Rispondi alla richiesta OPTIONS
        w.WriteHeader(http.StatusOK)
        return
    }

    // Gestisci la tua API qui
    fmt.Fprintf(w, `{"message": "Success"}`)
}

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	r := router.SetupRouter()

	log.Printf("Starting server on port %s", port)
	if err := http.ListenAndServe(":"+port, r); err != nil {
		log.Fatalf("Failed to start server: %v", err)
	}
}
