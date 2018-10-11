/* Create a table called NAMES */
CREATE TABLE Department (
  Name char(2) NOT NULL,
  Address char,
  PRIMARY KEY (Name)
);

/* Create few records in this table */
INSERT INTO Department VALUES('EE','A');
INSERT INTO Department VALUES('CS','B');
INSERT INTO Department VALUES('NB','C');



/* Display all the records from the table */
SELECT * FROM Department;



/* Create a table called Course */
CREATE TABLE Course (
  d_name char(2) NOT NULL,
  Number char(4) NOT NULL,
  Name char(100) NOT NULL,
  Capacity int,

  PRIMARY KEY (Number, d_name),
  FOREIGN KEY (d_name) REFERENCES Department(Name) on delete CASCADE
);

/* Create few records in this table */
INSERT INTO Course VALUES('EE','6885', 'Reinforcement Learning', 160);
INSERT INTO Course VALUES('EE','4111', 'Database', 80);
INSERT INTO Course VALUES('CS','4111', 'Database', 80);
INSERT INTO Course VALUES('CS','4567', 'Weirdbase', 8000000);


/* Display all the records from the table */
SELECT * FROM Course;


/* Create a table called Term */
CREATE TABLE Term (
  Semesters char(6) NOT NULL,
  Years int NOT NULL,
  PRIMARY KEY(Semesters, Years)
);

/* Create few records in this table */
INSERT INTO Term VALUES('fall',2018);
INSERT INTO Term VALUES('spring',2018);
INSERT INTO Term VALUES('summer',2018);
INSERT INTO Term VALUES('fall',2017);
INSERT INTO Term VALUES('spring',2017);



/* Display all the records from the table */
SELECT * FROM Term;



/* Create a table called Student */
CREATE TABLE Student (
  UNI char(6) NOT NULL,
  Name char(20),
  age int,
  level char(9) NOT NULL,
  research_field char(20) check (is NOT NULL or level = 'undergrad'),
  concentration char(20) check (is NOT NULL or level = 'grad'),
  PRIMARY KEY (UNI),
  CHECK(level = 'undergrad' or level = 'grad')
);

/* Here we basically allow the overlap constraint because it makes sense. TO deal with cover constraint, I force
editors to indicate whether this is undergrad or grad */

/* Create few records in this table */
INSERT INTO Student VALUES('yy0001','yining yang', 22, 'undergrad','google baodi',null);
INSERT INTO Student VALUES('yy0002','yining yang', 22,'undergrad','google baodi',null);
INSERT INTO Student VALUES('yy0003','yining yang', 22,'undergrad','google baodi',null);
INSERT INTO Student VALUES('yy0004','yining yang', 22,'undergrad','google baodi',null);
INSERT INTO Student VALUES('yy1001','yining yang', 22, 'grad',null,'google baodi');
INSERT INTO Student VALUES('yy1002','yining yang', 22, 'grad',null,'google baodi');
INSERT INTO Student VALUES('yy1003','yining yang', 22, 'grad',null,'google baodi');
INSERT INTO Student VALUES('yy1004','yining yang', 22, 'grad',null,'google baodi');




/* Display all the records from the table */
SELECT * FROM Student;

/* Create a table called Affliate */
CREATE TABLE Affliate (
  d_name char(2) NOT NULL,
  UNI char(6) NOT NULL,
  PRIMARY KEY(UNI),
  Foreign KEY(d_name) references Department(name) on delete cascade,
  FOREIGN KEY(UNI) references Student(UNI) on delete cascade
);

/* Create few records in this table */
INSERT INTO Affliate VALUES('EE','yy2222');
INSERT INTO Affliate VALUES('CS','yy2223');
INSERT INTO Affliate VALUES('EE','yy0001');
INSERT INTO Affliate VALUES('EE','yy0002');
INSERT INTO Affliate VALUES('EE','yy0003');
INSERT INTO Affliate VALUES('EE','yy0004');

/* Display all the records from the table */
SELECT * FROM Affliate;


create table graduate(UNI, research_field)
select UNI, research_field from Student where level = 'grad';

-- /* Create a table called Graduate */
-- CREATE TABLE Graduate (
--   UNI char NOT NULL,
--   Research_field char NOT NULL,
--   PRIMARY KEY (UNI),
--   FOREIGN KEY (UNI) references Student
-- );

-- /* Create few records in this table */
-- INSERT INTO Graduate VALUES('yy2222','google baodi');
-- INSERT INTO Graduate VALUES('yy2223','google neitui');
-- /* Display all the records from the table */
-- SELECT * FROM Graduate;


-- /* Create a table called Undergraduate */
-- CREATE TABLE Undergraduate (
--   UNI char NOT NULL,
--   Research_field char NOT NULL,
--   PRIMARY KEY (UNI),
--   FOREIGN KEY (UNI) references Student
-- );

-- /* Sucess insert */
-- INSERT INTO Undergraduate VALUES('ss2222','google baodi');
-- -- INSERT INTO Undergraduate VALUES('nd2222','google neitui');
-- /* Fail insert */
-- /* Display all the records from the table */
-- SELECT * FROM Undergraduate;

CREATE TABLE offer(
    d_name char(2) NOT NULL,
    number char(4) NOT NULL,
    semester char(6) NOT NULL,
    year int NOT NULL,
    PRIMARY KEY(d_name, number, semester, year),
    FOREIGN KEY(number, d_name) REFERENCES Course(Number,d_name),
    FOREIGN KEY(semester, year) REFERENCES Term(Semesters, Years)
);
CREATE TABLE enroll(
    UNI char(6) NOT NULL ,
    d_name char(2) NOT NULL,
    number char(4) NOT NULL,
    semester char(6) NOT NULL,
    year int NOT NULL,
    PRIMARY KEY(UNI,d_name, number, semester, year),
    FOREIGN KEY(UNI) REFERENCES Student(UNI),
    FOREIGN KEY(d_name, number, semester, year) REFERENCES offer(d_name, number, semester, year)
);

/* Create few records in this table */
INSERT INTO offer VALUES('EE','6885', 'fall', 18);
INSERT INTO offer VALUES('EE','6885', 'spring', 18);
INSERT INTO offer VALUES('CS','4111', 'fall', 17);
INSERT INTO offer VALUES('EE','4111', 'fall', 18);
SELECT * FROM offer;
INSERT INTO enroll VALUES('yy0001','CS','4111', 'fall', 17);
INSERT INTO enroll VALUES('yy0002','EE','6885', 'fall', 18);
SELECT * FROM enroll;
