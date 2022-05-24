package utils

import (
	"encoding/json"
	"fmt"
)

// PrintJSON()
func PrintJSON(v interface{}) {
	prettyJSON, err := json.MarshalIndent(v, "", "    ")
	if err != nil {
		fmt.Println("----------------------------------------------")
		fmt.Println("----------------------------------------------")
		fmt.Println("Failed to generate json", err)
		fmt.Println("----------------------------------------------")
		fmt.Println("----------------------------------------------")
	}
	fmt.Printf("%s\n", string(prettyJSON))
}