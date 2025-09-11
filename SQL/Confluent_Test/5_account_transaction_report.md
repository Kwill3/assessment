# Account Transaction Report

In an accounting software system, the task is to generate a report that lists each account's IBAN along with the total number of transactions and the total transaction amount for both debit and credit transactions.  

The result should have the following columns: IBAN | total_debit_transactions | total_credit_transactions | total_debit_amount | total_credit_amount.
- IBAN: the IBAN code of the account
- total_debit_transactions: the total number of debit transactions
- total_credit_transactions: the total number of credit transactions
- total_debit_amount: the total amount of debit transactions in accounting format (see Note)
- total_credit_transactions: the total amount of credit transactions 

The results should be sorted in ascending order by IBAN.

Note:
- Ensure all decimal values are formatted to include trailing zeroes if necessary, e.g., 5.00.
- Debit amounts should be presented in accounting notation format, such as "(1234.56)".

## Schema
Table: accounts
```
_______________________________________________________________________________________
NAME          | TYPE         | CONSTRAINTS           | DESCRIPTION                     |
---------------------------------------------------------------------------------------|
id            | INTEGER      | NOT NULL PRIMARY KEY  | The identifier of the account   |
iban          | VARCHAR(255) |                       | The IBAN code of the account    |
---------------------------------------------------------------------------------------|
```

Table: transactions
```
__________________________________________________________________________________________________________________________________________________
NAME          | TYPE         | CONSTRAINTS   | DESCRIPTION                                                                                        |
--------------------------------------------------------------------------------------------------------------------------------------------------|
account_id    | INTEGER      | FK            | The identifier of the account associated with the transaction                                      |
iban          | VARCHAR(255) |               | The amount of the transaction, positive for credit and negative for debit in accounting notation   |
--------------------------------------------------------------------------------------------------------------------------------------------------|
```

## Sample Data
Table: accounts
```
_________________________________________________
id    | iban                                     |
-------------------------------------------------|
 1    | SK54 9028 8736 4159 6900 3833            |
 2    | FR89 8924 1373 91JJ HXB9 LD6T S00        |
 3    | RS14 1649 6768 0661 3462 93              |
 4    | KZ69 173D PMJH 65FK EJ0J                 |
 5    | AL52 9747 4994 AEUX IUS9 BEKO DDZN       |
 6    | FI90 5899 3875 6230 21                   |
 7    | BR75 1386 1278 9515 5453 3455 876X F     |
 8    | PK28 TQVT 7ZTC HLGN WBKC YVIJ            |
 9    | MT20 MWHE 8191 9ILR Q8LV X9AR 64AD PMH   |
 10   | MT96 WQCN 9398 0DPG SVNP E5KA PPDU ZS7   |
 11   | SK58 0245 3173 9567 0609 5521            |
 12   | TN72 0577 3009 5160 2826 5367            |
 13   | KW28 XASZ LBJK 4XIB HYS8 RUE3 N5RY DR    |
 14   | FR32 9479 0481 875I QMPW 7YMF R73        |
 15   | FR23 1897 5855 71AE 700M FSEW D33        |
 16   | IE20 DZGP 8647 9664 8734 64              |
 17   | FR04 0167 2225 01QZ K5DO SNBL 879        |
 18   | CY09 2480 7494 ZF3Q LTEZ 60RX WHUL       |
-------------------------------------------------|
```

Table: transactions
```
_________________________
account_id | amount     |
------------------------|
 19        | (7104.1)   |
 1         | 9772.9     |
 19        | 598.41     |
 4         | (1718.61)  |
 9         | 1415.57    |
 6         | 8219.01    |
 13        | 4105.27    |
 15        | (266.63)   |
 11        | (1185.29)  |
 13        | (3591.67)  |
 17        | (2618.09)  |
 11        | 7818.57    |
 4         | (5741.81)  |
 15        | (1165.29)  |
 6         | 8411.91    |
 3         | 9986.5     |
 10        | 5869.19    |
 14        | (5612.8)   |
 7         | (512.02)   |
 10        | (7496.83)  |
 19        | (7685.11)  |
 1         | 1531.74    |
 12        | (1547.72)  |
 4         | 7564.01    |
 18        | (1209.43)  |
 18        | 4063.05    |
 17        | (7296.64)  |
 19        | 6447.53    |
 19        | (4233.72)  |
 2         | 3571.43    |
 1         | (5110.34)  |
 14        | (3584.44)  |
 10        | (1590.19)  |
 5         | (2053.4)   |
 5         | (4183.81)  |
------------------------|
```

## Expected Output
```
AL52 9747 4994 AEUX IUS9 BEKO DDZN	12	13	(66990.29)	61033.29
BR75 1386 1278 9515 5453 3455 876X F	8	9	(49118.85)	34822.80
CY09 2480 7494 ZF3Q LTEZ 6ORX WHUL	18	8	(71534.16)	40364.20
FI90 5899 3875 6230 21	6	13	(23870.33)	86603.05
FR04 0167 2225 01QZ K5DO SNBL 879	10	7	(48183.29)	42922.85
FR23 1897 5855 71AE 7OOM FSEW D33	18	16	(78751.23)	77777.52
FR32 9479 0481 875I QMPW 7YMF R73	12	10	(49276.50)	48318.67
FR70 4634 3477 04FT FLP7 KPXH S04	15	10	(63918.17)	65260.72
FR89 8924 1373 91JJ HXB9 LD6T S00	6	14	(37757.74)	81686.13
IE20 DZGP 8647 9664 8734 64	10	10	(33564.06)	66607.71
KW28 XASZ LBJK 4XIB HYS8 RUE3 N5RY DR	11	16	(51438.71)	71203.54
KZ69 173D PMJH 65FK EJ0J	16	20	(66969.89)	95565.36
MT20 MWHE 8191 9ILR Q8LV X9AR 64AD PMH	9	13	(34814.30)	55848.36
MT96 WQCN 9398 0DPG SVNP E5KA PPDU ZS7	16	10	(86750.03)	55769.69
MU12 WGOQ 6040 2757 0464 0238 453G BE	19	12	(101422.92)	49275.02
PK28 TQVT 7ZTC HLGN WBKC YVIJ	10	12	(55050.52)	56320.35
RS14 1649 6768 0661 3462 93	11	17	(36780.59)	96260.43
SK54 9028 8736 4159 6900 3833	15	12	(78375.84)	64574.74
SK58 0245 3173 9567 0609 5521	23	11	(113584.56)	45382.49
TN72 0577 3009 5170 2826 5367	10	12	(30387.14)	55759.30
```