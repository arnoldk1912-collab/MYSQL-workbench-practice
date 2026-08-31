DESCRIBE address;
SELECT * FROM address
WHERE postal_code IS NULL;

SELECT * FROM address
WHERE postal_code IS NOT NULL;