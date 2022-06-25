--Топ типов питания в отеле за год
SELECT f.type AS TITLE, COUNT(fo.food_id) AS CNT
FROM reservation res, food_orders fo, food f
WHERE res.reservation_id = fo.reservation_id AND fo.food_id = f.food_id
GROUP BY f.type
ORDER BY CNT DESC;