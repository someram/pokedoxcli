package main

import (
	"errors"
	"fmt"
	"math/rand"
)

func commandCatch(c *config, args ...string) error {
	if len(args) != 1 {
		return errors.New("You must provide a pokemon name")
	}
	name := args[0]
	fmt.Printf("Throwing a Pokeball at %s...\n", name)

	pokemon, err := c.pokeapiClient.PokemonCatch(name)
	if err != nil {
		return err
	}


	const threshold = 40
	res := rand.Intn(pokemon.BaseExperience)

	if res > threshold {
		fmt.Printf("%s escaped!\n", pokemon.Name)
		return nil
	} 

	fmt.Printf("%s was caught\n", pokemon.Name)
	fmt.Println("You may now inspect it with the inspect command.")

	c.pokedox[pokemon.Name] = pokemon

	return nil
}
