## About the Project
A cli that lets you to have a fun time with Pokemons

#### How to use
Install Go programming language if not installed

On `Windows`
```cmd
winget install GoLang.Go
```

Clone the repo
```cmd
git clone https://github.com/someram/pokedoxcli.git
```

change the directory into the repo
and build the project with
```cmd
go build .
```

Run the binary 
```cmd
./pokedoxcli
```

#### List of commands

- ``help`` -> list all the commands
- ``explore`` -> explore pokemons on specific city area
- ``map`` -> get the next 20 city locations
- ``mapb`` -> get the previous 20 city locations
- ``catch`` -> catch a pokemon
- ``inspect`` -> inspect the caught pokemon stats
- ``pokedox``-> your own collections of pokemon that you have caught
- ``exit``-> exit the pokedoxcli


#### ALternate method to use Pokedoxcli

### Install pokedox cli on your machine 

On ```Linux/MacOS```

```bash
curl -fsSL https://raw.githubusercontent.com/someram/pokedoxcli/main/install.sh | sh
```

On ```Windows```

```powershell
irm https://raw.githubusercontent.com/someram/pokedoxcli/main/install.ps1 | iex
```


After installing Run
```shell
pokedoxcli
```
