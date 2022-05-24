package controllers

import (
	"encoding/json"
	"net/http"

	customHTTP "github.com/edsycarreon/pet/http"
	"github.com/edsycarreon/pet/models"
	"github.com/edsycarreon/pet/services"
	"golang.org/x/crypto/bcrypt"
)

// SignUp()
// @Summary Signs up the user to the application
// @Description Signs up the user to the application
// @Tags auth
// @Accept json
// @Produce json
// @Success 200 {object} models.Person
// @Router /signup [post]
func SignUp(w http.ResponseWriter, r *http.Request) {
	var person models.Person

	// Decode the request body
	err := json.NewDecoder(r.Body).Decode(&person)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}

	// Hash the password with bcrypt
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(person.Password), bcrypt.DefaultCost)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}

	// Add the hashed password to the model
	person.Password = string(hashedPassword)

	// Sign up service
	person, err = services.SignUp(person)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}

	// Return data response
	customHTTP.NewSuccessResponse(w, http.StatusCreated, person)
}


// SignIn()
// @Summary Signs the user into the application
// @Description Signs the user into the application
// @Tags auth
// @Accept json
// @Produce json
// @Success 200 {object} models.Person
// @Router /signin [post]
func SignIn(w http.ResponseWriter, r *http.Request) {
	var body models.Person

	// Decode the request body
	err := json.NewDecoder(r.Body).Decode(&body)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}

	// Get credentials
	p, err := services.GetCredentialsByEmail(body.Email)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}

	// Compare passwords
	err = bcrypt.CompareHashAndPassword([]byte(p.Password), []byte(body.Password))
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusUnauthorized, "Error: " + err.Error())
		return
	}

	// TODO implement JWT tokens

	// Return data response
	customHTTP.NewSuccessResponse(w, http.StatusCreated, p)
}

// ChangePassword()
// @Summary Change the password of the user
// @Description Change the password of the user
// @Tags auth
// @Accept json
// @Produce json
// @Success 200 {object} models.Person
// @Router /change-password [patch]
func ChangePassword(w http.ResponseWriter, r *http.Request) {
	
	// Request body model
	var body models.Person

	// Decode the request body
	err := json.NewDecoder(r.Body).Decode(&body)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}


	// Get credentials
	p, err := services.GetCredentialsByEmail(body.Email)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}

	// Compare passwords
	err = bcrypt.CompareHashAndPassword([]byte(p.Password), []byte(body.Password))
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusUnauthorized, "Error: " + err.Error())
		return
	}

	body.PersonID = p.PersonID

	// Hash the password with bcrypt
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(body.NewPassword), bcrypt.DefaultCost)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusInternalServerError, "Error: " + err.Error())
		return
	}

	body.NewPassword = string(hashedPassword)

	// Change password
	res, err := services.ChangePassword(body)
	if err != nil {
		customHTTP.NewErrorResponse(w, http.StatusUnauthorized, "Error: " + err.Error())
		return
	} 

	// Return data response
	customHTTP.NewSuccessResponse(w, http.StatusCreated, res)
}