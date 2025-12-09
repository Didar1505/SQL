import sqlite3

DB_NAME ='school.db'

def get_connection():
    return sqlite3.connect(DB_NAME)

def list_students():
    with get_connection() as con:
        cur = con.cursor()
        cur.execute("SELECT * FROM students")
        rows = cur.fetchall()
        print("\nStudents:")
        for id, name, age in rows:
            print(f"{id}: {name} (age {age})")
            

def add_student():
    name = input("Student name: ")
    age = input("Student age: ")

    with get_connection() as con:
        cursor = con.cursor()
        cursor.execute("INSERT INTO students (name, age) VALUES (?,?)", (name, age))
        con.commit()
    print("Student added")


def add_course():
    title = input("Course title:")
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("INSERT INTO course (title) VALUES (?)", (title,))
        conn.commit()
    print("Course added")

def enrollments():
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("""
        SELECT c.title, s.name FROM enrollments e
        JOIN students s ON s.id = e.student_id
        JOIN course c ON c.id = e.course_id
""")
        rows = cursor.fetchall()
        print("\nEnrollments:")

        c_dict = {}

        for course, student in rows:
            if course in c_dict:
                c_dict[course].append(student)
            else:
                c_dict[course] = [student]

        for course, students in c_dict.items():
            print(f"{course} --", ", ".join(students))

def list_courses():
    with get_connection() as conn:
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM course")
        courses = cursor.fetchall()
        print("\nCourses:")
        for id, title in courses:
            print(f"{id}: {title}")

def enroll():
    list_students()
    student_id = input("Choose a student id to enroll: ")
    list_courses()
    course_id = input("Choose course id to enroll a student: ")
    with get_connection() as conn:
        cursor= conn.cursor()
        cursor.execute("INSERT INTO enrollments (student_id, course_id) VALUES (?, ?)", (student_id, course_id))
        conn.commit()
    print("Successfully enrolled")

def main():
    while True:
        print('\nMenu:')
        print('1. List students')
        print("2. Add students")
        print("3. Add course")
        print("4. Show enrollments")
        print("5. Enroll student in a course")
        print("6. Quit")
        choice = input("Choose an option: ")

        if choice == '1':
            list_students()
        elif choice == '2':
            add_student()
        elif choice == "3":
            add_course()
        elif choice == '4':
            enrollments()
        elif choice == "5":
            enroll()
        elif choice == '6':
            print("Goodbye!")
            break
        else:
            print("Invalid choice!")

if __name__ == '__main__':
    main()