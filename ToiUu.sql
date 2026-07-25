-- 1. Tạo bảng Orders
CREATE TABLE Orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

INSERT INTO Orders (customer_id, order_date, total_amount)
SELECT 
    (random() * 10000 + 1)::INT,
    CURRENT_DATE - (random() * 365)::INT,
    (random() * 1000 + 10)::numeric(10,2)
FROM generate_series(1, 500000);

EXPLAIN ANALYZE 
SELECT * FROM Orders WHERE customer_id = 500;

CREATE INDEX idx_orders_customer_id ON Orders(customer_id);

EXPLAIN ANALYZE 
SELECT * FROM Orders WHERE customer_id = 500;