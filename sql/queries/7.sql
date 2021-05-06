-- Aržurirati tabelu files gde za tipove treba staviti extenziju falja 
-- ili ukoliko je folder folder

update files
set type=new.tip_fajla
from 
    (select case
        when file_path ~ '.*(\/).*?\..*(?<!/)$' 
        then regexp_replace(file_path, '.*(\/).*?\.', '')
        else 'folder'
        end as tip_fajla,file_path
    from files) as new
where new.file_path=files.file_path