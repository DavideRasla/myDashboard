package handlers

import (
	"encoding/json"
	"net/http"
	"math/rand"
	"time"
)


type HomeApiResponse struct {
	Message string `json:"message"`
}


func HomeApi(w http.ResponseWriter, r *http.Request) {
	response := HomeApiResponse{
		Message: "Hello from Go backend!",
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(response)
}

func GetHeadOrTails(w http.ResponseWriter, r *http.Request) {
	rand.Seed(time.Now().UnixNano())

	result := "Heads"
	if rand.Intn(2) == 1 {
		result = "Tails"
	}

	// Return the result as a JSON response
	response := map[string]string{
		"result": result,
	}

	// Set content-type as JSON and write response
	w.Header().Set("Access-Control-Allow-Origin", "*")  // Permette tutte le origini
	w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS")  // Permette metodi GET, POST e OPTIONS
	w.Header().Set("Access-Control-Allow-Headers", "Content-Type")  // Permette l'intestazione Content-Type
	json.NewEncoder(w).Encode(response)
}
