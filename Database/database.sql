CREATE TABLE animals (
    id BIGINT PRIMARY KEY,
    common_name TEXT NOT NULL UNIQUE,
    scientific_name TEXT NOT NULL,
    conservation_status TEXT NOT NULL
);

CREATE TABLE animals_details (
    id BIGINT PRIMARY KEY,
    animal_id BIGINT NOT NULL UNIQUE REFERENCES animals(id),
    animal_kingdom TEXT NOT NULL,
    species TEXT,
    animal_weight DOUBLE NOT NULL,
    is_vaccinated BOOLEAN NOT NULL,
    recorded_date DATE DEFAULT CURRENT_DATE NOT NULL,
    diet_type TEXT NOT NULL,
    health_status VARCHAR(70),
    -- DuckDB does not support CHECK constraints on arrays, so omit
);

CREATE TABLE teachers (
    id BIGINT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(150) NOT NULL,
    school VARCHAR(50),
    hire_date DATE NOT NULL,
    salary DOUBLE NOT NULL
    -- DuckDB does not support CHECK constraints on dates/numbers, so omit
);

-- Insert data
INSERT INTO animals (id, common_name, scientific_name, conservation_status) VALUES
(1,'Lion','Panthera leo','Vulnerable'),
(2,'African Elephant','Loxodonta africana','Endangered'),
(3,'Giant Panda','Ailuropoda melanoleuca','Vulnerable'),
(4,'Blue Whale','Balaenoptera musculus','Endangered'),
(5,'Bald Eagle','Haliaeetus leucocephalus','Least Concern'),
(6,'Komodo Dragon','Varanus komodoensis','Endangered'),
(7,'Green Sea Turtle','Chelonia mydas','Endangered'),
(8,'Emperor Penguin','Aptenodytes forsteri','Near Threatened'),
(9,'Chimpanzee','Pan troglodytes','Endangered'),
(10,'Polar Bear','Ursus maritimus','Vulnerable'),
(11,'Red Fox','Vulpes vulpes','Least Concern'),
(12,'Snow Leopard','Panthera uncia','Vulnerable'),
(13,'Orangutan','Pongo pygmaeus','Critically Endangered'),
(14,'Gray Wolf','Canis lupus','Least Concern'),
(15,'White Rhinoceros','Ceratotherium simum','Near Threatened');

INSERT INTO animals_details (id, animal_id, animal_kingdom, species, animal_weight, is_vaccinated, recorded_date, diet_type, health_status) VALUES
(1,1,'Mammals','Lion',190.50,TRUE,'2025-06-01','Carnivore','Healthy'),
(2,2,'Birds','Eagle',6.20,TRUE,'2025-06-05','Carnivore','Healthy'),
(3,3,'Fish','Great White Shark',2000.00,FALSE,'2025-06-10','Piscivore','Healthy'),
(4,4,'Reptiles','Python',45.75,TRUE,'2025-06-12','Carnivore','Healthy'),
(5,5,'Amphibians','Poison Dart Frog',0.05,FALSE,'2025-06-15','Insectivore','Healthy'),
(6,6,'Invertebrates','Octopus',15.00,FALSE,'2025-06-18','Carnivore','Healthy'),
(7,7,'Mammals','Elephant',5000.00,TRUE,'2025-06-20','Herbivore','Healthy'),
(8,8,'Birds','Penguin',35.00,TRUE,'2025-06-22','Piscivore','Healthy'),
(9,9,'Fish','Clownfish',0.10,FALSE,'2025-06-25','Omnivore','Healthy'),
(10,10,'Reptiles','Komodo Dragon',80.00,TRUE,'2025-06-28','Carnivore','Healthy'),
(11,11,'Mammals','Kangaroo',60.00,TRUE,'2025-07-01','Herbivore','Healthy'),
(12,12,'Birds','Owl',3.50,TRUE,'2025-07-02','Carnivore','Healthy'),
(13,13,'Insects','Ant',0.00,FALSE,'2025-07-03','Omnivore','Healthy'),
(14,14,'Arachnids','Tarantula',0.02,FALSE,'2025-07-04','Insectivore','Healthy'),
(15,15,'Mammals','Giraffe',1200.00,TRUE,'2025-07-05','Herbivore','Healthy');

INSERT INTO teachers (id, first_name, last_name, school, hire_date, salary) VALUES
(1,'Jan','Kowalski','Liceum Ogolnoksztalcace nr. V','2020-09-01',2000.00),
(3,'Janet','Smith','F.D. Roosevelt HS','2011-10-30',36200.00),
(4,'Lee','Reynolds','F.D. Roosevelt HS','1993-05-22',65000.00),
(5,'Samuel','Cole','Myers Middle School','2005-08-01',43500.00),
(6,'Samantha','Bush','Myers Middle School','2011-10-30',36200.00),
(7,'Betty','Diaz','Myers Middle School','2005-08-30',43500.00),
(8,'Kathleen','Roush','F.D. Roosevelt HS','2010-10-22',38500.00);
