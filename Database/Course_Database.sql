

USE Student;


CREATE TABLE Course(CourseCode VARCHAR(10), CourseName VARCHAR(255), Professor VARCHAR(255), 
Description VARCHAR (255), Term VARCHAR(10), Room VARCHAR(10), TimeSlot VARCHAR(255), 
DaySlot VARCHAR(50), Prerequisites VARCHAR (255), Capacity int);

INSERT INTO Course VALUES("SWS 110", "Intro to Software Engineering", "Mr.Bob", "A introductory course to Software Engineering"
"Fall", "A322", "10:30 AM - 12:30 PM", "Monday", "None", 30);
INSERT INTO Course VALUES("SWS 120", "Intro to Web Design", "Ms.Cinthia", "A introductory course to Web Design and Development"
"Fall", "A311", "12:30 PM - 2:30 PM", "Tuesday", "None", 30);
INSERT INTO Course VALUES("SWS 140", "Intro to Networking Theories", "Mr.Robert", "A introductory course to Networking and Theories"
"Fall", "A313", "10:30 AM - 12:30 PM", "Wednesday", "None", 30);
INSERT INTO Course VALUES("SWS 210", " Advanced Web Development", "Mr.James", "An advanced course that covers advanced web design techniques"
"Winter", "A322", "10:30 AM - 12:30 PM", "Friday", "SWS 120", 30);
INSERT INTO Course VALUES("SWS 220", "Advanced Software Development", "Mrs. Lucas", "Advanced Software Development strategies and Techniques"
"Winter", "A332", "4:30 PM - 6:30 PM", "Monday", "110", 30);
INSERT INTO Course VALUES("SWS 230", "Intermediate Networking Techniques", "Mr.Bob", "Advanced Networking Theories and Techniques based on Latest Networking Standards"
"Winter", "A317", "10:30 AM - 12:30 PM", "Tuesday", "SWS 140", 30);
INSERT INTO Course VALUES("SWS 310", "Software Programming 1", " Ms. Andrews", "Beginning Software Programming. Students will form groups and Design and Code thier own software"
"Fall", "A332", "10:30 AM - 12:30 PM", "Monday", "SWS 220", 30);
INSERT INTO Course VALUES("SWS 320", "Technical Writing", " Mr.Steve", "Writing Technical documents for the software industry"
"Fall", "A312", "10:30 AM - 12:30 PM", "Wednesday", "SWS 230", 30);
INSERT INTO Course VALUES("SWS 312", "Web Application and Services", "Mrs. Ng", "Designing Advanced websites using Database and MVC controllers"
"Fall", "B314", "4:30 PM - 6:30 PM", "Monday", "SWS 210", 30);
INSERT INTO Course VALUES("BUS 110", "Business 101", " Mr.Jack", "An introductory course to Business Fundamentals"
"Fall", "C112", "8:30 AM - 10:30 PM", "Thursday", "None", 30);
INSERT INTO Course VALUES("BUS 220", "Marketing", " Ms. Shawna", "Marketing Trends in the Modern World and How to Promote your business"
"Winter", "D221", "2:30 PM - 4:30 PM", "Tuesday", "BUS 110", 30);
