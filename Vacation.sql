DROP TABLE booking;
DROP TABLE package;

CREATE TABLE package
(
	resort_name VARCHAR2(20)
		CONSTRAINT package_resort_name_nn NOT NULL
		CONSTRAINT package_pk PRIMARY KEY,
	location VARCHAR2(25)
		CONSTRAINT package_location_nn NOT NULL
);

CREATE TABLE booking
(
	booking_no NUMBER(4)
		CONSTRAINT booking_booking_no_nn NOT NULL
		CONSTRAINT booking_booking_no_ck CHECK (booking_no > 0)
		CONSTRAINT booking_pk PRIMARY KEY,
	customer_name VARCHAR2(50)
		CONSTRAINT booking_customer_name_nn NOT NULL,
	num_vacationers NUMBER(3)
		CONSTRAINT booking_num_vacationers_nn NOT NULL
		CONSTRAINT booking_num_vacationers_ck CHECK (num_vacationers > 0),
	resort_name VARCHAR2(20)
		CONSTRAINT booking_resort_name_nn NOT NULL
		CONSTRAINT booking_resort_name_fk REFERENCES package(resort_name)
);

INSERT INTO package(resort_name, location) VALUES ('Serenity Cove', 'Greece');
INSERT INTO package(resort_name, location) VALUES ('White Beach', 'Jamaica');
INSERT INTO package(resort_name, location) VALUES ('Sun Spot', 'Jamaica');
INSERT INTO package(resort_name, location) VALUES ('Templedor', 'Iceland');
COMMIT;

INSERT INTO booking(booking_no, customer_name, num_vacationers, resort_name) VALUES (17, 'While Mouse', 1, 'Serenity Cove');
COMMIT;

INSERT INTO booking(booking_no, customer_name, num_vacationers, resort_name) VALUES (341, 'Jerry Coyote', 8, 'White Beach');
COMMIT;

INSERT INTO booking(booking_no, customer_name, num_vacationers, resort_name) VALUES (408, 'Tom Duck', 12, 'Sun Spot');
COMMIT;
