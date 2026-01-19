CREATE TABLE inventory (
inventory_id int primary key, 
product_id int, 
warehouse_id int, 
quantity int, 
reorder_level int, 
last_restock_date date, 
next_restock_date date, 
location_code varchar(20) NOT NULL UNIQUE, 
batch_number VARCHAR(20), 
expiry_date date
)

INSERT INTO inventory (inventory_id, product_id, warehouse_id, quantity, reorder_level, last_restock_date, next_restock_date, location_code, batch_number, expiry_date)
VALUES
(1, 1, 101, 50, 10, '2024-01-10', '2024-02-10', 'WH-A1-S1', 'BATCH001', '2025-01-10'),
(2, 2, 102, 100, 20, '2024-01-12', '2024-02-12', 'WH-A1-S2', 'BATCH002', '2025-03-15'),
(3, 3, 103, 30, 5, '2024-01-15', '2024-02-15', 'WH-A1-S3', 'BATCH003', '2025-05-20'),
(4, 4, 104, 200, 30, '2024-01-08', '2024-02-08', 'WH-A2-S1', 'BATCH004', '2025-02-28'),
(5, 5, 105, 80, 15, '2024-01-20', '2024-02-20', 'WH-A2-S2', 'BATCH005', '2025-04-10'),
(6, 6, 106, 40, 8, '2024-01-18', '2024-02-18', 'WH-A2-S3', 'BATCH006', '2025-06-15'),
(7, 7, 107, 60, 12, '2024-01-14', '2024-02-14', 'WH-B1-S1', 'BATCH007', '2025-03-30'),
(8, 8, 108, 150, 25, '2024-01-16', '2024-02-16', 'WH-B1-S2', 'BATCH008', '2025-07-20'),
(9, 9, 109, 180, 35, '2024-01-22', '2024-02-22', 'WH-B1-S3', 'BATCH009', '2025-05-05'),
(10, 10, 110, 90, 18, '2024-01-11', '2024-02-11', 'WH-B2-S1', 'BATCH010', '2025-08-12'),
(11, 11, 111, 70, 14, '2024-01-19', '2024-02-19', 'WH-B2-S2', 'BATCH011', '2025-04-25'),
(12, 12, 112, 120, 22, '2024-01-13', '2024-02-13', 'WH-B2-S3', 'BATCH012', '2025-06-30'),
(13, 13, 113, 50, 10, '2024-01-17', '2024-02-17', 'WH-C1-S1', 'BATCH013', '2025-03-15'),
(14, 14, 114, 200, 40, '2024-01-21', '2024-02-21', 'WH-C1-S2', 'BATCH014', '2025-09-10'),
(15, 15, 115, 85, 16, '2024-01-09', '2024-02-09', 'WH-C1-S3', 'BATCH015', '2025-05-20'),
(16, 16, 116, 45, 9, '2024-01-23', '2024-02-23', 'WH-C2-S1', 'BATCH016', '2025-07-05'),
(17, 17, 117, 110, 20, '2024-01-07', '2024-02-07', 'WH-C2-S2', 'BATCH017', '2025-04-15'),
(18, 18, 118, 300, 50, '2024-01-24', '2024-02-24', 'WH-C2-S3', 'BATCH018', '2025-08-30'),
(19, 19, 119, 65, 13, '2024-01-26', '2024-02-26', 'WH-D1-S1', 'BATCH019', '2025-06-10'),
(20, 20, 120, 35, 7, '2024-01-28', '2024-02-28', 'WH-D1-S2', 'BATCH020', '2025-05-25');

exec sp_rename  'inventory', 'products_inventory';

exec sp_rename 'inventory.reorder_level', 'reorder', 'column'

alter table inventory
Add number int 

alter table inventory
drop column number

ALTER TABLE inventory
ADD CONSTRAINT uq_con UNIQUE (batch_number);

alter table inventory
drop constraint uq_con ;

alter table inventory
alter column reorder float;


SELECT * FROM inventory;