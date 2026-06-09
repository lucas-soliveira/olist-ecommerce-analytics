CREATE VIEW `olist_data_analysis.view_vendas_limpas` AS
SELECT 
    id_pedido,
    status_pedido,
    SAFE_CAST(data_compra AS DATETIME) AS data_compra,
    SAFE_CAST(data_aprovacao AS DATETIME) AS data_aprovacao,
    SAFE_CAST(data_entrega_real AS DATETIME) AS data_entrega_real,
    ROUND(preco, 2) AS preco,
    ROUND(valor_frete, 2) AS valor_frete,
    ROUND(valor_total_pago, 2) AS valor_total_pago,
    UPPER(cidade_cliente) AS cidade_cliente,
    estado_cliente,
    DATE_DIFF(SAFE_CAST(data_entrega_real AS DATE), SAFE_CAST(data_compra AS DATE), DAY) AS dias_para_entrega
FROM 
    `olist_data_analysis..view_vendas_consolidadas`
WHERE 
    status_pedido = 'delivered'
    AND data_aprovacao IS NOT NULL;