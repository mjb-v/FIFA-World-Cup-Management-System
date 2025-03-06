

DROP TABLE countries;
DROP TABLE games;
DROP TABLE players;
DROP TABLE game_manager;
DROP TABLE league_table;


-- Create tables

CREATE TABLE countries
(
    c_name          VARCHAR2(20),
    c_coach         VARCHAR2(30) NOT NULL,
    c_win           NUMBER(2) NOT NULL,
    c_lose          NUMBER(2) NOT NULL,
    c_score         NUMBER(2) NOT NULL,
    
    CONSTRAINT countries_c_name_pk
        PRIMARY KEY (c_name)
);



CREATE TABLE games
(
    g_name          VARCHAR2(30),
    g_location      VARCHAR2(30) NOT NULL,
    g_final         VARCHAR2(10) NOT NULL,
    g_semifinal     VARCHAR2(10) NOT NULL,

    CONSTRAINT games_g_name_pk
        PRIMARY KEY (g_name)
);



CREATE TABLE players
(
    p_name          VARCHAR2(30),
    p_score         NUMBER(5) NOT NULL,
    c_name          VARCHAR2(20),

    CONSTRAINT players_p_name_pk
        PRIMARY KEY (p_name),
    CONSTRAINT players_countries_fk
        FOREIGN KEY (c_name)
        REFERENCES countries (c_name)
);



CREATE TABLE game_manager
(
    gm_manager      VARCHAR2(10),
    gm_name         VARCHAR2(20),
    gm_pwd          NUMBER(10) NOT NULL,

    CONSTRAINT game_manager_pk
        PRIMARY KEY (gm_manager)
);



CREATE TABLE league_table
(
    l_id            NUMBER(3),
    l_country1      VARCHAR2(20) NOT NULL,
    l_country2      VARCHAR2(20) NOT NULL,
    l_winner        VARCHAR(10) NOT NULL,

    CONSTRAINT league_table_l_id_pk
        PRIMARY KEY (l_id)
);






