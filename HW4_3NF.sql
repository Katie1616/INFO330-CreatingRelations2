-- against table
CREATE TABLE IF NOT EXISTS against (
    pokedex_number INT,
    "against_bug" TEXT, 
    "against_dark" TEXT, 
    "against_dragon" TEXT,
    "against_electric" TEXT,
    "against_fairy" TEXT,  
    "against_fight" TEXT, 
    "against_fire" TEXT,
    "against_flying" TEXT, 
    "against_ghost" TEXT, 
    "against_grass" TEXT, 
    "against_ground" TEXT,
    "against_ice" TEXT, 
    "against_normal" TEXT, 
    "against_poison" TEXT, 
    "against_psychic" TEXT,
    "against_rock" TEXT, 
    "against_steel" TEXT, 
    "against_water" TEXT, 
    FOREIGN KEY (pokedex_number) REFERENCES imported_pokemon(pokedex_number)
)

--insert information to against table
INSERT INTO against (
    against_bug, 
    against_dark, 
    against_dragon, 
    against_electric, 
    against_fairy, 
    against_fight, 
    against_fire, 
    against_flying, 
    against_ghost, 
    against_grass, 
    against_ground, 
    against_ice, 
    against_normal, 
    against_poison, 
    against_psychic, 
    against_rock, 
    against_steel, 
    against_water
)
SELECT 
    against_bug, 
    against_dark, 
    against_dragon, 
    against_electric, 
    against_fairy, 
    against_fight, 
    against_fire, 
    against_flying, 
    against_ghost, 
    against_grass, 
    against_ground, 
    against_ice, 
    against_normal, 
    against_poison, 
    against_psychic, 
    against_rock, 
    against_steel, 
    against_water
FROM imported_pokemon;

--stats table 
CREATE TABLE IF NOT EXISTS stats(
     "attack" TEXT,
     "base_egg_steps" TEXT,
     "base_happiness" TEXT, 
     "base_total" TEXT, 
     "capture_rate" TEXT,
     "classfication" TEXT, 
     "defense" TEXT, 
     "experience_growth" TEXT, 
     "height_m" TEXT,
     "hp" TEXT, 
     "name" TEXT, 
     "percentage_male" TEXT, 
     "sp_attack" TEXT, 
     "sp_defense" TEXT, 
     "speed" TEXT,  
     "weight_kg" TEXT, 
     "generation" TEXT, 
     "is_legendary" TEXT
)

--insert information into stats table
INSERT INTO stats (
  "attack",
  "base_egg_steps",
  "base_happiness",
  "base_total",
  "capture_rate",
  "classfication",
  "defense",
  "experience_growth",
  "height_m",
  "hp",
  "name",
  "percentage_male",
  "sp_attack",
  "sp_defense",
  "speed",
  "weight_kg",
  "generation",
  "is_legendary"
)
SELECT
  "attack",
  "base_egg_steps",
  "base_happiness",
  "base_total",
  "capture_rate",
  "classfication",
  "defense",
  "experience_growth",
  "height_m",
  "hp",
  "name",
  "percentage_male",
  "sp_attack",
  "sp_defense",
  "speed",
  "weight_kg",
  "generation",
  "is_legendary"
FROM
  imported_pokemon;