create database if not exists taobao character set utf8mb4;
use taobao;

create table userbehavior (
    user_id       int unsigned not null comment '用户ID',
    item_id       int unsigned not null comment '商品ID',
    category_id   int unsigned not null comment '类目ID',
    behavior_type varchar(10)  not null comment '行为: pv/cart/fav/buy',
    ts            int unsigned not null comment 'Unix秒级时间戳'
) engine=innodb default charset=utf8mb4;

set global local_infile = 1;

load data local infile 'D:/userbehavior/UserBehavior.csv'
into table userbehavior
fields terminated by ','
lines terminated by '\n'
(user_id, item_id, category_id, behavior_type, ts);
