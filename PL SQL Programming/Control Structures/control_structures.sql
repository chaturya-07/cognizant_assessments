SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('===== CONTROL STRUCTURES PROGRAM STARTED =====');

    ------------------------------------------------------------------
    -- Scenario 1: Apply 1% discount for customers above 60 years
    ------------------------------------------------------------------
    FOR c IN (SELECT CUSTOMER_ID, AGE FROM CUSTOMER) LOOP
        IF c.AGE > 60 THEN
            UPDATE LOAN
            SET INTEREST_RATE = INTEREST_RATE - 1
            WHERE CUSTOMER_ID = c.CUSTOMER_ID;

            DBMS_OUTPUT.PUT_LINE('Scenario 1: Interest updated for Customer ID ' || c.CUSTOMER_ID);
        END IF;
    END LOOP;

    ------------------------------------------------------------------
    -- Scenario 2: Promote customers with balance > 10000 to VIP
    ------------------------------------------------------------------
    FOR c IN (SELECT CUSTOMER_ID, BALANCE FROM CUSTOMER) LOOP
        IF c.BALANCE > 10000 THEN
            UPDATE CUSTOMER
            SET ISVIP = 'TRUE'
            WHERE CUSTOMER_ID = c.CUSTOMER_ID;

            DBMS_OUTPUT.PUT_LINE('Scenario 2: Customer ID ' || c.CUSTOMER_ID || ' promoted to VIP');
        END IF;
    END LOOP;

    ------------------------------------------------------------------
    -- Scenario 3: Print reminders for loans due within 30 days
    ------------------------------------------------------------------
    FOR l IN (
        SELECT l.LOAN_ID,
               c.NAME,
               l.DUE_DATE
        FROM LOAN l
        JOIN CUSTOMER c
          ON l.CUSTOMER_ID = c.CUSTOMER_ID
        WHERE l.DUE_DATE BETWEEN SYSDATE AND SYSDATE + 30
    ) LOOP

        DBMS_OUTPUT.PUT_LINE(
            'Scenario 3: Reminder -> Customer: ' || l.NAME ||
            ', Loan ID: ' || l.LOAN_ID ||
            ', Due Date: ' || TO_CHAR(l.DUE_DATE,'DD-MON-YYYY')
        );

    END LOOP;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('===== ALL SCENARIOS COMPLETED SUCCESSFULLY =====');

END;
/
