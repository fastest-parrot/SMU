INSERT INTO classroom (building, room_number, capacity) VALUES ('Packard', 101, 500);
INSERT INTO classroom (building, room_number, capacity) VALUES ('Painter', 514, 10);
INSERT INTO classroom (building, room_number, capacity) VALUES ('Taylor', 3128, 70);
INSERT INTO classroom (building, room_number, capacity) VALUES ('Watson', 100, 30);
INSERT INTO classroom (building, room_number, capacity) VALUES ('Watson', 120, 50);

INSERT INTO department (dept_name, building, budget) VALUES ('Biology', 'Watson', 90000);
INSERT INTO department (dept_name, building, budget) VALUES ('Comp. Sci.', 'Taylor', 100000);
INSERT INTO department (dept_name, building, budget) VALUES ('Elec. Eng.', 'Taylor', 85000);
INSERT INTO department (dept_name, building, budget) VALUES ('Finance', 'Painter', 120000);
INSERT INTO department (dept_name, building, budget) VALUES ('History', 'Painter', 50000);
INSERT INTO department (dept_name, building, budget) VALUES ('Music', 'Packard', 80000);
INSERT INTO department (dept_name, building, budget) VALUES ('Physics', 'Watson', 70000);

INSERT INTO course (course_id, title, dept_name, credits) VALUES ('BIO-101', 'Intro. To Biology', 'Biology', 4);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('BIO-301', 'Genetics', 'Biology', 4);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('BIO-399', 'Computational Biology', 'Biology', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('CS-190', 'Game Design', 'Comp. Sci.', 4);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('CS-315', 'Robotics', 'Comp. Sci.', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('CS-319', 'Image Processing', 'Comp. Sci.', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('CS-347', 'Database System Concepts', 'Comp. Sci.', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('FIN-201', 'Investment Banking', 'Finance', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('HIS-351', 'World History', 'History', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('MU-199', 'Music Video Production', 'Music', 3);
INSERT INTO course (course_id, title, dept_name, credits) VALUES ('PHY-101', 'Physical Principles', 'Physics', 4);


INSERT INTO instructor (ID,name, dept_name, salary) VALUES(10101,  'Srinivasan',  'Comp. Sci.',  65000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(12121,  'Wu', 'Finance', 90000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(15151, 'Mozart', 'Music', 40000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(22222, 'Einstein', 'Physics', 95000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(32343,  'El Said', 'History',  60000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(33456,  'Gold', 'Physics',  87000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(45565, 'Katz',  'Comp. Sci.', 75000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(58583, 'Califieri',  'History', 62000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(76543, 'Singh',  'Finance', 80000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(76766,  'Crick', 'Biology',  72000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(83821,  'Brandt',  'Comp. Sci.',  92000);
INSERT INTO instructor (ID,name, dept_name, salary) VALUES(98345, 'Kim',  'Elec. Eng.',  80000);

#time slot is either one word or two - make up your fucking mind
#also - why does this relation not exist between course and time slot?
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('A', 'M', '8:00', '8:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES('A', 'W', '8:00', '8:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('A', 'F', '8:00', '8:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('B', 'M', '9:00', '9:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('B', 'W', '9:00', '9:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('B', 'F', '9:00', '9:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('C', 'M', '11:00', '11:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('C', 'W', '11:00', '11:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('C', 'F', '11:00', '11:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('D', 'M', '13:00', '13:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('D', 'W', '13:00', '13:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('D', 'F', '13:00', '13:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('E', 'T', '10:30', '11:45');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('E', 'R', '10:30', '11:45');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('F', 'T', '14:30', '15:45');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('F', 'R', '14:30', '15:45');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('G', 'M', '16:00', '16:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('G', 'W', '16:00', '16:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('G', 'F', '16:00', '16:50');
INSERT INTO timeslot (time_slot_id, day, start_time, end_time) VALUES ('H', 'W', '10:00', '12:30');


INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('BIO-101', '1', 'Summer', 2009, 'Painter', 514, 'B');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('BIO-301', '1', 'Summer', 2010, 'Painter', 514, 'A');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('CS-101', '1', 'Fall', 2009, 'Packard', 101, 'H');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('CS-101', '1', 'Spring', 2010, 'Packard', 101, 'F'); 
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('CS-190', '1', 'Spring', 2009, 'Taylor', 3128, 'E');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('CS-190', '2', 'Spring', 2009, 'Taylor', 3128, 'A');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('CS-315', '1', 'Spring', 2010, 'Watson', 120, 'D');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('CS-319', '1', 'Spring', 2010, 'Watson', 100, 'B');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('CS-319', '2', 'Spring', 2010, 'Taylor', 3128, 'C');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('CS-347', '1', 'Fall', 2009, 'Taylor', 3128, 'A');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('EE-181', '1', 'Spring', 2009, 'Taylor', 3128, 'C');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('FIN-201', '1',  'Spring', 2010, 'Packard', 101, 'B');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('HIS-351', '1', 'Spring', 2010, 'Painter', 514, 'C');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('MU-199', '1', 'Spring', 2010, 'Packard', 101, 'D');
INSERT INTO section (course_id, sec_id, semester, year, building, room_number, time_slot_id) VALUES('PHY-101', '1', 'Fall', 2009, 'Watson', 100, 'A');


#terrible design, tot_cred should not be a stored field....
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('00128', 'Zhang', 'Comp. Sci.', 102);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('12345', 'Shankar', 'Comp. Sci.', 32);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('19991', 'Brandt', 'History', 80);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('23121', 'Chavez', 'Finance', 110);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('44553', 'Peltier', 'Physics' , 56);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('45678', 'Levy', 'Physics', 46);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('54321', 'Williams', 'Comp. Sci.', 54);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('55739', 'Sanchez',  'Music', 38);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('70557', 'Snow', 'Physics', 0);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('76543', 'Brown', 'Comp. Sci.', 58);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('76653', 'Aoi', 'Elec. Eng.', 60);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('98765', 'Bourikas', 'Elec. Eng.', 98);
INSERT INTO student (ID, name, dept_name, tot_cred) VALUES('98988', 'Tanaka', 'Biology', 120);

INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('10101',  'CS-101', '1', 'Fall', 2009);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('10101', 'CS-315', '1', 'Spring', 2010);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('10101', 'CS-347', '1', 'Fall', 2009);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('12121', 'FIN-201', '1', 'Spring', 2010);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('15151', 'MU-199', '1', 'Spring', 2010);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('22222', 'PHY-101', '1', 'Fall', 2009);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('32343', 'HIS-351', '1',  'Spring', 2010);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('45565', 'CS-101', '1', 'Spring', 2010);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('45565', 'CS-319', '1', 'Spring', 2010);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('76766', 'BIO-101', '1', 'Summer', 2009);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('76766', 'BIO-301', '1', 'Summer', 2010);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('83821', 'CS-190', '1', 'Spring', 2009);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('83821', 'CS-190', '2', 'Spring', 2009);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('83821', 'CS-319', '2', 'Spring', 2010);
INSERT INTO teaches(ID, course_id, sec_id, semester, year) VALUES('98345', 'EE-181', '1', 'Spring', 2009);


INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('00128', 'CS-101', '1', 'Fall', 2009, 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('00128',  'CS-347', '1', 'Fall', 2009, 'A-');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('12345', 'CS-101', '1', 'Fall', 2009, 'C');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('12345', 'CS-190', '2', 'Spring', 2009, 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('12345', 'CS-315', '1', 'Spring', 2010, 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('12345', 'CS-347', '1', 'Fall', 2009, 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('19991', 'HIS-351', '1', 'Spring', 2010, 'B');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('23121', 'FIN-201', '1', 'Spring', 2010, 'C+');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('44553', 'PHY-101', '1', 'Fall', 2009, 'B-');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('45678', 'CS-101', '1', 'Fall', 2009, 'F');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('45678', 'CS-101', '1', 'Spring', 2010, 'B+');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('45678', 'CS-319', '1', 'Spring', 2010, 'B');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('54321', 'CS-101', '1', 'Fall', 2009, 'A-');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('54321', 'CS-190', '2', 'Spring', 2009, 'B+');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('55739', 'MU-199', '1', 'Spring', 2010, 'A-');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('76543', 'CS-101', '1', 'Fall', 2009, 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('76543', 'CS-319', '2', 'Spring', 2010, 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('76653', 'EE-181', '1', 'Spring', 2009, 'C');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('98765', 'CS-101', '1', 'Fall', 2009, 'C-');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('98765', 'CS-315', '1', 'Spring', 2010, 'B');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES('98988', 'BIO-101', '1', 'Summer', 2009, 'A');
INSERT INTO takes (ID, course_id, sec_id, semester, year, grade) VALUES ('98988', 'BIO-301', '1', 'Summer', 2010, null);

#comically bad variable naming
INSERT INTO advisor(s_ID, i_ID) VALUES ('00128',  '45565');
INSERT INTO advisor(s_ID, i_ID) VALUES ('12345', '10101');
INSERT INTO advisor(s_ID, i_ID) VALUES ('23121',  '76543');
INSERT INTO advisor(s_ID, i_ID) VALUES ('44553', '22222');
INSERT INTO advisor(s_ID, i_ID) VALUES ('45678', '22222');
INSERT INTO advisor(s_ID, i_ID) VALUES ('76543', '45565');
INSERT INTO advisor(s_ID, i_ID) VALUES ('76653', '98345');
INSERT INTO advisor(s_ID, i_ID) VALUES ('98765', '98345');
INSERT INTO advisor(s_ID, i_ID) VALUES ('98988', '76766');

#better naming
INSERT INTO prereq (course_ID, prereq_ID) VALUES('BIO-301', 'BIO-101');
INSERT INTO prereq (course_ID, prereq_ID) VALUES('BIO-399', 'BIO-101');
INSERT INTO prereq (course_ID, prereq_ID) VALUES('CS-190', 'CS-101');
INSERT INTO prereq (course_ID, prereq_ID) VALUES('CS-315', 'CS-101');
INSERT INTO prereq (course_ID, prereq_ID) VALUES('CS-319', 'CS-101');
INSERT INTO prereq (course_ID, prereq_ID) VALUES('CS-347', 'CS-101');
INSERT INTO prereq (course_ID, prereq_ID) VALUES('EE-181', 'PHY-101');
