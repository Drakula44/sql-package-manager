COPY install_files(package_name, file_path)
FROM 'D:\OpenSource\sql-package-manager\data\install_files.csv'
DELIMITER ','
CSV HEADER;