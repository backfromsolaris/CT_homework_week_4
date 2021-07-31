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