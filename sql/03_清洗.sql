select count(*)                              as total,
       sum(ts>=1511539200 and ts<1512316800) as in_range,
       sum(ts<1511539200)                    as before_range,
       sum(ts>=1512316800)                   as after_range
from userbehavior;

set time_zone = '+08:00';
create table userbehavior_clean as
select user_id, item_id, category_id, behavior_type,
       from_unixtime(ts)      as dt,
       date(from_unixtime(ts)) as d
from userbehavior
where ts >= 1511539200 and ts < 1512316800;

select count(*) from userbehavior_clean;
select min(d), max(d) from userbehavior_clean;
