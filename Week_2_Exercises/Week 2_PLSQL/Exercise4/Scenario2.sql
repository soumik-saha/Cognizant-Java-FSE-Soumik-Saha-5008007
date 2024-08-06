CREATE OR REPLACE FUNCTION CALCULATEMONTHLYINSTALLMENT (
    LOAN_AMOUNT IN NUMBER,
    ANNUAL_INTEREST_RATE IN NUMBER,
    LOAN_DURATION_YEARS IN NUMBER
) RETURN NUMBER IS
    MONTHLY_INTEREST_RATE NUMBER;
    NUMBER_OF_PAYMENTS    NUMBER;
    MONTHLY_INSTALLMENT   NUMBER;
BEGIN
    MONTHLY_INTEREST_RATE := ANNUAL_INTEREST_RATE / 12 / 100;
    NUMBER_OF_PAYMENTS := LOAN_DURATION_YEARS * 12;
    IF MONTHLY_INTEREST_RATE = 0 THEN
        MONTHLY_INSTALLMENT := LOAN_AMOUNT / NUMBER_OF_PAYMENTS;
    ELSE
        MONTHLY_INSTALLMENT := LOAN_AMOUNT * MONTHLY_INTEREST_RATE / (1 - POWER(1 + MONTHLY_INTEREST_RATE, -NUMBER_OF_PAYMENTS));
    END IF;

    RETURN MONTHLY_INSTALLMENT;
END CALCULATEMONTHLYINSTALLMENT;