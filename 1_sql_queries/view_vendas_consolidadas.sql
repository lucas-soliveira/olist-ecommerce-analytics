CREATE VIEW `olist_data_analysis.view_vendas_consolidadas` AS
SELECT 
    o.order_id AS id_pedido,
    o.customer_id AS id_cliente,
    o.order_status AS status_pedido,
    o.order_purchase_timestamp AS data_compra,
    o.order_approved_at AS data_aprovacao,
    o.order_delivered_customer_date AS data_entrega_real,
    o.order_estimated_delivery_date AS data_entrega_prevista,
    oi.product_id AS id_produto,
    oi.price AS preco,
    oi.freight_value AS valor_frete,
    p.payment_type AS tipo_pagamento,
    p.payment_installments AS parcelas,
    p.payment_value AS valor_total_pago,
    c.customer_city AS cidade_cliente,
    c.customer_state AS estado_cliente
FROM 
    `projeto.olist_raw.orders` o
JOIN 
    `projeto.olist_raw.order_items` oi ON o.order_id = oi.order_id
JOIN 
    `projeto.olist_raw.order_payments` p ON o.order_id = p.order_id
JOIN 
    `projeto.olist_raw.customers` c ON o.customer_id = c.customer_id;