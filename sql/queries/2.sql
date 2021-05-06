-- Razdvojiti string na ime i verziju
-- Postoje progami koji 
with proba as  
	(
		SELECT p.package_name, version , regexp_replace(u.name_version, (p.package_name || '-'), '') as new_version, 
		char_length(u.name_version) as length_version
		from programs p cross join tmp_update_program u
		where u.name_version like (p.package_name || '%') 
		order by package_name asc
	), agg as
	(
		select p.package_name,min(p.length_version) as length_version
		from proba p
		group by p.package_name
	)
	select p.package_name,p.new_version,a.length_version
	from proba p join agg a on p.package_name=a.package_name and p.length_version=a.length_version
