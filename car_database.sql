create table car(
	car_id serial primary key,
	pre_owned integer,
	make varchar(50),
	model varchar(50),
	price float
)

--insert into car table
insert into car(pre_owned, make, model, price)
values(1, 'Tesla', 'Model S', 60000.00)
insert into car(pre_owned, make, model, price)
values(0, 'Honda', 'Model CRV', 40000.00)
insert into car(pre_owned, make, model, price)
values(1, 'Audi', 'Model Q7', 60000.00)
insert into car(pre_owned, make, model, price)
values(0, 'Audi', 'Model r8', 60000.00)

create table customer(
	customer_id serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	address varchar(100)
)

insert into customer(first_name, last_name, email, address)
values('Jay', 'Patel', 'jp@codingtemple.com', '8788 oak rd.')
insert into customer(first_name, last_name, email, address)
values('Lucas', 'Lang', 'lg@codingtemple.com', '8 oak rd.')

create table sales_person(
	sales_id serial primary key,
	car_id integer,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(50),
	foreign key(car_id) references car(car_id)
)

insert into sales_person(car_id, first_name, last_name, email)
values(2, 'Tom', 'Holland', 'th23@codingtemple.com')
insert into sales_person(car_id, first_name, last_name, email)
values(2, 'Kush', 'Patel', 'kp@codingtemple.com')

create table invoice(
	invoice_id serial primary key,
	car_id integer,
	customer_id integer,
	sales_id integer,
	foreign key(car_id) references car(car_id),
	foreign key(customer_id) references customer(customer_id),
	foreign key(sales_id) references sales_person(sales_id)
)

insert into invoice(car_id, customer_id, sales_id)
values(2, 2, 1)
insert into invoice(car_id, customer_id, sales_id)
values(2, 1, 2)

create table mechanic(
	mechanic_id serial primary key,
	first_name varchar(50),
	last_name varchar(50)
)

insert into mechanic(first_name, last_name)
values('Sam', 'Reyna')
insert into mechanic(first_name, last_name)
values('Ben', 'Ten')


create table parts(
	parts_id serial primary key,
	parts_name varchar(100),
	price float
)

insert into parts(parts_name, price)
values('Radiator', 39.99)
insert into parts(parts_name, price)
values('Battery', 32.99)
insert into parts(parts_name, price)
values('Brakes', 16.99)
insert into parts(parts_name, price)
values('Bumper', 43.99)
insert into parts(parts_name, price)
values('AC Compressor', 32.99)
insert into parts(parts_name, price)
values('Transmission', 164.99)


create table parts_used(
	parts_used_id serial primary key,
	parts_id integer,
	car_id integer,
	foreign key(parts_id) references parts(parts_id),
	foreign key(car_id) references car(car_id)
)

insert into parts_used(parts_id, car_id)
values(2, 1)
insert into parts_used(parts_id, car_id)
values(4, 3)

create table service_ticket(
	service_ticket_id serial primary key,
	mechanic_id integer,
	parts_id integer,
	customer_id integer,
	car_id integer,
	work_performed varchar(100),
	date_added date default current_date,
	foreign key(mechanic_id) references mechanic(mechanic_id),
	foreign key(parts_id) references parts(parts_id),
	foreign key(customer_id) references customer(customer_id),
	foreign key(car_id) references car(car_id)
)

insert into service_ticket(mechanic_id, parts_id, customer_id, car_id, work_performed)
values(1, 2, 1, 1, 'Battery change')
insert into service_ticket(mechanic_id, parts_id, customer_id, car_id, work_performed)
values(2, 4, 2, 3, 'Fixed bumper')

create table service(
	service_id serial primary key,
	service_ticket_id integer,
	customer_id integer,
	foreign key(service_ticket_id) references service_ticket(service_ticket_id),
	foreign key(customer_id) references customer(customer_id)
)

insert into service(service_ticket_id, customer_id)
values(1, 2)
insert into service(service_ticket_id, customer_id)
values(2, 1)
