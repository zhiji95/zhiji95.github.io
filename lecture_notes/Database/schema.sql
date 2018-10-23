create table users(
uid int,
password text NOT NULL,
username text NOT NULL,
phone_number text,
address text,
gender text,
birth_date date,
primary key(uid));

create table products(
pid int,
bid int NOT NULL,
price float NOT NULL,
name text NOT NULL,
rating int,
configuration text,
primary key(pid),
foreign key (bid) references brand(bid)
);

create table describe(
did int,
pid int NOT NULL,
content text NOT NULL,
image text,
primary key(did),
foreign key(pid) references product(pid) on delete cascade
);

create table add_to_cart(
pid int,
uid int,
amount int not null,
primary key(pid,uid),
check (amount > 0),
foreign key (pid) references product(pid),
foreign key (uid) references users(uid));



create table place_order(
oid int,
uid int,
pid int,
amount int NOT NULL,
check (amount > 0),
primary key (oid, pid),
foreign key (uid) references users(uid) on delete cascade,
foreign key (pid) references product(pid));


create table comments_followed_post(
cid int,
oid int not null,
uid int not null UNIQUE,
content text,
time time,
rating int,
primary key (cid),
foreign key (uid) references users(uid),
foreign key (oid) references place_order(oid) on delete cascade);



create table user_payment(
phone_number text NOT NULL,
account_number text NOT NULL,
bank text,
billing_address text,
name text,
uid int not null,
method_id int,
primary key(uid,method_id),
foreign key (uid) references users(uid) on delete cascade);

create table brands(
  bid int,
  name text,
  detail text,
  primary key (bid));
