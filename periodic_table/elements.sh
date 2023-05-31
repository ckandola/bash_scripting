#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
else
  GIVEN_ARG=$1
  # test if arg is a number
  if [[ $GIVEN_ARG =~ ^[0-9]+$ ]]
  then
    # look up element with that atomic number
    ELEMENT_NUM=$GIVEN_ARG
    ELEMENT_SYM=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ELEMENT_NUM")
    ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ELEMENT_NUM")
    # check if result exists
    if [[ -z $ELEMENT_NAME ]]
    then
      echo "I could not find that element in the database."
    else
      ELEMENT_NAME=$(echo $ELEMENT_NAME | sed 's/^ *| *$//g')

      ELEMENT_TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ELEMENT_NUM")
      ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$ELEMENT_TYPE_ID")
      ELEMENT_TYPE=$(echo $ELEMENT_TYPE | sed 's/^ *| *$//g')
      
      ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_NUM")
      ELEMENT_MASS=$(echo $ELEMENT_MASS | sed 's/^ *| *$//g')
      
      ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_NUM")
      ELEMENT_MP=$(echo $ELEMENT_MP | sed 's/^ *| *$//g')
      
      ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_NUM")
      ELEMENT_BP=$(echo $ELEMENT_BP | sed 's/^ *| *$//g')
      
      FIRST_MSG="The element with atomic number $ELEMENT_NUM is $ELEMENT_NAME ($(echo $ELEMENT_SYM | sed -r 's/^ *| *$//g'))."
      SECOND_MSG="It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
      echo "$FIRST_MSG $SECOND_MSG"
    fi

  else
    # check if symbol was provided
    if [[ ${#GIVEN_ARG} < 3 ]]
    then
      ELEMENT_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$GIVEN_ARG'")
      if [[ -z $ELEMENT_NUM ]]
      then
        echo "I could not find that element in the database."
      else
        ELEMENT_SYM=$GIVEN_ARG
        ELEMENT_NUM=$(echo $ELEMENT_NUM | sed 's/^ *| *$//g')
        ELEMENT_NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_NAME=$(echo $ELEMENT_NAME | sed 's/^ *| *$//g')
        
        ELEMENT_TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$ELEMENT_TYPE_ID")
        ELEMENT_TYPE=$(echo $ELEMENT_TYPE | sed 's/^ *| *$//g')
        
        ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_MASS=$(echo $ELEMENT_MASS | sed 's/^ *| *$//g')
        
        ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_MP=$(echo $ELEMENT_MP | sed 's/^ *| *$//g')
        
        ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_BP=$(echo $ELEMENT_BP | sed 's/^ *| *$//g')
        
        FIRST_MSG="The element with atomic number $ELEMENT_NUM is $ELEMENT_NAME ($(echo $ELEMENT_SYM | sed -r 's/^ *| *$//g'))."
        SECOND_MSG="It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
        echo "$FIRST_MSG $SECOND_MSG"
      fi
    else 
      # check if arg was for name of element
      ELEMENT_NUM=$($PSQL "SELECT atomic_number FROM elements WHERE name='$GIVEN_ARG'")
      if [[ -z $ELEMENT_NUM ]]
      then
        echo "I could not find that element in the database."
      else
        ELEMENT_NAME=$GIVEN_ARG
        ELEMENT_NUM=$(echo $ELEMENT_NUM | sed 's/^ *| *$//g')

        ELEMENT_SYM=$($PSQL "SELECT symbol FROM elements WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_SYM=$(echo $ELEMENT_SYM | sed 's/^ *| *$//g')
        
        ELEMENT_TYPE_ID=$($PSQL "SELECT type_id FROM properties WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_TYPE=$($PSQL "SELECT type FROM types WHERE type_id=$ELEMENT_TYPE_ID")
        ELEMENT_TYPE=$(echo $ELEMENT_TYPE | sed 's/^ *| *$//g')
        
        ELEMENT_MASS=$($PSQL "SELECT atomic_mass FROM properties WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_MASS=$(echo $ELEMENT_MASS | sed 's/^ *| *$//g')
        
        ELEMENT_MP=$($PSQL "SELECT melting_point_celsius FROM properties WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_MP=$(echo $ELEMENT_MP | sed 's/^ *| *$//g')
        
        ELEMENT_BP=$($PSQL "SELECT boiling_point_celsius FROM properties WHERE atomic_number=$ELEMENT_NUM")
        ELEMENT_BP=$(echo $ELEMENT_BP | sed 's/^ *| *$//g')
        
        FIRST_MSG="The element with atomic number $ELEMENT_NUM is $ELEMENT_NAME ($(echo $ELEMENT_SYM | sed -r 's/^ *| *$//g'))."
        SECOND_MSG="It's a $ELEMENT_TYPE, with a mass of $ELEMENT_MASS amu. $ELEMENT_NAME has a melting point of $ELEMENT_MP celsius and a boiling point of $ELEMENT_BP celsius."
        echo "$FIRST_MSG $SECOND_MSG"
      fi # end if GIVEN_ARG len >= 3
    fi # end if GIVEN_ARG len < 3
  fi
fi