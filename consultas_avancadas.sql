-- SCRIPT SQL: CRIAÇÃO E CONSULTAS AVANÇADAS PARA ANÁLISE DE DADOS

-- 1. CRIAÇÃO DE TABELA (DDL - Data Definition Language)
-- Cria a estrutura para a tabela Pedidos, incluindo a chave estrangeira (FK)
CREATE TABLE Pedidos (
    id_pedido INT PRIMARY KEY,
    id_cliente INT,
    data_pedido DATE NOT NULL,
    status VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente)
);

-- 2. CONSULTA DE ANÁLISE AVANÇADA (JOIN + GROUP BY + HAVING)
-- Objetivo: Encontrar o total de pedidos por cliente que gastou mais de um certo valor.
SELECT 
    c.nome, 
    COUNT(p.id_pedido) AS total_pedidos,
    SUM(p.valor_total) AS total_gasto
FROM 
    Clientes c
JOIN 
    Pedidos p ON c.id_cliente = p.id_cliente
GROUP BY 
    c.nome
HAVING 
    SUM(p.valor_total) > 500
ORDER BY 
    total_gasto DESC;
    
-- 3. CONSULTA COM SUBCONSULTA (Subquery para Análise de Estoque)
-- Objetivo: Listar produtos que estão com estoque abaixo da média geral de estoque, indicando itens críticos.
SELECT 
    nome_produto, 
    estoque
FROM 
    Produtos
WHERE 
    estoque < (SELECT AVG(estoque) FROM Produtos);