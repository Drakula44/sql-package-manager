-- instalirati program ukoliko postoje sve dependecy i ne postoje konflikti u fajlu

insert into programs(package_name,version)
select package_name,version 
from install_program install
where not exists(select id.package_name,id.dep_name
                from install_program ip join 
                    (select package_name,dep_name 
                    from install_deps 
                    union 
                    select package_name,dep_name 
                    from dependencies) id 
                on id.package_name=ip.package_name
                where install.package_name=id.package_name
                and id.dep_name not in 
                (select package_name from programs))
        and not EXISTS(select package_name
            from install_program ip
            where install.package_name=ip.package_name AND
            ip.package_name not in (
                select fi.package_name
                from install_files fi join files f on fi.file_path = f.file_path 
            ));

delete from install_files brisem
where exists (
    select package_name
    from install_program install
    where brisem.package_name=install.package_name 
    not exists(select id.package_name,id.dep_name
                from install_program ip join 
                    (select package_name,dep_name 
                    from install_deps 
                    union 
                    select package_name,dep_name 
                    from dependencies) id 
                on id.package_name=ip.package_name
                where install.package_name=id.package_name
                and id.dep_name not in 
                (select package_name from programs))
        and not EXISTS(select package_name
            from install_program ip
            where install.package_name=ip.package_name AND
            ip.package_name not in (
                select fi.package_name
                from install_files fi join files f on fi.file_path = f.file_path 
            ))
);
delete from install_deps brisem
where exists (
    select package_name
    from install_program install
    where brisem.package_name=install.package_name and
    not exists(select id.package_name,id.dep_name
                from install_program ip join 
                    (select package_name,dep_name 
                    from install_deps 
                    union 
                    select package_name,dep_name 
                    from dependencies) id 
                on id.package_name=ip.package_name
                where install.package_name=id.package_name
                and id.dep_name not in 
                (select package_name from programs))
        and not EXISTS(select package_name
            from install_program ip
            where install.package_name=ip.package_name AND
            ip.package_name not in (
                select fi.package_name
                from install_files fi join files f on fi.file_path = f.file_path 
            ))
);
delete from install_program brisem
WHERE exists (
    select package_name
    from install_program install
    where brisem.package_name=install.package_name and
    not exists(select id.package_name,id.dep_name
                from install_program ip join 
                    (select package_name,dep_name 
                    from install_deps 
                    union 
                    select package_name,dep_name 
                    from dependencies) id 
                on id.package_name=ip.package_name
                where install.package_name=id.package_name
                and id.dep_name not in 
                (select package_name from programs))
        and not EXISTS(select package_name
            from install_program ip
            where install.package_name=ip.package_name AND
            ip.package_name not in (
                select fi.package_name
                from install_files fi join files f on fi.file_path = f.file_path 
            ))
);