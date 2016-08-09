create table expandtest(pk_id bigint primary key, name text, group_id text);
insert into expandtest values (1, 'Franklin', 'g1');
insert into expandtest values (2, 'Eleanor', 'g1');
insert into expandtest values (3, 'Theo', 'g1');
insert into expandtest values (4, 'Tommy', null);
insert into expandtest values (5, 'Billy', null);
insert into expandtest values (6, 'Georgie', null);
create index idxfoo on expandtest using zombodb(zdb('expandtest', ctid), zdb(expandtest)) with (url='http://localhost:9200/');

select * from expandtest order by pk_id;
select pk_id, name, group_id from expandtest where zdb('expandtest'::regclass, ctid) ==> '(pk_id < 6 AND (#expand<group_id=<this.index>group_id>(pk_id:3 OR pk_id:5)))' order by pk_id;
select pk_id, name, group_id from expandtest where zdb('expandtest'::regclass, ctid) ==> '((#expand<group_id=<this.index>group_id>(pk_id < 6 AND #expand<group_id=<this.index>group_id>(pk_id:3 OR pk_id:5))))' order by pk_id;
drop table expandtest;