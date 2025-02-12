
-- Task 1: Identify Top Students by Total Scores
-- ● Use a subquery to calculate the total score (math_score + science_score +
-- english_score) for each student.
-- ● Use an ORDER BY clause to rank students by their total scores in descending order.
-- ● Limit the results to show only the top students (e.g., top 5).

SELECT StudentID, Name, Gender, Age, Grade, MathScore, ScienceScore, EnglishScore, 
       (MathScore + ScienceScore + EnglishScore) AS TotalScore
FROM Students
ORDER BY TotalScore DESC
LIMIT 5;

-- Calculate Averages Based on Specific Conditions
-- Use subqueries to filter and group data for average calculations:
-- ○ Example 1: Calculate the average score of students who scored above 70 in
-- Math.
-- ○ Example 2: Calculate the average total score of students grouped by a specific
-- condition, such as a score range (e.g., students scoring 200–250 in total).

SELECT 
    AVG((MathScore + ScienceScore + EnglishScore) / 3) AS AvgOverallScore
FROM
    Students
WHERE
    MathScore > 70;

SELECT 
    AVG(MathScore + ScienceScore + EnglishScore) AS AvgTotalScore
FROM
    Students
WHERE
    (MathScore + ScienceScore + EnglishScore) BETWEEN 200 AND 250;

-- Find Second-Highest Math Scores
-- ● Use a subquery to determine the highest Math score and exclude it in a second query to
-- find the next highest value.
-- ● Example:
-- ○ Use MAX(math_score) in a subquery to find the highest score.
-- ○ Use WHERE math_score < (SELECT MAX(math_score) FROM
-- Students) to exclude the top score and then use MAX again to find the second
-- highest score.


SELECT 
    Name, MathScore
FROM
    Students
WHERE
    MathScore = (SELECT 
            MAX(MathScore)
        FROM
            Students
        WHERE
            MathScore < (SELECT 
                    MAX(MathScore)
                FROM
                    Students));
