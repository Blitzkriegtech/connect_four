# frozen_string_literal: true

module HowToPlay
  def instructions
    <<-DOC
      Welcome to CONNECT FOUR!!

      The Game:

      Player 1 has discs marked ('X') while Player 2 has discs marked ('O'), first player to CONNECT FOUR IDENTICAL DISCS:

      a. X X X X
      
      b. X
        X
        X
        X

      c. X
          X
            X
              X

      d.       X
            X  
          X
        X
      of either patterns a-b WINS.

      How to place disc:

      Select a column no. from 0-6 to drop a disc.
    DOC
  end
end