# Parking-Space-Detection-System

This Parking Space Detection System helps in allotting a parking area for the driver along with an option for an online payment for the parking ticket. The system allows user to identify the available parking spaces and book it. On booking, the parking space is blocked for that user and is available only after the driver exits the parking lot. This system efficiently helps in tracking the parking spaces by users as well as an admin of the system who has an additional authority.

Tables used:

CREATE TABLE user_admin(
Name varchar(100) NOT NULL,
Uname varchar(50) NOT NULL,
Password varchar(50) NOT NULL,
Email varchar(100) NOT NULL);


CREATE TABLE garage (
Name varchar(100) NOT NULL,
Uname varchar(50) NOT NULL,
Password varchar(50) NOT NULL,
Email varchar(100) NOT NULL,
License varchar(8) NOT NULL,
primary key(License));


CREATE TABLE T_issue(
License varchar(50) NOT NULL,
Ticket_Issued INT NOT NULL,
primary key(License)
);


CREATE TABLE ticket(
Name varchar(100) NOT NULL,
License varchar(50) NOT NULL,
Slot varchar(8) NOT NULL,
EntryTime DATETIME NOT NULL,
ExitTime DATETIME,
TotalTime INT,
Amount INT,
Payment varchar(20));


CREATE TABLE payment(
Name varchar(100) NOT NULL,
License varchar(50) NOT NULL,
Holder varchar(100) NOT NULL,
CardNo varchar(20) NOT NULL,
CVV INT NOT NULL
);


CREATE TABLE parking_slots(
Slot varchar(5) NOT NULL, 
Status varchar(50) NOT NULL);

