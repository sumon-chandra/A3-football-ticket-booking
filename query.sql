-- Create tables
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    role VARCHAR(50) NOT NULL,
    phone_number VARCHAR(20)
);

CREATE TABLE matches (
    match_id INT PRIMARY KEY,
    fixture VARCHAR(255) NOT NULL,
    tournament_category VARCHAR(100) NOT NULL,
    base_ticket_price NUMERIC(10,2) NOT NULL,
    match_status VARCHAR(50) NOT NULL
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    match_id INT NOT NULL,
    seat_number VARCHAR(20),
    payment_status VARCHAR(50),
    total_cost NUMERIC(10,2) NOT NULL,

    CONSTRAINT fk_booking_user
        FOREIGN KEY (user_id)
        REFERENCES users(user_id),

    CONSTRAINT fk_booking_match
        FOREIGN KEY (match_id)
        REFERENCES matches(match_id)
);

-- Insert dummy data
INSERT INTO users
(user_id, full_name, email, role, phone_number)
VALUES
(1,'Tanvir Rahman','tanvir@mail.com','Football Fan','+8801711111111'),
(2,'Asif Haque','asif@mail.com','Football Fan','+8801722222222'),
(3,'Sajjad Rahman','sajjad@mail.com','Ticket Manager','+8801733333333'),
(4,'Jannat Ara','jannat@mail.com','Football Fan',NULL);

INSERT INTO matches
(match_id, fixture, tournament_category, base_ticket_price, match_status)
VALUES
(101,'Real Madrid vs Barcelona','Champions League',150,'Available'),
(102,'Man City vs Liverpool','Premier League',120,'Selling Fast'),
(103,'Bayern Munich vs PSG','Champions League',130,'Available'),
(104,'AC Milan vs Inter Milan','Serie A',90,'Sold Out'),
(105,'Juventus vs Roma','Serie A',80,'Available');

INSERT INTO bookings
(booking_id,user_id,match_id,seat_number,payment_status,total_cost)
VALUES
(501,1,101,'A-12','Confirmed',150),
(502,1,102,'B-04','Confirmed',120),
(503,2,101,'A-13','Confirmed',150),
(504,2,101,NULL,NULL,150),
(505,3,102,'C-20','Pending',120);

-- Query 1. Retrieve all Champions League matches that are Available.
SELECT
    match_id,
    fixture,
    base_ticket_price
FROM matches
WHERE tournament_category = 'Champions League'
AND match_status = 'Available';

-- Query 2. Search users whose name starts with Tanvir or contains Haque.
SELECT
    user_id,
    full_name,
    email
FROM users
WHERE full_name ILIKE 'Tanvir%'
   OR full_name ILIKE '%Haque%';