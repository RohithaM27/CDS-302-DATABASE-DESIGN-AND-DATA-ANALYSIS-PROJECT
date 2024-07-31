#query 1 - What factors influence the price per day for accommodations?
SELECT
    a.room_type,
    l.city,
    l.neighborhood,
    o.max_guest,
    ROUND(AVG(a.price_per_day), 2) AS avg_price_per_day
FROM
    Accommodation a
    JOIN located_at la ON a.room_id = la.room_id
    JOIN Location l ON la.location_id = l.location_id
    JOIN offers o ON a.room_id = o.room_id
GROUP BY
    a.room_type,
    l.city,
    l.neighborhood,
    o.max_guest
ORDER BY
    avg_price_per_day DESC;
    
#query 2 - What are the top 10 most expensive Airbnb listings in Brooklyn?
SELECT
    a.room_id,
    a.room_type,
    a.price_per_day,
    lo.neighborhood,
    lo.city
FROM
    Accommodation a
    JOIN located_at l ON a.room_id = l.room_id
    JOIN Location lo ON l.location_id = lo.location_id
WHERE
    lo.city = 'Brooklyn'
ORDER BY
    a.price_per_day DESC
LIMIT 10;

#query 3 - What is the average price per day for each room type across all cities?
SELECT lo.city, l.room_type, AVG(l.price_per_day) AS avg_price_per_day
FROM Accommodation l
JOIN located_at la ON l.room_id = la.room_id
JOIN Location lo ON la.location_id = lo.location_id
GROUP BY lo.city, l.room_type;
    
#query 4 - Find listings with maximum guest capacity above a threshold of 5 guests.
SELECT o.listing_id, o.max_guest
FROM offers o
WHERE o.max_guest > 5;  

#query 5 - What are the most popular locations based on number of listings?
SELECT l.city, COUNT(lo.location_id) AS listing_count
FROM Location l
JOIN located_at lo ON l.location_id = lo.location_id
GROUP BY l.city
ORDER BY listing_count DESC;

#quesry 6 - What is the average price per day for rooms in Harlem?
SELECT l.neighborhood, AVG(a.price_per_day) AS average_price
FROM Accommodation a
JOIN located_at la ON a.room_id = la.room_id
JOIN Location l ON la.location_id = l.location_id
WHERE l.neighborhood = 'Harlem'
GROUP BY l.neighborhood;

#query 7 - What are the host names with more than one listing?
SELECT hi.host_name, COUNT(h.listing_id) AS number_of_listings
FROM Host_info hi
JOIN hosts h ON hi.host_id = h.host_id
GROUP BY hi.host_name
HAVING COUNT(h.listing_id) > 1
ORDER BY number_of_listings DESC;

#query 8 - List the number of rooms available for each room type.
SELECT a.room_type, COUNT(a.room_id) AS room_count
FROM Accommodation a
GROUP BY a.room_type;

#query 9. - What are the names of listings that offer Entire home/apt?
SELECT DISTINCT li.name
FROM Listings_info li
JOIN offers o ON li.listing_id = o.listing_id
JOIN Accommodation a ON o.room_id = a.room_id
WHERE a.room_type = 'Entire home/apt';

#quesr10 - What are all room types and their average price per day?
SELECT a.room_type, AVG(a.price_per_day) AS average_price
FROM Accommodation a
GROUP BY a.room_type;




