SELECT counts.experiment_group, AVG(counts.average) as average_messages_sent FROM 
  (SELECT exp.user_id,exp.experiment_group, COUNT(event.event_name) as average
    FROM tutorial.yammer_experiments exp
    INNER JOIN tutorial.yammer_events event
    ON exp.user_id = event.user_id
    INNER JOIN tutorial.yammer_users use
    ON event.user_id = use.user_id
    WHERE event_name ='send_message' and activated_at < '2014-05-01 00:00:00'
    GROUP BY exp.user_id,exp.experiment_group) as counts
GROUP BY counts.experiment_group
