# создать базу warehouse_counterparties
CREATE DATABASE IF NOT EXISTS warehouse_counterparties;

# использовать базу warehouse_counterparties
use warehouse_counterparties;

# таблица склады
CREATE TABLE warehouses (
  warehouse_id INT(50) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  warehouse_name VARCHAR(255) NOT NULL,
  warehouse_address VARCHAR(255) NOT NULL,
  warehouse_contact INT(15) NOT NULL
);

ALTER TABLE warehouses ADD INDEX (warehouse_id); -- Add an index to the referenced column

ALTER TABLE warehouses ADD FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id);


#  категории
create table category (category_id int(50) primary key not null auto_increment,
                       category_name varchar(255) not null);

# бренды
create table brand (brand_id int(50) primary key  not null auto_increment,
                    brand_name varchar(255) not null,
                    category_id int(50) not null);

# продукты
CREATE TABLE product (
  product_id INT(50) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(255) NOT NULL,
  category_id INT(50) NOT NULL,
  brand_id INT(50) NOT NULL,
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES category(category_id)
);


# контрагенты
create table counterparties(counterparties_id int(50) primary key not null auto_increment,
                         counterparties_name varchar(255) not null,
                         counterparties_supplier boolean,
                         counterparties_purchase boolean);

# цены
create table price ( price_id int(50) primary key  not null auto_increment,
                         product_id int(50) not null,
                         counterparties_id int(50) not null,
                         price decimal(10,10) not null);


# передвижение товара
CREATE TABLE movementStock (
  movementStock_id INT(50) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  product_id INT(50) NOT NULL,
  toTheWarehouse INT(50) NOT NULL,
  fromWarehouse INT(50) NOT NULL,
  quantity INT(50) NOT NULL,
  date DATETIME NOT NULL,
  counterparties_id INT(50) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (toTheWarehouse) REFERENCES warehouses(warehouse_id),
  FOREIGN KEY (fromWarehouse) REFERENCES warehouses(warehouse_id),
  FOREIGN KEY (counterparties_id) REFERENCES counterparties(counterparties_id)
);


