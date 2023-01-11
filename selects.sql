-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)
SELECT pedidos.*,
produtos.id,
produtos.nome,
produtos.tipo,
produtos.preco,
produtos.pts_de_lealdade AS pontos_de_lealdade_do_produto
FROM pedidos
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos_pedidos.produto_id = produtos.id;

-- 2)
SELECT pedidos.id
FROM pedidos
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos_pedidos.produto_id = produtos.id
WHERE produtos.nome = 'Fritas'; 

-- 3)
SELECT clientes.nome AS gostam_de_fritas 
FROM pedidos
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos_pedidos.produto_id = produtos.id
INNER JOIN clientes ON pedidos.cliente_id = clientes.id 
WHERE produtos.nome = 'Fritas';

-- 4)
SELECT SUM(produtos.preco)
FROM pedidos
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos_pedidos.produto_id = produtos.id
INNER JOIN clientes ON pedidos.cliente_id = clientes.id 
WHERE clientes.nome = 'Laura';

-- 5)
SELECT produtos.nome, COUNT(produtos.nome)
FROM pedidos
INNER JOIN produtos_pedidos on pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos on produtos_pedidos.produto_id = produtos.id
INNER JOIN clientes on pedidos.cliente_id = clientes.id
GROUP BY produtos.nome
ORDER BY produtos.nome;