from config import Config
from app import login, engine

class Customer(object):
	def __init__(self, fetch):
			self.username = fetch.username
			self.uid = fetch.uid
			self.password = fetch.password
			self.gender = fetch.gender
			self.birth_date = fetch.birth_date
			self.phone_number = fetch.phone_number
			self.address = fetch.address

	def is_active(self):
		return True

	def is_authenticated(self):
		return True

	def is_anonymous(self):
		return False

	def get_id(self):
		return self.username


@login.user_loader
def load_user(username):
	return find_user(engine, username)

# Search Functions
def find_user(engine, data):
	sql_text = '''
		SELECT *
		FROM users
		WHERE username = '%s'
	''' % (data)
	cursor = engine.execute(sql_text)
	fetch = cursor.first()
	cursor.close()
	return fetch

def find_user_id(engine, data):
	sql_text = '''
			SELECT *
			FROM users
			WHERE uid = '%s'
		''' % (data)
	cursor = engine.execute(sql_text)
	fetch = cursor.first()
	cursor.close()
	return fetch

def get_product_brand(engine):
	return engine.execute("""
                SELECT p.pid as pid, p.name as product_name, b.name as brand_name,
                 price, d.content as content, image
                FROM products as p, brands as b, describe as d
                WHERE p.pid = d.pid and p.bid = b.bid;
                """)

def get_products(engine, data):
	return engine.execute("""
    		SELECT products.name as product_name, brands.name as brand_name,
    		 price, products.pid as pid, describe.content as content, image 
    		FROM products, brands, describe
    		WHERE products.pid = describe.pid and products.pid = '%s' and products.bid = brands.bid;
    		""" % (data)).fetchone()

def get_comments(engine, data):
	return engine.execute("""
    		WITH temp(oid, cid, content, uid, ctime, rating) as
    		(SELECT p.oid, c.cid, c.content, c.uid, c.time, c.rating 
    		FROM place_order as p, comments_followed_post as c
    		WHERE p.oid = c.oid and p.pid = '%s')

    		SELECT DISTINCT oid, cid, content, username, ctime, rating, avg(rating) as avg_rating
    		FROM temp, users
    		WHERE temp.uid = users.uid
    		GROUP BY oid, cid, content, username, ctime, rating
    		ORDER BY ctime DESC;
    		""" % (data)
    		)

def get_orders(engine, data):
	return engine.execute("""
    		SELECT name, oid, price , p.pid as pid, uid
    		from place_order as o, products as p
    		where o.uid = '%s' and p.pid = o. pid;
    		"""%(data)
    		)

def find_address(engine, data):
	sql_text = '''
			SELECT *
			FROM user_payment
			WHERE uid = '%s'
		''' % (data)
	return engine.execute(sql_text)

def get_item_in_cart(engine, data1, data2):
	sql_text='''
			SELECT * 
			FROM add_to_cart
			WHERE uid = '%s' and pid = '%s'
			''' % (data1, data2)
	cursor = engine.execute(sql_text)
	fetch = cursor.first()
	cursor.close()
	return fetch

def get_item_to_checkout(engine, data):
	return engine.execute("""
        	select * 
        	from add_to_cart as a, products as p
        	where a.pid = p.pid and a.uid = '%s'
        	""" % (data))


# Add data functions

def add_method(engine, payphone, account, paybank, billaddress, payname, uid, method_id):
	engine.execute("""
			INSERT INTO user_payment
			VALUES ('%s', '%s','%s','%s','%s','%s','%s');
			""" % (payphone, account, paybank, billaddress, payname, uid, method_id)
			)


def add_id(engine, data, table):
	return engine.execute("""
			SELECT max(%s)
			FROM %s
			""" % (data, table)
			).fetchone()[0]+1

def insert_to_cart(engine, pid, uid, quantity, time):
	engine.execute("""
        INSERT INTO add_to_cart
        VALUES('%s','%s','%s','%s');
        """ % (pid, uid, quantity, time)
        )

def insert_to_comments(engine, cid, oid, uid, pid, comment, time, rating):
	engine.execute("""
        INSERT INTO comments_followed_post
        VALUES ('%s', '%s','%s','%s','%s','%s','%s');
        """%(cid, oid, uid, pid, comment, time, rating)
        )

def insert(engine, table, uid, phone_number, address, gender, birth_date, password, username):
	assert type(table) == str
	sql_text = """
	INSERT INTO users
	VALUES ('%s', '%s','%s','%s','%s','%s','%s')
	""" % (uid,password, username, phone_number, address, gender, birth_date)
	engine.execute(sql_text)
	print("Invalid insertion")

def add_order(engine, oid, uid, pid, amount):
	engine.execute("""
			INSERT INTO place_order
			VALUES ('%s', '%s', '%s', '%s')
			""" % (oid, uid, pid, amount)
			)

# Delete functions
def delete_item_in_cart(engine, data):
	engine.execute("""
			DELETE FROM add_to_cart
			WHERE uid = '%s'
			""" % (data)
			)
def delete_item_in_cart(engine, data1, data2):
	engine.execute("""
			DELETE FROM add_to_cart
			WHERE uid = '%s' and pid = '%s'
			""" % (data1, data2)
			)
def search_product(engine, keyword):
	return engine.execute("""
				SELECT p.pid, p.name as product_name, b.name as brand_name, 
				price, d.content as content, image
				FROM  products p, brands b, describe as d
				WHERE lower(p.name) LIKE '%%%%%s%%%%' and p.bid=b.bid and p.pid = d.pid
				""" % keyword
				)