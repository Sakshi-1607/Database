create database task;
use task;
create table Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Age INT NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    Contact VARCHAR(20) NOT NULL
);
CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL
);
CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATETIME,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
SELECT Name, Contact FROM Patients;
SELECT Name, Specialization FROM Doctors;
SELECT PatientID, DoctorID FROM Appointments;
SELECT * FROM Patients WHERE Age > 50;
SELECT * FROM Doctors WHERE Specialization = 'Cardiology';
SELECT * FROM Appointments WHERE AppointmentDate > '2024-01-01';
SELECT P.Name AS PatientName, D.Name AS DoctorName, A.AppointmentDate
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID;
SELECT DISTINCT P.*
FROM Patients P
JOIN Appointments A ON P.PatientID = A.PatientID;
SELECT P.*
FROM Patients P
LEFT JOIN Appointments A ON P.PatientID = A.PatientID
WHERE A.AppointmentID IS NULL;
SELECT COUNT(*) AS TotalPatients FROM Patients;
SELECT DoctorID, COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY DoctorID;
SELECT MAX(Age) AS OldestPatientAge FROM Patients;
SELECT * FROM Appointments ORDER BY AppointmentDate DESC LIMIT 5;
SELECT * FROM Patients ORDER BY Age ASC LIMIT 3;
SELECT * FROM Patients WHERE Gender = 'Male' AND Age > 40;
SELECT * FROM Appointments 
WHERE MONTH(AppointmentDate) = MONTH(CURDATE()) 
AND YEAR(AppointmentDate) = YEAR(CURDATE());
SELECT * FROM Patients WHERE Name LIKE 'A%';
SELECT P.Name AS PatientName, D.Name AS DoctorName, D.Specialization, A.AppointmentDate
FROM Appointments A
JOIN Patients P ON A.PatientID = P.PatientID
JOIN Doctors D ON A.DoctorID = D.DoctorID;
SELECT D.DoctorID, D.Name, COUNT(A.PatientID) AS TotalPatients
FROM Appointments A
JOIN Doctors D ON A.DoctorID = D.DoctorID
GROUP BY D.DoctorID, D.Name
HAVING COUNT(A.PatientID) > 5;
SELECT P.Name AS PatientName, D.Name AS DoctorName
FROM Patients P
LEFT JOIN Appointments A ON P.PatientID = A.PatientID
LEFT JOIN Doctors D ON A.DoctorID = D.DoctorID;
SELECT Gender, COUNT(*) AS TotalCount
FROM Patients
GROUP BY Gender;
SELECT D.DoctorID, D.Name, COUNT(A.AppointmentID) AS TotalAppointments
FROM Appointments A
JOIN Doctors D ON A.DoctorID = D.DoctorID
GROUP BY D.DoctorID, D.Name
ORDER BY TotalAppointments DESC
LIMIT 1;
SELECT YEAR(AppointmentDate) AS Year, MONTH(AppointmentDate) AS Month, COUNT(*) AS TotalAppointments
FROM Appointments
GROUP BY YEAR(AppointmentDate), MONTH(AppointmentDate)
ORDER BY Year DESC, Month DESC;
SELECT P.*
FROM Patients P
JOIN Appointments A ON P.PatientID = A.PatientID
ORDER BY P.Age ASC
LIMIT 1;
SELECT D.DoctorID, D.Name, COUNT(A.AppointmentID) AS TotalAppointments
FROM Appointments A
JOIN Doctors D ON A.DoctorID = D.DoctorID
GROUP BY D.DoctorID, D.Name
HAVING COUNT(A.AppointmentID) > (SELECT AVG(AppointmentsCount) FROM 
    (SELECT COUNT(AppointmentID) AS AppointmentsCount FROM Appointments GROUP BY DoctorID) AS AvgAppointments);
