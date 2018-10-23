create table users(
    uid char(10),
    phone_number text,
    address text,
    gender text,
    birth_date date,
    primary key(uid));


create table add_prod_to_cart(
    pid char(10) not null,
    cart_id int not null,
    amount int not null,
    primary key(pid,cart_id),
    foreign key (pid) references product(pid),
    foreign key (cart_id) references user_own_cart(cart_id));

create table product(
  pid char(10) not null,
  video text,
  image text,
  icon text,
  rating int,
  price float,
  configuration text,
  name text,
  primary key(pid)
);

create table orders(
  oid char(10),
  amount int,
  primary key(oid)
);


create table has(
  pid char(10) not null,
  oid char(10),
  foreign key (pid) references product(pid),
  foreign key (oid) references orders(oid)
);

create table comments(
  cid char(10),
  content text,
  time datetime,
  rating int,
  primary key (cid)
);

create table comments_followed(
  cid char(10),
  oid char(10) not null,
  content text,
  time datetime,
  rating int,
  primary key (cid, oid),
  foreign key (oid) references orders(oid) on delete cascade
);

create table place_order(
  oid char(10),
  uid char(10) not null,
  amount int,
  primary key (oid, uid),
  foreign key (uid) references users(uid) on delete cascade
);
create table post(
  uid char(10) unique not null,
  cid char(10),
  foreign key (uid) references users(uid),
  foreign key (cid) references comments(cid)
);
