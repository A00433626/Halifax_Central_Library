use u41;

DROP TABLE if exists MAGAZINE;
#
create table if not exists MAGAZINE (
  _id bigint not null auto_increment,
  name varchar(50) not null,
  primary key(_id),
  check(name != '')
) engine = innodb;

 DROP TABLE if exists MAGAZINEVOLUME;
#
create table if not exists MAGAZINEVOLUME (
  Mag_ID bigint  not null auto_increment,
  volumeNumber int ,
  year varchar(4), 
  primary key(Mag_ID,volumeNumber),
  index(Mag_ID,volumeNumber),
foreign key(Mag_ID) references MAGAZINE(_id)
) engine = innodb;

DROP TABLE if exists ARTICLE;
#
create table if not exists ARTICLE (
  _Id BIGINT not null auto_increment,
  Title varchar(50) not null,
  pages varchar(50) ,
  volumeNumber int ,
  Magazine_id bigint,
  primary key(_Id),
   index(Magazine_id,volumeNumber),
   constraint foreign key(Magazine_id,volumeNumber) references MAGAZINEVOLUME(Mag_ID,volumeNumber)
 ) engine = innodb;

  
DROP TABLE if exists AUTHOR;
#
create table if not exists AUTHOR (
  _id BIGINT not null auto_increment,
  lname varchar(30) not null,
  fname varchar(30),
  email varchar(50),
  primary key(_id)
) engine = innodb;

  DROP TABLE if exists ARTICLE_AUTHOR;
#
create table if not exists ARTICLE_AUTHOR (
  author_id BIGINT not null,
  article_id BIGINT not null,
  primary key(author_id,article_id),
  foreign key(author_id) references AUTHOR(_id),
   foreign key(article_id) references ARTICLE(_Id)
) engine = innodb;



 DROP TABLE if exists ITEM;
#
create table if not exists ITEM (
  _id BIGINT not null auto_increment,
  price FLOAT(8,2) not null,
  primary key(_id)
) engine = innodb;  
 
    DROP TABLE if exists CUSTOMER;
#
create table if not exists CUSTOMER (
  customer_id INT(11) not null auto_increment,
  fname varchar(30),
   lname varchar(30) not null,
  address varchar(50), 
   phoneNumber varchar(50), 
  primary key(customer_id)
) engine = innodb;

  DROP TABLE if exists TRANS_ACTION ;
#
create table if not exists TRANS_ACTION (
  transactionNumber INT(11) not null auto_increment,
  discountcode INT(11),
  transactiondate date, 
  totalpurchaseprice float, 
   customerID INT(11) not null, 
  primary key(transactionNumber)
  #foreign key(customerID) references CUSTOMER(customer_id)
) engine = innodb;

 DROP TABLE if exists TRANSACTIONDETAILS ;
#
create table if not exists TRANSACTIONDETAILS (
  transactionNO INT(11) not null auto_increment,
  itemId BIGINT not null not null ,
   primary key (transactionNo , itemId),
  unique key (transactionNo , itemId),
  foreign key (transactionNo) references TRANS_ACTION(transactionNumber),
  foreign key (itemId) references ITEM(_id)
) engine = innodb;

DROP TABLE if exists YEARLYRENT;
#
create table if not exists YEARLYRENT(

year varchar(4) not null ,

rent double,

primary key (year)

)engine = innodb;

DROP TABLE if exists MONTHLYEXPENSES;
#
create table if not exists MONTHLYEXPENSES (
  year varchar(4) not null,
   month varchar(2) not null,
  electricity double,
  heat double,
  water double,
  primary key (month, year),
   index(year,month),
  foreign key(year) references YEARLYRENT(year)
) engine = innodb;

DROP TABLE if exists EMPLOYEE;
#
create table if not exists EMPLOYEE (
year varchar(4),
  month varchar(2),
  sinNO bigint(20) not null auto_increment,
  primary key(sinNO,year,month),
  index(year,month),
  foreign key(year,month) references MONTHLYEXPENSES(year,month)  
) engine = innodb;


 DROP TABLE if exists EMPLOYEEWORKHOURS ;
#
create table if not exists EMPLOYEEWORKHOURS (
   sinNo bigint(20) not null, 
   workdate date, 
   start_time datetime,
   end_time datetime,
  primary key(sinNo,workdate),
  foreign key (sinNo) references EMPLOYEE(sinNO)
  
) engine = innodb;




   
   

