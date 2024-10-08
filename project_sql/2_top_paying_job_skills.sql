/*
What skills are required or the top paying data analyst jobs ?
- Use the top 10 highest paying data analyst jobs from first query.
- Add the specific skills equired for these roles
- Why? It provides a detailed look t which hight paying jobs emand certain skills, helping 
*/
WITH top_paying_jobs AS (
    SELECT 
        name AS company_name,
        job_id,
        job_title,
        salary_year_avg,
        name AS company_name
    FROM
        job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

    WHERE
        job_title_short = 'Data Analyst' AND
        job_location LIKE '%Türkiye%' AND
        salary_year_avg IS NOT NULL
    ORDER BY
        salary_year_avg DESC
    LIMIT 10
)


SELECT 
   COUNT(skills) AS count_of_skills,
   skills

FROM  top_paying_jobs

INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id

GROUP BY
    skills

ORDER BY
count_of_skills DESC

LIMIT 10




