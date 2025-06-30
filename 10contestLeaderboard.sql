SELECT H.hacker_id, H.name, SUM(max_scores.max_score) AS total_score 
FROM Hackers H JOIN ( SELECT hacker_id, challenge_id, MAX(score) AS max_score FROM Submissions S 
                     GROUP BY hacker_id, challenge_id ) max_scores ON H.hacker_id = max_scores.hacker_id 
                     GROUP BY H.hacker_id, H.name HAVING SUM(max_scores.max_score) > 0 
                     ORDER BY total_score DESC, hacker_id ASC;