use Final_project_gradingsystem;
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS510', 'SP25', 1, 'Databases', 3, 'Francesca Spezano');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS537', 'FA24', 2, 'Analysis and design of algorithm', 3, 'Hersh Arnholdt');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS547', 'FA24', 3, 'Data Science', 3, 'Dyanna Fairley');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS510', 'SP25', 2, 'Databases', 3, 'Kareem Frend');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS537', 'FA23', 2, 'Analysis and design of algorithm', 5, 'Hersh Arnholdt');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS531', 'FA23', 2, 'Operating system', 3, 'Anthe Castagneto');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS521', 'FA23', 1, 'Deep Learning', 3, 'Leontyne Jakovijevic');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS533', 'SP23', 1, 'advanced software engineering', 3, 'Ogdan Leonardi');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS601', 'FA24', 1, 'Intro to graduate studies', 1, 'Theresina Meiner');
insert into Class (coursenumber, term, section_no, class_description, credit, instructor_name) values ('CS534', 'SP25', 3, 'Machine learning', 3, 'Prince Trunby');

select * from Class;

insert into Categories (category_name) values ('Homework');
insert into Categories (category_name) values ('Project');
insert into Categories (category_name) values ('Exam');
insert into Categories (category_name) values ('Presentation');


select * from Categories;

insert into Student (student_name, username) values ('Ettore Newcombe', 'Ettore');
insert into Student (student_name, username) values ('Darrel Sautter', 'Darrel');
insert into Student (student_name, username) values ('Salim Mein', 'Salim');
insert into Student (student_name, username) values ('Lowe Mossman', 'Lowe ');
insert into Student (student_name, username) values ('Cathyleen Fife', 'Cathyleen');
insert into Student (student_name, username) values ('Kelsey Lowensohn', 'Kelsey');
insert into Student (student_name, username) values ('Tootsie Purvey', 'Tootsie');
insert into Student (student_name, username) values ('Crista Pettengell', 'Crista');
insert into Student (student_name, username) values ('Randolf Martinie', 'Randolf');
insert into Student (student_name, username) values ('Conrade Bleackly', 'Conrade');
insert into Student (student_name, username) values ('Sapphira Benning', 'Sapphira');
insert into Student (student_name, username) values ('Constance Weatherhill', 'Constance');
insert into Student (student_name, username) values ('Chet Levecque', 'Chet');
insert into Student (student_name, username) values ('Whitaker Greatbanks', 'Whitaker');
insert into Student (student_name, username) values ('Editha Thomkins', 'Editha');
insert into Student (student_name, username) values ('Jacquenetta Beer', 'Jacquenetta');
insert into Student (student_name, username) values ('Felizio Blakesley', 'Felizio');
insert into Student (student_name, username) values ('Steve Stocks', 'Steve');
insert into Student (student_name, username) values ('Wilone Letchford', 'Wilone');
insert into Student (student_name, username) values ('Kellyann Gorriessen', 'Kellyann');
insert into Student (student_name, username) values ('Clemmie Cunnah', 'Clemmie');

select * from Student;

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Afrocarpus Page', 50, 1, 1);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Menodora decemfida', 40, 1, 1);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm', 'Elymus trachycaulus', 75, 3, 1);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project', 'Buellia calcariaecola de Lesd.', 120, 2, 1);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Dichondra recurvata', 150, 3, 1);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalpresentation', 'Thymelaea passerina', 90, 4, 1);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Tabernaemontana L.', 50, 1, 2);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Phyllanthus pentaphyllus ', 50, 1, 2);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm1', 'Helodium blandowii ', 60, 3, 2);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm2', 'Lupinus hispanicus Boiss', 60, 3, 2);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Afrocarpus Page', 50, 3, 2);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('presentation', 'Menodora decemfida', 40, 4, 2);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Elymus trachycaulus', 75, 1, 3);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Buellia calcariaecola de Lesd.', 120, 1, 3);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm1', 'Dichondra recurvata', 150, 3, 3);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm2', 'Thymelaea passerina', 90, 3, 3);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project', 'Tabernaemontana L.', 50, 2, 3);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('projectpresentation', 'Phyllanthus pentaphyllus ', 50, 4, 3);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Helodium blandowii ', 60, 3, 3);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Elymus trachycaulus', 65, 1, 4);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Buellia calcariaecola de Lesd.', 100, 1, 4);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm1', 'Dichondra recurvata', 150, 3, 4);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm2', 'Thymelaea passerina', 60, 3, 4);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('presentation', 'Phyllanthus pentaphyllus ', 50, 4, 4);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Helodium blandowii ', 60, 3, 4);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Afrocarpus Page', 60, 1, 5);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Menodora decemfida', 20, 1, 5);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm', 'Elymus trachycaulus', 105, 3, 5);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project', 'Buellia calcariaecola de Lesd.', 120, 2, 5);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Dichondra recurvata', 100, 3, 5);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalpresentation', 'Thymelaea passerina', 50, 4, 5);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Tabernaemontana L.', 50, 1, 6);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Phyllanthus pentaphyllus ', 50, 1, 6);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework3', 'Helodium blandowii ', 60, 1, 6);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm', 'Lupinus hispanicus Boiss', 60, 3, 6);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Afrocarpus Page', 40, 3, 6);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('presentation', 'Menodora decemfida', 60, 4, 6);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project', 'Menodora decemfida', 40, 2, 6);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Tabernaemontana L.', 40, 1, 7);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Phyllanthus pentaphyllus ', 90, 1, 7);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project1', 'Helodium blandowii ', 60, 2, 7);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project2', 'Lupinus hispanicus Boiss', 80, 2, 7);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Afrocarpus Page', 140, 3, 7);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('presentation1', 'Menodora decemfida', 30, 4, 7);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('presentation2', 'Menodora decemfida', 40, 4, 7);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Tabernaemontana L.', 70, 1, 8);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Phyllanthus pentaphyllus ', 90, 1, 8);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework3', 'Helodium blandowii ', 110, 1, 8);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project1', 'Lupinus hispanicus Boiss', 50, 2, 8);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Afrocarpus Page', 140, 3, 8);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('midterm presentation', 'Menodora decemfida', 30, 4, 8);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project2', 'Menodora decemfida', 50, 2, 8);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Tabernaemontana L.', 60, 1, 9);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Phyllanthus pentaphyllus ', 60, 1, 9);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework3', 'Helodium blandowii ', 60, 1, 9);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm', 'Lupinus hispanicus Boiss', 100, 3, 9);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Afrocarpus Page', 150, 3, 9);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('presentation', 'Menodora decemfida', 80, 4, 9);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project', 'Menodora decemfida', 100, 2, 9);

insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework1', 'Tabernaemontana L.', 70, 1, 10);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework2', 'Phyllanthus pentaphyllus ', 80, 1, 10);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Homework3', 'Helodium blandowii ', 90, 1, 10);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm1', 'Lupinus hispanicus Boiss', 100, 3, 10);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Midterm2', 'Afrocarpus Page', 100, 3, 10);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('presentation', 'Menodora decemfida', 100, 4, 10);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('project', 'Menodora decemfida', 100, 2, 10);
insert into assignment (assignment_name, assignment_description, pointvalue, category_id, class_id) values ('Finalexam', 'Menodora decemfida', 100, 3, 10);


select * from assignment;

insert into enroll (student_id, class_id) values (1, 1);
insert into enroll (student_id, class_id) values (2, 1);
insert into enroll (student_id, class_id) values (3, 2);
insert into enroll (student_id, class_id) values (4, 2);
insert into enroll (student_id, class_id) values (5, 3);
insert into enroll (student_id, class_id) values (6, 3);
insert into enroll (student_id, class_id) values (7, 4);
insert into enroll (student_id, class_id) values (8, 4);
insert into enroll (student_id, class_id) values (9, 5);
insert into enroll (student_id, class_id) values (10, 5);
insert into enroll (student_id, class_id) values (11, 6);
insert into enroll (student_id, class_id) values (12, 6);
insert into enroll (student_id, class_id) values (13, 7);
insert into enroll (student_id, class_id) values (14, 7);
insert into enroll (student_id, class_id) values (15, 8);
insert into enroll (student_id, class_id) values (16, 8);
insert into enroll (student_id, class_id) values (17, 9);
insert into enroll (student_id, class_id) values (18, 9);
insert into enroll (student_id, class_id) values (19, 10);
insert into enroll (student_id, class_id) values (20, 10);
insert into enroll (student_id, class_id) values (21, 10);


select * from enroll;

insert into has (class_id, category_id, weight) values (1, 1, 15.00);
insert into has (class_id, category_id, weight) values (1, 3, 45.00);
insert into has (class_id, category_id, weight) values (1, 2, 25.00);
insert into has (class_id, category_id, weight) values (1, 4,15.00);
insert into has (class_id, category_id, weight) values (2, 1, 15.00);
insert into has (class_id, category_id, weight) values (2, 3, 75.00);
insert into has (class_id, category_id, weight) values (2, 4, 10.00);
insert into has (class_id, category_id, weight) values (3, 1, 10.00);
insert into has (class_id, category_id, weight) values (3, 3, 60.00);
insert into has (class_id, category_id, weight) values (3, 4, 10.00);
insert into has (class_id, category_id, weight) values (3, 2, 20.00);
insert into has (class_id, category_id, weight) values (4, 1, 15.00);
insert into has (class_id, category_id, weight) values (4, 3, 75.00);
insert into has (class_id, category_id, weight) values (4, 4, 10.00);
insert into has (class_id, category_id, weight) values (5, 1, 20.00);
insert into has (class_id, category_id, weight) values (5, 3, 40.00);
insert into has (class_id, category_id, weight) values (5, 4, 10.00);
insert into has (class_id, category_id, weight) values (5, 2, 30.00);
insert into has (class_id, category_id, weight) values (6, 1, 20.00);
insert into has (class_id, category_id, weight) values (6, 3, 30.00);
insert into has (class_id, category_id, weight) values (6, 4, 10.00);
insert into has (class_id, category_id, weight) values (6, 2, 40.00);
insert into has (class_id, category_id, weight) values (7, 1, 10.00);
insert into has (class_id, category_id, weight) values (7, 3, 20.00);
insert into has (class_id, category_id, weight) values (7, 2, 40.00);
insert into has (class_id, category_id, weight) values (7, 4, 30.00);
insert into has (class_id, category_id, weight) values (8, 1, 20.00);
insert into has (class_id, category_id, weight) values (8, 3, 20.00);
insert into has (class_id, category_id, weight) values (8, 2, 40.00);
insert into has (class_id, category_id, weight) values (8, 4, 20.00);
insert into has (class_id, category_id, weight) values (9, 1, 30.00);
insert into has (class_id, category_id, weight) values (9, 3, 30.00);
insert into has (class_id, category_id, weight) values (9, 2, 30.00);
insert into has (class_id, category_id, weight) values (9, 4, 10.00);
insert into has (class_id, category_id, weight) values (10, 1, 30.00);
insert into has (class_id, category_id, weight) values (10, 3, 30.00);
insert into has (class_id, category_id, weight) values (10, 2, 20.00);
insert into has (class_id, category_id, weight) values (10, 4, 20.00);

select * from has;

insert into isassigned (student_id, assignment_id, grade) values (1, 1, 45);
insert into isassigned (student_id, assignment_id, grade) values (1, 2, 40);
insert into isassigned (student_id, assignment_id, grade) values (1, 3, 70);
insert into isassigned (student_id, assignment_id, grade) values (1, 4, 120);
insert into isassigned (student_id, assignment_id, grade) values (1, 5, 149);
insert into isassigned (student_id, assignment_id, grade) values (1, 6, 88);
insert into isassigned (student_id, assignment_id, grade) values (2, 1, 50);
insert into isassigned (student_id, assignment_id, grade) values (2, 2, 40);
insert into isassigned (student_id, assignment_id, grade) values (2, 3, 60);
insert into isassigned (student_id, assignment_id, grade) values (2, 4, 120);
insert into isassigned (student_id, assignment_id, grade) values (2, 5, 149);
insert into isassigned (student_id, assignment_id, grade) values (2, 6, 88);
insert into isassigned (student_id, assignment_id, grade) values (3, 7, 50);
insert into isassigned (student_id, assignment_id, grade) values (3, 8, 50);
insert into isassigned (student_id, assignment_id, grade) values (3, 9, 60);
insert into isassigned (student_id, assignment_id, grade) values (3, 10, 55);
insert into isassigned (student_id, assignment_id, grade) values (3, 11, 48);
insert into isassigned (student_id, assignment_id, grade) values (3, 12, 38);
insert into isassigned (student_id, assignment_id, grade) values (4, 7, 50);
insert into isassigned (student_id, assignment_id, grade) values (4, 8, 50);
insert into isassigned (student_id, assignment_id, grade) values (4, 9, 55);
insert into isassigned (student_id, assignment_id, grade) values (4, 10, 55);
insert into isassigned (student_id, assignment_id, grade) values (4, 11, 48);
insert into isassigned (student_id, assignment_id, grade) values (4, 12, 40);
insert into isassigned (student_id, assignment_id, grade) values (5, 13, 75);
insert into isassigned (student_id, assignment_id, grade) values (5, 14, 120);
insert into isassigned (student_id, assignment_id, grade) values (5, 15, 150);
insert into isassigned (student_id, assignment_id, grade) values (5, 16, 82);
insert into isassigned (student_id, assignment_id, grade) values (5, 17, 50);
insert into isassigned (student_id, assignment_id, grade) values (5, 18, 48);
insert into isassigned (student_id, assignment_id, grade) values (5, 19, 58);
insert into isassigned (student_id, assignment_id, grade) values (6, 13, 74);
insert into isassigned (student_id, assignment_id, grade) values (6, 14, 120);
insert into isassigned (student_id, assignment_id, grade) values (6, 15, 120);
insert into isassigned (student_id, assignment_id, grade) values (6, 16, 84);
insert into isassigned (student_id, assignment_id, grade) values (6, 17, 50);
insert into isassigned (student_id, assignment_id, grade) values (6, 18, 48);
insert into isassigned (student_id, assignment_id, grade) values (6, 19, 60);
insert into isassigned (student_id, assignment_id, grade) values (7, 20, 58);
insert into isassigned (student_id, assignment_id, grade) values (7, 21, 100);
insert into isassigned (student_id, assignment_id, grade) values (7, 22, 140);
insert into isassigned (student_id, assignment_id, grade) values (7, 23, 58);
insert into isassigned (student_id, assignment_id, grade) values (7, 24, 50);
insert into isassigned (student_id, assignment_id, grade) values (7, 25, 58);
insert into isassigned (student_id, assignment_id, grade) values (8, 20, 63);
insert into isassigned (student_id, assignment_id, grade) values (8, 21, 100);
insert into isassigned (student_id, assignment_id, grade) values (8, 22, 145);
insert into isassigned (student_id, assignment_id, grade) values (8, 23, 58);
insert into isassigned (student_id, assignment_id, grade) values (8, 24, 48);
insert into isassigned (student_id, assignment_id, grade) values (8, 25, 58);
insert into isassigned (student_id, assignment_id, grade) values (9, 26, 55);
insert into isassigned (student_id, assignment_id, grade) values (9, 27, 20);
insert into isassigned (student_id, assignment_id, grade) values (9, 28, 105);
insert into isassigned (student_id, assignment_id, grade) values (9, 29, 100);
insert into isassigned (student_id, assignment_id, grade) values (9, 30, 98);
insert into isassigned (student_id, assignment_id, grade) values (9, 31, 50);
insert into isassigned (student_id, assignment_id, grade) values (10, 26, 60);
insert into isassigned (student_id, assignment_id, grade) values (10, 27, 20);
insert into isassigned (student_id, assignment_id, grade) values (10, 28, 100);
insert into isassigned (student_id, assignment_id, grade) values (10, 29, 110);
insert into isassigned (student_id, assignment_id, grade) values (10, 30, 98);
insert into isassigned (student_id, assignment_id, grade) values (10, 31, 48);
insert into isassigned (student_id, assignment_id, grade) values (11, 32, 48);
insert into isassigned (student_id, assignment_id, grade) values (11, 33, 45);
insert into isassigned (student_id, assignment_id, grade) values (11, 34, 55);
insert into isassigned (student_id, assignment_id, grade) values (11, 35, 60);
insert into isassigned (student_id, assignment_id, grade) values (11, 36, 38);
insert into isassigned (student_id, assignment_id, grade) values (11, 37, 58);
insert into isassigned (student_id, assignment_id, grade) values (11, 38, 40);
insert into isassigned (student_id, assignment_id, grade) values (12, 32, 50);
insert into isassigned (student_id, assignment_id, grade) values (12, 33, 45);
insert into isassigned (student_id, assignment_id, grade) values (12, 34, 56);
insert into isassigned (student_id, assignment_id, grade) values (12, 35, 50);
insert into isassigned (student_id, assignment_id, grade) values (12, 36, 40);
insert into isassigned (student_id, assignment_id, grade) values (12, 37, 55);
insert into isassigned (student_id, assignment_id, grade) values (12, 38, 40);
insert into isassigned (student_id, assignment_id, grade) values (13, 39, 30);
insert into isassigned (student_id, assignment_id, grade) values (13, 40, 88);
insert into isassigned (student_id, assignment_id, grade) values (13, 41, 60);
insert into isassigned (student_id, assignment_id, grade) values (13, 42, 70);
insert into isassigned (student_id, assignment_id, grade) values (13, 43, 130);
insert into isassigned (student_id, assignment_id, grade) values (13, 44, 30);
insert into isassigned (student_id, assignment_id, grade) values (13, 45, 40);
insert into isassigned (student_id, assignment_id, grade) values (14, 39, 38);
insert into isassigned (student_id, assignment_id, grade) values (14, 40, 88);
insert into isassigned (student_id, assignment_id, grade) values (14, 41, 50);
insert into isassigned (student_id, assignment_id, grade) values (14, 42, 75);
insert into isassigned (student_id, assignment_id, grade) values (14, 43, 135);
insert into isassigned (student_id, assignment_id, grade) values (14, 44, 25);
insert into isassigned (student_id, assignment_id, grade) values (14, 45, 40);
insert into isassigned (student_id, assignment_id, grade) values (15, 46, 70);
insert into isassigned (student_id, assignment_id, grade) values (15, 47, 88);
insert into isassigned (student_id, assignment_id, grade) values (15, 48, 110);
insert into isassigned (student_id, assignment_id, grade) values (15, 49, 50);
insert into isassigned (student_id, assignment_id, grade) values (15, 50, 135);
insert into isassigned (student_id, assignment_id, grade) values (15, 51, 25);
insert into isassigned (student_id, assignment_id, grade) values (15, 52, 45);
insert into isassigned (student_id, assignment_id, grade) values (16, 46, 70);
insert into isassigned (student_id, assignment_id, grade) values (16, 47, 90);
insert into isassigned (student_id, assignment_id, grade) values (16, 48, 110);
insert into isassigned (student_id, assignment_id, grade) values (16, 49, 48);
insert into isassigned (student_id, assignment_id, grade) values (16, 50, 135);
insert into isassigned (student_id, assignment_id, grade) values (16, 51, 26);
insert into isassigned (student_id, assignment_id, grade) values (16, 52, 48);
insert into isassigned (student_id, assignment_id, grade) values (17, 53, 60);
insert into isassigned (student_id, assignment_id, grade) values (17, 54, 55);
insert into isassigned (student_id, assignment_id, grade) values (17, 55, 45);
insert into isassigned (student_id, assignment_id, grade) values (17, 56, 98);
insert into isassigned (student_id, assignment_id, grade) values (17, 57, 145);
insert into isassigned (student_id, assignment_id, grade) values (17, 58, 80);
insert into isassigned (student_id, assignment_id, grade) values (17, 59, 100);
insert into isassigned (student_id, assignment_id, grade) values (18, 53, 60);
insert into isassigned (student_id, assignment_id, grade) values (18, 54, 56);
insert into isassigned (student_id, assignment_id, grade) values (18, 55, 55);
insert into isassigned (student_id, assignment_id, grade) values (18, 56, 100);
insert into isassigned (student_id, assignment_id, grade) values (18, 57, 148);
insert into isassigned (student_id, assignment_id, grade) values (18, 58, 78);
insert into isassigned (student_id, assignment_id, grade) values (18, 59, 100);
insert into isassigned (student_id, assignment_id, grade) values (19, 60, 90);
insert into isassigned (student_id, assignment_id, grade) values (19, 61, 66);
insert into isassigned (student_id, assignment_id, grade) values (19, 62, 80);
insert into isassigned (student_id, assignment_id, grade) values (19, 63, 100);
insert into isassigned (student_id, assignment_id, grade) values (19, 64, 90);
insert into isassigned (student_id, assignment_id, grade) values (19, 65, 98);
insert into isassigned (student_id, assignment_id, grade) values (19, 66, 100);
insert into isassigned (student_id, assignment_id, grade) values (19, 67, 90);
insert into isassigned (student_id, assignment_id, grade) values (20, 60, 90);
insert into isassigned (student_id, assignment_id, grade) values (20, 61, 70);
insert into isassigned (student_id, assignment_id, grade) values (20, 62, 90);
insert into isassigned (student_id, assignment_id, grade) values (20, 63, 100);
insert into isassigned (student_id, assignment_id, grade) values (20, 64, 90);
insert into isassigned (student_id, assignment_id, grade) values (20, 65, 98);
insert into isassigned (student_id, assignment_id, grade) values (20, 66, 98);
insert into isassigned (student_id, assignment_id, grade) values (20, 67, 92);

insert into isassigned (student_id, assignment_id, grade) values (21, 60, 90);
insert into isassigned (student_id, assignment_id, grade) values (21, 61, 65);
insert into isassigned (student_id, assignment_id, grade) values (21, 62, 90);
insert into isassigned (student_id, assignment_id, grade) values (21, 63, 98);
insert into isassigned (student_id, assignment_id, grade) values (21, 64, 90);
insert into isassigned (student_id, assignment_id, grade) values (21, 65, 98);
insert into isassigned (student_id, assignment_id, grade) values (21, 66, 98);
insert into isassigned (student_id, assignment_id, grade) values (21, 67, 95);






























