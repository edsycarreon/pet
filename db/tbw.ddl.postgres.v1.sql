-- Trabawho DATA DEFINITION LANGUAGE

-- CREATE DATABASE IF NOT EXISTS tbw;
-- USE tbw;

-- CREATE SCHEMA IF NOT EXIST

-- ####################
-- Drop Tables
-- ####################

-- Main Tables
DROP TABLE IF EXISTS agent_stats;
DROP TABLE IF EXISTS agent_level;
DROP TABLE IF EXISTS agent_reviews;
DROP TABLE IF EXISTS agent_services_offered;
DROP TABLE IF EXISTS appointment;
DROP TABLE IF EXISTS agent;
DROP TABLE IF EXISTS customer_stats;
DROP TABLE IF EXISTS customer_level;
DROP TABLE IF EXISTS customer_address;
DROP TABLE IF EXISTS customer;

-- Lookups
DROP TABLE IF EXISTS lu_status_customer;
DROP TABLE IF EXISTS lu_status_agent;
DROP TABLE IF EXISTS lu_status_appointment;
DROP TABLE IF EXISTS lu_gender;
DROP TABLE IF EXISTS lu_agent_type;
DROP TABLE IF EXISTS lu_service_type;

-- ####################
-- Lookup Tables
-- ####################

-- lu_status_customer
CREATE TABLE lu_status_customer (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              SMALLINT            NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_status_customer (code, description, sort_order) VALUES ('ACT', 'Active', 1);
INSERT INTO lu_status_customer (code, description, sort_order) VALUES ('INA', 'Inactive', 2);
INSERT INTO lu_status_customer (code, description, sort_order) VALUES ('NEW', 'New', 3);
INSERT INTO lu_status_customer (code, description, sort_order) VALUES ('DEL', 'Deleted', 4);
INSERT INTO lu_status_customer (code, description, sort_order) VALUES ('BAN', 'Banned', 5);
INSERT INTO lu_status_customer (code, description, sort_order) VALUES ('TIM', 'Timeout', 6);

-- lu_status_agent
CREATE TABLE lu_status_agent (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              SMALLINT            NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_status_agent (code, description, sort_order) VALUES ('ACT', 'Active', 1);
INSERT INTO lu_status_agent (code, description, sort_order) VALUES ('INA', 'Inactive', 2);
INSERT INTO lu_status_agent (code, description, sort_order) VALUES ('NEW', 'New', 3);
INSERT INTO lu_status_agent (code, description, sort_order) VALUES ('DEL', 'Deleted', 4);
INSERT INTO lu_status_agent (code, description, sort_order) VALUES ('BAN', 'Banned', 5);
INSERT INTO lu_status_agent (code, description, sort_order) VALUES ('TIM', 'Timeout', 6);

-- lu_status_appointment
CREATE TABLE lu_status_appointment (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              SMALLINT            NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_status_appointment (code, description, sort_order) VALUES ('ACT', 'Active', 1);
INSERT INTO lu_status_appointment (code, description, sort_order) VALUES ('INA', 'Inactive', 2);
INSERT INTO lu_status_appointment (code, description, sort_order) VALUES ('NEW', 'New', 3);
INSERT INTO lu_status_appointment (code, description, sort_order) VALUES ('DEL', 'Deleted', 4);

-- lu_gender
CREATE TABLE lu_gender (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              SMALLINT            NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_gender (code, description, sort_order) VALUES ('MAL', 'Male', 1);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('FEM', 'Female', 2);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('OTH', 'Others', 3);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('UNK', 'Unknown', 4);

-- lu_agent_type
CREATE TABLE lu_agent_type (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              SMALLINT            NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_agent_type (code, description, sort_order) VALUES ('IND', 'Individual', 1);
INSERT INTO lu_agent_type (code, description, sort_order) VALUES ('COM', 'Company', 2);

-- lu_service_type
CREATE TABLE lu_service_type (
    code                    CHAR(5)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    service_group           VARCHAR(255)        NOT NULL,
    sort_order              SMALLINT            NOT NULL,
    PRIMARY KEY (code)
);

INSERT INTO lu_service_type (code, description, service_group, sort_order) VALUES ('CARPT', 'Carpentry', 'Construction', 1);
INSERT INTO lu_service_type (code, description, service_group, sort_order) VALUES ('ELCTR', 'Electrical', 'Construction', 2);
INSERT INTO lu_service_type (code, description, service_group, sort_order) VALUES ('PLUMB', 'Plumbing', 'Construction', 3);
INSERT INTO lu_service_type (code, description, service_group, sort_order) VALUES ('GARDN', 'Gardening', 'Cleaning', 1);
INSERT INTO lu_service_type (code, description, service_group, sort_order) VALUES ('JANTR', 'Janitorial', 'Cleaning', 2);
INSERT INTO lu_service_type (code, description, service_group, sort_order) VALUES ('MECHA', 'Mechanics', 'Repair & Maintenance', 1);
INSERT INTO lu_service_type (code, description, service_group, sort_order) VALUES ('TECHG', 'Technological', 'Repair & Maintenance', 2);

-- ####################
-- Main Tables
-- ####################

-- customer
CREATE TABLE customer (
    customer_id                     SERIAL                              PRIMARY KEY,
    first_name                      VARCHAR(255)                        NOT NULL,
    last_name                       VARCHAR(255)                        NOT NULL,
    email                           VARCHAR(255)                        UNIQUE NOT NULL,
    password                        VARCHAR(255)                        NOT NULL,
    status                          CHAR(3)                             NOT NULL,
    display_photo                   VARCHAR(255)                        DEFAULT NULL,
    gender                          CHAR(3)                             DEFAULT 'OTH',
    phone_number                    VARCHAR(20)                         DEFAULT NULL,
    last_login                      INT                                 DEFAULT NULL,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      customer_fk_01                          FOREIGN KEY (status)             REFERENCES lu_status_customer (code),
    CONSTRAINT                      customer_fk_02                          FOREIGN KEY (gender)             REFERENCES lu_gender (code),
    CONSTRAINT                      customer_fk_88                          FOREIGN KEY (who_added)          REFERENCES customer (customer_id),
    CONSTRAINT                      customer_fk_89                          FOREIGN KEY (who_updated)        REFERENCES customer (customer_id)
);

-- customer Address
CREATE TABLE customer_address (
    customer_address_id             SERIAL                              PRIMARY KEY,
    customer_id                     INT                                 NOT NULL,
    address_line_1                  VARCHAR(255)                        DEFAULT NULL,
    address_line_2                  VARCHAR(255)                        DEFAULT NULL,
    municipality                    VARCHAR(255)                        DEFAULT NULL,
    city                            VARCHAR(255)                        DEFAULT NULL,
    zipcode                         VARCHAR(5)                          DEFAULT NULL,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      customer_address_fk_01              FOREIGN KEY (customer_id)           REFERENCES customer (customer_id),
    CONSTRAINT                      customer_address_fk_88              FOREIGN KEY (who_added)             REFERENCES customer (customer_id),
    CONSTRAINT                      customer_address_fk_89              FOREIGN KEY (who_updated)           REFERENCES customer (customer_id)
);

-- customer Level
CREATE TABLE customer_level (
    customer_level_id               SERIAL                              PRIMARY KEY,
    customer_id                     INT                                 NOT NULL,
    level                           INT                                 DEFAULT 0,
    experience                      INT                                 DEFAULT 0,
    next_level                      INT                                 DEFAULT 100,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                           DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                           DEFAULT NULL,
    CONSTRAINT                      customer_level_fk_01                FOREIGN KEY (customer_id)           REFERENCES customer (customer_id),
    CONSTRAINT                      customer_level_fk_88                FOREIGN KEY (who_added)             REFERENCES customer (customer_id),
    CONSTRAINT                      customer_level_fk_89                FOREIGN KEY (who_updated)           REFERENCES customer (customer_id)
);


-- Agent
CREATE TABLE agent (
    agent_id                        SERIAL                              PRIMARY KEY,
    customer_id                     INT                                 NOT NULL,
    agent_type                      CHAR(3)                             NOT NULL,
    name                            VARCHAR(255)                        NOT NULL,
    about                           VARCHAR(500)                        DEFAULT NULL,
    status                          CHAR(3)                             NOT NULL,
    display_photo                   VARCHAR(255)                        DEFAULT NULL,
    website                         VARCHAR(255)                        DEFAULT NULL,
    phone_number                    VARCHAR(255)                        DEFAULT NULL,
    service_type                    CHAR(5)                             NOT NULL,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      agent_fk_01                         FOREIGN KEY (customer_id)             REFERENCES customer (customer_id),
    CONSTRAINT                      agent_fk_02                         FOREIGN KEY (agent_type)              REFERENCES lu_agent_type (code),
    CONSTRAINT                      agent_fk_03                         FOREIGN KEY (service_type)            REFERENCES lu_service_type (code),
    CONSTRAINT                      agent_fk_04                         FOREIGN KEY (status)                  REFERENCES lu_status_agent (code),
    CONSTRAINT                      agent_fk_88                         FOREIGN KEY (who_added)               REFERENCES customer (customer_id),
    CONSTRAINT                      agent_fk_89                         FOREIGN KEY (who_updated)             REFERENCES customer (customer_id)
);

-- Agent Services Offered
CREATE TABLE agent_services_offered (
    agent_services_offered_id       SERIAL                              PRIMARY KEY,
    agent_id                        INT                                 NOT NULL,
    name                            VARCHAR(255)                        NOT NULL,
    description                     VARCHAR(255)                        NOT NULL,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      agent_services_offered_fk_01        FOREIGN KEY (agent_id)                REFERENCES agent (agent_id),
    CONSTRAINT                      agent_services_offered_fk_88        FOREIGN KEY (who_added)               REFERENCES customer (customer_id),
    CONSTRAINT                      agent_services_offered_fk_89        FOREIGN KEY (who_updated)             REFERENCES customer (customer_id)
);

-- Appointment
CREATE TABLE appointment (
    appointment_id                  SERIAL                              PRIMARY KEY,
    customer_id                     INT                                 NOT NULL,
    agent_id                        INT                                 NOT NULL,
    status                          CHAR(3)                             NOT NULL,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      appointment_fk_01                   FOREIGN KEY (agent_id)                  REFERENCES agent (agent_id),
    CONSTRAINT                      appointment_fk_02                   FOREIGN KEY (customer_id)               REFERENCES customer (customer_id),
    CONSTRAINT                      appointment_fk_03                   FOREIGN KEY (status)                    REFERENCES lu_status_appointment (code),
    CONSTRAINT                      appointment_fk_88                   FOREIGN KEY (who_added)                 REFERENCES customer (customer_id),
    CONSTRAINT                      appointment_fk_89                   FOREIGN KEY (who_updated)               REFERENCES customer (customer_id)
);

-- Agent Reviews
CREATE TABLE agent_reviews (
    agent_reviews_id                SERIAL                              PRIMARY KEY,
    agent_id                        INT                                 NOT NULL,
    customer_id                     INT                                 NOT NULL,
    appointment_id                  INT                                 NOT NULL,
    rating                          FLOAT                               NOT NULL,
    comment                         VARCHAR(500)                        DEFAULT NULL,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      agent_reviews_fk_01                 FOREIGN KEY (agent_id)                  REFERENCES agent (agent_id),
    CONSTRAINT                      agent_reviews_fk_02                 FOREIGN KEY (customer_id)               REFERENCES customer (customer_id),
    CONSTRAINT                      agent_reviews_fk_03                 FOREIGN KEY (appointment_id)            REFERENCES appointment (appointment_id),
    CONSTRAINT                      agent_reviews_fk_88                 FOREIGN KEY (who_added)                 REFERENCES customer (customer_id),
    CONSTRAINT                      agent_reviews_fk_89                 FOREIGN KEY (who_updated)               REFERENCES customer (customer_id)
);

-- Agent Level
CREATE TABLE agent_level (
    agent_level_id                  SERIAL                              PRIMARY KEY,
    agent_id                        INT                                 NOT NULL,
    level                           INT                                 DEFAULT 0,
    experience                      INT                                 DEFAULT 0,
    next_level                      INT                                 DEFAULT 100,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      agent_level_fk_01                   FOREIGN KEY (agent_id)                  REFERENCES agent (agent_id),
    CONSTRAINT                      agent_level_fk_88                   FOREIGN KEY (who_added)                 REFERENCES customer (customer_id),
    CONSTRAINT                      agent_level_fk_89                   FOREIGN KEY (who_updated)               REFERENCES customer (customer_id)
);

-- Agent Stats
CREATE TABLE agent_stats (
    agent_stats_id                  SERIAL                              PRIMARY KEY,
    agent_id                        INT                                 NOT NULL,
    services_accepted               INT                                 DEFAULT 0,
    services_completed              INT                                 DEFAULT 0,
    services_cancelled              INT                                 DEFAULT 0,
    highest_rating                  FLOAT                               DEFAULT NULL,
    average_rating                  FLOAT                               DEFAULT 0.00,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      agent_stats_fk_01                   FOREIGN KEY (agent_id)                  REFERENCES agent (agent_id),
    CONSTRAINT                      agent_stats_fk_88                   FOREIGN KEY (who_added)                 REFERENCES customer (customer_id),
    CONSTRAINT                      agent_stats_fk_89                   FOREIGN KEY (who_updated)               REFERENCES customer (customer_id)
);

-- customer Stats
CREATE TABLE customer_stats (
    customer_stats_id               SERIAL                              PRIMARY KEY,
    customer_id                     INT                                 NOT NULL,
    services_received               INT                                 DEFAULT 0,
    appointment_scheduled           INT                                 DEFAULT 0,
    most_used_service               CHAR(5)                             DEFAULT NULL,
    most_recent_agent               INT                                 DEFAULT NULL,
    services_ordered                INT                                 DEFAULT 0,
    services_completed              INT                                 DEFAULT 0,
    services_cancelled              INT                                 DEFAULT 0,
    who_added                       INT                                 DEFAULT NULL,
    when_added                      TIMESTAMP                                 DEFAULT NULL,
    who_updated                     INT                                 DEFAULT NULL,
    when_updated                    TIMESTAMP                                 DEFAULT NULL,
    CONSTRAINT                      customer_stats_fk_01                FOREIGN KEY (customer_id)               REFERENCES customer (customer_id),
    CONSTRAINT                      customer_stats_fk_02                FOREIGN KEY (most_recent_agent)         REFERENCES customer (customer_id),
    CONSTRAINT                      customer_stats_fk_03                FOREIGN KEY (most_used_service)         REFERENCES lu_service_type (code),
    CONSTRAINT                      customer_stats_fk_88                FOREIGN KEY (who_added)                 REFERENCES customer (customer_id),
    CONSTRAINT                      customer_stats_fk_89                FOREIGN KEY (who_updated)               REFERENCES customer (customer_id)
);