-- Trabawho DATA DEFINITION LANGUAGE

CREATE DATABASE IF NOT EXISTS tbw;
USE tbw;

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
DROP TABLE IF EXISTS user_stats;
DROP TABLE IF EXISTS user_level;
DROP TABLE IF EXISTS user_address;
DROP TABLE IF EXISTS user;

-- Lookups
DROP TABLE IF EXISTS lu_status_user;
DROP TABLE IF EXISTS lu_status_agent;
DROP TABLE IF EXISTS lu_status_appointment;
DROP TABLE IF EXISTS lu_gender;
DROP TABLE IF EXISTS lu_agent_type;
DROP TABLE IF EXISTS lu_service_type;

-- ####################
-- Lookup Tables
-- ####################

-- lu_status_user
CREATE TABLE lu_status_user (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              TINYINT             UNSIGNED NOT NULL,
    PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO lu_status_user (code, description, sort_order) VALUES ('ACT', 'Active', 1);
INSERT INTO lu_status_user (code, description, sort_order) VALUES ('INA', 'Inactive', 2);
INSERT INTO lu_status_user (code, description, sort_order) VALUES ('NEW', 'New', 3);
INSERT INTO lu_status_user (code, description, sort_order) VALUES ('DEL', 'Deleted', 4);
INSERT INTO lu_status_user (code, description, sort_order) VALUES ('BAN', 'Banned', 5);
INSERT INTO lu_status_user (code, description, sort_order) VALUES ('TIM', 'Timeout', 6);

-- lu_status_agent
CREATE TABLE lu_status_agent (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              TINYINT             UNSIGNED NOT NULL,
    PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
    sort_order              TINYINT             UNSIGNED NOT NULL,
    PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO lu_status_appointment (code, description, sort_order) VALUES ('ACT', 'Active', 1);
INSERT INTO lu_status_appointment (code, description, sort_order) VALUES ('INA', 'Inactive', 2);
INSERT INTO lu_status_appointment (code, description, sort_order) VALUES ('NEW', 'New', 3);
INSERT INTO lu_status_appointment (code, description, sort_order) VALUES ('DEL', 'Deleted', 4);

-- lu_gender
CREATE TABLE lu_gender (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              TINYINT             UNSIGNED NOT NULL,
    PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO lu_gender (code, description, sort_order) VALUES ('MAL', 'Male', 1);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('FEM', 'Female', 2);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('OTH', 'Others', 3);
INSERT INTO lu_gender (code, description, sort_order) VALUES ('UNK', 'Unknown', 4);

-- lu_agent_type
CREATE TABLE lu_agent_type (
    code                    CHAR(3)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    sort_order              TINYINT             UNSIGNED NOT NULL,
    PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO lu_agent_type (code, description, sort_order) VALUES ('IND', 'Individual', 1);
INSERT INTO lu_agent_type (code, description, sort_order) VALUES ('COM', 'Company', 2);

-- lu_service_type
CREATE TABLE lu_service_type (
    code                    CHAR(5)             NOT NULL,
    description             VARCHAR(255)        NOT NULL,
    service_group                   VARCHAR(255)        NOT NULL,
    sort_order              TINYINT             NOT NULL,
    PRIMARY KEY (code)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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

-- User
CREATE TABLE user (
    user_id                         INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    first_name                      VARCHAR(255)                        NOT NULL,
    last_name                       VARCHAR(255)                        NOT NULL,
    email                           VARCHAR(255)                        NOT NULL,
    password                        VARCHAR(255)                        NOT NULL,
    status                          CHAR(3)                             NOT NULL,
    display_photo                   VARCHAR(255)                        DEFAULT NULL,
    gender                          CHAR(3)                             DEFAULT 'UNK',
    phone_number                    VARCHAR(20)                         DEFAULT NULL,
    last_login                      INT                                 UNSIGNED DEFAULT NULL,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (user_id),
    UNIQUE KEY                      (email),
    CONSTRAINT                      user_fk_01                          FOREIGN KEY (status)             REFERENCES lu_status_user (code),
    CONSTRAINT                      user_fk_02                          FOREIGN KEY (gender)             REFERENCES lu_gender (code),
    CONSTRAINT                      user_fk_88                          FOREIGN KEY (who_added)          REFERENCES user (user_id),
    CONSTRAINT                      user_fk_89                          FOREIGN KEY (who_updated)        REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- User Address
CREATE TABLE user_address (
    user_address_id                 INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id                         INT                                 UNSIGNED NOT NULL,
    address_line_1                  VARCHAR(255)                        DEFAULT NULL,
    address_line_2                  VARCHAR(255)                        DEFAULT NULL,
    municipality                    VARCHAR(255)                        DEFAULT NULL,
    city                            VARCHAR(255)                        DEFAULT NULL,
    zipcode                         VARCHAR(5)                          DEFAULT NULL,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (user_address_id),
    CONSTRAINT                      user_address_fk_01                  FOREIGN KEY (user_id)               REFERENCES user (user_id),
    CONSTRAINT                      user_address_fk_88                  FOREIGN KEY (who_added)             REFERENCES user (user_id),
    CONSTRAINT                      user_address_fk_89                  FOREIGN KEY (who_updated)           REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- User Level
CREATE TABLE user_level (
    user_level_id                   INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id                         INT                                 UNSIGNED NOT NULL,
    level                           INT                                 UNSIGNED DEFAULT 0,
    experience                      INT                                 UNSIGNED DEFAULT 0,
    next_level                      INT                                 UNSIGNED DEFAULT 100,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (user_level_id),
    CONSTRAINT                      user_level_fk_01                    FOREIGN KEY (user_id)               REFERENCES user (user_id),
    CONSTRAINT                      user_level_fk_88                    FOREIGN KEY (who_added)             REFERENCES user (user_id),
    CONSTRAINT                      user_level_fk_89                    FOREIGN KEY (who_updated)           REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- Agent
CREATE TABLE agent (
    agent_id                        INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id                         INT                                 UNSIGNED NOT NULL,
    agent_type                      CHAR(3)                             NOT NULL,
    name                            VARCHAR(255)                        NOT NULL,
    about                           VARCHAR(500)                        DEFAULT NULL,
    status                          CHAR(3)                             NOT NULL,
    display_photo                   VARCHAR(255)                        DEFAULT NULL,
    website                         VARCHAR(255)                        DEFAULT NULL,
    phone_number                    VARCHAR(255)                        DEFAULT NULL,
    service_type                    CHAR(5)                             NOT NULL,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (agent_id),
    CONSTRAINT                      agent_fk_01                         FOREIGN KEY (user_id)                 REFERENCES user (user_id),
    CONSTRAINT                      agent_fk_02                         FOREIGN KEY (agent_type)              REFERENCES lu_agent_type (code),
    CONSTRAINT                      agent_fk_03                         FOREIGN KEY (service_type)            REFERENCES lu_service_type (code),
    CONSTRAINT                      agent_fk_04                         FOREIGN KEY (status)                  REFERENCES lu_status_agent (code),
    CONSTRAINT                      agent_fk_88                         FOREIGN KEY (who_added)               REFERENCES user (user_id),
    CONSTRAINT                      agent_fk_89                         FOREIGN KEY (who_updated)             REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Agent Services Offered
CREATE TABLE agent_services_offered (
    agent_services_offered_id       INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    agent_id                        INT                                 UNSIGNED NOT NULL,
    name                            VARCHAR(255)                        NOT NULL,
    description                     VARCHAR(255)                        NOT NULL,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (agent_services_offered_id),
    CONSTRAINT                      agent_services_offered_fk_01        FOREIGN KEY (agent_id)                REFERENCES agent (agent_id),
    CONSTRAINT                      agent_services_offered_fk_88        FOREIGN KEY (who_added)               REFERENCES user (user_id),
    CONSTRAINT                      agent_services_offered_fk_89        FOREIGN KEY (who_updated)             REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Appointment
CREATE TABLE appointment (
    appointment_id                  INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id                         INT                                 UNSIGNED NOT NULL,
    agent_id                        INT                                 UNSIGNED NOT NULL,
    status                          CHAR(3)                             NOT NULL,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (appointment_id),
    CONSTRAINT                      appointment_fk_01                   FOREIGN KEY (agent_id)                  REFERENCES agent (agent_id),
    CONSTRAINT                      appointment_fk_02                   FOREIGN KEY (user_id)                   REFERENCES user (user_id),
    CONSTRAINT                      appointment_fk_03                   FOREIGN KEY (status)                    REFERENCES lu_status_appointment (code),
    CONSTRAINT                      appointment_fk_88                   FOREIGN KEY (who_added)                 REFERENCES user (user_id),
    CONSTRAINT                      appointment_fk_89                   FOREIGN KEY (who_updated)               REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Agent Reviews
CREATE TABLE agent_reviews (
    agent_reviews_id                INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    agent_id                        INT                                 UNSIGNED NOT NULL,
    user_id                         INT                                 UNSIGNED NOT NULL,
    appointment_id                  INT                                 UNSIGNED NOT NULL,
    rating                          FLOAT                               NOT NULL,
    comment                         VARCHAR(500)                        DEFAULT NULL,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (agent_reviews_id),
    CONSTRAINT                      agent_reviews_fk_01                 FOREIGN KEY (agent_id)                  REFERENCES agent (agent_id),
    CONSTRAINT                      agent_reviews_fk_02                 FOREIGN KEY (user_id)                   REFERENCES user (user_id),
    CONSTRAINT                      agent_reviews_fk_03                 FOREIGN KEY (appointment_id)            REFERENCES appointment (appointment_id),
    CONSTRAINT                      agent_reviews_fk_88                 FOREIGN KEY (who_added)                 REFERENCES user (user_id),
    CONSTRAINT                      agent_reviews_fk_89                 FOREIGN KEY (who_updated)               REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Agent Level
CREATE TABLE agent_level (
    agent_level_id                  INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    agent_id                        INT                                 UNSIGNED NOT NULL,
    level                           INT                                 UNSIGNED DEFAULT 0,
    experience                      INT                                 UNSIGNED DEFAULT 0,
    next_level                      INT                                 UNSIGNED DEFAULT 100,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (agent_level_id),
    CONSTRAINT                      agent_level_fk_01                   FOREIGN KEY (agent_id)                  REFERENCES agent (agent_id),
    CONSTRAINT                      agent_level_fk_88                   FOREIGN KEY (who_added)                 REFERENCES user (user_id),
    CONSTRAINT                      agent_level_fk_89                   FOREIGN KEY (who_updated)               REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Agent Stats
CREATE TABLE agent_stats (
    agent_stats_id                  INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    agent_id                        INT                                 UNSIGNED NOT NULL,
    services_accepted               INT                                 UNSIGNED DEFAULT 0,
    services_completed              INT                                 UNSIGNED DEFAULT 0,
    services_cancelled              INT                                 UNSIGNED DEFAULT 0,
    highest_rating                  FLOAT                               DEFAULT NULL,
    average_rating                  FLOAT                               DEFAULT 0.00,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (agent_stats_id),
    CONSTRAINT                      agent_stats_fk_01                   FOREIGN KEY (agent_id)                  REFERENCES agent (agent_id),
    CONSTRAINT                      agent_stats_fk_88                   FOREIGN KEY (who_added)                 REFERENCES user (user_id),
    CONSTRAINT                      agent_stats_fk_89                   FOREIGN KEY (who_updated)               REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- User Stats
CREATE TABLE user_stats (
    user_stats_id                   INT                                 UNSIGNED NOT NULL AUTO_INCREMENT,
    user_id                         INT                                 UNSIGNED NOT NULL,
    services_received               INT                                 UNSIGNED DEFAULT 0,
    appointment_scheduled           INT                                 UNSIGNED DEFAULT 0,
    most_used_service               CHAR(5)                             DEFAULT NULL,
    most_recent_agent               INT                                 UNSIGNED DEFAULT NULL,
    services_ordered                INT                                 UNSIGNED DEFAULT 0,
    services_completed              INT                                 UNSIGNED DEFAULT 0,
    services_cancelled              INT                                 UNSIGNED DEFAULT 0,
    who_added                       INT                                 UNSIGNED DEFAULT NULL,
    when_added                      INT                                 UNSIGNED DEFAULT NULL,
    who_updated                     INT                                 UNSIGNED DEFAULT NULL,
    when_updated                    INT                                 UNSIGNED DEFAULT NULL,
    PRIMARY KEY                     (user_stats_id),
    CONSTRAINT                      user_stats_fk_01                    FOREIGN KEY (user_id)                 REFERENCES user (user_id),
    CONSTRAINT                      user_stats_fk_02                    FOREIGN KEY (most_recent_agent)       REFERENCES user (user_id),
    CONSTRAINT                      user_stats_fk_03                    FOREIGN KEY (most_used_service)       REFERENCES lu_service_type (code),
    CONSTRAINT                      user_stats_fk_88                    FOREIGN KEY (who_added)               REFERENCES user (user_id),
    CONSTRAINT                      user_stats_fk_89                    FOREIGN KEY (who_updated)             REFERENCES user (user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
