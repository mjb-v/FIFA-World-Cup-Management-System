
------------- WELCOME TO THE FIFA WORLD CUP MANAGER! -------------
-- You are a game manager who records the results of the FIFA WORLD CUP games.
-- FILL IN THE '___XXXXX____' parts below.

SET SERVEROUTPUT ON


-- 1. Access the database. You don't need to do this if you are new here.
exec game_access('___name___', ___password___);


-- 2. Enter the name of the World Cup and its location.
exec new_game('___WORLD CUP NAME___', '___WORLD CUP LOCATION___', 'unknown', 'unknown');


-- 3. Enter the countries and their matching game number.
exec game_info('___Country 1___', '___Country 2___', '___Group Number___');
exec game_info('___Country 1___', '___Country 2___', '___Group Number___');
exec game_info('___Country 1___', '___Country 2___', '___Group Number___');
exec game_info('___Country 1___', '___Country 2___', '___Group Number___');
exec game_info('___Country 1___', '___Country 2___', '___Group Number___');
exec game_info('___Country 1___', '___Country 2___', '___Group Number___');
exec game_info('___Country 1___', '___Country 2___', '___Group Number___');
exec game_info('___Country 1___', '___Country 2___', '___Group Number___');


-- 4. For the round of 16, enter the 2 countries that they match and the winner.
exec round16('___Country 1___', '___Country 2___', '___Winner Country___');
exec round16('___Country 1___', '___Country 2___', '___Winner Country___');
exec round16('___Country 1___', '___Country 2___', '___Winner Country___');
exec round16('___Country 1___', '___Country 2___', '___Winner Country___');
exec round16('___Country 1___', '___Country 2___', '___Winner Country___');
exec round16('___Country 1___', '___Country 2___', '___Winner Country___');
exec round16('___Country 1___', '___Country 2___', '___Winner Country___');
exec round16('___Country 1___', '___Country 2___', '___Winner Country___');


-- 5. For the quarterfinals, enter the 2 countries that they match and the winner.
exec quarterfinals('___Country 1___', '___Country 2___', '___Winner Country___');
exec quarterfinals('___Country 1___', '___Country 2___', '___Winner Country___');
exec quarterfinals('___Country 1___', '___Country 2___', '___Winner Country___');
exec quarterfinals('___Country 1___', '___Country 2___', '___Winner Country___');


-- 6. For the semifinals, enter the 2 countries that they match and the winner.
exec semifinals('___Country 1___', '___Country 2___', '___Winner Country___');
exec semifinals('___Country 1___', '___Country 2___', '___Winner Country___');


-- 7. For the final match, enter the 2 countries that they match and the winner.
exec the_final('___Country 1___', '___Country 2___', '___Winner Country___');

-- 8. Also record the third placed country, too.
exec match_for_third_place('___Country 1___', '___Country 2___', '___Winner Country___');


-- 9. (Optional) You can check the scores so far.
exec check_score('___Group Number___');


-- 10. Now, let's update the World Cup information.
-- Enter the winner country of each match game number at the quarterfinals.
exec quarterfinals_info('___Winner Country___', '___Group Number___');
exec quarterfinals_info('___Winner Country___', '___Group Number___');
exec quarterfinals_info('___Winner Country___', '___Group Number___');
exec quarterfinals_info('___Winner Country___', '___Group Number___');
exec quarterfinals_info('___Winner Country___', '___Group Number___');
exec quarterfinals_info('___Winner Country___', '___Group Number___');
exec quarterfinals_info('___Winner Country___', '___Group Number___');
exec quarterfinals_info('___Winner Country___', '___Group Number___');


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






