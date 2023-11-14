# Quais os 5 (cinco) ingredientes mais utilizados em pizzas

SELECT descricao_ingrediente, COUNT(ingrediente_id) AS total_utilizado
FROM tb_sabores_ingredientes
JOIN cad_ingredientes ON ingrediente_id = id_ingrediente
GROUP BY ingrediente_id
ORDER BY total_utilizado desc limit 5;