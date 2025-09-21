
USE Futbol;

-- ============================
-- Parte 3: Preguntas del Grupo
-- ============================

-- Preguntas del grupo 10 
-- ¿Cuál es el equipo con más empates?
SELECT t.team_name,
       COUNT(*) AS TotalDraws
FROM teams t
INNER JOIN matches m ON t.team_id = m.home_team_id OR t.team_id = m.away_team_id
WHERE m.fulltime_home = m.fulltime_away
GROUP BY t.team_name
ORDER BY TotalDraws DESC
LIMIT 1;

-- ¿Cuál fue el partido con más goles anotados?
SELECT m.match_id, c.competition_name, s.season, 
       t1.team_name AS home_team, t2.team_name AS away_team,
       m.fulltime_home, m.fulltime_away,
       m.total_goals
FROM matches m
INNER JOIN seasons s ON m.season_id = s.season_id
INNER JOIN competitions c ON s.competition_code = c.competition_code
INNER JOIN teams t1 ON m.home_team_id = t1.team_id
INNER JOIN teams t2 ON m.away_team_id = t2.team_id
ORDER BY m.total_goals DESC
LIMIT 1;

-- ¿Qué equipo obtuvo más puntos como visitante?
SELECT t.team_name,
       SUM(m.away_points) AS total_away_points
FROM matches m
INNER JOIN teams t ON m.away_team_id = t.team_id
GROUP BY t.team_name
ORDER BY total_away_points DESC
LIMIT 10;

-- ¿Cuál es el promedio de goles recibidos por equipo?
SELECT t.team_name,
       ROUND(AVG(CASE
                   WHEN m.home_team_id = t.team_id THEN m.fulltime_away
                   WHEN m.away_team_id = t.team_id THEN m.fulltime_home
                   ELSE NULL
                 END), 2) AS avg_goals_conceded
FROM teams t
INNER JOIN matches M ON t.team_id = m.home_team_id OR t.team_id = m.away_team_id
GROUP BY t.team_name
ORDER BY avg_goals_conceded DESC;

-- ¿Qué equipos han jugado más partidos en total?
SELECT t.team_name,
       COUNT(*) AS total_matches
FROM teams t
INNER JOIN matches m ON t.team_id = m.home_team_id OR t.team_id = m.away_team_id
GROUP BY t.team_name
ORDER BY total_matches DESC;