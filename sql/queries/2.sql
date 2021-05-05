-- Razdvojiti string na ime i verziju
-- Postoje progami koji 
INSERT INTO update_program(package_name, version, new_version)
SELECT package_name, version , regexp_replace(name_version, (package_name || '-'), '')
from programs p cross join tmp_update_program u
where name_version like (package_name || '%') 