package main

import (
	"github.com/edsycarreon/pet/db"
	"github.com/edsycarreon/pet/routers"
)

// Instantiates the router and all available routes.
// @title PET API
// @version 1.0
// @description API for the PET application
// @contact.name API support
// @contact.email edsonjaybcarreon@gmail.com
// @host localhost:9000
// @BasePath /
func main() {
	// Initialize database connection
	db.InitializeDatabase()

	// Initialize router
	routers.Router()
}