# Listagem dos 5 pedidos mais caros

SELECT nome_cliente, SUM(valor_sabor + valor_tamanho + valor_produto) AS valor_pedido_total
FROM pedido p
JOIN tb_clientes ON cliente_id = id_cliente
JOIN tb_funcionarios ON funcionario_id = id_funcionario
JOIN pizzas_pedido ON id_pedido = pedido_id
JOIN sabores_pizza sp ON pizza_sabor_id = id_sabor_pizza
JOIN tb_sabores ON sabor_id = id_sabor
JOIN tb_pizzas ON sp.pizza_id = id_pizza 
JOIN itens_pedido ip ON id_pedido = ip.pedido_id
JOIN cad_produtos ON produto_id = id_produto
GROUP BY id_pedido
ORDER BY valor_pedido_total desc limit 5;
