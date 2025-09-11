# Contacted Customer Invoices

Write a query that will return a list of all customers and their invoices. Return only rows where invoices were created by a user who never contacted that particular customer.  

For each row, return the invoice number, customer name and the number of contacts that started prior to the time the invoice was created. Order the result by invoice number ascending.  

## Schema
Table: customer
```
_______________________________________________
NAME                | TYPE        | key/NULL  |
----------------------------------------------|
id                  | INTEGER     | PK        |
customer_name       | VARCHAR(255)|           |
city_id             | INTEGER     |           |
customer_address    | VARCHAR(255)|           |
contact_person      | VARCHAR(255)| N         |
email               | VARCHAR(128)|           |
phone               | VARCHAR(128)|           |
----------------------------------------------|
```

Table: invoice
```
_______________________________________________
NAME                | TYPE        | key/NULL  |
----------------------------------------------|
id                  | INTEGER     | PK        |
invoice_number      | VARCHAR(255)|           |
customer_id         | INTEGER     | FK        |
user_account_id     | INTEGER     |           |
total_price         | DECIMAL(8,2)| N         |
time_issued         | VARCHAR(255)| N         |
time_due            | VARCHAR(255)| N         |
time_paid           | VARCHAR(255)| N         |
time_cancelled      | VARCHAR(255)| N         |
time_refunded       | VARCHAR(255)| N         |
----------------------------------------------|
invoice.customer_id REFERENCES customer.id
```

Table: user_account
```
__________________________________________
NAME           | TYPE        | key/NULL  |
-----------------------------------------|
id             | INTEGER     | PK        |
first_name     | VARCHAR(64) |           |
last_name      | VARCHAR(64) |           |
user_name      | VARCHAR(128)|           |
password       | VARCHAR(255)|           |
email          | VARCHAR(128)|           |
phone          | VARCHAR(128)| N         |
-----------------------------------------|
```

Table: contact
```
_______________________________________________
NAME                | TYPE        | key/NULL  |
----------------------------------------------|
id                  | INTEGER     | PK        |
user_account_id     | INTEGER     | FK        |
customer_id         | INTEGER     | FK        |
contact_type_id     | INTEGER     |           |
contact_outcome_id  | INTEGER     | N         |
additional_comment  | VARCHAR(255)| N         |
contact_start_time  | VARCHAR(255)|           |
contact_end_time    | VARCHAR(255)| N         |
----------------------------------------------|
contact.user_account_id REFERENCES user_account.id
contact.customer_id REFERENCES customer.id
```

## Sample Data Tables

## Expected Output
```
2a24cc2ad4440d698878a0a1a71f70fa    K-Wien  1
3b6638118246b6bcfd3dfcd9be487599    Kosmetikstudio  1
cbd304872ca6257716bcab8fc43204d7    Neue Kosmetik   1
dfe7f0a01a682196cac0120a9adbb550    Bio Kosmetik    1
```