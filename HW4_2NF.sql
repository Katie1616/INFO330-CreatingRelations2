CREATE TABLE pokemon_abilities (
  id INTEGER PRIMARY KEY,
  pokedex_number INT,
  ability TEXT,
  FOREIGN KEY (pokedex_number) REFERENCES temp_abilities(pokedex_number)
);

INSERT INTO pokemon_abilities (pokedex_number, ability)
SELECT ta.pokedex_number, a.ability
FROM temp_abilities ta
JOIN abilities a ON ta.abilities = a.ability;

CREATE TABLE types (
  id INTEGER PRIMARY KEY,
  name TEXT
);

INSERT INTO types (name)
SELECT DISTINCT type1 FROM imported_pokemon;
INSERT INTO types (name)
SELECT DISTINCT type2 FROM imported_pokemon WHERE type2 NOT NULL;

ALTER TABLE temp_abilities DROP COLUMN abilities;
