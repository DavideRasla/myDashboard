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
	w.Header().Set("Content-Type", "application/json")
	w.Header().Set("Access-Control-Allow-Origin", "http://localhost:8082")
    w.Header().Set("Access-Control-Allow-Methods", "GET")
    w.Header().Set("Access-Control-Allow-Headers", "Content-Type")
	json.NewEncoder(w).Encode(response)
}
