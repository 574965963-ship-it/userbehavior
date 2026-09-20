select behavior_type, count(*)
from userbehavior
group by behavior_type;

set time_zone = '+08:00';
select min(from_unixtime(ts)), max(from_unixtime(ts))
from userbehavior;

select sum(behavior_type='') as empty_behavior,
       sum(ts=0)            as zero_ts,
       sum(user_id=0)       as zero_user,
       sum(item_id=0)       as zero_item
from userbehavior;

set time_zone = '+08:00';
select date(from_unixtime(ts)) as d, count(*) as cnt
from userbehavior
group by date(from_unixtime(ts))
order by d;

select user_id, item_id, category_id, behavior_type, ts
from userbehavior
where ts = 0 or ts > 1512316800
limit 20;
