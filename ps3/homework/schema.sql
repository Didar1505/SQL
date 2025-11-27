CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    OfficeNumber VARCHAR(10)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Major VARCHAR(50)
);

CREATE TABLE Courses (
    CourseID VARCHAR(10) PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT NOT NULL,
    Department VARCHAR(50)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID VARCHAR(10) NOT NULL,
    InstructorID INT,
    Grade CHAR(2),
    
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

INSERT INTO Instructors (InstructorID, FirstName, LastName, OfficeNumber) VALUES
(101, 'Alice', 'Smith', 'A205'),
(102, 'Robert', 'Jones', 'B112'),
(103, 'Maria', 'Garcia', 'A205'), -- Shared office
(104, 'David', 'Lee', 'C301'),
(105, 'Emily', 'Chen', 'B112'); -- Shared office

INSERT INTO Students (StudentID, FirstName, LastName, Email, Major) VALUES
(1, 'Jane', 'Austen', 'jane.austen@uni.edu', 'Literature'),
(2, 'Mark', 'Twain', 'mark.twain@uni.edu', 'Computer Science'),
(3, 'Leo', 'Tolstoy', 'leo.t@uni.edu', 'History'),
(4, 'Maya', 'Angelou', 'maya.a@uni.edu', 'Literature'),
(5, 'Alan', 'Turing', 'alan.t@uni.edu', 'Computer Science');

INSERT INTO Courses (CourseID, CourseName, Credits, Department) VALUES
('CS101', 'Intro to Programming', 3, 'Comp Sci'),
('LIT205', 'Victorian Novels', 4, 'Literature'),
('HIST350', 'Modern European History', 3, 'History'),
('CS480', 'Database Systems', 3, 'Comp Sci'),
('MATH101', 'Calculus I', 4, 'Mathematics');

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, InstructorID, Grade) VALUES
(1001, 1, 'LIT205', 101, 'B+'), -- Jane Austen in Victorian Novels (Instructor Smith)
(1002, 2, 'CS101', 102, 'A'),  -- Mark Twain in Intro to Programming (Instructor Jones)
(1003, 5, 'CS101', 102, 'B'),  -- Alan Turing in Intro to Programming (Instructor Jones)
(1004, 3, 'HIST350', 104, NULL), -- Leo Tolstoy in History (Instructor Lee) - Grade pending
(1005, 5, 'CS480', 105, 'A-'), -- Alan Turing in Database Systems (Instructor Chen)
(1006, 4, 'LIT205', 101, 'A'),  -- Maya Angelou in Victorian Novels (Instructor Smith)
(1007, 5, 'MATH101', 103, 'C+'); -- Alan Turing in Calculus I (Instructor Garcia)