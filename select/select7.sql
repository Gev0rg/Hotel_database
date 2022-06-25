--Минимальная, средняя и максимальная стоимости свободных номеров в отеле
SELECT MIN(price) AS min_price, ROUND(AVG(price)) AS average_price, 
       MAX(price) AS max_price
FROM (SELECT r.price 
      FROM rooms r, reservation res 
      WHERE r.room_id = res.reservation_id AND 
            (res.arrival_date < CURRENT_DATE OR res.departure_date > CURRENT_DATE));