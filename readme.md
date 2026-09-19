# Grade Management System

A command-line Grade Management System developed using **Python and MySQL** for a database course project.

The application provides a database-backed system for managing classes, students, grading categories, assignments, enrollments, and student grades. It uses Python to interact with a MySQL relational database and provides command-line functions for performing common grade-management operations.

## Features

The system supports:

- Creating and viewing classes
- Selecting an active class
- Creating and viewing grading categories
- Creating and viewing assignments
- Adding new students
- Enrolling existing students in classes
- Viewing students enrolled in a class
- Searching students by name or username
- Assigning and updating grades
- Viewing individual student grades
- Generating a class gradebook

## Technologies Used

- Python
- MySQL
- SQL
- MySQL Connector for Python
- Relational Database Design

## Database Design

The database contains the following main entities:

- **Class** – stores course number, term, section, description, credit hours, and instructor information.
- **Student** – stores student information and usernames.
- **Categories** – stores grading categories such as Homework, Project, Exam, and Presentation.
- **Assignment** – stores assignments, descriptions, point values, categories, and associated classes.

The database also uses relationship tables:

- **enroll** – represents student enrollment in classes.
- **has** – associates grading categories and their weights with classes.
- **isassigned** – stores student grades for assignments.

The complete E-R diagram is available in `model.pdf`.

## Project Files

```text
model.pdf
    E-R diagram for the database.

schema.sql
    MySQL database schema containing the table definitions,
    primary keys, foreign keys, and indexes.

dump.sql
    Sample database data containing classes, students,
    assignments, enrollments, category weights, and grades.

finalproject_cli_mysql_ready.py
    Python command-line application.

README.md
    Project documentation.
```

## Database Setup

Create the MySQL database before running the application.

The project uses the database:

```sql
Final_project_gradingsystem
```

Run `schema.sql` to create the required tables.

After creating the schema, run `dump.sql` if you want to populate the database with the sample data used for testing the application.

The Python application must also be configured with valid MySQL connection information for your local environment.

## Running the Application

From the project directory, run:

```bash
python3 finalproject_cli_mysql_ready.py
```

After starting the program, the available project functions can be called from the command-line interface.

## Example Commands

### Create a Class

```python
new_class("CS522", "FA24", "1A", "Hybrid", 3, "Dr. Smith")
```

### List Classes

```python
list_classes()
```

### Select a Class

```python
select_class("CS533")
```

### Show the Active Class

```python
show_class()
```

### Show Categories

```python
show_categories()
```

### Add a Category

```python
add_category("assignment", 10.00)
```

### Show Assignments

```python
show_assignment()
```

### Add an Assignment

```python
add_assignment(
    "takehomeassignment1",
    "assignment",
    "Complete the take-home assignment",
    50
)
```

### Add a Student

```python
add_student("mehenaz", 22, "afrin", "mehenaz")
```

### Enroll an Existing Student

```python
enroll_existing_student("Mehenaz")
```

### Show Students

```python
show_students()
```

### Search for Students

```python
show_students_filtered("editha")
```

### Assign a Grade

```python
grade("Homework3", "Editha", 50)
```

### View a Student's Grades

```python
student_grades("Editha")
```

### View the Gradebook

```python
gradebook()
```

## Grade Management

Grades are stored for individual student-assignment combinations. The application supports updating an existing grade and reporting student performance based on assignments and grading categories.

The database stores category weights for each class, allowing different classes to use different grading structures.

## Example Data

The included `dump.sql` contains sample data for testing the system, including:

- Multiple classes and course sections
- Students
- Homework assignments
- Projects
- Exams
- Presentations
- Student enrollments
- Category weights
- Assignment grades

This allows the application to be tested immediately after the database has been created and populated.

## Purpose

This project was developed as a course project for **CS 510/410 – Databases**.

The project demonstrates practical experience with:

- Relational database modeling
- E-R modeling
- Primary and foreign key relationships
- SQL schema design
- MySQL database operations
- Python–MySQL integration
- Database-backed command-line application development
- Managing many-to-many relationships
- Querying and reporting relational data

## Author

**Mehenaz Afrin**