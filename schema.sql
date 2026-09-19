use Final_project_gradingsystem;
CREATE TABLE Class (
    class_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    coursenumber VARCHAR(50) NOT NULL,
    term VARCHAR(50) NOT NULL,
    section_no VARCHAR(50) NOT NULL,
    class_description VARCHAR(500) NOT NULL,
    credit INT NOT NULL,
    instructor_name VARCHAR(100) NOT NULL
) AUTO_INCREMENT=1;

CREATE TABLE Categories (
  category_id INTEGER PRIMARY KEY AUTO_INCREMENT,
  category_name VARCHAR(100) NOT NULL 
) AUTO_INCREMENT=1;

CREATE TABLE Student (
    student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL
) AUTO_INCREMENT=1;

CREATE TABLE assignment (
    assignment_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    assignment_name VARCHAR(100) NOT NULL UNIQUE,
	assignment_description VARCHAR(500) NOT NULL,
    pointvalue float NOT NULL,
    category_id int not null,
    class_id int not null,
	FOREIGN KEY (class_id) REFERENCES Class(class_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
	INDEX (class_id),
    INDEX (category_id)
    
) AUTO_INCREMENT=1;

Alter table assignment drop index assignment_name;

CREATE TABLE enroll (
    student_id int not null,
    class_id int not null,
	FOREIGN KEY (class_id) REFERENCES Class(class_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    PRIMARY KEY (class_id, student_id),
	INDEX (class_id),
    INDEX (student_id)
) AUTO_INCREMENT=1;

CREATE TABLE has (
    class_id int not null,
	category_id int not null,
    weight DECIMAL(5,2),
	FOREIGN KEY (class_id) REFERENCES Class(class_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    PRIMARY KEY (class_id, category_id),
	INDEX (class_id),
    INDEX (category_id)
);
CREATE TABLE isassigned (
    student_id int not null,
    assignment_id int not null,
    grade DECIMAL(10,2) NOT NULL,
	FOREIGN KEY (assignment_id) REFERENCES assignment(assignment_id),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    PRIMARY KEY (student_id, assignment_id),
	INDEX (student_id),
    INDEX (assignment_id)
);

ALTER TABLE isassigned MODIFY grade FLOAT;


Alter table Categories AUTO_INCREMENT=1;
Alter table assignment AUTO_INCREMENT=1;










