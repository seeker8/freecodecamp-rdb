#!/bin/bash

PSQL="psql -X -U freecodecamp -d salon -Atc"

MAIN_MENU(){

  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nWelcome to My Salon, how can I help you?\n"
  fi

  # display numbered list of services e.g #) <service name>
  SERVICES=$($PSQL "select * from services order by service_id")
  FORMATTED_SERVICES_LIST=$(echo "$SERVICES" | sed 's/|/) /g')
  echo "$FORMATTED_SERVICES_LIST"
  read SERVICE_ID_SELECTED
  if [[ $SERVICE_ID_SELECTED =~ ^[0-9]+$  ]]
  then
    SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
  fi
  if [[ -z $SERVICE_NAME ]]
  then
    MAIN_MENU "I could not find that service. What would you like today?"
  else

    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE

    CUSTOMER_INFO=$($PSQL "select customer_id, name from customers where phone='$CUSTOMER_PHONE'")
    
    # extract ID and name from customer info
    CUSTOMER_ID=$(echo "$CUSTOMER_INFO" | sed -r 's/([0-9]+)\|.*/\1/')
    CUSTOMER_NAME=$(echo "$CUSTOMER_INFO" | sed -r 's/.*\|([a-zA-Z]+)/\1/')

    if [[ -z $CUSTOMER_INFO ]]
    then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      # if not empty
      if [[ ! -z $CUSTOMER_NAME ]]
      then
        # insert new customer into customers
        INSERT_RESULT=$($PSQL "insert into customers(name, phone) values ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
        # get customer_id
        CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
      fi
    fi

    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME

    if [[ ! -z $SERVICE_TIME ]]
    then
      SERVICE_INSERT_RESULT=$($PSQL "insert into appointments (time, customer_id, service_id) values ('$SERVICE_TIME', $CUSTOMER_ID, $SERVICE_ID_SELECTED)")
      echo "I have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    fi
  fi
}

echo -e "\n~~~~~ MY SALON ~~~~~"
MAIN_MENU




