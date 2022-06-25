CREATE TABLE travel_agencies (
	travel_agency_id INT NOT NULL PRIMARY KEY,
	title VARCHAR(50),
	city VARCHAR(50), 
	promo_code VARCHAR(50)
);

CREATE TABLE hotels (
    hotel_id INT NOT NULL PRIMARY KEY,
    city VARCHAR(50) NOT NULL
);

CREATE TABLE rooms (
	room_id INT NOT NULL PRIMARY KEY,
    hotel_id INT NOT NULL,
    building INT NOT NULL,
    room_num INT NOT NULL,
	class VARCHAR(50) NOT NULL,
	num_of_beds INT NOT NULL,
    kitchen VARCHAR(50) NOT NULL,
    tv VARCHAR(50) NOT NULL,
	price INT NOT NULL,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE
);

CREATE TABLE personal_data (
	personal_data_id INT NOT NULL PRIMARY KEY,
    document_type VARCHAR(50) NOT NULL,
	document_num INT NOT NULL,
	date_of_birth DATE NOT NULL,
	name VARCHAR(50) NOT NULL,
	surname VARCHAR(50) NOT NULL,
	patronymic VARCHAR(50) NOT NULL,
	CONSTRAINT personal_unique UNIQUE (document_num)
);

CREATE TABLE clients (
	client_id INT NOT NULL PRIMARY KEY,
	personal_data_id INT NOT NULL,
	number_of_visits INT NOT NULL,
    type VARCHAR(50) NOT NULL,
	CONSTRAINT clients_unique UNIQUE (personal_data_id),
	FOREIGN KEY (personal_data_id) REFERENCES personal_data(personal_data_id) ON DELETE CASCADE
);

CREATE TABLE employees (
	employee_id INT NOT NULL PRIMARY KEY,
	personal_data_id INT NOT NULL,
    hotel_id INT NOT NULL,
	education VARCHAR(50) NOT NULL,
	position VARCHAR(50) NOT NULL,
	salary INT NOT NULL,
	CONSTRAINT employees_unique UNIQUE (personal_data_id),
	FOREIGN KEY (personal_data_id) REFERENCES personal_data(personal_data_id) ON DELETE CASCADE,
    FOREIGN KEY (hotel_id) REFERENCES hotels(hotel_id) ON DELETE CASCADE
);

CREATE TABLE goals (
    goal_id INT NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL
);

CREATE TABLE services (
    service_id INT NOT NULL PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

CREATE TABLE goal_serv (
    goal_serv_id INT NOT NULL PRIMARY KEY,
    service_id INT NOT NULL,
    goal_id INT NOT NULL,
    FOREIGN KEY (service_id) REFERENCES services(service_id) ON DELETE CASCADE,
    FOREIGN KEY (goal_id) REFERENCES goals(goal_id) ON DELETE CASCADE
);

CREATE TABLE food (
	food_id INT NOT NULL PRIMARY KEY,
	type VARCHAR(50) NOT NULL,
	price INT NOT NULL,
	CONSTRAINT food_unique UNIQUE (type)
);

CREATE TABLE reservation (
	reservation_id INT NOT NULL PRIMARY KEY,
	room_id INT NOT NULL, 
    employee_id INT NOT NULL,
    goal_id INT NOT NULL,
	travel_agency_id INT NOT NULL,
	client_id INT NOT NULL,
	arrival_date DATE NOT NULL,
	departure_date DATE NOT NULL,
	FOREIGN KEY (room_id) REFERENCES rooms(room_id) ON DELETE CASCADE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE,
    FOREIGN KEY (goal_id) REFERENCES goals(goal_id) ON DELETE CASCADE,
	FOREIGN KEY (travel_agency_id) REFERENCES travel_agencies(travel_agency_id) ON DELETE CASCADE,
	FOREIGN KEY (client_id) REFERENCES clients(client_id) ON DELETE CASCADE	
);

CREATE TABLE service_orders (
    service_order_id INT NOT NULL PRIMARY KEY,
    service_id INT NOT NULL,
    reservation_id INT NOT NULL,
    FOREIGN KEY (service_id) REFERENCES services(service_id) ON DELETE CASCADE,
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id) ON DELETE CASCADE
); 

CREATE TABLE food_orders (
    food_order_id INT NOT NULL PRIMARY KEY,
    food_id INT NOT NULL,
    reservation_id INT NOT NULL,
	FOREIGN KEY (food_id) REFERENCES food(food_id) ON DELETE CASCADE,
    FOREIGN KEY (reservation_id) REFERENCES reservation(reservation_id) ON DELETE CASCADE
);