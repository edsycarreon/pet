package services

import (
	"fmt"

	"github.com/edsycarreon/pet/db"
	"github.com/edsycarreon/pet/models"
	"github.com/edsycarreon/pet/utils"
)

// SignUp()
func SignUp(person models.Person) (models.Person, error) {

	var p models.Person
	
	// Prepare SQL statement
	sql := `
		INSERT INTO person (
			first_name,
			last_name,
			email,
			password,
			gender,
			status,
			phone_number,
			display_photo,
			created_by
		) VALUES (
			:first_name,
			:last_name,
			:email,
			:password,
			:gender,
			'PEN',
			:phone_number,
			:display_photo,
			lastval()
		) RETURNING *;
	`

	res, err := db.DB.NamedQuery(sql, person)
	if err != nil {
		return p, err
	}

	if res.Next() {
		res.Scan(&p)
	}

	return p, nil
}

// GetCredentialsByEmail
func GetCredentialsByEmail(email string) (models.Person, error) {

	var p models.Person

	// Prepare SQL statement
	sql := `
		SELECT 
			person_id,
			email,
			password
		FROM person 
		WHERE email = $1 
		ORDER BY person_id ASC
	`

	err := db.DB.Get(&p, sql, email)
	if err != nil {
		return p, err
	}

	utils.PrintJSON(p)

	return p, nil
}

// ChangePassword
func ChangePassword(cred models.Person) (models.Person, error) {

	var p models.Person	

	fmt.Println(cred)
	// Prepare sql statement
	sql := `
		UPDATE person
		SET password = :new_password
		WHERE person_id = :person_id
	`

	res, err := db.DB.NamedQuery(sql, cred)
	if err != nil {
		return p, err
	}

	if res.Next() {
		res.Scan(&p)
	}

	return p, nil
}