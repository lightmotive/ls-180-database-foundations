-- In `encyclopedia` DB:
ALTER TABLE famous_people
RENAME TO celebrities;

ALTER TABLE celebrities
RENAME COLUMN name TO first_name;

ALTER TABLE celebrities
ALTER COLUMN first_name TYPE varchar(80);

ALTER TABLE celebrities
ADD COLUMN last_name varchar(100) NOT NULL;

ALTER TABLE celebrities
ALTER COLUMN date_of_birth TYPE date USING date_of_birth::date,
ALTER COLUMN date_of_birth SET NOT NULL;

ALTER TABLE animals
ALTER COLUMN max_weight_kg TYPE decimal(10, 4);

ALTER TABLE animals
ADD CONSTRAINT animals_binomial_name_unique UNIQUE (binomial_name);

-- In `ls_burger` DB:
ALTER TABLE orders
ADD COLUMN customer_email varchar(50),
ADD COLUMN customer_loyalty_points int DEFAULT 0;

ALTER TABLE orders
ADD COLUMN burger_cost decimal(4, 2) DEFAULT 0,
ADD COLUMN side_cost decimal(4, 2) DEFAULT 0,
ADD COLUMN drink_cost decimal(4, 2) DEFAULT 0;

ALTER TABLE orders
DROP COLUMN order_total;
