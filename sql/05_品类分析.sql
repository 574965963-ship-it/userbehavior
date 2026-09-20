select category_id,
       count(distinct concat(user_id, '-', item_id)) as pv_uv,
       count(distinct case when behavior_type in ('cart','fav')
             then concat(user_id, '-', item_id) end) as intent_uv,
       count(distinct case when behavior_type='buy'
             then concat(user_id, '-', item_id) end) as buy_uv
from userbehavior_clean
group by category_id
order by pv_uv desc
limit 200;
