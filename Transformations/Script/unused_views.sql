---- UNUSED VIEWS
-- CREATE VIEW `team_max_goal_statistics` AS SELECT
--     t1.name AS home_team,
--     t2.name AS away_team,
--     MAX(goal_for) AS max_goal_for,
--     MAX(goal_against) AS max_goal_against,
--     MAX(total_goal) AS max_total_goal,
--     COUNT(*) AS meetings
-- FROM
--     `match_goals_fact`
-- JOIN team_dim AS t1
-- ON
--     match_goals_fact.home_team = t1.id
-- JOIN team_dim AS t2
-- ON
--     match_goals_fact.away_team = t2.id
-- GROUP BY
--     t1.name,
--     t2.name;
--
-- CREATE VIEW `season_home_away_max_goals` AS SELECT
--     team_dim.id AS team_id,
--     team_dim.name AS team_name,
--     season_dim.id AS season_id,
--     season_dim.period AS season_name,
--     MAX(goal_for) AS home_max_goals
-- FROM
--     `match_goals_fact`
-- JOIN team_dim ON match_goals_fact.home_team = team_dim.id
-- JOIN season_dim ON match_goals_fact.season = season_dim.id
-- GROUP BY
--     team_dim.id,
--     season_dim.id;

-- CREATE VIEW `season_each_away_max_goals` AS SELECT
--     team_dim.id AS team_id,
--     team_dim.name AS team_name,
--     season_dim.id AS season_id,
--     season_dim.period AS season_name,
--     MAX(goal_against) AS away_max_goals
-- FROM
--     `match_goals_fact`
-- JOIN team_dim ON match_goals_fact.away_team = team_dim.id
-- JOIN season_dim ON match_goals_fact.season = season_dim.id
-- GROUP BY
--     team_dim.id,
--     season_dim.id;

-- CREATE VIEW `season_home_max_goals` AS SELECT
--     *
-- FROM
--     `season_each_home_max_goals` AS view_1
-- WHERE
--     view_1.home_max_goals =(
--     SELECT
--         MAX(view_2.home_max_goals)
--     FROM
--         `season_each_home_max_goals` AS view_2
--     WHERE
--         view_2.season_id = view_1.season_id
-- )
-- ORDER BY view_1.season_name;

-- CREATE VIEW `season_away_max_goals` AS SELECT
--     *
-- FROM
--     `season_each_away_max_goals` AS view_1
-- WHERE
--     view_1.away_max_goals =(
--     SELECT
--         MAX(view_2.away_max_goals)
--     FROM
--         `season_each_away_max_goals` AS view_2
--     WHERE
--         view_2.season_id = view_1.season_id
-- )
-- ORDER BY view_1.season_name;

-- CREATE VIEW `season_max_goals` AS SELECT
--     `season_home_max_goals`.season_name,
--     IF(
--         home_max_goals > away_max_goals,
--         home_max_goals,
--         away_max_goals
--     ) AS max_goals
-- FROM
--     `season_home_max_goals`
-- JOIN `season_away_max_goals` ON `season_home_max_goals`.`season_id` = `season_away_max_goals`.`season_id`
-- GROUP BY
--     `season_home_max_goals`.`season_id`
-- ORDER BY
--     `season_home_max_goals`.`season_name`;
