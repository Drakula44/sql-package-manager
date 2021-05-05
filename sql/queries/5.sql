-- ispisati pakete koji trebaju da se instaliraju ali 
-- neki falj vec postoji u bazi podataka koji nije folder

select package_name
from install_programs
where package_name not in (
    select package_name
    from install_files fi join files f on fi.file_path = f.file_path 
)



