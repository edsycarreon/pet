package controllers

import (
	"net/http"

	customHTTP "github.com/edsycarreon/pet/http"
	"github.com/edsycarreon/pet/services"
	"github.com/gorilla/mux"
)

// GetAllPersons()
// @Summary Get all users from the database
// @Description Get all users from the database
// @Tags person
// @Accept json
// @Produce json
// @Success 200 {array} models.Person
// @Router /persons [get]
func GetAllPersons(w http.ResponseWriter, r *http.Request) {

	// Set response content-type header
	w.Header().Set("Content-Type", "application/json")

	// Fetch persons
	persons, err := services.GetAllPersons()
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}
	
	customHTTP.NewSuccessResponse(w, http.StatusOK, persons)
}

// GetPersonByID()
// @Summary Get a user by its ID
// @Description Get user by its ID
// @Param person_id path string true "Person ID"
// @Tags person
// @Accept json
// @Produce json
// Success 200 {object} models.Person
// @Router /persons/:id [get]
func GetPersonByID(w http.ResponseWriter, r *http.Request) {
	
	// Set response content-type header
	w.Header().Set("Content-Type", "application/json")

	// Vars
	vars := mux.Vars(r)
	id := vars["id"]

	// Struct
	// data := make(map[string]interface{})

	// Fetch person
	person, err := services.GetPersonByID(id)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}
	w.WriteHeader(http.StatusOK)
	customHTTP.NewSuccessResponse(w, http.StatusOK, person)
}