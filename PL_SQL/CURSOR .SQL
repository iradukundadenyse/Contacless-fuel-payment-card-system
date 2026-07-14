CREATE OR REPLACE PROCEDURE SHOW_TRANSACTIONS
AS

CURSOR transaction_cursor IS
SELECT Transaction_ID, Card_ID, Fuel_Type, Amount, Transaction_Date
FROM FUEL_TRANSACTION;

BEGIN

FOR trans IN transaction_cursor
LOOP

DBMS_OUTPUT.PUT_LINE(
'Transaction ID: ' || trans.Transaction_ID ||
' Card ID: ' || trans.Card_ID ||
' Fuel: ' || trans.Fuel_Type ||
' Amount: ' || trans.Amount
);

END LOOP;

END;
/
