#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=worldcup --no-align --tuples-only -c"

# Do not change code above this line. Use the PSQL variable above to query your database.

echo -e "\nTotal number of goals in all games from winning teams:"
SUM_WINNER_GOALS="$($PSQL "SELECT SUM(winner_goals) FROM games")"
echo $SUM_WINNER_GOALS

echo -e "\nTotal number of goals in all games from both teams combined:"
SUM_OPPONENT_GOALS="$($PSQL "SELECT SUM(opponent_goals) FROM games")"
echo $(( $SUM_WINNER_GOALS + $SUM_OPPONENT_GOALS ))

echo -e "\nAverage number of goals in all games from the winning teams:"
AVG_WINNER_GOALS="$($PSQL "SELECT AVG(winner_goals) FROM games")"
echo $AVG_WINNER_GOALS

echo -e "\nAverage number of goals in all games from the winning teams rounded to two decimal places:"
echo "$($PSQL "SELECT ROUND($AVG_WINNER_GOALS, 2)")"

echo -e "\nAverage number of goals in all games from both teams:"
AVG_OPPONENT_GOALS="$($PSQL "SELECT AVG(opponent_goals) FROM games")"
echo "$($PSQL "SELECT ROUND(AVG($AVG_WINNER_GOALS + $AVG_OPPONENT_GOALS),16)")"

echo -e "\nMost goals scored in a single game by one team:"
MAX_W_GOALS="$($PSQL "SELECT MAX(winner_goals) FROM games")"
MAX_O_GOALS="$($PSQL "SELECT MAX(opponent_goals) FROM games")"
if [[ $MAX_W_GOALS -ge $MAX_O_GOALS ]]
then
  echo $MAX_W_GOALS
else 
  echo $MAX_O_GOALS
fi

echo -e "\nNumber of games where the winning team scored more than two goals:"
echo "$($PSQL "SELECT COUNT(*) FROM games WHERE winner_goals > 2")"

echo -e "\nWinner of the 2018 tournament team name:"
WINNER_2018_ID="$($PSQL "SELECT winner_id FROM games WHERE year=2018 AND round='Final'")"
echo "$($PSQL "SELECT name FROM teams WHERE team_id=$WINNER_2018_ID")"

echo -e "\nList of teams who played in the 2014 'Eighth-Final' round:"
echo "$($PSQL "SELECT name FROM teams LEFT JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE year=2014 AND round='Eighth-Final' ORDER BY name")"

echo -e "\nList of unique winning team names in the whole data set:"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams RIGHT JOIN games ON teams.team_id = games.winner_id ORDER BY name")"

echo -e "\nYear and team name of all the champions:"
echo "$($PSQL "SELECT year, name FROM games LEFT JOIN teams ON games.winner_id = teams.team_id WHERE round = 'Final' ORDER BY year")"

echo -e "\nList of teams that start with 'Co':"
echo "$($PSQL "SELECT DISTINCT(name) FROM teams LEFT JOIN games ON teams.team_id = games.winner_id OR teams.team_id = games.opponent_id WHERE name LIKE 'Co%'")"
