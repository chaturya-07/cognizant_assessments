-------------------------------------------------
-- ACCOUNTS TABLE
-------------------------------------------------
CREATE TABLE ACCOUNTS (
    ACCOUNT_ID NUMBER PRIMARY KEY,
    CUSTOMER_NAME VARCHAR2(50),
    ACCOUNT_TYPE VARCHAR2(20),
    BALANCE NUMBER(10,2)
);

-------------------------------------------------
-- EMPLOYEES TABLE
-------------------------------------------------
CREATE TABLE EMPLOYEES (
    EMPLOYEE_ID NUMBER PRIMARY KEY,
    EMPLOYEE_NAME VARCHAR2(50),
    DEPARTMENT VARCHAR2(30),
    SALARY NUMBER(10,2)
);

-------------------------------------------------
-- SAMPLE DATA
-------------------------------------------------
INSERT INTO ACCOUNTS VALUES (101,'Ravi','SAVINGS',10000);
INSERT INTO ACCOUNTS VALUES (102,'Sita','SAVINGS',20000);
INSERT INTO ACCOUNTS VALUES (103,'Arjun','CURRENT',15000);
INSERT INTO ACCOUNTS VALUES (104,'Priya','SAVINGS',30000);

INSERT INTO EMPLOYEES VALUES (1,'Rahul','IT',50000);
INSERT INTO EMPLOYEES VALUES (2,'Anitha','IT',60000);
INSERT INTO EMPLOYEES VALUES (3,'Kiran','HR',45000);
INSERT INTO EMPLOYEES VALUES (4,'Deepa','HR',55000);

COMMIT;
