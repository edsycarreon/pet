package controllers

import (
	"log"
	"net/http"
)

func Ping(w http.ResponseWriter, r *http.Request) {
	log.Println("Pong!")
}