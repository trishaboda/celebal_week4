SELECT d.hacker_id, e.name FROM (SELECT a.hacker_id, a.challenge_id, a.score, b.difficulty_level, c.score AS max_score, 
CASE WHEN c.score = a.score THEN 1 ELSE 0 END AS score_a FROM submissions AS a 
LEFT JOIN challenges AS b ON a.challenge_id = b.challenge_id 
LEFT JOIN difficulty AS c ON b.difficulty_level = c.difficulty_level ) AS d 
LEFT JOIN hackers AS e ON d.hacker_id = e.hacker_id 
GROUP BY d.hacker_id, e.name HAVING SUM(d.score_a) > 1 
ORDER BY SUM(d.score_a) DESC, d.hacker_id ASC;