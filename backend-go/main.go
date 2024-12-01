package main
import (
	"log"
	"net/http"
	"os"

	"backend-go/router"
)

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
