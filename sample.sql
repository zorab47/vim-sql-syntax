SELECT array_agg(players), player_teams
FROM (
  SELECT DISTINCT t1.t1player AS players, t1.player_teams
  FROM (
    SELECT
      p.playerid AS t1id,
      concat(p.playerid,':', p.playername, ' ') AS t1player,
      array_agg(pl.teamid ORDER BY pl.teamid) AS player_teams
    FROM player p
    LEFT JOIN plays pl ON p.playerid = pl.playerid
    GROUP BY p.playerid, p.playername
  ) t1
INNER JOIN (
  SELECT
    p.playerid AS t2id,
    array_agg(pl.teamid ORDER BY pl.teamid) AS player_teams
  FROM player p
  LEFT JOIN plays pl ON p.playerid = pl.playerid
  GROUP BY p.playerid, p.playername
) t2 ON t1.player_teams=t2.player_teams AND t1.t1id <> t2.t2id
) innerQuery
GROUP BY player_teams

SELECT bucket, sum(cnt) OVER (ORDER BY bucket) FROM (
    SELECT width_bucket(salary, 70000, 140000, 20) as bucket, 
           count(*) as cnt
    FROM employee_salary
    GROUP BY bucket 
    ORDER BY bucket) x;

CREATE MATERIALIZED VIEW blah

REFRESH MATERIALIZED VIEW blah CONCURRENTLY



SELECT date_trunc('month', timestamp) as date,
       count(*) as count
FROM events
WHERE event_name = 'Created Chart'
GROUP BY 1
ORDER BY 1

SELECT series AS dt,
       coalesce(sum(sales), 0) as sales
FROM generate_series('2016-01-01'::date, '2016-01-31'::date, '1 day'::interval) AS series
LEFT JOIN transactions ON transactions.dt = series

'[{"a":"foo"},{"b":"bar"},{"c":"baz"}]'::json->2

-> <- 

'{"a":1, "b":2}'::jsonb @> '{"b":2}'::jsonb

create table  a ( a date )


