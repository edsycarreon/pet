package models

// Person
type Person struct {
	PersonID		int			`json:"personID,omitempty" db:"person_id"`
	FirstName		string		`json:"firstName,omitempty" db:"first_name"`
	LastName		string		`json:"lastName,omitempty" db:"last_name"`
	Email			string		`json:"email,omitempty" db:"email"`
	Password		string  	`json:"password,omitempty" db:"password"`
	NewPassword		string  	`json:"newPassword,omitempty" db:"new_password"`
	Gender			string		`json:"gender,omitempty" db:"gender"`
	DisplayPhoto	*string		`json:"displayPhoto,omitempty" db:"display_photo"`
	PhoneNumber 	*string		`json:"phoneNumber,omitempty" db:"phone_number"`
	Status			string		`json:"status,omitempty" db:"status"`
	LastLogin		*string		`json:"lastLogin,omitempty" db:"last_login"`
	General
}

// User Address
type PersonAddress struct {
	PersonAddressID	int			`json:"personAddressID,omitempty" db:"person_address_id"`
	PersonID		int			`json:"personID,omitempty" db:"person_id"`
	Street			string		`json:"street,omitempty" db:"street"`
	State			string		`json:"state,omitempty" db:"state"`
	City			string		`json:"city,omitempty" db:"city"`
	Zipcode			string		`json:"zipcode,omitempty" db:"zipcode"`
	General
}

// User Level
type PersonLevel struct {
	PersonLevelID	int			`json:"personLevelID,omitempty" db:"person_level_id"`
	PersonID		int			`json:"personID,omitempty" db:"person_id"`
	Level			int			`json:"level,omitempty" db:"level"`
	Experience		int			`json:"experience,omitempty" db:"experience"`
	NextLevel		int			`json:"nextLevel,omitempty" db:"next_level"`
	General
}

// User Stats
type PersonStats struct {
	PersonStatsID	int			`json:"personStatsID,omitempty" db:"person_stats_id"`
	PersonID		int			`json:"personID,omitempty" db:"person_id"`
	PetsBorrowed	int			`json:"petsBorrowed,omitempty" db:"pets_borrowed"`
	PetsLent		int			`json:"petsLent,omitempty" db:"pets_lent"`
	General
}