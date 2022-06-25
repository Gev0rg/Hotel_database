--Рассчет общей стоимости услуг гостиницы
SELECT c.client_id, pd.name, pd.surname, (SUM(f.price) + SUM(r.price) + SUM(s.price)) AS "OVER PRICE" 
FROM reservation res, rooms r, food_orders fo, food f, service_orders so, services s, clients c, personal_data pd
WHERE res.room_id = r.room_id AND fo.reservation_id = res.reservation_id AND fo.food_id = f.food_id AND so.reservation_id = res.reservation_id AND so.service_id = s.service_id AND 
      res.client_id = c.client_id AND c.personal_data_id = pd.personal_data_id
GROUP BY c.client_id, pd.name, pd.surname
ORDER BY c.client_id;