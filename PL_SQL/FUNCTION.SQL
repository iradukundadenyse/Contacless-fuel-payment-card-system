CREATE OR REPLACE FUNCTION CHECK_BALANCE(
    p_card_id NUMBER
)
RETURN NUMBER

AS
    v_balance NUMBER;

BEGIN

    SELECT Balance
    INTO v_balance
    FROM PAYMENT_CARD
    WHERE Card_ID = p_card_id;

    RETURN v_balance;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        RETURN 0;

END;
/
