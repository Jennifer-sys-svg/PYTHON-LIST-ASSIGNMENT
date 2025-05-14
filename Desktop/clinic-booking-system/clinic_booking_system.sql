-- ====================================================
-- Clinic Booking System SQL Schema
-- Author: Jennifer
-- Description: This SQL script creates a complete relational
-- database structure for a Clinic Booking System.
-- ====================================================

-- =======================
-- Table: patients
-- =======================
-- Stores patient information including contact details.
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(15) UNIQUE,
    email VARCHAR(100) UNIQUE
);

-- =======================
-- Table: doctors
-- =======================
-- Stores doctor information including specialty.
CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE
);

-- =======================
-- Table: services
-- =======================
-- Lists medical services offered by the clinic.
CREATE TABLE services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL UNIQUE,
    price DECIMAL(10, 2) NOT NULL
);

-- =======================
-- Table: appointments
-- =======================
-- Stores appointment details and links patients, doctors, and services.
CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    service_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Scheduled',
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id),
    FOREIGN KEY (service_id) REFERENCES services(service_id)
);
