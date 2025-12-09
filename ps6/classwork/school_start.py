import sqlite3

DB_NAME ='school.db'

def get_connection():
    return sqlite3.connect(DB_NAME)

def list_students():
    pass
            
def add_student():
    pass

def add_course():
    pass

def enrollments():
    pass

def list_courses():
    pass

def enroll():
    pass

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