
------------- WELCOME TO THE FIFA WORLD CUP MANAGER! -------------

SET SERVEROUTPUT ON


-- 1. Access the database. You don't need to do this if you are new here.
exec game_access('Matthew', 852963);


-- 2. Enter the name of the World Cup and its location.
exec new_game('FIFA 2018 WORLD CUP', 'Russia', 'unknown', 'unknown');


-- 3. Enter the countries and their matching game number.
exec game_info('France', 'Argentina', '16-1');
exec game_info('Uruguay', 'Portugal', '16-2');
exec game_info('Spain', 'Russia', '16-3');
exec game_info('Croatia', 'Denmark', '16-4');
exec game_info('Brazil', 'Mexico', '16-5');
exec game_info('Belgium', 'Japan', '16-6');
exec game_info('Sweden', 'Switzerland', '16-7');
exec game_info('Colombia', 'England', '16-8');


-- 4. For the round of 16, enter the 2 countries that they match and the winner.
exec round16('France', 'Argentina', 'France');
exec round16('Uruguay', 'Portugal', 'Uruguay');
exec round16('Spain', 'Russia', 'Russia');
exec round16('Croatia', 'Denmark', 'Croatia');
exec round16('Brazil', 'Mexico', 'Brazil');
exec round16('Belgium', 'Japan', 'Belgium');
exec round16('Sweden', 'Switzerland', 'Sweden');
exec round16('Colombia', 'England', 'England');

-- 5. For the quarterfinals, enter the 2 countries that they match and the winner.
exec quarterfinals('France', 'Uruguay', 'France');
exec quarterfinals('Brazil', 'Belgium', 'Belgium');
exec quarterfinals('Russia', 'Croatia', 'Croatia');
exec quarterfinals('Sweden', 'England', 'England');


-- 6. For the semifinals, enter the 2 countries that they match and the winner.
exec semifinals('France', 'Belgium', 'France');
exec semifinals('Croatia', 'England', 'Croatia');


-- 7. For the final match, enter the 2 countries that they match and the winner.
exec the_final('France', 'Croatia', 'France');


-- 8. Also record the third placed country, too.
exec match_for_third_place('Belgium', 'England', 'Belgium');


-- 9. You can check the scores so far.
exec check_score('16-2');


-- 10. Now, let's update the World Cup information.
-- Enter the winner country of each match game number at the quarterfinals.
exec quarterfinals_info('France', '16-1');
exec quarterfinals_info('Uruguay', '16-2');
exec quarterfinals_info('Russia', '16-3');
exec quarterfinals_info('Croatia', '16-4');
exec quarterfinals_info('Brazil', '16-5');
exec quarterfinals_info('Belgium', '16-6');
exec quarterfinals_info('Sweden', '16-7');
exec quarterfinals_info('England', '16-8');


-- 11. Just run the following commands.
-- This will automatically update the results based on what you've entered so far.
exec semifinals_info('16-1');
exec semifinals_info('16-2');
exec semifinals_info('16-3');
exec semifinals_info('16-4');
exec semifinals_info('16-5');
exec semifinals_info('16-6');
exec semifinals_info('16-7');
exec semifinals_info('16-8');

exec the_final_info('16-1', '16-2');
exec the_final_info('16-3', '16-4');
exec the_final_info('16-5', '16-6');
exec the_final_info('16-7', '16-8');


-- 12. Now, you can check the final results and the overall results.
exec the_final_results;

exec overall_results;

--SELECT * FROM games;
--SELECT * FROM FIFA2018;
--SELECT * FROM games;






