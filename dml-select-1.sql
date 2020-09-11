## Progression


-- 1. **Write a query to display the team details. Display the records sorted in the order of team name.**
SELECT TEAM_ID,TEAM_NAME,COACH,HOME_CITY,CAPTAIN FROM TEAM ORDER BY TEAM_NAME;

-- 2. **Write a query to display the player details whose name starts with a letter `S` and who do not belong to the country 'South Africa'. Display the records sorted in descending order based on player name.**
SELECT PLAYER_ID,PLAYER_NAME,PLAYER_COUNTRY,SKILL_ID,TEAM_ID
FROM PLAYER
WHERE PLAYER_NAME LIKE 'S%' AND NOT PLAYER_COUNTRY = 'SOUTH AFRICA'
ORDER BY PLAYER_NAME DESC;

-- 3. **Write a query to display the event number and the seconds taken for each event. Display the records sorted in ascending order based on event number.**
SELECT EVENT_NUMBER,CLOCK_IN_SECONDS FROM EVENT ORDER BY EVENT_NUMBER ASC;

-- 4. **Write a query to display the event numbers of those events which has sum of raid points and defending points greater than or equal to 3. Display the records sorted in ascending order based on event_no.**
SELECT EVENT_NUMBER FROM EVENT WHERE SUM(RAID_POINTS + DEFENDING_POINTS)>=3 ORDER BY EVENT_NUMBER ASC; 

-- 5. **Write a query to display the name of all the players who belong to the country India or Iran. Display the records sorted in ascending order based on player name.**
SELECT PLAYER_NAME FROM PLAYER WHERE COUNTRY='INDIA' OR COUNTRY='IRAN' ORDER BY PLAYER_NAME ASC;

-- 6. **Write a query to display the name of all the players who does not belong to the country India and Iran. Display the records sorted in ascending order based on player name.**
SELECT PLAYER_NAME FROM PLAYER WHERE NOT Country='INDIA' AND NOT Country='IRAN' ORDER BY PLAYER_NAME ASC;

-- 7. **Write a query to display the names of all the skills that start with `Defend`. Display the records sorted in ascending order based on skill name.**
SELECT SKILL_NAME FROM SKILL WHERE SKILL_NAME LIKE 'DEFEND%' ORDER BY SKILL_NAME ASC;

-- 8. **Write a query to display all the stadium names that ends with `Complex`. Display the records sorted in ascending order based on stadium names.**
SELECT STADIUM_NAME FROM VENUE WHERE STADIUM_NAME LIKE '%COMPLEX' ORDER BY STADIUM_NAME ASC;

-- 9. **Write a query to display the winner team ids and the scores of those teams whose scores are less than 35. Display the records sorted in descending order based on outcome id.**
SELECT WINNER_TEAM_ID,SCORE FROM OUTCOME WHERE SCORE<35 ORDER BY OUTCOME_ID DESC;

-- 10. **Write a query to display the game details of those games that were played between January and March of 2020. Display the records sorted in descending order based on id.**
SELECT GAME_ID, GAME_DATE, TEAM_ID_1, TEAM_ID_2, VENUE_ID, OUTCOME_ID, REFEREE_ID_1, REFEREE_ID_2, FIRST_INNINGS_ID, SECOND_INNINGS_ID
FROM GAME
WHERE GAME_DATE BETWEEN '2020-01-01' AND '2020-03-31'
ORDER BY GAME_ID DESC;

-- 11. **Write a query to display the names of players who are Raiders. Display the records sorted in ascending order based on player name.**
SELECT PLAYER.PLAYER_NAME FROM EVENT INNER JOIN PLAYER ON EVENT.RAIDER_ID =PLAYER.PLAYER_ID; 

-- 12. **Write a query to display the event number, raid points and defence points scored in the first innings of the game that was played on `2020-01-26`. Display the records sorted in ascending order based on event number.**
SELECT EVENT.EVEN_NUMBER, EVENT.RAID_POINTS, EVENT.DEFENDING_POINTS 
FROM ((EVENT INNER JOIN INNINGS ON EVENT.INNINGS_ID = INNINGS.INNINGS_ID)
INNER JOIN GAME ON INNINGS.INNINGS_ID = GAME.FIRST_INNINGS_ID)
WHERE GAME_DATE = '2020-01-26'
ORDER BY EVENT_NUMBER ASC;

-- 13. **Write a query to display the name of the winner team in the game played on `2020-03-09`. Display the records sorted in ascending order based on team name.**
SELECT TEAM.TEAM_NAME
FROM ((TEAM INNER JOIN OUTCOME ON OUTCOME.WINNER_TEAM_ID = TEAM.TEAM_ID )
INNER JOIN GAME ON OUTCOME.OUTCOME_ID = GAME.OUTCOME_ID )
WHERE GAME_DATE = '2020-03-09'
ORDER BY TEAM_NAME ASC;

-- 14. **Write a query to display the names of players who were the player of the match in the game played on 2020-03-09'. Display the records sorted in ascending order based on player name.**
SELECT PLAYER.PLAYER_NAME
FROM (OUTCOME INNER JOIN PLAYER ON OUTCOME.PLAYER_OF_MATCH = PLAYER.PLAYER_ID)
WHERE GAME_DATE = '2020-03-09'
ORDER BY PLAYER_NAME ASC;

-- 15. **Write a query to display the names of players who are All rounders. Display the records sorted in ascending order based on player name.**
SELECT PLAYER.PLAYER_NAME
FROM (OUTCOME INNER JOIN PLAYER ON OUTCOME.PLAYER_OF_MATCH = PLAYER.PLAYER_ID)
ORDER BY PLAYER_NAME ASC;

-- 16. **Write a query to display the venue names for all the games that were played on `2020-03-09`. Display the records sorted in ascending order based on venue name.**
SELECT VENUE.STADIUM_NAME
FROM (GAME INNER JOIN VENUE ON GAME.VENUE_ID = VENUE.VENUE_ID)
WHERE GAME_DATE = '2020-03-09'
ORDER BY STADIUM_NAME ASC;

-- 17. **Write a query to display the Coach's name of the team `Iran`**
SELECT TEAM.COACH
FROM (TEAM INNER JOIN CITY ON TEAM.HOME_CITY = CITY.CITY_ID)
WHERE CITY_NAME = 'IRAN';

-- 18. **Write a query to display the event number and the defence points of `Fazel Atrachali` in each event. Display the records sorted in ascending order based on event number.**
SELECT EVEN.EVENT_NO, EVENT.DEFENDING_POINTS 
FROM(EVENT INNER JOIN PLAYER ON EVENT.RAIDER_ID = PLAYER.PLAYER_ID)
WHERE PLAYER_NAME = 'Fazel Atrachali'
ORDER BY EVENT_NO ASC;

-- 19. **Write a query to display the names of the Winning teams in the month of March 2020. Display the records sorted in ascending order based on team name.**
SELECT TEAM.TEAM_NAME
FROM ((OUTCOME INNER JOIN TEAM ON OUTCOME.WINNER_TEAM_ID = TEAM.TEAM_ID )
INNER JOIN GAME ON OUTCOME.OUTCOME_ID = GAME.OUTCOME_ID )
WHERE GAME_DATE BETWEEN '2020-03-01' and '2020-03-31'
ORDER BY TEAM_NAME ASC;

-- 20. **Write a query to display the names of players who were the player of the match in the games held in March 2020. Display the records sorted in ascending order based on player name.**
SELECT PLAYER.PLAYER_NAME
FROM (OUTCOME INNER JOIN PLAYER ON OUTCOME.PLAYER_OF_MATCH = PLAYER.PLAYER_ID)
WHERE GAME_DATE BETWEEN '2020-03-01' and '2020-03-31'
ORDER BY PLAYER_NAME ASC;



