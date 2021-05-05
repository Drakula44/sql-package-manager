-- ispisati pakete koje treba dodati da bi paketi mogli da se instaliraju

select id.package_name,id.dep_name
from install_program ip join (select package_name,dep_name from install_deps union select package_name,dep_name from dependencies) id on id.package_name=ip.package_name
where id.dep_name not in (select package_name from programs)