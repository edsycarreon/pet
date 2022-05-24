package models

type General struct {
	CreatedBy		int			`json:"createdBy,omitempty" db:"created_by"`
	CreatedAt		string		`json:"createdAt,omitempty" db:"created_at"`
	UpdatedBy		*int		`json:"updatedBy,omitempty" db:"updated_by"`
	UpdatedAt		*string		`json:"updatedAt,omitempty" db:"updated_at"`
}