select behavior_type,
       count(distinct user_id, item_id) as uv_item
from userbehavior_clean
group by behavior_type;
