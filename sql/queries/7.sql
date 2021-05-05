-- ispisati sve package koji su potrebni za pakete koji se instaliraju


create table IF NOT EXISTS temp_dep(package_name varchar(200) primary key);
create table IF NOT EXISTS temp_dep2(package_name varchar(200) primary key);
create table IF NOT EXISTS temp_dep3(package_name varchar(200) primary key);

delete from temp_dep;
delete from temp_dep2;
delete from temp_dep3;
insert into temp_dep(package_name)
select package_name from install_program;


CREATE OR REPLACE FUNCTION checkalldep() RETURNS SETOF temp_dep AS
$BODY$
DECLARE
    r temp_dep%rowtype;
BEGIN
--     WHILE EXISTS (SELECT * FROM temp_dep)
    while 1=1
	loop
		insert into temp_dep2
        select distinct id.dep_name
		from temp_dep ip join (select package_name,dep_name 
									  from install_deps 
									  union 
									  select package_name,dep_name 
									  from dependencies) id 
									  on id.package_name=ip.package_name
		where id.dep_name in (select package_name from programs);
		if not exists (
			select distinct package_name 
			from temp_dep
			where package_name not in 
			(select * from temp_dep3)) then
			exit;
			end if;
        insert into temp_dep3
		select distinct package_name from temp_dep
		where package_name not in (select * from temp_dep3);
		delete from temp_dep;
		insert into temp_dep
		select * from temp_dep2;
		delete from temp_dep2;
    END LOOP;
	RETURN QUERY select * from temp_dep3;
END
$BODY$
LANGUAGE 'plpgsql' ;

SELECT distinct * FROM checkalldep();