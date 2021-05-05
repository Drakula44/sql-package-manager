-- Selektovati sve programe koji trebaju da se updatuju i imaju preko 30 fajlova

select p.package_name
from programs p join update_program u on u.package_name=p.package_name
where p.package_name in (
    select f.package_name
    from files f
    group by f.package_name
    having count(*) > 30
);