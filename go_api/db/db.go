package db

import (
	"fmt"
	"log"
	"os"

	"github.com/jmoiron/sqlx"
	"github.com/joho/godotenv"
	_ "github.com/lib/pq"
)

var DB *sqlx.DB

// Instantiates the database
func InitializeDatabase() {

	//Connect database
	//Initialize environment variables
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}

	pgHost := os.Getenv("PG_HOST")
	pgPort := os.Getenv("PG_PORT")
	pgUser := os.Getenv("PG_USER")
	pgPassword := os.Getenv("PG_PASSWORD")
	pgDatabase := os.Getenv("PG_DATABASE")


	conn := fmt.Sprintf("host=%s port=%s user=%s "+
    "password=%s dbname=%s sslmode=disable",
    pgHost, pgPort, pgUser, pgPassword, pgDatabase)

	DB, err = sqlx.Connect("postgres", conn)
	if err != nil {
		log.Fatalln(err)
	}

	log.Println("Successfully connected!")

	err = DB.Ping()
	if err != nil {
		log.Fatalln(err)
	}
}