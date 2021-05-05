COPY programs(package_name,version)
FROM 'D:\OpenSource\sql-package-manager\data\programs.csv'
DELIMITER ','
CSV HEADER;