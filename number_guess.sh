#!/bin/bash

PSQL="psql -X -U freecodecamp -d number_guess -Atc"
NUMBER_TO_GUESS=$(($RANDOM % 1000 + 1))
MAX_USERNAME_LENGTH=22

read -p "Enter your username: " USERNAME

USERNAME_LENGTH=${#USERNAME}
if [[ $USERNAME_LENGTH -le $MAX_USERNAME_LENGTH ]]
then
  # look up username in database
  USER_INFO=$($PSQL "select user_id, name, count(game_id) as games_played, min(number_guesses) as best_game from users inner join games using(user_id) where name='$USERNAME' group by name, user_id")
  # if found
  if [[ -n $USER_INFO ]]
  then
    # separate details
    IFS='|' read USER_ID NAME GAMES_PLAYED BEST_GAME <<< $USER_INFO
    echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  else
    # if not found
    INSERT_RESULT=$($PSQL "insert into users(name) values('$USERNAME')")
    if [[ $INSERT_RESULT == 'INSERT 0 1' ]]
    then
      USER_ID=$($PSQL "select user_id from users where name='$USERNAME'")
    fi
    echo "Welcome, $USERNAME! It looks like this is your first time here."
  fi

  read -p "Guess the secret number between 1 and 1000: " GUESSED_NUMBER
  GUESSES=1
  
  while [[ $GUESSED_NUMBER -ne $NUMBER_TO_GUESS ]]
  do
    GUESSES=$(($GUESSES + 1))
    if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
    then
      read -p "That is not an integer, guess again: " GUESSED_NUMBER 
    elif [[ $GUESSED_NUMBER -lt $NUMBER_TO_GUESS ]]
    then
      read -p "It's higher than that, guess again: " GUESSED_NUMBER
    elif [[ $GUESSED_NUMBER -gt $NUMBER_TO_GUESS ]]
    then
      read -p "It's lower than that, guess again: " GUESSED_NUMBER
    fi
  done
  INSERT_GAME_RESULT=$($PSQL "insert into games (user_id, number_guesses) values('$USER_ID', $GUESSES)")
  echo "You guessed it in $GUESSES tries. The secret number was $NUMBER_TO_GUESS. Nice job!"
fi
