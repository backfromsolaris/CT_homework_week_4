CREATE TABLE members(
	member_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	phone_number INTEGER,
	email VARCHAR(100)
);

CREATE TABLE employees(
	employee_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100)
);

CREATE TABLE concessions(
	order_id SERIAL PRIMARY KEY,
	order_date DATE,
	member_id INTEGER,
	employee_id INTEGER,
	price NUMERIC(6,2),
	FOREIGN KEY(member_id) REFERENCES members(member_id),
	FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE tickets(
	ticket_id SERIAL PRIMARY KEY,
	movie_id INTEGER,
	member_id INTEGER,
	employee_id INTEGER,
	ticket_date DATE,
	price NUMERIC(6,2),
	FOREIGN KEY(movie_id) REFERENCES movies(movie_id),
	FOREIGN KEY(member_id) REFERENCES members(member_id),
	FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE parking(
	park_ticket_id SERIAL PRIMARY KEY,
	park_date DATE,
	park_time TIME(0),
	member_id INTEGER,
	FOREIGN KEY(member_id) REFERENCES members(member_id)
);

CREATE TABLE kitchen(
	menu_item VARCHAR(100) PRIMARY KEY,
	order_id INTEGER,
	employee_id INTEGER,
	price NUMERIC,
	FOREIGN KEY(order_id) REFERENCES concessions(order_id),
	FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

CREATE TABLE movies(
	movie_id SERIAL PRIMARY KEY,
	movie_date DATE,
	movie_time TIME(0),
	movie_length INTEGER
);

CREATE TABLE bar(
	drink_name VARCHAR(150) PRIMARY KEY,
	order_id INTEGER,
	employee_id INTEGER,
	price NUMERIC(6,2),
	FOREIGN KEY(order_id) REFERENCES concessions(order_id),
	FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);


