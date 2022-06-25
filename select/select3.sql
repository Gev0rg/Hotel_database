--Топ турфирм, через которые регестрируются больше всего клиентов за год
SELECT ta.title, COUNT(res.reservation_id) AS cnt
FROM reservation res, travel_agencies ta
WHERE res.travel_agency_id = ta.travel_agency_id AND res.arrival_date > TO_DATE ('November 13, 2015', 'MONTH DD, YYYY') AND res.arrival_date < TO_DATE ('November 13, 2016', 'MONTH DD, YYYY')
GROUP BY ta.title
ORDER BY cnt DESC;