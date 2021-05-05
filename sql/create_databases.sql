create table programs (
    package_name     varchar(200)  not null                      ,
    version          varchar(100)  not null                      ,
    update_date      DATE NOT NULL DEFAULT CURRENT_DATE          ,
    primary key (package_name)
);
create table files (
    package_name    varchar(200)     not null                    ,
    file_path       varchar(100)    not null                    ,
    type            varchar(100)                                 ,
    primary key (file_path)                                     ,
    foreign key (package_name) references programs(package_name)
);
create table dependencies (
    package_name    varchar(200)                                ,
    dep_name        varchar(200)                                ,
    dep_version     varchar(200)                                ,
    primary key (package_name, dep_name)                        ,
    foreign key (package_name) references programs(package_name)
);
create table update_program (
    package_name    varchar(200)                                 ,
    version         varchar(100)                                 ,
    new_version     varchar(100)                                 ,
    PRIMARY KEY (package_name)                                   ,
    FOREIGN KEY (package_name) REFERENCES programs(package_name)
);
create table install_program (
    package_name    varchar(200)                                 ,
    version         varchar(100)                                 ,
    PRIMARY KEY (package_name)    
);
create table install_files (
    package_name    varchar(200)     not null                    ,
    file_path       varchar(100)    not null                    ,
    type            varchar(100)                                 ,
    note            varchar(500)                                ,
    primary key (file_path)                                     ,
    foreign key (package_name) references install_program(package_name)
);
create table install_deps (
    package_name    varchar(200)                                 ,
    dep_name        varchar(200)                                 ,
    primary key (package_name, dep_name)                        ,
    foreign key (package_name) references install_program(package_name)
    -- contrain needed to dep_name be in install_program or programs   
);
create table tmp_update_program (
	name_version varchar(300) primary key
);