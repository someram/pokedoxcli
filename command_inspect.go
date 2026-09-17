package main

import (
	"errors"
	"fmt"
)

func commandInspect(c *config, args ...string) error {
	if len(args) != 1 {
		return errors.New("You must provide a pokemon name")
	}

	name := args[0]

	val, ok := c.pokedox[name]
	if !ok {
		return errors.New("you have not caught that pokemon")
	}

	fmt.Printf("Name: %s\n", val.Name)
	fmt.Printf("Height: %v\n", val.Height)
	fmt.Printf("Weight: %v\n", val.Weight)

	fmt.Println("Stats:")
	for _, s := range val.Stats {
		fmt.Printf("  -%s: %v\n", s.Stat.Name, s.BaseStat)
	}

	fmt.Println("Types:")
	for _, t := range val.Types {
		fmt.Printf("  - %v\n", t.Type.Name)
	}

	return nil
}
