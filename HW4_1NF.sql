
-- Create temp table temp abilities to store the spilt abilities 
DROP TABLE IF EXISTS temp_abilities;
CREATE TEMPORARY TABLE temp_abilities (name TEXT, 
    pokedex_number TEXT, 
    abilities TEXT, 
    FOREIGN KEY (pokedex_number) REFERENCES imported_pokemon(pokedex_number)
);

-- insert the values from imported_pokemon into the temp table 
INSERT INTO temp_abilities (name, pokedex_number, abilities) 
SELECT name, pokedex_number, abilities 
FROM imported_pokemon; 

WITH RECURSIVE split(pokedex_number, name, abilities, diff_abilities) AS (
    -- anchor query 
    SELECT pokedex_number, name, '' AS abilities, abilities || ',' AS diff_abilities
    FROM imported_pokemon
    -- union 
    UNION ALL 
    -- recursive query
    SELECT pokedex_number, name,
        substr(diff_abilities, 0, instr(diff_abilities, ',')) AS abilities, 
        substr(diff_abilities, instr(diff_abilities, ',')+1) AS diff_abilities
    FROM split
    WHERE diff_abilities != ''
)
INSERT INTO temp.temp_abilities(name, pokedex_number, abilities)
SELECT name, pokedex_number, abilities 
FROM split
ORDER BY pokedex_number;

UPDATE temp_abilities
SET abilities = REPLACE(REPLACE(REPLACE(abilities, '[', ''), ']', ''), '"', '');
