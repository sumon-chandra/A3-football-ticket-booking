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