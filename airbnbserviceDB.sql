-- Create the database
CREATE SCHEMA airbnbserviceDB;
USE airbnbserviceDB;

-- Create the Listings_Info table
CREATE TABLE Listings_Info (
    listing_id INT PRIMARY KEY,
    name VARCHAR(1000)
);

-- Create the Host_Info table
CREATE TABLE Host_Info (
    host_id INT PRIMARY KEY,
    host_name VARCHAR(300)
);

-- Create the hosts table
CREATE TABLE hosts (
    listing_id INT,
    host_id INT,
    Number_of_host_listings INT,
    PRIMARY KEY (listing_id),
    FOREIGN KEY (listing_id) REFERENCES Listings_Info(listing_id),
    FOREIGN KEY (host_id) REFERENCES Host_Info(host_id)
);

-- Create the Location table
CREATE TABLE Location (
    location_id INT PRIMARY KEY,
    city VARCHAR(300),
    neighborhood VARCHAR(300)
);

-- Create the Accommodation table
CREATE TABLE Accommodation (
    room_id INT PRIMARY KEY,
    room_type VARCHAR(500),
    price_per_day INT
);

-- Create the offers table
CREATE TABLE offers (
    listing_id INT,
    room_id INT,
    max_guest INT,
    PRIMARY KEY (listing_id, room_id),
    FOREIGN KEY (listing_id) REFERENCES Listings_Info(listing_id),
    FOREIGN KEY (room_id) REFERENCES Accommodation(room_id)
);


-- Create the located_at table
CREATE TABLE located_at (
    location_id INT,
    room_id INT,
    PRIMARY KEY (location_id),
    FOREIGN KEY (location_id) REFERENCES Location(location_id),
    FOREIGN KEY (room_id) REFERENCES Accommodation(room_id)
);