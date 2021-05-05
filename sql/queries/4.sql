-- Izbrojati koliko pputa se pojavljuju folderi koji se pojavljuju i u install filovima

select f.file_path, count(*)
from files f
where f.file_path like '%/' and
 f.file_path in (
     select file_path 
     from install_files 
     where f.file_path like '%/')
GROUP by f.file_path
order by count(*) desc;


