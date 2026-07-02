SET SERVEROUTPUT ON;

-------------------------------------------------
-- Scenario 1
-------------------------------------------------
CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
IS
BEGIN
    UPDATE ACCOUNTS
    SET BALANCE = BALANCE + (BALANCE * 0.01)
    WHERE ACCOUNT_TYPE='SAVINGS';

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Monthly interest processed successfully.');
END;
/

-------------------------------------------------
-- Scenario 2
-------------------------------------------------
CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus
(
    p_department IN VARCHAR2,
    p_bonus IN NUMBER
)
IS
BEGIN
    UPDATE EMPLOYEES
    SET SALARY = SALARY + (SALARY * p_bonus/100)
    WHERE DEPARTMENT=p_department;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE('Employee bonus updated.');
END;
/

-------------------------------------------------
-- Scenario 3
-------------------------------------------------
CREATE OR REPLACE PROCEDURE TransferFunds
(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
IS
    v_balance NUMBER;
BEGIN

    SELECT BALANCE
    INTO v_balance
    FROM ACCOUNTS
    WHERE ACCOUNT_ID=p_from_account;

    IF v_balance >= p_amount THEN

        UPDATE ACCOUNTS
        SET BALANCE=BALANCE-p_amount
        WHERE ACCOUNT_ID=p_from_account;

        UPDATE ACCOUNTS
        SET BALANCE=BALANCE+p_amount
        WHERE ACCOUNT_ID=p_to_account;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE('Transfer Successful');

    ELSE

        DBMS_OUTPUT.PUT_LINE('Insufficient Balance');

    END IF;

END;
/
