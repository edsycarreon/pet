-- Pet Meet DATA DEFINITION LANGUAGE

-- ###################
-- Drop Tables
-- ###################

-- Main Tables
DROP TABLE IF EXISTS meetup_photo;
DROP TABLE IF EXISTS meetup_review;
DROP TABLE IF EXISTS meetup;
DROP TABLE IF EXISTS pet_photo;
DROP TABLE IF EXISTS pet;
DROP TABLE IF EXISTS person_stats;
DROP TABLE IF EXISTS person_level;
DROP TABLE IF EXISTS person_address;
DROP TABLE IF EXISTS person;

-- Lookup Tables
DROP TABLE IF EXISTS lu_status;
DROP TABLE IF EXISTS lu_gender;
DROP TABLE IF EXISTS lu_species;
DROP TABLE IF EXISTS lu_meetup_type;

-- ###################
-- Lookup Tables
-- ###################

-- lu_status
CREATE TABLE lu_status (
    code                CHAR(3)         NOT NULL,
    description         VARCHAR(255)    NOT NULL,
    sort_order          SMALLINT        NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_status (code, description, sort_order) VALUES ('ACT', 'Active', 1);
INSERT INTO lu_status (code, description, sort_order) VALUES ('INA', 'Inactive', 2);
INSERT INTO lu_status (code, description, sort_order) VALUES ('DEL', 'Deleted', 3);
INSERT INTO lu_status (code, description, sort_order) VALUES ('BAN', 'Banned', 4);
INSERT INTO lu_status (code, description, sort_order) VALUES ('TIM', 'Timeout', 5);
INSERT INTO lu_status (code, description, sort_order) VALUES ('PEN', 'Pending', 6);

-- lu_gender
CREATE TABLE lu_gender (
    code                CHAR(3)         NOT NULL,
    description         VARCHAR(255)    NOT NULL,
    sort_order          SMALLINT        NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_gender (code, description, sort_order) VALUES ('MAL', 'Male', 1);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('FEM', 'Female', 2);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('OTH', 'Other', 3);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('UNK', 'Unknown', 4);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('RNS', 'Rather not say', 5);

-- lu_species
CREATE TABLE lu_species (
    code                CHAR(3)         NOT NULL,
    description         VARCHAR(255)    NOT NULL,
    sort_order          SMALLINT        NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_species (code, description, sort_order) VALUES ('DOG', 'Dog', 1);
INSERT INTO lu_species (code, description, sort_order) VALUES ('CAT', 'Cat', 2);
INSERT INTO lu_species (code, description, sort_order) VALUES ('OTH', 'Other', 3);

-- lu_meetup_type
CREATE TABLE lu_meetup_type (
    code                CHAR(3)         NOT NULL,
    description         VARCHAR(255)    NOT NULL,
    sort_order          SMALLINT        NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_meetup_type (code, description, sort_order) VALUES ('MTP', 'Meetup', 1);
INSERT INTO lu_meetup_type (code, description, sort_order) VALUES ('WLK', 'Walk', 2);
INSERT INTO lu_meetup_type (code, description, sort_order) VALUES ('PLY', 'Play', 3);
INSERT INTO lu_meetup_type (code, description, sort_order) VALUES ('OTH', 'Others', 4);

-- ###################
-- Main Tables
-- ###################

-- person
CREATE TABLE person (
    person_id           SERIAL          PRIMARY KEY,
    first_name          VARCHAR(255)    NOT NULL,
    last_name           VARCHAR(255)    NOT NULL,
    email               VARCHAR(255)    UNIQUE NOT NULL,
    password            VARCHAR(255)    NOT NULL,
    status              CHAR(3)         NOT NULL,
    display_photo       VARCHAR(500)    DEFAULT NULL,
    gender              CHAR(3)         DEFAULT 'UNK',
    phone_number        VARCHAR(25)     DEFAULT NULL,
    last_login          TIMESTAMPTZ     DEFAULT NULL,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          person_fk_01    FOREIGN KEY (status)        REFERENCES lu_status(code),
    CONSTRAINT          person_fk_02    FOREIGN KEY (gender)        REFERENCES lu_gender(code),
    CONSTRAINT          person_fk_88    FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          person_fk_89    FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);

-- person_profile
CREATE TABLE person_address (
    person_profile_id   SERIAL          PRIMARY KEY,
    person_id           INT             NOT NULL,
    street              VARCHAR(255)    DEFAULT NULL,
    state               VARCHAR(255)    DEFAULT NULL,
    city                VARCHAR(255)    DEFAULT NULL,
    zipcode             VARCHAR(255)    DEFAULT NULL,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          person_address_fk_01    FOREIGN KEY (person_id)     REFERENCES person(person_id),
    CONSTRAINT          person_address_fk_88    FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          person_address_fk_89    FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);

-- person_level
CREATE TABLE person_level (
    person_level_id     SERIAL          PRIMARY KEY,
    person_id           INT             NOT NULL,
    level               INT             DEFAULT 0,
    experience          INT             DEFAULT 0,
    next_level          INT             DEFAULT 0,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          person_level_fk_01    FOREIGN KEY (person_id)     REFERENCES person(person_id),
    CONSTRAINT          person_level_fk_88    FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          person_level_fk_89    FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);

-- person_stats
CREATE TABLE person_stats (
    person_stats_id     SERIAL          PRIMARY KEY,
    person_id           INT             NOT NULL,
    pets_borrowed       INT             DEFAULT 0,
    pets_lent           INT             DEFAULT 0,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          person_stats_fk_01    FOREIGN KEY (person_id)     REFERENCES person(person_id),
    CONSTRAINT          person_stats_fk_88    FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          person_stats_fk_89    FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);

-- pet
CREATE TABLE pet (
    pet_id              SERIAL          PRIMARY KEY,
    person_id           INT             NOT NULL,
    name                VARCHAR(255)    NOT NULL,
    bio                 VARCHAR(500)    DEFAULT NULL,
    species             CHAR(3)         NOT NULL DEFAULT 'OTH',
    breed               VARCHAR(255)    NOT NULL,
    age                 INT             DEFAULT NULL,
    gender              CHAR(3)         DEFAULT 'UNK',
    display_photo       VARCHAR(500)    DEFAULT NULL, 
    location            VARCHAR(255)    DEFAULT NULL,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          pet_fk_01       FOREIGN KEY (person_id)     REFERENCES person(person_id),
    CONSTRAINT          pet_fk_02       FOREIGN KEY (species)       REFERENCES lu_species(code),
    CONSTRAINT          pet_fk_03       FOREIGN KEY (gender)        REFERENCES lu_gender(code),
    CONSTRAINT          pet_fk_88       FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          pet_fk_89       FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);

-- pet_photo
CREATE TABLE pet_photo (
    pet_photo_id        SERIAL          PRIMARY KEY,
    pet_id              INT             NOT NULL,
    title               VARCHAR(255)    DEFAULT NULL,
    description         VARCHAR(500)    DEFAULT NULL,
    media_url           VARCHAR(500)    NOT NULL,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          pet_photo_fk_01    FOREIGN KEY (pet_id)        REFERENCES pet(pet_id),
    CONSTRAINT          pet_photo_fk_88    FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          pet_photo_fk_89    FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);

-- meetup
CREATE TABLE meetup (
    meetup_id           SERIAL          PRIMARY KEY,
    person_id           INT             NOT NULL,
    pet_id              INT             NOT NULL,
    type                CHAR(3)         NOT NULL,
    location            POINT           NOT NULL,
    date_and_time       TIMESTAMPTZ     NOT NULL,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          meetup_fk_01    FOREIGN KEY (person_id)     REFERENCES person(person_id),
    CONSTRAINT          meetup_fk_02    FOREIGN KEY (pet_id)        REFERENCES pet(pet_id),
    CONSTRAINT          meetup_fk_03    FOREIGN KEY (type)          REFERENCES lu_meetup_type(code),
    CONSTRAINT          meetup_fk_88    FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          meetup_fk_89    FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);

-- meetup_review
CREATE TABLE meetup_review (
    meetup_review_id    SERIAL          PRIMARY KEY,
    meetup_id           INT             NOT NULL,
    rating              NUMERIC(2,1)    NOT NULL,
    comment             VARCHAR(500)    DEFAULT NULL,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          meetup_review_fk_01    FOREIGN KEY (meetup_id)     REFERENCES meetup(meetup_id),
    CONSTRAINT          meetup_review_fk_88    FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          meetup_review_fk_89    FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);

-- meetup_photo
CREATE TABLE meetup_photo (
    meetup_photo_id     SERIAL          PRIMARY KEY,
    meetup_id           INT             NOT NULL,
    title               VARCHAR(255)    DEFAULT NULL,
    description         VARCHAR(500)    DEFAULT NULL,
    media_url           VARCHAR(500)    NOT NULL,
    created_by          INT             DEFAULT NULL,
    created_at          TIMESTAMPTZ     NOT NULL DEFAULT now(),
    updated_by          INT             DEFAULT NULL,
    updated_at          TIMESTAMPTZ     DEFAULT NULL,
    CONSTRAINT          meetup_review_fk_01    FOREIGN KEY (meetup_id)     REFERENCES meetup(meetup_id),
    CONSTRAINT          meetup_review_fk_88    FOREIGN KEY (created_by)    REFERENCES person(person_id),
    CONSTRAINT          meetup_review_fk_89    FOREIGN KEY (updated_by)    REFERENCES person(person_id)
);