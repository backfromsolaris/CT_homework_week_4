INSERT INTO members(
	member_id,
	first_name,
	last_name,
	phone_number,
	email
)VALUES(
	1,
	'Jane',
	'Dough',
	5555555,
	'dough_money@hotmail.org'
);

INSERT INTO concessions(
	order_id,
	order_date,
	member_id,
	employee_id,
	price
)VALUES(
	1,
	'2021-07-27',
	1,
	1,
	20.00
);

INSERT INTO employees(
	employee_id,
	first_name,
	last_name
)VALUES(
	1,
	'John',
	'Dough'
);

INSERT INTO tickets(
	ticket_id,
	movie_id,
	member_id,
	employee_id,
	ticket_date,
	price
)VALUES(
	1,
	1,
	1,
	1,
	'2021-07-27',
	10.00
);

INSERT INTO movies(
	movie_id,
	movie_date,
	movie_time,
	movie_length
)VALUES(
	1,
	'2021-07-27',
	'20:00:00',
	120
);

INSERT INTO parking(
	park_ticket_id,
	park_date,
	park_time,
	member_id
)VALUES(
	1,
	'2021-07-27',
	'19:45:00',
	1
);

INSERT INTO kitchen(
	menu_item,
	order_id,
	employee_id,
	price
)VALUES(
	'Burger',
	1,
	1,
	8.00
);

INSERT INTO bar(
	drink_name,
	order_id,
	employee_id,
	price
)VALUES(
	'Pilsner',
	1,
	1,
	6.00
);