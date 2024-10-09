#!/bin/bash

# Set up PSQL command with database connection
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# Randomly generate secret number between 1 and 1000
SECRET_NUMBER=$(( $RANDOM % 1000 + 1 ))

# Function to ask for username
ASK_FOR_USERNAME(){
  echo -e "\nEnter your username:"
  read USERNAME

  # Get the number of characters in the username
  USERNAME_CHARACTERS=$(echo $USERNAME | wc -c)
  
  # Validate if username is 22 characters or less
  if [[ $USERNAME_CHARACTERS -gt 21 ]]
  then
    echo -e "\nUsername must be 22 characters or less."
    ASK_FOR_USERNAME
  fi
}

# Call function to ask for username
ASK_FOR_USERNAME

# Check if user exists in the database
RETURNING_USER=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

if [[ -z $RETURNING_USER ]]
then
  # If user is not found, insert new user into the database
  INSERT_USER=$($PSQL "INSERT INTO users (username) VALUES ('$USERNAME')")
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  # If user exists, fetch games played and best game (minimum guesses)
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME'")
  BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games INNER JOIN users USING(user_id) WHERE username = '$USERNAME'")
  
  # Output user's game statistics
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Fetch the user's ID from the database
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")

# Initialize number of tries and the user's guess
TRIES=1
GUESS=0

# Function for number guessing logic
NUMBER_GUESSING_GENERATOR(){
  read GUESS

  # While the guess is a valid integer and is not the secret number
  while [[ $GUESS =~ ^[0-9]+$ && ! $GUESS -eq $SECRET_NUMBER ]]
  do
    # Increment tries
    TRIES=$(($TRIES + 1))

    # Provide feedback based on the guess
    if [[ $GUESS -gt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's lower than that, guess again:"
    elif [[ $GUESS -lt $SECRET_NUMBER ]]
    then
      echo -e "\nIt's higher than that, guess again:"
    fi

    # Read the next guess
    read GUESS
  done

  # If guess is not a valid integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
    TRIES=$(($TRIES + 1))
    NUMBER_GUESSING_GENERATOR
  fi
}

# Start the guessing game
echo -e "\nGuess the secret number between 1 and 1000:"
NUMBER_GUESSING_GENERATOR

# Once the correct number is guessed, insert the game result into the database
INSERT_GAME=$($PSQL "INSERT INTO games (user_id, guesses) VALUES ($USER_ID, $TRIES)")

# Determine pluralization for tries
PLURAL_TRIES=$(if [[ $TRIES -eq 1 ]]; then echo "try"; else echo "tries"; fi)

# Congratulate the user on their win
echo -e "\nYou guessed it in $TRIES $PLURAL_TRIES. The secret number was $SECRET_NUMBER. Nice job!"
