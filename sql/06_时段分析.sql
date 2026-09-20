select hour(dt) as hr,
       sum(behavior_type='pv')  as pv_cnt,
       sum(behavior_type='buy') as buy_cnt,
       round(sum(behavior_type='buy') / sum(behavior_type='pv') * 100, 2) as conv_pct
from userbehavior_clean
group by hour(dt)
order by hr;
