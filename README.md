## Connect Four

A simple, text‑based Connect Four game implemented in Ruby. Players alternate dropping discs into a 7‑column by 6‑row board, aiming to get four of their discs in a row—horizontally, vertically, or diagonally.

---

## Table of Contents

1. [Features](#features)  
2. [Installation](#installation)  
3. [Usage](#usage)  
4. [Game Rules](#game-rules)  
5. [Testing](#testing)  

---

## Features

- **Clean Ruby design** with `Board` and `Game` classes  
- **Robust win detection** (vertical, horizontal, both diagonals)  
- **Input validation** ensuring only columns `0`–`6` are accepted  
- **CLI interface** prompting players for moves

---

## Installation

1. **Clone the repo**  
   ```bash
   git clone https://github.com/Blitzkriegtech/connect_four.git
   cd connect_four
2. **Install dependencies**
    ```bash
    bundle install

---

## Usage
Run the game via:
```bash
ruby main.rb

or

bundle exec ruby main.rb
```
You'll be prompted:
```css
Player X please enter a column (0-6):
```
Enter a number `0` through `6` to drop your disc into that column. First to connect four wins!

---

## Game Rules

1. Players alternate turns, dropping one disc at a time.
2. Discs `fall` to the lowest available slot in the chosen column.
3. A player wins by connecting `4` of their discs in a row:
    - Horizontal
    - Vertical
    - Diagonal (both `\` and `/` slopes)
4. If the board fills up with no winner, the game is a tie.

---

## Testing

This project uses `RSpec`  for behavior-driven testing. To run the full suite:
```bash
bundle exec rspec
```
---