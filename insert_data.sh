#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != 'year' ]]
  then
    ANY_TEAM=$($PSQL "select name from teams where name='$WINNER' or name='$OPPONENT'")
    if [[ -z $ANY_TEAM ]]
    then
      INSERT_RESULT=$($PSQL "insert into teams(name) values ('$WINNER'), ('$OPPONENT')")
    elif [[ $ANY_TEAM == $WINNER ]]
    then
      INSERT_RESULT=$($PSQL "insert into teams(name) values ('$OPPONENT')")
    elif [[ $ANY_TEAM == $OPPONENT ]]
    then
      INSERT_RESULT=$($PSQL "insert into teams(name) values ('$WINNER')")
    fi
    
    OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
    WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
    TEAM_INSERT_RESULT=$($PSQL "insert into games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) values ($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOALS, $OPPONENT_GOALS)")
  fi
done
