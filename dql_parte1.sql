-- pedro assis de castro
-- questao 1 = 906
SELECT * 
FROM fato_vendas
WHERE id_cliente IS NULL;	--WHERE filtra linhas
-- questao 2 = 746
SELECT COUNT(DISTINCT id_cliente)
FROM fato_vendas
-- 3. = 769785.29
SELECT SUM(valor_total)
FROM fato_vendas
-- 4.
SELECT DISTINCT marca
FROM dim_produto
WHERE categoria='Higiene'
ORDER BY marca ASC  -- ASC crescente, DESC decrescente
-- 5. = 52.2665833630846126
SELECT AVG(valor_total)
FROM fato_vendas
WHERE canal='Aplicativo'
-- 6. = 20
SELECT *
FROM dim_produto
WHERE categoria='Bebidas'
AND preco_tabela >=10
-- 7.
SELECT nome_produto,marca,preco_tabela
FROM dim_produto
ORDER BY nome_produto ASC
LIMIT 1
-- 8.
SELECT categoria 
FROM dim_produto
GROUP BY categoria
ORDER BY COUNT(*), categoria
-- 9.
SELECT categoria 
FROM dim_produto	-- Ordem das cláusulas: SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
GROUP BY categoria	-- lembra de botar o group by
ORDER BY AVG(preco_tabela) DESC  
-- 10.
SELECT COUNT(*) cidade
FROM dim_cliente
GROUP BY cidade 
HAVING COUNT(*) >=60 -- n usa WHERE, Ordem das cláusulas!
ORDER BY COUNT(*) DESC
-- 11.
SELECT *
FROM dim_cliente
WHERE email IS NULL
-- 12.
SELECT *
FROM dim_cliente
WHERE sexo='F'
AND data_nascimento>='01-01-1990'	-- n deu certo: AND data_nascimento>='01-01-1990',data_nascimento<='31-12-1999'
AND data_nascimento<='31-12-1999'	-- lembrar de por ''
-- 13.
SELECT FROM dim_cliente
WHERE nome='Ana'
-- 14. Quantas lojas existem em cada UF? Mostre apenas as UFs com mais de 3 lojas, da maior quantidade para a menor.
SELECT uf, COUNT(*) nome_loja -- ,
FROM dim_loja
GROUP BY uf
HAVING COUNT(*)>3
ORDER BY COUNT(*) DESC
-- 15. 
SELECT *
FROM dim_loja
WHERE data_inauguracao<='2007-01-01' 
ORDER BY data_inauguracao ASC 
-- 16. pula                     		!!!!!!!!!!!!!!!!! REFAZER A PARTIR DA 16 !!!!!!!!!!!!!!!!!
SELECT 
FROM
WHERE
-- 17.
SELECT forma_pagamento
FROM fato_vendas
WHERE canal='Loja física'
-- 18.	DANDO ERRO	
--SELECT id_produto 
--FROM fato_vendas		-- Ordem das cláusulas: SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT. !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
--GROUP BY id_produto 
--ORDER BY quantidade DESC
--LIMIT 10
--19.
SELECT id_loja
FROM fato_vendas
WHERE data_venda<'2025-01-01'
AND data_venda>='2024-01-01'
LIMIT 5
-- 20.  Quantas linhas de venda cada loja (id_loja) tem? 
SELECT id_loja, 
FROM fato_vendas
-- HAVING >=300
-- 21. 		EX DA 14: SELECT uf, COUNT(*) nome_loja -- , FROM dim_loja, GROUP BY uf, HAVING COUNT(*)>3, ORDER BY COUNT(*) DESC
SELECT id_cliente, COUNT(*) AS venda		-- ,  e AS venda(???)			!!!!
FROM fato_vendas
WHERE id_clientes IS NOT NULL					-- IS NOT NULL, usar isso
GROUP BY id_cliente		-- Ordem das cláusulas!!!
HAVING COUNT(*)>=70
ORDER BY COUNT(*) DESC, id_cliente ASC;
-- 22.
SELECT COUNT(*) AS		-- AS vendas tbm?
FROM fato_vendas		-- mds !! REFAZER
WHERE desconto >=
-- 23.			COUNT, SUM, AVG, MIN, MAX resumem colunas;
SELECT MAX(valor_total) AS maior,MIN(valor_total) AS menor
FROM valor_vendas
WHERE data_venda>='2025-12-01'
AND data_venda<='2026-01-01'
-- 24. ex da 21
SELECT COUNT(*) AS venda,SUM(valor_total) AS faturamento_dia
FROM fato_vendas
WHERE data_venda='2025-12-24' -- FOI DESGRACA
-- 25. vendas do site    			MDS		SELECT → FROM → WHERE → GROUP BY → HAVING → ORDER BY → LIMIT
SELECT 					
FROM fato_vendas
WHERE canal='Site'
AND desconto>0
AND data_venda<'2026-01-01'
AND data_venda>='2025-01-01'
ORDER BY DESC
LIMIT 10 

