CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    DECLARE @Ans INT;

    WITH salary_cte AS (
        SELECT
            salary,
            DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
        FROM Employee
    )
    SELECT @Ans = (
        SELECT DISTINCT salary
        FROM salary_cte
        WHERE salary_rank = @N
    );

    RETURN @Ans;
END
