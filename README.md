(Sample execution is in 'Execution_example.sql' file.)    

The program is ready to be filled in. Read the titles of each command carefully and enter the game information in '___xxx___'.  
   (ex) exec game_access('___', ___);   -->  exec game_access('Matthew', 852963);  

To run commands: Ctrl + Enter  

Steps to run FIFA WORLD CUP MANAGER:  
	1. Open the files: Part1_database.sql through Part4_game_manage.sql using Oracle program.  
	2. Press Ctrl + a then Ctrl + ENTER for each part.  
	3. Now, open Execution.sql.  
	4. Enter your name and id (You don't need to do this if you are a new manager).  
	5. Enter the World Cup information in the 'exec game_info' section.  
	6. Enter the round of 16 information in the 'exec round16' section.  
	7. Enter the quarterfinals information in the 'exec quarterfinals' section.  
	8. Enter the semifinals information in the 'exec semifinals' section.  
	9. Enter the final match information in the 'exec the_final' section.  
	10. Enter the information of the third place country in the 'match_for_third_place' section.  
	11. Update the FIFA WORLD CUP information in the 'quarterfinals_info', 'semifinals_info', and 'the_final_info' by entering the game results for each game.  
	12. Now you can check the overall scores and results by running: 'exec check_score('game number'), exec the_final_results or exec overall_results.

