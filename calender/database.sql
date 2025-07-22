create database library;
use library;

create table Authors (
	author_id int auto_increment primary key,
    name varchar(255) not null,
    birth_year year
);

create table Books (
	book_id int auto_increment primary key,
    title varchar(255) not null,
	author_id int,
    isbn varchar(30),
    published_year year,
    available_copies int,
    foreign key (author_id) references Authors (author_id)
);

create table Members (
	member_id int auto_increment primary key,
    name varchar(255) not null,
    email varchar(255) not null,
    join_date date
);

create table Loans(
	loan_id int auto_increment primary key,
    book_id int,
    member_id int,
    loan_date date,
    return_date date,
    foreign key (book_id) references Books(book_id),
    foreign key (member_id) references Members (member_id)
);

