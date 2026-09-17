package main

import (
	"time"

	"github.com/someram/pokedoxcli/internal/pokeapi"
)

func main() {
	pokeClient := pokeapi.NewClient(5 * time.Second, 5 * time.Minute)
	cfg := &config{
		commands: getCommands(),
		pokeapiClient: pokeClient,
		pokedox: make(map[string]pokeapi.Pokemon),
	}
	startRepl(cfg)
}
