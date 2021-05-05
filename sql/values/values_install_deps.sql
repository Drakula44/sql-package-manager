COPY install_deps(package_name,dep_name)
FROM 'D:\OpenSource\sql-package-manager\data\install_deps.csv'
DELIMITER ','
CSV HEADER;