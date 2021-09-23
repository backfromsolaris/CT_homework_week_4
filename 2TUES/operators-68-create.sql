-- Creating customer table
CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	address VARCHAR(150),
	billing_info VARCHAR(150)
);

CREATE TABLE brand(
	seller_id SERIAL PRIMARY KEY,
	brand_name VARCHAR(150),
	contact_number VARCHAR(15),
	address VARCHAR(150)
);

CREATE TABLE inventory(
	upc SERIAL PRIMARY KEY,
	total_stock INTEGER
);

CREATE TABLE cart(
	cart_id SERIAL PRIMARY KEY,
	customer_id INTEGER NOT NULL,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

CREATE TABLE order_(
	order_id SERIAL PRIMARY KEY,
	order_date DATE DEFAULT CURRENT_DATE,
	sub_total NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	upc INTEGER,
	cart_id INTEGER,
	FOREIGN KEY(upc) REFERENCES inventory(upc),	
	FOREIGN KEY(cart_id) REFERENCES cart(cart_id)
);

CREATE TABLE products(
	item_id SERIAL PRIMARY KEY,
	prod_name VARCHAR(100),
	price NUMERIC(6,2),
	seller_id INTEGER NOT NULL,
	upc INTEGER NOT NULL,
	FOREIGN KEY(seller_id) REFERENCES brand(seller_id),
	FOREIGN KEY(upc)  REFERENCES inventory(upc)
);