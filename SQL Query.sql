USE ist722_srramach_stage
UPDATE dbo.stgFMFFSales
SET quantity=1
WHERE quantity is NULL;