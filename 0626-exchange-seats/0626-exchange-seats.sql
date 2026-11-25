# Write your MySQL query statement below
SELECT
    s1.id,
    s2.student
FROM Seat s1
JOIN Seat s2
ON s2.id = CASE
    WHEN MOD(s1.id, 2) = 1 AND s1.id < (SELECT COUNT(*) FROM Seat)
        THEN s1.id + 1
    WHEN MOD(s1.id, 2) = 0
        THEN s1.id - 1
    ELSE s1.id
END
ORDER BY s1.id ASC;