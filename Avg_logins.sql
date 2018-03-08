SELECT counts.experiment_group, AVG(counts.average) as average_logins FROM 
  (SELECT exp.user_id,exp.experiment_group, COUNT(event.event_name) as average
    FROM tutorial.yammer_experiments exp
    INNER JOIN tutorial.yammer_events event
    ON exp.user_id = event.user_id
    WHERE event_name ='login'
    GROUP BY exp.user_id,exp.experiment_group) as counts
GROUP BY counts.experiment_group
