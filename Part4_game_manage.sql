
SET SERVEROUTPUT ON

--------------------------------------------------------------------------------
-- Game manager access the database
CREATE OR REPLACE PROCEDURE game_access
(
    p_gm_name IN game_manager.gm_name%TYPE,
    p_gm_pwd IN game_manager.gm_pwd%TYPE
)
IS
    v_gm_pwd game_manager.gm_pwd%TYPE;
BEGIN
--    DBMS_OUTPUT.ENABLE;
    SELECT gm_pwd INTO v_gm_pwd FROM game_manager
    WHERE gm_name = p_gm_name;

    IF v_gm_pwd = p_gm_pwd THEN
        dbms_output.put_line('Login Successful.');
    ELSE
        dbms_output.put_line('Invalid User.');
    END IF ;
END ;
/



--------------------------------------------------------------------------------
-- Enter new game
CREATE OR REPLACE TRIGGER game_trigger
BEFORE INSERT ON games FOR EACH ROW
BEGIN 
    DBMS_OUTPUT.PUT_LINE('New Game Created: ' || :new.g_name);
END;
/

CREATE OR REPLACE PROCEDURE new_game
(
    p_g_name IN games.g_name%TYPE,
    p_g_location IN games.g_location%TYPE,
    p_g_final IN games.g_final%TYPE,
    p_g_semifinal IN games.g_semifinal%TYPE
)
IS
BEGIN

    INSERT INTO games(g_name, g_location, g_final, g_semifinal) VALUES(p_g_name, p_g_location, p_g_final, p_g_semifinal);   
END;
/



--------------------------------------------------------------------------------
-- Enter game info
CREATE OR REPLACE PROCEDURE game_info
(
    p_r_country1 IN FIFA2018.r_country%TYPE,
    p_r_country2 IN FIFA2018.r_country%TYPE,
    p_round16_game_num IN FIFA2018.round16_game_num%TYPE
)
IS
BEGIN
    UPDATE FIFA2018 SET r_country=p_r_country1
    WHERE round16_turn=1 AND round16_game_num = p_round16_game_num;
    UPDATE FIFA2018 SET r_country=p_r_country2
    WHERE round16_turn=2 AND round16_game_num = p_round16_game_num;
    
    dbms_output.put_line('Round of 16, Game ' || p_round16_game_num);
    dbms_output.put_line(p_r_country1 || ' and ' || p_r_country2);
END;
/



--------------------------------------------------------------------------------
-- Record the information at the end of each game.

-- Round of 16:
DROP SEQUENCE l_id_seq;
CREATE SEQUENCE l_id_seq START WITH 6 increment by 1;
--
--
--DROP TRIGGER seq_trigger;
--CREATE OR REPLACE TRIGGER seq_trigger
--BEFORE INSERT ON league_table FOR EACH ROW
--DECLARE
--    v_l_id NUMBER(3);
--BEGIN
--    SELECT max(l_id) INTO v_l_id FROM league_table;
--    CREATE SEQUENCE l_id_seq START WITH v_l_id increment by 1;
--    DBMS_OUTPUT.PUT_LINE('New Game Created: ' || :new.g_name);
--END;
--/

CREATE OR REPLACE PROCEDURE round16
(
    p_r_country1 IN FIFA2018.r_country%TYPE,
    p_r_country2 IN FIFA2018.r_country%TYPE,
    p_round16_winner IN FIFA2018.r_country%TYPE
)
IS
BEGIN
    INSERT INTO league_table VALUES (l_id_seq.nextval, p_r_country1, p_r_country2, p_round16_winner);
    UPDATE FIFA2018 SET round16_win = round16_win + 1 WHERE r_country = p_round16_winner;
END;
/



--------------------------------------------------------------------------------
-- Quarterfinals:

CREATE OR REPLACE PROCEDURE quarterfinals
(
    p_r_country1 IN FIFA2018.r_country%TYPE,
    p_r_country2 IN FIFA2018.r_country%TYPE,
    p_round16_winner IN FIFA2018.r_country%TYPE
)
IS
BEGIN
    INSERT INTO league_table VALUES (l_id_seq.nextval, p_r_country1, p_r_country2, p_round16_winner);
    UPDATE FIFA2018 SET round8_win = round8_win + 1 WHERE r_country = p_round16_winner;
END;
/



--------------------------------------------------------------------------------
-- Semifinal:
CREATE OR REPLACE PROCEDURE semifinals
(
    p_r_country1 IN FIFA2018.r_country%TYPE,
    p_r_country2 IN FIFA2018.r_country%TYPE,
    p_round16_winner IN FIFA2018.r_country%TYPE
)
IS
BEGIN
    INSERT INTO league_table VALUES (l_id_seq.nextval, p_r_country1, p_r_country2, p_round16_winner);
    UPDATE FIFA2018 SET round4_win = round4_win + 1 WHERE r_country = p_round16_winner;
END;
/



--------------------------------------------------------------------------------
-- The Final:

CREATE OR REPLACE PROCEDURE the_final
(
    p_r_country1 IN FIFA2018.r_country%TYPE,
    p_r_country2 IN FIFA2018.r_country%TYPE,
    p_round16_winner IN FIFA2018.r_country%TYPE
)
IS
BEGIN
    INSERT INTO league_table VALUES (l_id_seq.nextval, p_r_country1, p_r_country2, p_round16_winner);
    UPDATE FIFA2018 SET round2_win = round2_win + 3 WHERE r_country = p_round16_winner;
END;
/


CREATE OR REPLACE PROCEDURE match_for_third_place
(
    p_r_country1 IN FIFA2018.r_country%TYPE,
    p_r_country2 IN FIFA2018.r_country%TYPE,
    p_round16_winner IN FIFA2018.r_country%TYPE
)
IS
BEGIN
    INSERT INTO league_table VALUES (l_id_seq.nextval, p_r_country1, p_r_country2, p_round16_winner);
    UPDATE FIFA2018 SET round2_win = round2_win + 1 WHERE r_country = p_round16_winner;
END;
/


--------------------------------------------------------------------------------
-- Check the scores
CREATE OR REPLACE PROCEDURE check_score
(
    p_round16_game_num IN FIFA2018.round16_game_num%TYPE
)
IS
    TYPE score_table IS TABLE OF FIFA2018.round16_win%TYPE INDEX BY BINARY_INTEGER;
    TYPE country_table IS TABLE OF FIFA2018.r_country%TYPE INDEX BY BINARY_INTEGER;
    win_tab score_table;
    country_tab country_table;
    i BINARY_INTEGER:=0;
BEGIN
    FOR k IN (SELECT round16_win, r_country FROM FIFA2018 WHERE round16_game_num=p_round16_game_num)
    LOOP
        i := i+1;
        win_tab(i) := k.round16_win;
        country_tab (i):= k.r_country;
    END LOOP;

    FOR q IN 1..i
    LOOP
        dbms_output.put_line('Country: ' || country_tab(q));
        dbms_output.put_line('Score: ' || win_tab(q));
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line('Invalid Game.');
END;
/



--------------------------------------------------------------------------------
-- Enter Quarterfinals information to FIFA2018
CREATE OR REPLACE PROCEDURE quarterfinals_info
(
    p_r_country IN FIFA2018.r_country%TYPE,
    p_round16_game_num IN FIFA2018.round16_game_num%TYPE
)
IS
BEGIN
    UPDATE FIFA2018 SET r_comment = 'Advancing to the quarterfinals' WHERE r_country = p_r_country;

    dbms_output.put_line('Winner of the Game ' || p_round16_game_num || ' made it to the quarterfinals: ' || p_r_country);

EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('Invalid Input.');
END;
/



--------------------------------------------------------------------------------
-- Enter Semifinal information
CREATE OR REPLACE PROCEDURE semifinals_info
(
    p_round16_game_num IN FIFA2018.round16_game_num%TYPE
)
IS
    v_round8_win FIFA2018.round8_win%TYPE;
    v_r_country FIFA2018.r_country%TYPE;
BEGIN
    SELECT round8_win, r_country INTO v_round8_win, v_r_country FROM FIFA2018
    WHERE round8_win = (SELECT MAX(round8_win) FROM FIFA2018 WHERE round16_game_num = p_round16_game_num)
    AND round16_game_num = p_round16_game_num;
    
    UPDATE FIFA2018 SET r_comment = 'Advancing to the semifinals'
    WHERE round8_win = v_round8_win AND round16_game_num = p_round16_game_num;

EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('Invalid group for the semifinals.');
END;
/



--------------------------------------------------------------------------------
-- Enter the grand final information
CREATE OR REPLACE PROCEDURE the_final_info
(
    p_round16_game_num1 IN FIFA2018.round16_game_num%TYPE,
    p_round16_game_num2 IN FIFA2018.round16_game_num%TYPE
)
IS
    v_semi_win1 FIFA2018.round4_win%TYPE;
    v_semi_win2 FIFA2018.round4_win%TYPE;
    v_r_country1 FIFA2018.r_country%TYPE;
    v_r_country2 FIFA2018.r_country%TYPE;
    v_cnt1 NUMBER := 0;
    v_cnt2 NUMBER := 0;
BEGIN
--    SELECT round4_win, r_country INTO v_semi_win1, v_r_country1 FROM FIFA2018
--    WHERE round4_win = (SELECT MAX(round4_win) FROM FIFA2018 WHERE round16_game_num = p_round16_game_num1)
--    AND round16_game_num = p_round16_game_num1;
--
--    SELECT round4_win, r_country INTO v_semi_win2, v_r_country2 FROM FIFA2018
--    WHERE round4_win = (SELECT MAX(round4_win) FROM FIFA2018 WHERE round16_game_num = p_round16_game_num2)
--    AND round16_game_num = p_round16_game_num2;

    SELECT COUNT(*) INTO v_cnt1 FROM FIFA2018
    WHERE round4_win = (SELECT MAX(round4_win) FROM FIFA2018 WHERE round16_game_num = p_round16_game_num1);

    SELECT COUNT(*) INTO v_cnt2 FROM FIFA2018
    WHERE round4_win = (SELECT MAX(round4_win) FROM FIFA2018 WHERE round16_game_num = p_round16_game_num2);

    IF v_cnt1 = 2 THEN
        UPDATE FIFA2018 SET r_comment = 'Advancement to the finals'
        WHERE round4_win > 0 AND round16_game_num = p_round16_game_num1;

    ELSE
        UPDATE FIFA2018 SET r_comment = 'Advancement to the finals'
        WHERE round4_win > 0 AND round16_game_num = p_round16_game_num2;
    END IF;

    
--    IF
--        SELECT COUNT(*) FROM (SELECT round4_win, r_country FROM FIFA2018
--        WHERE round4_win = (SELECT MAX(round4_win) FROM FIFA2018 WHERE round16_game_num = p_round16_game_num1)
--        AND round16_game_num = p_round16_game_num1) = 2 THEN
--            v_cnt1 := 2;
--    ELSIF
--        (SELECT COUNT(*) FROM (SELECT round4_win, r_country FROM FIFA2018
--        WHERE round4_win = (SELECT MAX(round4_win) FROM FIFA2018 WHERE round16_game_num = p_round16_game_num2)
--        AND round16_game_num = p_round16_game_num2)) = 2 THEN
--            v_cnt2 := 2;
--    END IF;

EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('Invalid group for the finals.');
END;
/



--------------------------------------------------------------------------------
-- 
CREATE OR REPLACE PROCEDURE the_final_results
IS
    v_round2_win1 FIFA2018.round2_win%TYPE;
    v_round2_win2 FIFA2018.round2_win%TYPE;
    v_r_country1 FIFA2018.r_country%TYPE;
    v_r_country2 FIFA2018.r_country%TYPE;
BEGIN
    SELECT round2_win, r_country INTO v_round2_win1, v_r_country1 FROM FIFA2018
    WHERE round2_win = (SELECT MAX(round2_win) FROM FIFA2018 WHERE round16_game_num IN ('16-1', '16-2', '16-3', '16-4'));
    SELECT round2_win, r_country INTO v_round2_win2, v_r_country2 FROM FIFA2018
    WHERE round2_win = (SELECT MAX(round2_win) FROM FIFA2018 WHERE round16_game_num IN ('16-5', '16-6', '16-7', '16-8'));

    IF v_round2_win1 > 1 THEN
        UPDATE FIFA2018 SET r_comment = 'Winner' WHERE round2_win = v_round2_win1;
        UPDATE FIFA2018 SET r_comment = 'Second Place' WHERE r_country = v_r_country2;
        UPDATE games SET g_final = v_r_country1 WHERE g_name = 'FIFA 2018 WORLD CUP';
        UPDATE games SET g_semifinal = v_r_country2 WHERE g_name = 'FIFA 2018 WORLD CUP';
        dbms_output.put_line('Winner: ' || v_r_country1);
        dbms_output.put_line('Second Place: ' || v_r_country2);
    ELSE
        UPDATE FIFA2018 SET r_comment = 'Winner' WHERE r_country = v_r_country2;
        UPDATE FIFA2018 SET r_comment = 'Second Place' WHERE round2_win = v_round2_win1;
        UPDATE games SET g_final = v_r_country2 WHERE g_name = 'FIFA 2018 WORLD CUP';
        UPDATE games SET g_semifinal = v_r_country1 WHERE g_name = 'FIFA 2018 WORLD CUP';
        dbms_output.put_line('Winner: ' || v_r_country2);
        dbms_output.put_line('Second Place: ' || v_r_country1);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
            dbms_output.put_line('Invalid group to get the results.');
END;
/



--------------------------------------------------------------------------------
CREATE OR REPLACE PROCEDURE overall_results
IS
CURSOR overall_results IS
    SELECT r_country, r_comment, round16_win+round8_win+round4_win+round2_win AS total_s FROM FIFA2018;
BEGIN
    FOR ka IN overall_results LOOP
        dbms_output.put_line('Country: '|| ka.r_country);
        dbms_output.put_line('Score: '|| ka.total_s);
        dbms_output.put_line('Fianl result: '|| ka.r_comment);
    END LOOP;

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('ERR CODE:'||to_char(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('ERR MESSAGE:'||SQLERRM);
END;
/






