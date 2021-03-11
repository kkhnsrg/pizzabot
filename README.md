# Pizzabot

iOS application for calculating movement instructions for Pizzabot 🍕🤖

## How it's work

- Pizzabot can move on the grid (where each point on the grid is one house) by the following instructions:
  - N: Move north 
  - S: Move south 
  - E: Move east 
  - W: Move west 
  - D: Drop pizza
- We have a list of points representing houses in need of pizza delivery
- Input the grid size and points in specified format: 5x5 (1, 3) (4, 4)
  - First parameter - 5x5 - is grid `width` x `height` parameters
  - Next arguments - destination points: (`x coordinate`, `y coordinate`)
- Application gives you instructions for Pizzabot ✅

## How to run

To run the application: 

- Open the project in Xcode
- Build and then run the Pizzabot scheme
- Enter string with the specified format in the text field
- Press the start button
- Get instructions for pizzabot

![App Demo](git_materials/demo.gif)

To run tests: 

- Open the project in Xcode
- Go to Test navigator
- Run PizzabotTests

P.S ```PizzabotTests``` class includes challenge completion with solving the following input string: 5x5 (0, 0) (1, 3) (4,4) (4, 2) (4, 2) (0, 1) (3, 2) (2, 3) (4, 1)
