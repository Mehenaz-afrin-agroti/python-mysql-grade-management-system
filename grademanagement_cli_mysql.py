# ✅ Direct MySQL connection without SSH
import mysql.connector
import warnings
from cryptography.utils import CryptographyDeprecationWarning

warnings.filterwarnings("ignore", category=CryptographyDeprecationWarning)

def connect_db():
    global conn, cursor
    conn = mysql.connector.connect(
        host='127.0.0.1',            # Adjust to 'onyx.boisestate.edu' or similar if needed
        port=54953,                   # Change port if needed
        user='msandbox',     # Replace with your MySQL username
        password='',   # Replace with your MySQL password
    )
    cursor = conn.cursor()
    cursor.execute("CREATE DATABASE IF NOT EXISTS Final_project_gradingsystem")
    conn.commit()
    conn.database = 'Final_project_gradingsystem'
    print("✅ Connected and ensured database exists.")

# ✳️ Paste all your logic functions below this (unchanged):

# Example to show continuation (replace with your full function code):
current_class_id = None

def new_class(coursenumber, term, section_no, class_description, credit, instructor_name):
    try:
        query = "INSERT INTO Class (coursenumber, term, section_no, class_description, credit, instructor_name) VALUES (%s, %s, %s, %s, %s, %s)"
        cursor.execute(query, (coursenumber, term, section_no, class_description, credit, instructor_name))
        conn.commit()
        print(f"✅ Class {coursenumber} {term} {section_no} created.")
    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# new_class(coursenumber, term, section_no, class_description, credit, instructor_name)
def new_class(coursenumber, term, section_no, class_description, credit, instructor_name):
    try:
        query = "INSERT INTO Class (coursenumber, term, section_no, class_description, credit, instructor_name) VALUES (%s, %s, %s, %s, %s, %s)"
        cursor.execute(query, (coursenumber, term, section_no, class_description, credit, instructor_name))
        conn.commit()
        print(f"✅ Class {coursenumber} {term} {section_no} {class_description} {credit} {instructor_name} created.")
    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")


# listing all classess
def list_classes():
    query = """
        SELECT c.coursenumber, c.term, c.section_no, c.class_description, c.credit, c.instructor_name, COUNT(e.student_id) AS student_count
        FROM Class c
        LEFT JOIN enroll e ON c.class_id = e.class_id
        GROUP BY c.class_id;
    """
    cursor.execute(query)
    for row in cursor.fetchall():
        print(row)


# track the active classes
current_class_id = None

def select_class(coursenumber, term=None, section_no=None):
    global current_class_id
    query = "SELECT class_id FROM Class WHERE coursenumber = %s"
    params = [coursenumber]
    
    if term:
        query += " AND term = %s"
        params.append(term)
    if section_no:
        query += " AND section_no = %s"
        params.append(section_no)

    cursor.execute(query, tuple(params))
    results = cursor.fetchall()

    if len(results) == 1:
        current_class_id = results[0][0]
        print(f"✅ Class selected: ID {current_class_id}")
    elif len(results) == 0:
        print("❌ No matching class found.")
    else:
        print("⚠️ Multiple classes match. Please specify term and section_no.")


# for showing class
def show_class():
    if current_class_id is None:
        print("⚠️ No class currently selected.")
        return
    try:
        query = "SELECT * FROM Class WHERE class_id = %s"
        cursor.execute(query, (current_class_id,))
        row = cursor.fetchone()
        if row:
            print(f"📘 Current class:")
            print(f"  ID: {row[0]}")
            print(f"  Course: {row[1]}")
            print(f"  Term: {row[2]}")
            print(f"  Section: {row[3]}")
            print(f"  Description: {row[4]}")
            print(f"  Credit: {row[5]}")
            print(f"  Instructor: {row[6]}")
        else:
            print("❌ Class not found.")
    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# show categories on current active class
def show_categories():
    if current_class_id is None:
        print("⚠️ No class selected. Use select_class() first.")
        return

    try:
        cursor.execute("""
            SELECT c.category_name, h.weight
            FROM has h
            JOIN Categories c ON h.category_id = c.category_id
            WHERE h.class_id = %s
        """, (current_class_id,))
        categories = cursor.fetchall()

        if not categories:
            print("ℹ️ No categories linked to this class.")
        else:
            print("📂 Categories for current class:")
            for name, weight in categories:
                print(f" - {name}: {weight}%")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# add category to the current class
def add_category(category_name, weight):
    if current_class_id is None:
        print("⚠️ No class selected.")
        return
    
    try:
        # Check if category exists
        cursor.execute("SELECT category_id FROM Categories WHERE category_name = %s", (category_name,))
        result = cursor.fetchone()
        
        if result:
            category_id = result[0]
        else:
            # Create category if not exists
            cursor.execute("INSERT INTO Categories (category_name) VALUES (%s)", (category_name,))
            conn.commit()
            category_id = cursor.lastrowid
            print(f"✅ New category '{category_name}' created.")

        # Link category to class in `has`
        cursor.execute("""
            INSERT INTO has (class_id, category_id, weight)
            VALUES (%s, %s, %s)
            ON DUPLICATE KEY UPDATE weight = %s
        """, (current_class_id, category_id, weight, weight))
        conn.commit()
        print(f"✅ Category '{category_name}' linked to class with weight {weight}%.")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# show the assignments in the current class grouped by category with their point values

def show_assignment():
    if current_class_id is None:
        print("⚠️ No class selected.")
        return
    try:
        query = """
        SELECT c.category_name, a.assignment_name, a.pointvalue
        FROM assignment a
        JOIN Categories c ON a.category_id = c.category_id
        WHERE a.class_id = %s
        ORDER BY c.category_name, a.assignment_name
        """
        cursor.execute(query, (current_class_id,))
        results = cursor.fetchall()

        if not results:
            print("ℹ️ No assignments found.")
            return

        print("📝 Assignments grouped by category:")
        current_cat = None
        for category, name, points in results:
            if category != current_cat:
                print(f"\n📂 {category}")
                current_cat = category
            print(f"   - {name} ({points} pts)")
    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# Adds a new assignment under the given category in the current class
def add_assignment(name, category_name, description, pointvalue):
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    try:
        # Get the category ID for this class
        cursor.execute("""
            SELECT c.category_id
            FROM Categories c
            JOIN has h ON c.category_id = h.category_id
            WHERE h.class_id = %s AND c.category_name = %s
        """, (current_class_id, category_name))
        result = cursor.fetchone()

        if not result:
            print(f"❌ Category '{category_name}' is not linked to this class.")
            return

        category_id = result[0]

        # Insert new assignment
        cursor.execute("""
            INSERT INTO assignment (assignment_name, assignment_description, pointvalue, category_id, class_id)
            VALUES (%s, %s, %s, %s, %s)
        """, (name, description, pointvalue, category_id, current_class_id))
        conn.commit()
        print(f"✅ Assignment '{name}' added under '{category_name}' ({pointvalue} pts).")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# add-student username studentid Last First according to the project requirement
def add_student(username, studentid, last_name, first_name):
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    full_name = f"{first_name} {last_name}"
    username = first_name  # Username is first name only

    try:
        # Check if student already exists
        cursor.execute("SELECT student_id, student_name FROM Student WHERE student_id = %s", (studentid,))
        existing = cursor.fetchone()

        if existing:
            existing_id, existing_name = existing

            if existing_name != full_name:
                # ⚠️ Warning message as required
                print(f"⚠️ Warning: student name is being changed from '{existing_name}' to '{full_name}'.")
                cursor.execute("UPDATE Student SET student_name = %s WHERE student_id = %s", (full_name, studentid))
                conn.commit()
            else:
                print(f"ℹ️ Student ID {studentid} already exists with the same name.")
        else:
            # Insert new student
            cursor.execute(
                "INSERT INTO Student (student_id, student_name, username) VALUES (%s, %s, %s)",
                (studentid, full_name, username)
            )
            conn.commit()
            print(f"✅ New student '{full_name}' added with ID {studentid}.")

        # Enroll student in current class
        cursor.execute(
            "INSERT IGNORE INTO enroll (class_id, student_id) VALUES (%s, %s)",
            (current_class_id, studentid)
        )
        conn.commit()
        print(f"📘 Student ID {studentid} enrolled in current class.")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# enrolls an already-existing student in the current class. If the specified student does not exist, report an error.
def enroll_existing_student(username):
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    try:
        # Look up student by username (first name)
        cursor.execute("SELECT student_id FROM Student WHERE username = %s", (username,))
        result = cursor.fetchone()

        if not result:
            print(f"❌ Error: No student found with username '{username}'.")
            return

        student_id = result[0]

        # Enroll student in current class
        cursor.execute("""
            INSERT IGNORE INTO enroll (class_id, student_id)
            VALUES (%s, %s)
        """, (current_class_id, student_id))
        conn.commit()

        print(f"✅ Student '{username}' enrolled in current class.")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

#Show all students in current class
def show_students():
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    try:
        query = """
        SELECT s.student_id, s.student_name, s.username
        FROM Student s
        JOIN enroll e ON s.student_id = e.student_id
        WHERE e.class_id = %s
        ORDER BY s.student_name
        """
        cursor.execute(query, (current_class_id,))
        students = cursor.fetchall()

        if not students:
            print("ℹ️ No students enrolled in this class.")
        else:
            print("📘 Students in current class:")
            for sid, name, uname in students:
                print(f" - ID: {sid}, Name: {name}, Username: {uname}")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

#show all students with ‘string’ in their name or username (case-insensitive)
def show_students_filtered(search_term):
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    try:
        search_term = f"%{search_term.lower()}%"
        query = """
        SELECT s.student_id, s.student_name, s.username
        FROM Student s
        JOIN enroll e ON s.student_id = e.student_id
        WHERE e.class_id = %s
          AND (LOWER(s.student_name) LIKE %s OR LOWER(s.username) LIKE %s)
        ORDER BY s.student_name
        """
        cursor.execute(query, (current_class_id, search_term, search_term))
        students = cursor.fetchall()

        if not students:
            print(f"ℹ️ No students match '{search_term.strip('%')}' in this class.")
        else:
            print(f"🔍 Students matching '{search_term.strip('%')}' in current class:")
            for sid, name, uname in students:
                print(f" - ID: {sid}, Name: {name}, Username: {uname}")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# grade assignmentname username grade
def grade(assignmentname, username, grade_value):
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    try:
        # 1. Find assignment by name and current class
        cursor.execute("""
            SELECT assignment_id, pointvalue
            FROM assignment
            WHERE assignment_name = %s AND class_id = %s
        """, (assignmentname, current_class_id))
        assignment = cursor.fetchone()

        if not assignment:
            print(f"❌ Assignment '{assignmentname}' not found in current class.")
            return

        assignment_id, pointvalue = assignment

        # 2. Find student by username
        cursor.execute("SELECT student_id FROM Student WHERE username = %s", (username,))
        student = cursor.fetchone()

        if not student:
            print(f"❌ Student with username '{username}' not found.")
            return

        student_id = student[0]

        # 3. Warn if grade > assignment max points
        try:
            numeric_grade = float(grade_value)
            if numeric_grade > pointvalue:
                print(f"⚠️ Warning: grade '{grade_value}' exceeds configured max points ({pointvalue}).")
        except ValueError:
            pass  # Grade is non-numeric (e.g., 'A'), skip check

        # 4. Insert or update grade
        cursor.execute("""
            INSERT INTO isassigned (student_id, assignment_id, grade)
            VALUES (%s, %s, %s)
            ON DUPLICATE KEY UPDATE grade = VALUES(grade)
        """, (student_id, assignment_id, grade_value))
        conn.commit()

        print(f"✅ Grade '{grade_value}' recorded for student '{username}' on assignment '{assignmentname}'.")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# student-grades username – show student’s current grade
def student_grades(username):
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    try:
        # Get student ID
        cursor.execute("SELECT student_id, student_name FROM Student WHERE username = %s", (username,))
        student = cursor.fetchone()

        if not student:
            print(f"❌ No student found with username '{username}'.")
            return

        student_id, student_name = student
        print(f"🧑 Grades for {student_name} (username: {username})")

        # Fetch all assignments, categories, and grades
        cursor.execute("""
            SELECT 
                c.category_name,
                h.weight,
                a.assignment_name,
                a.pointvalue,
                ia.grade
            FROM assignment a
            JOIN Categories c ON a.category_id = c.category_id
            JOIN has h ON h.category_id = c.category_id AND h.class_id = a.class_id
            LEFT JOIN isassigned ia ON ia.assignment_id = a.assignment_id AND ia.student_id = %s
            WHERE a.class_id = %s
            ORDER BY c.category_name, a.assignment_name
        """, (student_id, current_class_id))
        rows = cursor.fetchall()

        if not rows:
            print("ℹ️ No assignments or grades found.")
            return

        # Group and calculate
        from collections import defaultdict

        category_totals = defaultdict(lambda: {"graded": 0.0, "attempted": 0.0, "max": 0.0, "weight": 0.0})
        
        current_cat = None
        for category, weight, assignment, max_points, grade in rows:
            if category != current_cat:
                print(f"\n📂 Category: {category} (Weight: {weight}%)")
                current_cat = category

            grade_display = grade if grade is not None else "—"
            print(f"   - {assignment}: {grade_display} / {max_points}")

            try:
                numeric_grade = float(grade)
                category_totals[category]["graded"] += numeric_grade
                category_totals[category]["attempted"] += max_points
            except (TypeError, ValueError):
                pass  # Skip if no grade or non-numeric

            category_totals[category]["max"] += max_points
            category_totals[category]["weight"] = float(weight)

        # Compute total and attempted grades
        total_grade = 0.0
        total_attempted_grade = 0.0
        total_weight = 0.0
        total_attempted_weight = 0.0

        print("\n📊 Category Subtotals:")
        for cat, data in category_totals.items():
            graded = data["graded"]
            attempted = data["attempted"]
            max_possible = data["max"]
            weight = data["weight"]

            cat_score = (graded / max_possible) * weight if max_possible else 0
            cat_attempted_score = (graded / attempted) * weight if attempted else 0

            print(f" - {cat}:")
            print(f"     ⤷ Total Grade Contribution: {cat_score:.2f}")
            print(f"     ⤷ Attempted Grade Contribution: {cat_attempted_score:.2f}")

            total_grade += cat_score
            total_attempted_grade += cat_attempted_score
            total_weight += weight
            if attempted > 0:
                total_attempted_weight += weight

        print("\n🎯 Final Grades:")
        print(f" ✅ Total Grade: {total_grade:.2f} / 100")
        print(f" ✅ Attempted Grade: {total_attempted_grade:.2f} / {total_attempted_weight if total_attempted_weight else 100:.2f}")

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# code for showing the current class’s gradebook: students (username, student ID, and name), along with their total grades in the class.
def gradebook():
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    try:
        # Step 1: Get all students enrolled in the class
        cursor.execute("""
            SELECT s.student_id, s.username, s.student_name
            FROM Student s
            JOIN enroll e ON s.student_id = e.student_id
            WHERE e.class_id = %s
            ORDER BY s.student_name
        """, (current_class_id,))
        students = cursor.fetchall()

        if not students:
            print("ℹ️ No students enrolled in this class.")
            return

        print("📘 GRADEBOOK")
        print("-" * 70)
        print("{:<10} {:<10} {:<25} {:>10} {:>15}".format("ID", "Username", "Name", "Total %", "Attempted %"))

        for student_id, username, name in students:
            # Step 2: Get all assignments, categories, and this student’s grades
            cursor.execute("""
                SELECT 
                    h.weight,
                    a.pointvalue,
                    ia.grade
                FROM assignment a
                JOIN Categories c ON a.category_id = c.category_id
                JOIN has h ON h.category_id = c.category_id AND h.class_id = a.class_id
                LEFT JOIN isassigned ia ON ia.assignment_id = a.assignment_id AND ia.student_id = %s
                WHERE a.class_id = %s
            """, (student_id, current_class_id))
            rows = cursor.fetchall()

            # Step 3: Aggregate category-weighted scores
            from collections import defaultdict
            cat_totals = defaultdict(lambda: {"graded": 0.0, "attempted": 0.0, "max": 0.0, "weight": 0.0})

            for weight, max_points, grade in rows:
                weight = float(weight)  # 💡 Convert DECIMAL to float

                try:
                    numeric_grade = float(grade)
                    cat_totals[weight]["graded"] += numeric_grade
                    cat_totals[weight]["attempted"] += max_points
                except (TypeError, ValueError):
                    pass  # No grade or invalid format

                cat_totals[weight]["max"] += max_points
                cat_totals[weight]["weight"] = weight

            total = 0.0
            attempted = 0.0
            total_weight = 0.0
            attempted_weight = 0.0

            for weight, data in cat_totals.items():
                if data["max"] > 0:
                    total += (data["graded"] / data["max"]) * weight
                if data["attempted"] > 0:
                    attempted += (data["graded"] / data["attempted"]) * weight
                    attempted_weight += weight
                total_weight += weight

            print("{:<10} {:<10} {:<25} {:>10.2f} {:>15.2f}".format(
                student_id, username, name, total, attempted if attempted_weight > 0 else 0.0
            ))

    except mysql.connector.Error as err:
        print(f"❌ Error: {err}")

# code for for SQL-Based Grade Calculation for student grade
def student_grades_fixed(username):
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    query = """
    SELECT 
        c.category_name,
        a.assignment_name,
        a.pointvalue,
        ia.grade,
        ROUND((h.weight / total.total_weight) * 100, 2) AS normalized_weight,
        CASE
            WHEN ia.grade IS NOT NULL THEN
                ROUND(
                    (LEAST(ia.grade, a.pointvalue) / a.pointvalue)
                    * (h.weight / total.total_weight),
                    4
                ) * 100
            ELSE 0
        END AS weighted_contribution
    FROM assignment a
    JOIN Categories c ON a.category_id = c.category_id
    JOIN has h ON h.category_id = c.category_id AND h.class_id = a.class_id
    JOIN Student s ON s.username = %s
    LEFT JOIN isassigned ia ON ia.assignment_id = a.assignment_id AND ia.student_id = s.student_id
    JOIN (
        SELECT class_id, SUM(weight) AS total_weight
        FROM has
        WHERE class_id = %s
        GROUP BY class_id
    ) total ON total.class_id = a.class_id
    WHERE a.class_id = %s
    ORDER BY c.category_name, a.assignment_name;
    """

    cursor.execute(query, (username, current_class_id, current_class_id))
    rows = cursor.fetchall()

    if not rows:
        print("ℹ️ No assignments or grades found.")
        return

    print(f"🧑 Grades for '{username}' in class ID {current_class_id}")
    current_category = None
    total_grade = 0.0
    attempted_grade = 0.0
    attempted_weight = 0.0

    for row in rows:
        category, assignment, max_points, grade, weight, contrib = row
        weight = float(weight)

        if category != current_category:
            print(f"\n📂 Category: {category} (Weight: {weight:.2f}%)")
            current_category = category

        display_grade = grade if grade is not None else "—"
        print(f"   - {assignment}: {display_grade} / {max_points}")
        print(f"     → Contribution to grade: {contrib:.2f}")

        total_grade += contrib
        if grade is not None:
            attempted_grade += contrib
            attempted_weight += weight

    print("\n📊 Final Grade Summary:")
    print(f" ✅ Total Grade (including ungraded): {total_grade:.2f} / 100")
    if attempted_weight > 0:
        print(f" ✅ Attempted Grade (graded only): {attempted_grade:.2f} / {attempted_weight:.2f}")
    else:
        print(" ⚠️ Attempted Grade: No graded assignments yet.")

#final code for SQL-powered gradebook() 
def gradebook():
    if current_class_id is None:
        print("⚠️ No class selected.")
        return

    query = """
    SELECT
        s.student_id,
        s.username,
        s.student_name,
        ROUND(SUM(
            CASE
                WHEN ia.grade IS NOT NULL THEN 
                    (LEAST(ia.grade, a.pointvalue) / a.pointvalue) * (h.weight / tw.total_weight * 100)
                ELSE 0
            END
        ), 2) AS raw_total_grade,

        ROUND(SUM(
            CASE
                WHEN ia.grade IS NOT NULL THEN 
                    (LEAST(ia.grade, a.pointvalue) / a.pointvalue) * (h.weight / tw.total_weight * 100)
                ELSE 0
            END
        ), 2) AS attempted_grade,

        ROUND(SUM(
            CASE
                WHEN ia.grade IS NOT NULL THEN h.weight
                ELSE 0
            END
        ) / tw.total_weight * 100, 2) AS attempted_weight

    FROM Student s
    JOIN enroll e ON e.student_id = s.student_id
    JOIN assignment a ON a.class_id = e.class_id
    JOIN has h ON h.class_id = a.class_id AND h.category_id = a.category_id
    LEFT JOIN isassigned ia ON ia.assignment_id = a.assignment_id AND ia.student_id = s.student_id
    JOIN (
        SELECT class_id, SUM(weight) AS total_weight
        FROM has
        WHERE class_id = %s
        GROUP BY class_id
    ) tw ON tw.class_id = a.class_id

    WHERE a.class_id = %s
    GROUP BY s.student_id, s.username, s.student_name
    ORDER BY s.student_id;
    """

    cursor.execute(query, (current_class_id, current_class_id))
    rows = cursor.fetchall()

    print("📘 CLASS GRADEBOOK")
    print("-" * 80)
    print(f"{'ID':<10} {'Username':<12} {'Name':<25} {'Total %':>10} {'Attempted %':>15}")
    print("-" * 80)

    for row in rows:
        student_id, username, name, raw_total, attempted, attempted_weight = row

        # ✅ Cap total grade at 100
        total = min(raw_total, 100.00)

        # Format attempted grade output
        attempted_display = f"{attempted:.2f}" if attempted_weight > 0 else "—"

        print(f"{student_id:<10} {username:<12} {name:<25} {total:>10.2f} {attempted_display:>15}")


if __name__ == '__main__':
    connect_db()
    print("\n🎓 Grade Management CLI is ready.")
    print("💡 Type your function calls below. Supported commands:")
    print("   new_class(...)")
    print("   list_classes()")
    print("   select_class(...)")
    print("   show_class()")
    print("   show_categories()")
    print("   add_category(...)")
    print("   show_assignment()")
    print("   add_assignment(...)")
    print("   add_student(...)")
    print("   enroll_existing_student(...)")
    print("   show_students()")
    print("   show_students_filtered(...)")
    print("   grade(...)")
    print("   student_grades(...)")
    print("   student_grades_fixed(...)")
    print("   gradebook()")
    print("🔚 Type 'exit' to quit.\n")

    try:
        while True:
            cmd = input(">>> ")
            if cmd.strip().lower() == 'exit':
                break
            try:
                exec(cmd)
            except Exception as e:
                print(f"❌ Error: {e}")
    finally:
        cursor.close()
        conn.close()
        print("🔒 Disconnected.")
