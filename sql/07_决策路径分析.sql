select
  sum(has_cart=0 and has_fav=0) as direct_buy,
  sum(has_cart=1 and has_fav=0) as cart_then_buy,
  sum(has_cart=0 and has_fav=1) as fav_then_buy,
  sum(has_cart=1 and has_fav=1) as cart_fav_then_buy
from (
  select user_id, item_id,
         max(behavior_type='cart') as has_cart,
         max(behavior_type='fav')  as has_fav
  from userbehavior_clean
  group by user_id, item_id
  having max(behavior_type='buy') = 1
) t;
