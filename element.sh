#!/bin/bash

PSQL="psql -X -U freecodecamp -d periodic_table -Atc"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT_INFO=$($PSQL "select atomic_number, symbol, type, atomic_mass, name, melting_point_celsius, boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where atomic_number=$1")
  elif [[ $1 =~ ^[a-zA-Z]*$ ]]
  then
    ELEMENT_INFO=$($PSQL "select atomic_number, symbol, type, atomic_mass, name, melting_point_celsius, boiling_point_celsius from elements inner join properties using(atomic_number) inner join types using(type_id) where symbol ilike '$1' or name ilike '$1'")
  fi

  if [[ -z $ELEMENT_INFO ]]
  then
    echo "I could not find that element in the database."
  else
    echo "$ELEMENT_INFO" | while IFS='|' read ATOMIC_NUMBER SYMBOL TYPE ATOMIC_MASS NAME MELTING_POINT BOILING_POINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
fi
