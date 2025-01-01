CREATE DATABASE bikes;

CREATE TABLE bikes();

ALTER TABLE bikes
ADD COLUMN bike_id SERIAL PRIMARY KEY;
ALTER TABLE bikes
ADD COLUMN type VARCHAR(50) NOT NULL;
ALTER TABLE bikes
ADD COLUMN size INT NOT NULL;
ALTER TABLE bikes
ADD COLUMN available NOT NULL DEFAULT TRUE;

CREATE TABLE customers();

ALTER TABLE customers
ADD COLUNM customer_id SERAIL PRIMARY KEY;
ALTER TABLE customers
ADD COLUMN phone VARCHAR(15) NOT NULL UNIQUE;
ALTER TABLE customers
ADD COLUMN name VARCHAR(40) NOT NULL;

CREATE TABLE rentals();

ALTER TABLE rentals
ADD COLUMN rental_id SERAIL PRIMARY KEY;
ALTER TBALE rentals
ADD COLUMN customer_id INT NOT NULL;
ALTER TABLE rentals
ADD COLUMN bike_id INT NOT NULL;
ALTER TABLE rentals
ADD COLUMN date_rented DATE NOT NULL DEFAULT NOW();
ALTER TABLE rentals
ADD COLUMN date_returned DATE;

ALTER TABLE rentals
ADD FOREIGN KEY (customer_id) REFERENCES customers (customer_id);

ALTER TABLE rentals
ADD FOREIGN KEY(bike_id) REFERENCES bikes(bike_id);

INSERT INTO bikes (type, size)
VALUES('Mountain', 27),
    ('Mountain', 28),
    ('Mountain', 29);

INSERT INTO bikes (type, size)
VALUES('Road', 27),
    ('Road', 28),
    ('Road', 29);

INSERT INTO bikes (type, size)
VALUES('BMX', 19),
    ('BMX', 20),
    ('BMX', 21);

UPDATE bikes
SET available = false
WHERE available = true;

UPDATE bikes
SET available = true
WHERE type != 'BMX';

UPDATE bikes
SET available = true
WHERE available = false;

CUSTOMER_RENTALS = $(
    $PSQL "SELECT bike_id, type, size FROM bikes INNER JOIN rentals USING(bike_id) INNER JOIN customers USING(customer_id) WHERE phone = '$PHONE_NUMBER' AND date_returned IS NULL ORDER BY bike_id"
)