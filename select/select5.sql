--Предлагаемые услуги в зависимости от цели приезда, для цели "Holidays with the family"
SELECT s.title, s.price
FROM goal_serv gs, goals g, services s
WHERE gs.goal_id = g.goal_id AND gs.service_id = s.service_id AND g.goal_id = 3;