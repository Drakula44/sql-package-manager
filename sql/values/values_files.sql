COPY files(package_name, file_path)
FROM 'D:\OpenSource\sql-package-manager\data\files.csv'
DELIMITER ','
CSV HEADER;