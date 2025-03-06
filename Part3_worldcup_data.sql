
SET SERVEROUTPUT ON

DROP TABLE FIFA2018;

CREATE TABLE FIFA2018
(
    round16_id              NUMBER(2),
    round16_game_num        VARCHAR2(10),
    round16_turn            NUMBER(2),
    r_country               VARCHAR2(20),
    round16_win             NUMBER(2) DEFAULT(0),
    round8_win              NUMBER(2) DEFAULT(0),
    round4_win              NUMBER(2) DEFAULT(0),
    round2_win              NUMBER(2) DEFAULT(0),
    r_comment               VARCHAR2(50) DEFAULT(''),

    CONSTRAINT FIFA2018_round16_id_pk
        PRIMARY KEY (round16_id)
);

INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(1, '16-1', 1);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(2, '16-1', 2);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(3, '16-2', 1);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(4, '16-2', 2);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(5, '16-3', 1);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(6, '16-3', 2);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(7, '16-4', 1);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(8, '16-4', 2);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(9, '16-5', 1);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(10, '16-5', 2);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(11, '16-6', 1);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(12, '16-6', 2);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(13, '16-7', 1);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(14, '16-7', 2);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(15, '16-8', 1);
INSERT INTO FIFA2018(round16_id, round16_game_num, round16_turn) VALUES(16, '16-8', 2);






