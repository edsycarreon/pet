package http

import (
	"encoding/json"
	"net/http"
)

type ErrorResponse struct {
	ErrorStatus bool 	`json:"status"`
	Message 	string 	`json:"message,omitempty"`
}

type SuccessResponse struct {
	Error		ErrorResponse	`json:"error"`
	Data		interface{}		`json:"data,omitempty"`
}

/*
HTTP Response handling for errors,
Returns valid JSON with error type and response code
*/

func NewErrorResponse(w http.ResponseWriter, statusCode int, response string){

	// Struct
	data := make(map[string]interface{})
	error := ErrorResponse{
		true,
		response,
	}
	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(statusCode)
	data["error"] = error
	json.NewEncoder(w).Encode(&data)
	return
}

func NewSuccessResponse(w http.ResponseWriter, statusCode int, response interface{}){
	errorResponse := ErrorResponse{
		false,
		"Success",
	}
	res := SuccessResponse {
		errorResponse,
		response,
	}
	w.Header().Set("Content-Type", "application/json")
	json.NewEncoder(w).Encode(&res)
	return
}