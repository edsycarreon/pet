package routers

import (
	"fmt"
	"log"
	"net/http"
	"os"

	httpSwagger "github.com/swaggo/http-swagger"

	"github.com/edsycarreon/pet/controllers"
	_ "github.com/edsycarreon/pet/docs"

	"github.com/gorilla/mux"
	"github.com/joho/godotenv"
)


func Router() {
	// Init mux.
	r := mux.NewRouter()

	///////////////////////////
	// Routes
	//////////////////////////

	// Global routes
	r.HandleFunc("/ping", controllers.Ping).Methods("GET")

	// Auth routes
	r.HandleFunc("/signup", controllers.SignUp).Methods("POST")
	r.HandleFunc("/signin", controllers.SignIn).Methods("POST")
	r.HandleFunc("/change-password", controllers.ChangePassword).Methods("PATCH")

 
	// Person routes
	r.HandleFunc("/persons", controllers.GetAllPersons).Methods("GET")
	r.HandleFunc("/persons/{id}", controllers.GetPersonByID).Methods("GET")
	




	//Initialize environment variables
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	// Create HTTP server.
	port := os.Getenv("PORT")
	pgHost := os.Getenv("PG_HOST")
	log.Println(fmt.Sprintf("Runnig service on %s:%s", pgHost, port))

	// Swagger
	r.PathPrefix("/swagger/").Handler(httpSwagger.Handler(
		httpSwagger.URL("http://localhost:9000/swagger/doc.json"), //The url pointing to API definition
		httpSwagger.DeepLinking(true),
		httpSwagger.DocExpansion("none"),
		httpSwagger.DomID("#swagger-ui"),
	))
	log.Fatal(http.ListenAndServe(":" + port,r))
}