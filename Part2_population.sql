

INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Uruguay', 'Diego Alonso', 3, 0, 9);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Russia', 'Valeriy Karpin', 2, 1, 6);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Spain', 'Luis Enrique', 1, 0, 5);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Portugal', 'Fernando Santos', 1, 0, 5);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('France', 'Didier Deschamps', 2, 0, 7);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Denmark', 'Kasper Hjulmand', 1, 0, 5);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Croatia', 'Zlatko Dalic', 3, 0, 9);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Argentina', 'Lionel Scaloni', 1, 1, 4);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Brazil', 'Tite', 2, 0, 7);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Switzerland', 'Murat Yakin', 1, 0, 5);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Sweden', 'Janne Andersson', 2, 1, 6);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Mexico', 'Gerardo Martino', 2, 1, 6);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Belgium', 'Roberto Mart?nez', 3, 0, 9);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('England', 'Gareth Southgate', 2, 1, 6);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Colombia', 'Nestor Lorenzo', 2, 1, 6);
INSERT INTO countries (c_name, c_coach, c_win, c_lose, c_score)
VALUES ('Japan', 'Hajime Moriyasu', 1, 1, 4);


INSERT INTO games (g_name, g_location, g_final, g_semifinal)
VALUES ('FIFA 2002 WORLD CUP', 'Korea, Japan', 'Brazil', 'Germany');
INSERT INTO games (g_name, g_location, g_final, g_semifinal)
VALUES ('FIFA 2014 WORLD CUP', 'Brazil', 'Germany', 'Argentina');
--INSERT INTO games (g_name, g_location, g_final, g_semifinal)
--VALUES ('FIFA 2018 WORLD CUP', 'Russia', 'unknown', 'unknown');



INSERT INTO players (p_name, p_score, c_name)
VALUES ('Luis Suarez', 68, 'Uruguay');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Oleh Blokhin', 42, 'Russia');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('David villa', 59, 'Spain');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Cristiano Ronaldo', 117, 'Portugal');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Thierry Henry', 51, 'France');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Poul Nielsen', 52, 'Denmark');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Davor Suker', 45, 'Croatia');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Lionel Messi', 86, 'Argentina');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Pele', 77, 'Brazil');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Alexander Frei', 42, 'Switzerland');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Zlatan Ibrahimovic', 62, 'Sweden');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Javier Hernandez', 52, 'Mexico');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Romelu Lukaku', 68, 'Belgium');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Wayne Rooney', 53, 'England');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Radamel Falcao', 34, 'Colombia');
INSERT INTO players (p_name, p_score, c_name)
VALUES ('Gamamoto Kunisige', 75, 'Japan');



INSERT INTO league_table (l_id, l_country1, l_country2, l_winner)
VALUES (1, 'Colombia', 'Senegal', 'Colombia');
INSERT INTO league_table (l_id, l_country1, l_country2, l_winner)
VALUES (2, 'Japan', 'Poland', 'Japan');
INSERT INTO league_table (l_id, l_country1, l_country2, l_winner)
VALUES (3, 'Sweden', 'Korea', 'Sweden');
INSERT INTO league_table (l_id, l_country1, l_country2, l_winner)
VALUES (4, 'Mexico', 'Germany', 'Mexico');
INSERT INTO league_table (l_id, l_country1, l_country2, l_winner)
VALUES (5, 'Croatia', 'Iceland', 'Croatia');



INSERT INTO game_manager (gm_manager, gm_name, gm_pwd) VALUES ('Russia', 'Matthew', 852963);





