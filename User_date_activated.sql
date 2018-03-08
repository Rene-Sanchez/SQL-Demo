  SELECT use.activated_at,exp.experiment_group,COUNT(use.user_id) as user_count
    FROM tutorial.yammer_experiments as exp
    INNER JOIN tutorial.yammer_users as use
    ON exp.user_id = use.user_id
  GROUP BY use.activated_at,exp.experiment_group
