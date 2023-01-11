-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)
INSERT INTO clientes(nome, lealdade)
VALUES ('Georgia', 0);


-- 2)
INSERT INTO pedidos (status, cliente_id)
VALUES
	(
		'Recebido',
        ( 
		    SELECT clientes.id
		    FROM clientes 
		    WHERE clientes.nome = 'Georgia'
        )
	)
;


-- 3)
INSERT INTO produtos_pedidos (pedido_id, produto_id)
VALUES 
	(
		(
			SELECT pedidos.id
            FROM pedidos
            WHERE pedidos.id = 
			    (
                    SELECT clientes.id
			        FROM clientes 
			        WHERE clientes.nome = 'Georgia'
                ) 
		),
		(
			SELECT produtos.id
            FROM produtos
            WHERE produtos.nome = 'Big Serial'
		)
	),
	(
		(
			SELECT pedidos.id
            FROM pedidos
            WHERE pedidos.id = 
			    (
                    SELECT clientes.id
                    FROM clientes 
                    WHERE clientes.nome = 'Georgia'
                ) 
		),
		(
			SELECT produtos.id
            FROM produtos
            WHERE produtos.nome = 'Varchapa'
		)
	),
	(
		(
			SELECT pedidos.id
            FROM pedidos
            WHERE pedidos.id = 
			    (
                    SELECT clientes.id
                    FROM clientes
                    WHERE clientes.nome = 'Georgia'
                ) 
		),
		(
			SELECT produtos.id
            FROM produtos
            WHERE produtos.nome = 'Fritas'
		)
	),
	(
		(
			SELECT pedidos.id
            FROM pedidos
            WHERE pedidos.id = 
			    (
                    SELECT clientes.id
                    FROM clientes 
                    WHERE clientes.nome = 'Georgia'
                ) 
		),
		(
			SELECT produtos.id
            FROM produtos
            WHERE produtos.nome = 'Coca-Cola'
		)
	),
	(
		(
			SELECT pedidos.id
            FROM pedidos
            WHERE pedidos.id = 
			    (
                    SELECT clientes.id
                    FROM clientes 
                    WHERE clientes.nome = 'Georgia'
                ) 
		),
		(
			SELECT produtos.id
            FROM produtos
            WHERE produtos.nome = 'Coca-Cola'
		)
	)
;


-- Leitura

-- 1)
SELECT clientes.*,
pedidos.*,
produtos.*
FROM pedidos  
INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
INNER JOIN produtos ON produtos_pedidos.produto_id = produtos.id
INNER JOIN clientes ON pedidos.cliente_id = clientes.id
WHERE clientes.nome = 'Georgia';


-- Atualização

-- 1)
UPDATE clientes
SET
	lealdade = (
		SELECT SUM(produtos.pts_de_lealdade)
		FROM pedidos
		INNER JOIN produtos_pedidos ON pedidos.id = produtos_pedidos.pedido_id
		INNER JOIN produtos ON produtos_pedidos.produto_id = produtos.id
		INNER JOIN clientes ON pedidos.cliente_id = clientes.id 
		WHERE clientes.nome = 'Georgia'
		)
WHERE clientes.nome = 'Georgia'
RETURNING *;


-- Deleção

-- 1)
DELETE FROM clientes
WHERE clientes.nome = 'Marcelo'
RETURNING *;

