SET SERVEROUTPUT ON;

BEGIN
    ProcessMonthlyInterest;

    UpdateEmployeeBonus('IT',10);

    TransferFunds(101,102,2000);
END;
/
