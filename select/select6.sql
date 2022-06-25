--Администратор года
SELECT pd.name, pd.surname, e.position, COUNT(so.service_order_id) AS CNT
FROM reservation res, service_orders so, employees e, personal_data pd
WHERE res.employee_id = e.employee_id AND so.reservation_id = res.reservation_id AND e.personal_data_id = pd.personal_data_id AND
      res.arrival_date > TO_DATE ('November 13, 2015', 'MONTH DD, YYYY') AND res.arrival_date < TO_DATE ('November 13, 2016', 'MONTH DD, YYYY')
GROUP BY pd.name, pd.surname, e.position
ORDER BY CNT DESC;