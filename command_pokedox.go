package main

import (
	"fmt"
)

func commandPokedox(c *config, args ...string) error {

	fmt.Println("Your Pokedox:")
	for _, p := range c.pokedox {
		fmt.Printf(" - %s\n", p.Name)
	}

	return nil
}
