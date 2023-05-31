#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

echo -e "Welcome to my salon! How can I help you?\n"
SERVICE_LIST=$($PSQL "SELECT * FROM services")
DISPLAY_SERVICE_LIST(){
  echo "$SERVICE_LIST" | while read SERVICE_ID BAR SERVICE
  do
    echo "$SERVICE_ID) $SERVICE"
  done;
}
DISPLAY_SERVICE_LIST

read SERVICE_ID_SELECTED
SERVICE_RESULT_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED'")
if [[ -z $SERVICE_RESULT_NAME ]]
then
  # while [[ -z $SERVICE_RESULT_NAME ]]
  # do
    echo -e "\nThat service ($SERVICE_RESULT_NAME) does not exist. Please try again."
    DISPLAY_SERVICE_LIST
    read SERVICE_ID_SELECTED
    SERVICE_RESULT_NAME=$($PSQL "SELECT name FROM services WHERE name='$SERVICE_ID_SELECTED'")
  # done
fi
  echo -e "\nWhat's your phone number?"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat's your name?"
    read CUSTOMER_NAME
    CUSTOMER_ADD_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
    echo -e "added status: $CUSTOMER_ADD_RESULT"
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  echo -e "\nWhat time works best for you, $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')?"
  read SERVICE_TIME
  ADD_APPT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
  if [[ $ADD_APPT_RESULT == 'INSERT 0 1' ]]
  then
    echo -e "\nI have put you down for a $(echo $SERVICE_RESULT_NAME | sed -r 's/^ *| *$//g') at $(echo $SERVICE_TIME | sed -r 's/^ *| *$//g'), $(echo $CUSTOMER_NAME | sed -r 's/^ *| *$//g')."
  fi
