CREATE TABLE Department (
  Name char NOT NULL,
  Address char,
  PRIMARY KEY (Name)
)

CREATE TABLE Course (
  Number char NOT NULL,
  Name char,
  Capacity int,

  PRIMARY KEY (Number)
)

CREATE TABLE Term (
  Semesters char NOT NULL,
  Years int,
)

CREATE TABLE student (
  UNI char NOT NULL,
  Name char,
  age int,

  PRIMARY KEY (UNI)
)
