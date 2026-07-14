CREATE OR REPLACE PROCEDURE MAKE_PAYMENT(
    p_card_id NUMBER,
    p_amount NUMBER
)
AS
    v_balance NUMBER;

BEGIN

    -- Get current balance
    SELECT Balance
    INTO v_balance
    FROM PAYMENT_CARD
    WHERE Card_ID = p_card_id;


    -- Check balance
    IF v_balance >= p_amount THEN

        -- Deduct money
        UPDATE PAYMENT_CARD
        SET Balance = Balance - p_amount
        WHERE Card_ID = p_card_id;


        -- Save transaction
        INSERT INTO FUEL_TRANSACTION
        VALUES(
            FUEL_SEQ.NEXTVAL,
            p_card_id,
            'Fuel',
            p_amount,
            SYSDATE
        );


        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Payment Successful');


    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;


EXCEPTION

    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Card does not exist');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred');

END;
/
