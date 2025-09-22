CREATE DATABASE hospital_management;
USE hospital_management;


CREATE TABLE Appointment (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    PatientId INT NOT NULL,
    DoctorId INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason VARCHAR(500),
    Status VARCHAR(50) NOT NULL DEFAULT 'Scheduled',
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientId) REFERENCES Patients(Id) ON DELETE RESTRICT,
    FOREIGN KEY (DoctorId) REFERENCES Doctors(Id) ON DELETE RESTRICT
);




CREATE TABLE Patients (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Gender VARCHAR(10) NOT NULL,
    DateOfBirth DATE NOT NULL,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(200),
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Doctors (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Specialization VARCHAR(100) NOT NULL,
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100) NOT NULL,
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE Appointments (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    PatientId INT NOT NULL,
    DoctorId INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason VARCHAR(500),
    Status VARCHAR(50) NOT NULL DEFAULT 'Scheduled',
    CreatedAt DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientId) REFERENCES Patients(Id) ON DELETE RESTRICT,
    FOREIGN KEY (DoctorId) REFERENCES Doctors(Id) ON DELETE RESTRICT
);


INSERT INTO Doctors (Name, Specialization, PhoneNumber, Email)
VALUES 
('Dr. Sarah Johnson', 'Cardiology', '555-0101', 's.johnson@hospital.com'),
('Dr. Michael Chen', 'Neurology', '555-0102', 'm.chen@hospital.com'),
('Dr. Emily Wilson', 'Pediatrics', '555-0103', 'e.wilson@hospital.com'),
('Dr. Robert Garcia', 'Orthopedics', '555-0104', 'r.garcia@hospital.com'),
('Dr. Lisa Patel', 'Dermatology', '555-0105', 'l.patel@hospital.com');

INSERT INTO Patients (Name, Gender, DateOfBirth, PhoneNumber, Address)
VALUES
('John Smith', 'Male', '1985-06-15', '555-0201', '123 Main St, Anytown'),
('Maria Garcia', 'Female', '1990-11-22', '555-0202', '456 Oak Ave, Somewhere'),
('David Kim', 'Male', '1978-03-08', '555-0203', '789 Pine Rd, Nowhere'),
('Sarah Williams', 'Female', '1995-09-14', '555-0204', '321 Elm St, Anywhere'),
('James Brown', 'Male', '1982-12-30', '555-0205', '654 Maple Dr, Everywhere');

INSERT INTO Appointments (PatientId, DoctorId, AppointmentDate, Reason, Status)
VALUES
(1, 1, '2023-12-15 09:00:00', 'Annual heart checkup', 'Scheduled'),
(2, 3, '2023-12-16 10:30:00', 'Child vaccination', 'Scheduled'),
(3, 2, '2023-12-17 14:00:00', 'Migraine consultation', 'Scheduled'),
(4, 5, '2023-12-18 11:15:00', 'Skin rash examination', 'Scheduled'),
(5, 4, '2023-12-19 13:45:00', 'Knee pain evaluation', 'Scheduled');

