USE Futbol;
-- ===========================
-- Parte 1: Conociendo la Data
-- ===========================

-- ¿Cuántas competiciones diferentes existen en la base de datos?
SELECT COUNT(*) AS TotalComp -- Cuenta todas las filas en la tabla, sin importar si hay valores NULL o no
FROM competitions; -- Indica que los datos se están tomando de la tabla competitions

-- ¿Cuántas temporadas se registran en total?
SELECT COUNT(*) AS TotalSeas -- Cuenta todas las filas en la tabla, sin importar si hay valores NULL o no
FROM seasons; -- Indica que los datos se están tomando de la tabla seasons

-- ¿Cuántos equipos distintos están registrados?
SELECT COUNT(*) AS TotalTs -- Cuenta todas las filas en la tabla, sin importar si hay valores NULL o no
FROM teams; -- Indica que los datos se están tomando de la tabla teams

-- ¿Cuántos árbitros distintos aparecen en los partidos?
SELECT COUNT(DISTINCT referee_id) AS TotalRefDis -- Cuenta cuántos valores distintos hay en la columna referee_id
FROM matches -- Indica que los datos se están tomando de la tabla matches
WHERE referee_id IS NOT NULL; -- Esta condición filtra las filas de la tabla antes de hacer el conteo, ignora registros donde no se registró un árbitro







