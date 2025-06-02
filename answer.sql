-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change
SELECT 
  period,
  COUNT(DISTINCT user_id) * 1.0 / COUNT(DISTINCT day) AS avg_daily_users
FROM (
  SELECT 
    user_id,
    DATE(login_timestamp, 'unixepoch') AS day,
    CASE 
      WHEN DATE(login_timestamp, 'unixepoch') < '2018-06-02' THEN 'Before'
      ELSE 'After'
    END AS period
  FROM login_history
)
GROUP BY period;





-- PART 2: Create a SQL query that indicates the number of status changes by card

SELECT 
  c.name,
  COUNT(*) AS status_changes
FROM card_change_history ch
JOIN card c ON ch.cardId = c.id
WHERE ch.oldStatus IS NOT ch.newStatus
GROUP BY ch.cardId
ORDER BY status_changes DESC;




