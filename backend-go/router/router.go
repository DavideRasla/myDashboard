package router

import (
	"net/http"

	"backend-go/handlers"
	"github.com/gorilla/mux"
)

func SetupRouter() *mux.Router {
	r := mux.NewRouter()

	r.HandleFunc("/api/go", handlers.HomeApi).Methods("GET")
	r.HandleFunc("/api/go/getHeadOrTails", handlers.GetHeadOrTails).Methods("GET")

		r.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request) {
			w.WriteHeader(http.StatusOK)
			w.Write([]byte("OK"))
		}).Methods("GET")

	return r
}
