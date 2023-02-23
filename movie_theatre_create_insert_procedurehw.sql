CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	first_name VARCHAR(45),
	last_name VARCHAR(45),
	address VARCHAR(255),
	billing_info VARCHAR(255) NOT NULL
);

INSERT INTO customer(
	first_name,
	last_name,
	address,
	billing_info
)VALUES(
	
	'Joseph',
	'James',
	'123 CV st Oakland CA',
	'3242-3242-3242-3242'
),( 
	'Lala',
	'Geb',
	'123 middle st Akron Ohio',
	'1234-1234-1234-1234'
);


SELECT *
FROM customer;

CREATE TABLE tickets(
	ticket_id SERIAL PRIMARY KEY,
	price FLOAT,
	seat_number INTEGER,
	"date" TIMESTAMP,
	customer_id integer,
	movie_title_id integer,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(movie_title_id) REFERENCES movie_title(movie_title_id)

);
INSERT INTO tickets(
	price,
	seat_number,
	"date",
	customer_id,
	movie_title_id
	
)VALUES(
	3.99,
	5,
	'2023-02-22 12:23:54',
	1,
	3
),(
	3.99,
	7,
	'2023-02-22 12:25:34',
	2,
	3
);

SELECT *
FROM tickets;


CREATE TABLE concession_product(
	concession_product_id SERIAL PRIMARY KEY,
	"name" VARCHAR(255),
	"description" VARCHAR(255),
	price FLOAT,
	concession_purchase_id INTEGER,
	FOREIGN KEY(concession_purchase_id) REFERENCES concession_purchase(concession_purchase_id)
);

INSERT INTO concession_product(
	"name",
	"description",
	price,
	concession_purchase_id
)VALUES(
	'popcorn',
	'buttery goodness',
	9.99,
	1
),(
	'Fountain Drink Large',
	'bubbly goodness',
	10.00,
	2
);

SELECT *
FROM concession_product;

CREATE TABLE concession_purchase(
	concession_purchase_id SERIAL PRIMARY KEY,
	customer_id INTEGER,
	"DATE" TIMESTAMP,
	"TOTAL PRICE" FLOAT,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
	
);

INSERT INTO concession_purchase(
	customer_id,
	"DATE",
	"TOTAL PRICE"
	
)VALUES(
	5,
	'2020-10-20',
	20.99
),(
	1,
	'2020-10-21',
	10.99
);

SELECT *
FROM concession_purchase;

CREATE TABLE screen_room(
	screen_room_id SERIAL PRIMARY KEY,
	room_number INTEGER
);

INSERT INTO screen_room(
	room_number
)VALUES(
	1
),(
	2
);

SELECT *
FROM screen_room;


CREATE TABLE movie_title(
	movie_title_id SERIAL PRIMARY KEY,
	"Name" VARCHAR(255),
	screen_room_ID INTEGER NO NULL,
	FOREIGN KEY(screen_room_id) REFERENCES screen_room(screen_room_id)
);

INSERT INTO movie_title(
	"Name",
	screen_room_id
)VALUES(
	'One Piece: Red',
	1
),(
	'Black Panther',
	2
);

SELECT *
FROM movie_title;


CREATE TABLE movie_title_screen_room(
	movie_title_screen_room_id SERIAL PRIMARY KEY,
	movie_title_id integer NO NULL,
	screen_room_id integer NO NULL,
	FOREIGN KEY(movie_title_id) REFERENCES movie_title(movie_title_id),
	FOREIGN KEY(screen_room_id) REFERENCES screen_room(screen_room_id)
);

INSERT INTO movie_title_screen_room(
	movie_title_id,
	screen_room_id

)VALUES(
	3,
	1
),(
	4,
	2
);


SELECT *
FROM movie_title_screen_room;



CREATE OR REPLACE PROCEDURE insertCustomer(
 f_n varchar,
 l_n varchar,
 address_ varchar,
 billingInfo varchar
)
LANGUAGE plpgsql AS $$
BEGIN 
 INSERT INTO customer(
  first_name,
  last_name,
  address,
  billing_info
 )VALUES(
  f_n,
  l_n,
  address_,
  billingInfo
 );
 COMMIT;
END; $$

SELECT *
FROM customer;

CALL insertCustomer('JJ', 'Junior','2525 python st sql CA', '2222-2222-1111-1111');





