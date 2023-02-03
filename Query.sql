-- Use DISTINCT to test if there are any accounts associated with more than one region.
SELECT DISTINCT a.id AS account_id, a.name AS account, r.name AS region
FROM region AS r
JOIN sales_reps AS s
ON r.id = s.region_id
JOIN accounts AS a
ON s.id = a.sales_rep_id
JOIN web_events AS w
ON a.id = w.account_id;

-- Have any sales reps worked on more than one account?
SELECT s.id AS rep_id, s.name AS rep, COUNT(a.id) AS account_num
FROM accounts AS a
JOIN sales_reps AS S
ON s.id = a.sales_rep_id
GROUP BY rep_id, rep
ORDER BY account_num;