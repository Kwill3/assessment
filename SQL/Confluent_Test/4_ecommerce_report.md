# E-commerce Product Request Report

An e-commerce platform maintains a database to track its products and customer requests for these products. The task is to generate a report that lists each available product's name and the total number of requests received for it.  

The result should have the following columns: product_name | total_requests.
- product_name: the name of the available product.
- total_requests: the total number of requests received for the product.

The result should be sorted in descending order based on total_requests, and in case of a tie, by product_name in ascending order.  

Note:
- Only products that are currently available should be included in the report.
- The is_available field in the product table indicates whether a product is available (1 for available, 0 for not available).

## Schema
Table: products
```
_______________________________________________________________________________________
NAME          | TYPE         | CONSTRAINTS           | DESCRIPTION                     |
---------------------------------------------------------------------------------------|
id            | INTEGER      | NOT NULL PRIMARY KEY  | The identifier of the product   |
name          | VARCHAR(255) |                       | The name of the product         |
category      | VARCHAR(255) |                       | The category of the product     |
is_available  | SMALLINT     |                       | Product is available flag       |
---------------------------------------------------------------------------------------|
```

Table: requests
```
__________________________________________________________________________________
NAME          | TYPE         | CONSTRAINTS   | DESCRIPTION                        |
----------------------------------------------------------------------------------|
product_id    | INTEGER      | FK            | The reference to the product       |
client_email  | VARCHAR(255) |               | The email address of the client    |
----------------------------------------------------------------------------------|
requests.product_id REFERENCES products.id
```

## Sample Data


## Expected Output
```
AdWave 50
PromoPulse 49
BuzzBuilder 42
MarketMingle 40
AdVibe 34
BrandBlast 30
BrandBoost 24
AdVantage 23
PromoPro 20
MarketMagnet 19
BrandBlitz 13
```