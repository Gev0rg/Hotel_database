--Топ классов комнат посезонно
SELECT SEASON, CLASS, COUNT(ROOM_ID) AS CNT
FROM
(
    select 
        ROOMS.room_id, ROOMS.CLASS,
        MOD(TRUNC(EXTRACT(month FROM ARRIVAL_date) / 3), 4) AS SEASON
    from reservation LEFT JOIN ROOMS
    ON reservation.room_id = ROOMS.ROOM_ID
) 
GROUP BY SEASON, CLASS
ORDER BY SEASON, CNT DESC;