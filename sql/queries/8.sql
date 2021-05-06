-- Updatovati programs sa update_programs

update programs
set version=up.version,
    update_date=CURRENT_DATE
from ( select version,package_name
        from update_program) as up
where programs.package_name=up.package_name;

delete from update_program;
delete from tmp_update_program;