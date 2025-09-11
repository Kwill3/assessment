-- To solve this query, we need to identify invoices where the user who created the invoice (via user_account_id in the invoice table) has never contacted the associated customer (via the contact table). Additionally, for each such invoice, we need to count the number of contacts with the customer that started before the invoice was issued, regardless of who made the contact. The result should include the invoice number, customer name, and this contact count, ordered by invoice number in ascending order.

SELECT 
    i.invoice_number,
    c.customer_name,
    COUNT(cont.id) as contact_count
FROM 
    invoice i
    JOIN customer c ON i.customer_id = c.id
    LEFT JOIN contact cont ON c.id = cont.customer_id 
        AND cont.contact_start_time < i.time_issued
WHERE 
    NOT EXISTS (
        SELECT 1 
        FROM contact cont2 
        WHERE cont2.customer_id = i.customer_id 
        AND cont2.user_account_id = i.user_account_id
    )
GROUP BY 
    i.invoice_number, 
    c.customer_name
ORDER BY 
    i.invoice_number ASC;

-- Explanation of the Query
-- Main Tables and Joins:
-- invoice i JOIN customer c ON i.customer_id = c.id: Links each invoice to its corresponding customer to get the customer name.

-- LEFT JOIN contact cont ON c.id = cont.customer_id AND cont.contact_start_time < i.time_issued: Joins the contact table to count contacts for the customer that started before the invoice was issued. The LEFT JOIN ensures we include invoices even if there are no prior contacts (in which case the count will be 0).

-- Filtering Condition:
-- WHERE NOT EXISTS (...): Ensures that the user who created the invoice (i.user_account_id) has never contacted the customer (i.customer_id). The subquery checks the contact table for any records where the user_account_id matches the invoice’s user_account_id and the customer_id matches the invoice’s customer_id. If no such contact exists, the condition is satisfied.

-- Counting Contacts:
-- COUNT(cont.id) as contact_count: Counts the number of contacts for the customer where the contact_start_time is before the time_issued of the invoice. The LEFT JOIN ensures that if no such contacts exist, the count is 0.

-- Grouping and Ordering:
-- GROUP BY i.invoice_number, c.customer_name: Groups the results by invoice number and customer name to ensure each invoice appears once with the correct contact count.

-- ORDER BY i.invoice_number ASC: Orders the results by invoice number in ascending order, as specified.

-- Handling the Schema and Assumptions
-- The time_issued and contact_start_time fields are stored as VARCHAR(255), but the query assumes they can be compared directly (e.g., in a format like ISO 8601 where string comparison works chronologically, such as YYYY-MM-DD HH:MM:SS). If the format requires specific handling (e.g., conversion to a timestamp), the query would need adjustment, but no such requirement is indicated in the problem.

-- The contact_count includes all contacts for the customer that started before the invoice’s time_issued, regardless of the user who made the contact, as the problem specifies “number of contacts that started prior to the time the invoice was created” without restricting to the invoice’s user.

-- The NOT EXISTS condition ensures the user who created the invoice has no contact records with the customer at any time (not limited to before the invoice).
