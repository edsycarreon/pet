package services

import (
	"github.com/edsycarreon/pet/db"
	"github.com/edsycarreon/pet/models"
)

// GetAllPersons()
func GetAllPersons() ([]models.Person, error) {
	persons := []models.Person{}

	sql := `
		SELECT
			person_id,
			first_name,
			last_name,
			email,
			password,
			status,
			phone_number,
			gender,
			display_photo,
			created_by,
			created_at,
			updated_by,
			updated_at
		FROM person
		ORDER BY person_id ASC
	`

	err := db.DB.Select(&persons, sql)
	if err != nil {
		return persons, err
	}

	return persons, nil
}

// GetPersonByID()
func GetPersonByID(id string) (models.Person, error) {
	person := models.Person{}

	sql := `
		SELECT
			person_id,
			first_name,
			last_name,
			email,
			status,
			phone_number,
			gender,
			display_photo,
			created_by,
			created_at,
			updated_by,
			updated_at
		FROM person
		WHERE person_id = $1
	`

	err := db.DB.Get(&person, sql, id)
	if err != nil {
		return person, err
	}

	return person, nil
}

