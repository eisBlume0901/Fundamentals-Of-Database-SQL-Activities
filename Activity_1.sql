
-- create
CREATE TABLE EMPLOYEE (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  empId INTEGER NOT NULL,
  firstName VARCHAR(255) NOT NULL,
  lastName VARCHAR(255) NOT NULL,
  gender ENUM('MALE', 'FEMALE'),
  position VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  salary FLOAT NOT NULL,
  dept VARCHAR(255) NOT NULL,
  hiredDate DATE NOT NULL,
  address LONGTEXT NOT NULL
);

-- insert
INSERT INTO EMPLOYEE (empId, firstName, lastName, gender, position, email, salary, dept, hiredDate, address) VALUES 
  (125, 'John', 'Doe', 'MALE', 'IT Technician', 'johndoe@tech.com', 2500.54, 'Information Technology', '2020-12-20', '123 Main St'),
  (145, 'Jane', 'Smith', 'FEMALE', 'Software Developer', 'janesmith@tech.com', 3500.15, 'Software Development', '2022-04-10', '466 Oak St'),
  (331, 'Mike', 'Johnson', 'MALE', 'Business Analyst', 'mikejohnson@tech.com', 2750.41, 'Finance', '2022-07-03', '789 Pine St'),
  (225, 'Emily', 'Taylor', 'FEMALE', 'Marketing Specialist', 'emilytaylor@tech.com', 1450.60, 'Marketing', '2019-09-15', '101 Cedar St'),
  (155, 'Alex', 'Williams', 'MALE', 'System Administrator', 'alexwilliams@tech.com', 2300.22, 'Information Technology','2019-12-05', '202 Birch St'),
  (314, 'Sophie', 'Miller', 'FEMALE','Accountant','sophiemiller@tech.com', 1780.15, 'Finance','2019-10-20','303 Elm St'),
  (217, 'Daniel', 'Brown', 'MALE', 'Marketing Manager', 'danielbrown@tech.com', 1500.47, 'Marketing', '2018-06-12', '404 Maple St'),
  (111, 'William', 'Moore', 'MALE', 'Network Engineer', 'williammoore@tech.com', 3523.6, 'Information Management', '2018-11-02', '505 Oak St'),
  (405, 'Olivia', 'Davis', 'FEMALE', 'Human Resources Specialist', 'oliviadavis@tech.com', 1654.15, 'Human Resources Management', '2022-3-28', '606 Pine St'),
  (304, 'Eva','Anderson','FEMALE','Finance Planner','evaanderson@tech.com',1354.14,'Finance','2022-08-14','707 Cedar St');

-- fetch
SELECT * FROM EMPLOYEE;

-- update
-- UPDATE EMPLOYEE 
-- SET salary = 3500.42, position = 'IT Manager', lastName = 'Frankie'
-- WHERE empId = 125;

-- UPDATE
UPDATE EMPLOYEE
SET salary = 1500.00 WHERE dept LIKE 'Finance';

-- UPDATE EMPLOYEE SET salary = 3500.42 WHERE empId = 125 OR firstName LIKE 'John';
-- UPDATE EMPLOYEE SET address = '456 Berry St' WHERE firstName LIKE 'Olivia';
-- UPDATE EMPLOYEE SET salary = 4500 WHERE empID = 111 OR lastName LIKE 'Moore';
-- fetch
SELECT * FROM EMPLOYEE;

-- delete
DELETE FROM EMPLOYEE WHERE empID = 111 or lastName LIKE 'Moore';
-- fetch
SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE WHERE hiredDate BETWEEN '2022-01-31' AND '2022-04-30';
-- SELECT empId FROM EMPLOYEE WHERE dept IN('Human Resources Management', 'Marketing');

SELECT empId AS 'Employee ID',
	firstName AS 'First Name',
	lastName AS 'Last Name',
	gender AS 'Gender',
	position AS 'Job Position',
	email AS 'Email',
	salary AS 'Monthly Salary',
	dept AS 'Department',
	hiredDate AS 'Hired Date',
	address AS 'Address' 
FROM Employee;

INSERT INTO EMPLOYEE (empId, firstName, lastName, gender, position, email, salary, dept, hiredDate, address) VALUES 
  (194, 'Johanna', 'Grey', 'FEMALE', 'Software Architect', 'johannagrey@tech.com', 2600.54, 'Software Development', '2020-12-20', '124 Maple St'),
  (107, 'Jessica', 'Smith', 'FEMALE', 'Software Developer', 'jessicasmith@tech.com', 3540.15, 'Software Development', '2022-04-10', '467 Oak St'),
  (322, 'Mica', 'Robertson', 'FEMALE', 'Business Analyst', 'micarobertson@tech.com', 2754.41, 'Finance', '2022-07-03', '781 Pine St');
SELECT * FROM EMPLOYEE;

SELECT *
FROM EMPLOYEE
ORDER BY id DESC
LIMIT 3;

TRUNCATE TABLE EMPLOYEE;
SELECT * FROM EMPLOYEE;



