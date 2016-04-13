### Requirements

We will create an implementation of the Battleship game. The game consists of:

- 2 Players
- Each Player has a 5x5 board
- Players will be given 3 ships that are 3 units long and 1 unit wide
- Ships can only be oriented vertically
- The game should take as arguments two arrays of integers representing the ship
placement on each player’s board. Each entry in the array will represent the
vertical coordinate of the top of a ship with ­1 representing an empty column
(e.g. [ ­1 1 2 1 ­1] would represent 3 ships forming a V shape).

```
[
  [ ~, ~, ~, ~, ~ ],
  [ ~, S, ~, S, ~ ],
  [ ~, S, S, S, ~ ],
  [ ~, S, S, S, ~ ],
  [ ~, ~, S, ~, ~ ],
]
```
**NOTE**: elements in the example array are for demonstration purposes.
i.e. you don't have to use `~` and `S` in your code.

-  Players will take turns choosing coordinates to attack
The result of an attack can be one of:
- A 'Hit’ if the opponent has a ship covering the coordinate
- A 'Miss’ if there is no ship covering the coordinate
- 'Already Taken’ if the coordinate has previously been attacked
- 'Sunk’ if all coordinates a ship covers have been hit
- 'Win’ if all ships on the opponent's board have been sunk
The game ends when all of a player's ships have been sunk.
Acceptable ways to demonstrate functionality are: unit test, command line input, web page.
