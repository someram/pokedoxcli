package main

import (
	"errors"
	"fmt"
)


func commandMapf(c *config, agrs ...string) error {
	locationsResp, err := c.pokeapiClient.Listlocations(c.nextLocationsURl)
	if err != nil {
		return err
	}

	c.nextLocationsURl = locationsResp.Next
	c.prevLocationsURl = locationsResp.Previous

	for _, loc := range locationsResp.Results {
		fmt.Println(loc.Name)
	}
	return nil

}

func commandMapb(c *config, args ...string) error {
	if c.prevLocationsURl == nil {
		return errors.New("you're on the first page")
	}

	locationsResp, err := c.pokeapiClient.Listlocations(c.prevLocationsURl)
	if err != nil {
		return err
	}

	c.nextLocationsURl = locationsResp.Next
	c.prevLocationsURl = locationsResp.Previous

	for _, loc := range locationsResp.Results {
		fmt.Println(loc.Name)
	}
	return nil
}
