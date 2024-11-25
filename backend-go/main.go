package main

import (
	"fmt"
	"net/http"
)

func main() {
	http.HandleFunc("/api", func(w http.ResponseWriter, r *http.Request) {
		fmt.println(w, "Hello from Go backend!")
	})

	// Expose port 8081
	http.ListenAndServe(":8081", nil)
}
