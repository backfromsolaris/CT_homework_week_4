-- Creating car dealership database


CREATE TABLE sales_invoices(
	sale_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	salesperson_id INTEGER,
	vin_id VARCHAR(100),
	sales_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
	FOREIGN KEY(vin_id) REFERENCES cars(vin_id)
);

CREATE TABLE salesperson(
	salesperson_id SERIAL PRIMARY KEY,
	first_name 	VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE customers(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(150),
	last_name VARCHAR(150),
	address VARCHAR(150),
	email VARCHAR(150),
	billing_info VARCHAR(30)
);

CREATE TABLE cars(
	vin_id VARCHAR(100) PRIMARY KEY,
	car_make VARCHAR(100),
	car_model VARCHAR(100),
	year_ NUMERIC(4),
	color VARCHAR(50),
	new_or_used VARCHAR(5)
);

CREATE TABLE service_invoices(
	service_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	vin_id VARCHAR(100),
	service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0),
	service_type VARCHAR(150),
	price NUMERIC(8,2),
	FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
	FOREIGN KEY(vin_id) REFERENCES cars(vin_id)
);

CREATE TABLE service_ticket(
	ticket_id SERIAL PRIMARY KEY,
	mechanic_id INTEGER,
	service_id INTEGER,
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id),
	FOREIGN KEY(service_id) REFERENCES service_invoices(service_id)
);

CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);


-- Inserting data manually

INSERT INTO cars(
	vin_id,
	car_make,
	car_model,
	year_,
	color,
	new_or_used
)VALUES(
	'a11a11011a1',
	'Honda',
	'Fit',
	2014,
	'Grey',
	'used'
);

INSERT INTO cars(
	vin_id,
	car_make,
	car_model,
	year_,
	color,
	new_or_used
)VALUES(
	'b22bbb222b2',
	'Dodge',
	'Durango',
	2020,
	'Black',
	'used'
);

INSERT INTO customers(
	customer_id,
	first_name,
	last_name,
	address,
	email,
	billing_info
)VALUES(
	101,
	'Jameson',
	'Slubert',
	'549 S. Racine Ave',
	'jslub@hotmail.org',
	'1234-9878-4444-5555 12/25 555'
);

INSERT INTO customers(
	customer_id,
	first_name,
	last_name,
	address,
	email,
	billing_info
)VALUES(
	102,
	'Eleanor',
	'Fligly',
	'987 N Lake Shore Dr',
	'elefligz@hotmail.org',
	'1212-9898-5555-4444 11/23 555'
);

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
)VALUES(
	001,
	'Allison',
	'Smeesly'
);

INSERT INTO mechanic(
	mechanic_id,
	first_name,
	last_name
)VALUES(
	002,
	'Kingsley',
	'Weens'
);

INSERT INTO salesperson(
	salesperson_id,
	first_name,
	last_name
)VALUES(
	0001,
	'Jackson',
	'Smalls'
);

INSERT INTO salesperson(
	salesperson_id,
	first_name,
	last_name
)VALUES(
	0002,
	'Eric',
	'Biggs'
);

INSERT INTO sales_invoices(
	sale_id,
	customer_id,
	salesperson_id,
	vin_id,
	sales_date
)VALUES(
	135467,
	101,
	0001,
	'a11a11011a1',
	DEFAULT
);

INSERT INTO sales_invoices(
	sale_id,
	customer_id,
	salesperson_id,
	vin_id,
	sales_date
)VALUES(
	477772,
	102,
	0002,
	'b22bbb222b2',
	DEFAULT
);


-- Creating stored functions

CREATE OR REPLACE FUNCTION add_service_invoice(
	service_id INTEGER,
	customer_id INTEGER,
	vin_id VARCHAR(100),
	service_type VARCHAR(150),
	price NUMERIC(8,2),
	service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP(0)
)
RETURNS void
AS $$
BEGIN
	INSERT INTO service_invoices(service_id, customer_id, vin_id, service_type, price, service_date)
	VALUES(service_id, customer_id, vin_id, service_type, price, service_date);
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION add_service_ticket(
	ticket_id INTEGER,
	mechanic_id INTEGER,
	service_id INTEGER
)
RETURNS void
AS $$
BEGIN
	INSERT INTO service_ticket(ticket_id, mechanic_id, service_id)
	VALUES(ticket_id, mechanic_id, service_id);
END;
$$
LANGUAGE plpgsql;


-- Adding data via stored function

SELECT add_service_invoice(000001, 101, 'a11a11011a1', 'tire replacement', 300.00);
SELECT add_service_invoice(000002, 101, 'a11a11011a1', 'brake replacement', 175.00);
SELECT add_service_invoice(000003, 101, 'a11a11011a1', 'oil change', 50.00);
SELECT add_service_invoice(000004, 101, 'a11a11011a1', 'new spark plugs', 30.00);

SELECT add_service_invoice(000005, 102, 'b22bbb222b2', 'new tie rods', 350.00);
SELECT add_service_invoice(000006, 102, 'b22bbb222b2', 'axle replacement', 275.00);

SELECT add_service_ticket(00001, 001, 000001);
SELECT add_service_ticket(00002, 001, 000002);
SELECT add_service_ticket(00003, 001, 000003);
SELECT add_service_ticket(00004, 001, 000004);

SELECT add_service_ticket(00005, 002, 000005);
SELECT add_service_ticket(00006, 001, 000006);

-- Querying data inputted by stored function
SELECT * FROM service_invoices;
SELECT * FROM service_ticket;

