CREATE TABLE users (
  id SERIAL NOT NULL,
  name VARCHAR(255) NOT NULL,
  maiden_name VARCHAR(255),
  status SMALLINT NOT NULL CHECK (age >= 0),
  age SMALLINT NOT NULL CHECK (age >= 0),
  PRIMARY KEY (id)
);

CREATE INDEX status_age_idx ON users (status, age);
CREATE INDEX maiden_name_idx ON users (maiden_name);

