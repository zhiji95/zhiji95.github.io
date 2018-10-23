insert into users(uid, phone_number, address, gender, birth_date, password, username) values (1, '15151837100', 'youshihuqu', 'Female', DATE '1996-05-28', '1241hsf', 'peiwenliu');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (2, '15021030317', 'zjgk','Female', DATE '1985-12-17', '12345678', 'Xie nvshi');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (3, '15822768061', 'TianJin','Female', DATE '1985-12-17', '12345678', 'Liu nvshi');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (4, '18236926984', 'ZhengZhou','Female', DATE '1990-01-20', 'qwertyuiop', 'Wangfeifei');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (5, '19941506546', 'NanJing','Female', DATE '1997-05-05', 'shiyizhou', 'zsy');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (6, '15033573029', 'Baodingshi', 'Female', DATE '1995-11-9', '1234399', 'MissLin');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (7, '14792792292', 'Jiulonghu', 'Female', DATE '1998-03-08', 'asfwff', 'yujieyang');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (8, '15151837970', 'dongdahuqu', 'Female', DATE '1993-08-15', 'grgadawfe', 'fangya');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (9, '15775852666', 'nanchongshunqing', 'Male', DATE '1978-05-02', 'fafas', 'yongjundeng');
insert into users(uid, phone_number, address, gender, birth_date, password, username) values (10, '18196544330', 'anhuishengwuhushi', 'Female', DATE '1997-12-08', 'anhuianhui', 'zhixia'); gender, birth_dat

 --pid | bid | price | name | rating | configuration

insert into products (pid, price, name, bid, rating) values (1, 5.0, 'Wet n wild Blush', 4, 4.5);
insert into products (pid, price, name, bid) values (2, 15.0, 'Bourjois Fondation', 1);
insert into products (pid, price, name, bid) values (3, 20.0, 'Shiseido Fondation', 2);
insert into products (pid, price, name, bid, rating) values (4, 30.0, 'Armani Liquid Lipstick', 3, 5.0);
insert into products (pid, price, name, bid) values (5, 20.0, 'Loreal Liquid Lipstick', 5);
insert into products (pid, price, name, bid) values (6, 15.0, 'Kat Von D Matte Lipstick', 6);
insert into products (pid, price, name, bid, rating) values (7, 35.0, 'Yves Saint Laurant Lipcolor', 7, 4.0);
insert into products (pid, price, name, bid) values (8, 25.0, 'Zoeva Cocoa Blend Eyeshadow', 8);
insert into products (pid, price, name, bid) values (9, 15.0, 'Colorpop Lipcolor Bundle', 9);
insert into products (pid, price, name, bid) values (10, 20.0, 'Colorpop Longlasting Fondation', 9);



insert into describe(did, pid, content) values (1, 1, 'Beautiful Blush');
insert into describe(did, pid, content) values (2, 1, 'Soft pinky color with small shiny glitters');
insert into describe(did, pid, content) values (3, 2, 'Give your skin a radiance boost and leave it looking flawless for up to 16 hours! Bourjois’ Radiance Reveal Healthy Mix foundation is enriched with a fruit therapy formula to enhance your complexion.');
insert into describe(did, pid, content) values (4, 3, 'A smart, oil-free, long-lasting foundation that beautifully enhances your complexion. Shiseido Synchro Skin Lasting Liquid Foundation SPF20 maintains skin’s clarity while preventing shine, creasing and fading all day long.');
insert into describe(did, pid, content) values (5, 3, 'Flawlessly undetectable and better than bare skin, this innovative formula with medium, buildable coverage and a modern matte, natural finish feels uniquely airy and silky on skin.');
insert into describe(did, pid, content) values (6, 4, 'Lip Maestro Liquid Lipstick is a creamy formula infused with concentrated pigments which results in an incredible depth of color while leaving the lips with a plush velvet matte finish.');
insert into describe(did, pid, content) values (7, 4, 'A single swipe is enough to instantly create definition and add a touch of light for red carpet-ready');
insert into describe(did, pid, content) values (8, 6, 'Introducing the new and reborn Studded Kiss Crème Lipstick, the creamiest, most cushiony and unbelievably pigmented lipstick to ever cross your lips.');
insert into describe(did, pid, content) values (9, 7, 'Coat your lips with this lip color that offers a lightweight texture, which immediately melts onto lips. Glossy Stain delivers intense glossy color for an extremely long-lasting shine.');
insert into describe(did, pid, content) values (10, 7, 'A revolutionary lip product that combines the texture and shine of a gloss with the long wear of a stain.');


-- bid | name | detail

insert into brands(bid,name) values(1, 'Bourjois');
insert into brands(bid,name) values(2, 'Shiseido');
insert into brands(bid,name) values(3, 'Armani');
insert into brands(bid,name) values(4, 'Wet n Wild');
insert into brands(bid,name) values(5, 'Loreal');
insert into brands(bid,name) values(6, 'Kat Von D');
insert into brands(bid,name) values(7, 'Yves Saint Laurant');
insert into brands(bid,name) values(8, 'Zoeva');
insert into brands(bid,name) values(9, 'Colorpop');
insert into brands(bid,name) values(10, 'Becca');


insert into add_to_cart(pid, uid, amount) values (1, 2, 1);
insert into add_to_cart(pid, uid, amount) values (1, 3, 2);
insert into add_to_cart(pid, uid, amount) values (2, 3, 1);
insert into add_to_cart(pid, uid, amount) values (2, 4, 2);
insert into add_to_cart(pid, uid, amount) values (3, 5, 1);
insert into add_to_cart(pid, uid, amount) values (4, 5, 3);
insert into add_to_cart(pid, uid, amount) values (5, 5, 1);
insert into add_to_cart(pid, uid, amount) values (5, 6, 1);
insert into add_to_cart(pid, uid, amount) values (6, 7, 1);
insert into add_to_cart(pid, uid, amount) values (7, 7, 10);



insert into place_order(oid, uid,pid, amount) values (1, 1, 2, 1);
insert into place_order(oid, uid,pid, amount) values (1, 2, 3, 1);
insert into place_order(oid, uid,pid, amount) values (2, 2, 3, 1);
insert into place_order(oid, uid,pid, amount) values (2, 2, 4, 2);
insert into place_order(oid, uid,pid, amount) values (3, 3, 5, 1);
insert into place_order(oid, uid,pid, amount) values (4, 4, 5, 3);
insert into place_order(oid, uid,pid, amount) values (5, 5, 6, 1);
insert into place_order(oid, uid,pid, amount) values (6, 6, 6, 1);
insert into place_order(oid, uid,pid, amount) values (7, 7, 6, 1);
insert into place_order(oid, uid,pid, amount) values (8, 8, 7, 1);



insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (1, 1, 2, 1, 'Great!', 5);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (2, 2, 3, 1, 'Great!', 5);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (3, 3, 5, 1, 'Worest', 1);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (4, 3, 5, 3, 'Great!', 5);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (5, 4, 5, 4, 'Great!', 4);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (6, 5, 6, 5, 'I like it!', 5);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (7, 6, 6, 6, 'Nice product and fast shippment!', 5);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (8, 7, 6, 6, 'Compeletly ***', 1);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (9, 7, 6, 7, 'Great!', 5);
insert into comments_followed_post(cid, oid, pid, uid, content, rating) values (10, 8, 7, 8, 'Not good product but goo service', 4);


insert into user_payment(phone_number, account_number,uid, method_id) values ('15151837100','4403857357392843',1,1);
insert into user_payment(phone_number, account_number,uid, method_id) values ('15151837100','7463719345749273',1,2);
insert into user_payment(phone_number, account_number,uid, method_id) values ('15021030317','7173643649283823',2,1);
insert into user_payment(phone_number, account_number,uid, method_id) values ('15822768061','9823847474828328',3,1);
insert into user_payment(phone_number, account_number,uid, method_id) values ('18236926984','7367234874829238',4,1);
insert into user_payment(phone_number, account_number,uid, method_id) values ('19941506546','7374749298462832',5,1);
insert into user_payment(phone_number, account_number,uid, method_id) values ('15033573029','9732883729923744',6,1);
insert into user_payment(phone_number, account_number,uid, method_id) values ('15033573029','9823832947474442',6,2);
insert into user_payment(phone_number, account_number,uid, method_id) values ('14792792292','1378390495737823',7,1);
insert into user_payment(phone_number, account_number,uid, method_id) values ('15151837970','0827173737371173',8,1);
insert into user_payment(phone_number, account_number,uid, method_id) values ('15775852666','4499977373112496',9,1);

-- Get average rating for product 6
select AVG(rating) from comments_followed_post where pid = 6;
-- Get all illegal_comments_cid defined as the comments made by the users that never placed this order.
select cid as illegal_comments_cid from comments_followed_post where comments_followed_post.cid not in
(select cid from comments_followed_post as c, place_order as p
where c.oid = p.oid and c.pid = p.pid and c.uid = p.uid);
-- Get the shop cart for user.
select a.uid as uid, a.pid as pid, a.amount as amount, p.price as price_per_unit, p.price*a.amount as total_price
from add_to_cart as a, products as p where a.pid = p.pid;
