#insert data in warehouse_counterparties

use warehouse_counterparties;


ALTER TABLE warehouses MODIFY COLUMN warehouse_contact VARCHAR(15);

#  заполняем таблицу склады
INSERT INTO warehouses (warehouse_name, warehouse_address, warehouse_contact)
VALUES ('Москва', 'г. Москва', '9876532209865'),
       ('Бишкек', 'г. Бишкек', '9876532209875'),
       ('Ош', 'г. Ош', '987653220986'),
       ('Ташкент', 'г. Ташкент', '98765220987'),
       ('Тбилиси', 'г. Тбилиси', '987653209876'),
       ('Санкт-Петербург', 'г. Санкт-Петербург', '987652209876');


# заполняем таблицу категории
insert into category (category_id,  category_name)
values (1, 'HDD'),
       (2, 'SSD'),
       (3, 'Monitors'),
       (4, 'Motherboards'),
       (5, 'DDR'),
       (6, 'Video cards');

# заполняем таблицу бренды
insert into brand (brand_id,  brand_name, category_id)
values (1, 'Asus', 1),
       (2, 'Dell', 1),
       (3, 'Lenovo', 1),
       (4, 'HP', 1),
       (5, 'Acer', 1),
       (6, 'no name', 2);

# заполняем таблицу продукты
insert into product (product_id,  product_name, category_id, brand_id)
values (1, 'Laptop', 1, 5),
       (2, 'PC', 1, 6),
       (3, 'Laptop', 1, 3),
       (4, 'PC', 1, 4),
       (5, '"S1 HDD 1T',2,2),
       (6, '"S1 SSD 1T',2,5),
       (7, '"S4 HDD 1T',2,6),
       (8, 'Monitor B19',3,4),
       (9, 'Monitor B22',3,3),
       (10, 'Monitor B23',3,1),
       (11, 'HDD',1,2),
       (12, 'SSD',1,5),
       (13, 'MB-2',4,5);

# заполняем таблицу контрагентов
insert into counterparties (counterparties_id,  counterparties_name,
                            counterparties_supplier, counterparties_purchase)
values (1, '<Максим>', 1, 3),
       (2, '<Тимур>', 2, 4),
       (3, '<Алена>', 6, 4),
       (4, '<Владимир>', 5, 1),
       (5, '<Максат>', 1, 4),
       (6, '<Азиз>', 2, 1),
       (7, '<Самира>', 3, 1),
       (8, '<Александр>', 2, 3),
       (9, '<Александра>', 3, 5),
       (10, '<Алина>', 2, 4);

ALTER TABLE price
MODIFY COLUMN price INT;

insert into price (product_id, counterparties_id, price)
values 
    (1, 1, 200),
    (12, 5, 10),
    (8, 3, 200),
    (9, 4, 180),
    (10, 5, 190),
    (4, 6, 100),
    (5, 7, 100),
    (6, 8, 100),
    (6, 9, 100),
    (15, 10, 100),
    (2, 9, 100),
    (3, 2, 100),
    (11, 3, 100);
    ('Supplier 1', true, false),
    ('Supplier 2', true, false),
    ('Supplier 3', true, false),
    ('Supplier 4', true, false),
    ('Supplier 5', true, false),
    ('Supplier 6', true, false),
    ('Supplier 7', true, false),
    ('Supplier 8', true, false),
    ('Supplier 9', true, false),
    ('Supplier 10', true, false),
    ('Customer 1', false, true),
    ('Customer 2', false, true),
    ('Customer 3', false, true),
    ('Customer 4', false, true),
    ('Customer 5', false, true),
    ('Customer 6', false, true),
    ('Customer 7', false, true),
    ('Customer 8', false, true),
    ('Customer 9', false, true),
    ('Customer 10', false, true),
    ('Supplier 11', true, false),
    ('Supplier 12', true, false),
    ('Supplier 13', true, false),
    ('Supplier 14', true, false),

# созданем передвижения

-- Alter the movementStock table
ALTER TABLE movementStock
MODIFY COLUMN date DATETIME,
ADD CONSTRAINT FK_movementStock_toTheWarehouse FOREIGN KEY (toTheWarehouse) REFERENCES warehouses(warehouse_id),
ADD CONSTRAINT FK_movementStock_fromWarehouse FOREIGN KEY (fromWarehouse) REFERENCES warehouses(warehouse_id),
ADD CONSTRAINT FK_movementStock_counterparties FOREIGN KEY (counterparties_id) REFERENCES counterparties(counterparties_id);

insert into movementStock (product_id, toTheWarehouse, fromWarehouse, quantity, date, counterparties_id)
values (1, 1, 1, 10, '2019-10-27', 1),
       (2, 1, 1, 10, '2017-11-20', 2),
       (3, 1, 1, 10, '2019-01-02', 3),
       (4, 1, 1, 10, '2018-02-25', 4),
       (5, 1, 1, 10, '2013-10-07', 5),
       (6, 1, 1, 10, '2014-05-22', 6),
       (7, 1, 1, 10, '2020-12-29', 7),
       (8, 1, 1, 10, '2020-01-01', 8),
       (9, 1, 1, 10, '2022-05-26', 9),
       (10, 1, 1, 10, '2016-05-12', 10);
