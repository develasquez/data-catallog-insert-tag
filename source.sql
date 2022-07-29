CREATE DATABASE `mcp_db`;

CREATE TABLE `control_tables` (
  `table_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

CREATE TABLE `control_columns` (
  `column_id` int(11) NOT NULL AUTO_INCREMENT,
  `table_id` int(11) DEFAULT NULL,
  `column_name` varchar(100) DEFAULT NULL,
  `column_description` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

insert into control_tables (table_name)
values ('requerimiento'),
 ('tabla1'),
 ('tabla3'),
 ('MOD1'),
 ('pepe'),
 ('moni'),
 ('coki'),
 ('pao')

insert into control_columns (table_id, column_id, column_description)
values (1,1,'NOM=ID de requerimiento;DOM=CAC;SUB=NA;DSC=Id de requerimiento del IOC;PRO=Rodrigo Devia - Patricia Gomez;ADM=Claudia Ortega;TEC=Javier Navarrete Vera'),
 (2,2,'NOM=ID de tabla 1;SUB=LA;DSC=Id de tabla del IOC;PRO=Pepe - Moni;ADM=Claudia Ortega;TEC=Javier Navarrete Vera'),
 (3,3,'NOM=Tabla 3;DOM=CAC;SUB=PA;DSC=Id de requerimiento del IOC;PRO=Rodrigo Devia - Patricia Gomez;ADM=Claudia Ortega;TEC=Javier Navarrete Vera'),
 (4,4,'NOM=NOM 1;DOM=TAC;SUB=TA;DSC=Id de requerimiento del IOC;PRO=Rodrigo Devia - Patricia Gomez;ADM=Claudia Ortega;TEC=Javier Navarrete Vera'),
 (5,5,'NOM=ID de pepe;DOM=CAC;SUB=NA;DSC=Id de requerimiento del IOC;PRO=Rodrigo Devia - Patricia Gomez;ADM=Claudia Ortega;TEC=Javier Navarrete Vera'),
 (6,6,'NOM=ID de moni;DOM=TAC;SUB=PA;DSC=Id de requerimiento del IOC;PRO=Rodrigo Devia - Patricia Gomez;ADM=Claudia Ortega;TEC=Javier Navarrete Vera'),
 (7,7,'NOM=ID de coki;DOM=CAC;SUB=LA;DSC=Id de requerimiento del IOC;PRO=Rodrigo Devia - Patricia Gomez;ADM=Claudia Ortega;TEC=Javier Navarrete Vera'),
 (8,8,'NOM=ID de pao;DOM=TAC;SUB=TA;DSC=Id de requerimiento del IOC;PRO=Rodrigo Devia - Patricia Gomez;ADM=Claudia Ortega;TEC=Javier Navarrete Vera')

