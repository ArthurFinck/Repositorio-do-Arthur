# Quais os 5 (cinco) sabores de pizzas mais vendidos

SELECT descricao_sabor, COUNT(pizza_sabor_id) AS "Pizzas mais vendidas" 
FROM pizzas_pedido
JOIN sabores_pizza ON pizza_sabor_id = id_sabor_pizza
JOIN tb_sabores ON sabor_id = id_sabor
GROUP BY descricao_sabor # aqui em vez de agrupar por id do sabor sda pizza, agrupamos por descrição do sabor para nao ter duplicatas
ORDER BY COUNT(pizza_sabor_id) DESC LIMIT 5;
