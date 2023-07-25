create database DBMS;

create table Doctor(
    Dr_id varchar(6) Primary key,
    Ph_no varchar(10) unique,
    Dr_name varchar(20) not null,
    Colony varchar(20) not null,
    Qualifications varchar(20) not null,
    Specialisations varchar(20) not null,
    city varchar(20) not null
)

INSERT INTO Doctor VALUES('111111','8569326589','Ramesh','Bal vihar','MBBS','Physician','Raigarh');
INSERT INTO Doctor VALUES('111112','7459326588','Mohan','Lakhperabagh','BAMS','Therapyst','Barabanki');
INSERT INTO Doctor VALUES('111113','6769326598','Buchireddy','Wadepally','MBBS','Physician','Warangal');
INSERT INTO Doctor VALUES('111114','8869326575','Utkarsh Bansal','Subhash Nagar','MBBS','Cardiology','Mohanlalganj');



create table Lab(
    Lab_id varchar(5) Primary key,
	Colony varchar(20) not null, 
    city varchar(20) not null,
	State varchar(15) not null,
    Shop_no varchar(8) not null,
    Phone_no varchar(10) unique    
)

insert into Lab values('12345','Maharishi Nagar','Barabanki','Uttar Pradesh','85967432','9555283044');



create table patient(
	Pat_id varchar(5) Primary key,
    Age int NOT NULL,
    Phone_no varchar(10) unique,
    Gender varchar(6) not null,
    city varchar(20) not null,
	State varchar(15) not null,
    Pat_name varchar(20) not null,
    Email varchar(15) unique,
    Colony varchar(20) not null,
    Dr_id varchar(6),
	FOREIGN KEY (Dr_id) REFERENCES Doctor(Dr_id),
    Lab_id varchar(5),
    foreign key (Lab_id) references Lab(Lab_id),
    Reporting_date varchar(15) not null
); 

INSERT INTO patient VALUES('10000','25','9936315845','Male','Hyderabad','Telangana','Ashu Verma','a@gmail.com','Kartik Vihar','111111','12345','01/07/2023');
INSERT INTO patient VALUES('10001','24','9946315845','Male','Warangal','Telangana','Vikram Sai','v@gmail.com','Gosaiganj','111112','12345','18/07/2023');
INSERT INTO patient VALUES('10002','10','9937315845','Female','Khammam','Telangana','Mohini','m@gmail.com','subhash vihar','111113','12345','10/07/2023');
INSERT INTO patient VALUES('10003','45','9936415845','Male','Hyderabad','Telangana','Nikhil Boob','n@gmail.com','Kartik Vihar','111111','12345','01/07/2023');
INSERT INTO patient VALUES('10004','35','9936325845','Female','Barabanki','Uttar Pradesh','Parwati','p@gmail.com','Kushinagar','111113','12345','07/07/2023');
INSERT INTO patient VALUES('10005','20','9936316845','Male','Lucknow','Uttar Pradesh','Pappu Kumar','k@gmail.com','chandauli Vihar','111114','12345','20/03/2023');
INSERT INTO patient VALUES('10006','80','9936315945','Male','Surat','Gujarat','Sambhav','sa@gmail.com','modi colony','111114','12345','20/05/2023');
INSERT INTO patient VALUES('10007','65','9936315855','Female','Barabanki','Uttar Pradesh','Seema','se@gmail.com','chaya chauraha','111114','12345','17/07/2023');
INSERT INTO patient VALUES('10008','49','9936300845','Female','Bhopal','Madhya Pradesh','Khushnuma','kh@gmail.com','krishna colony','111111','12345','02/07/2023');
INSERT INTO patient VALUES('10009','25','9930315845','Male','ViZag','Andhra Pradesh','Modi','mo@gmail.com','god colony','111112','12345','31/07/2023');



create table Employee(
	  Emp_id varchar(3) Primary Key,
      Phone_no varchar(10) unique,
      Colony varchar(20) not null,
      city varchar(20) not null,
      State varchar(15) not null,
      Lab_id varchar(5),
      foreign key (Lab_id) references Lab(Lab_id),
      Emp_name varchar(20) not null,
      Email varchar(15) unique,
      Salary int not null
);

INSERT INTO Employee VALUES('100','8887630076','Lakhperabag','Barabanki','Uttar Pradesh','12345','Ashok','as@gmail.com',20000);
INSERT INTO Employee VALUES('101','8865630076','Wadepally','Warangal','Telangana','12345','Munni','mun@gmail.com',25000);
INSERT INTO Employee VALUES('102','8887633276','Krishna colony','Amritsar','Punjab','12345','Ratan Singh','rat@gmail.com',30000);



create table Complaints(
	  Comp_id varchar(7) Primary Key,
      Pat_id varchar(5),
      foreign key (Pat_id) references Patient(Pat_id),
      Status bool not null,
      Lab_id varchar(5),
      foreign key (Lab_id) references Lab(Lab_id)
);

INSERT INTO Complaints VALUES('1234566','10002',True,'12345');
INSERT INTO Complaints VALUES('1234567','10005',False,'12345');



create table Equipments(
	  Equip_id varchar(5) Primary Key,
      Purchase_date Varchar(15) not null,
      Price int not null,
      Working_status bool not null,
      Lab_id varchar(5),
      foreign key (Lab_id) references Lab(Lab_id)
);

INSERT INTO Equipments VALUES('54321','15/11/2021','40000',True,'12345');
INSERT INTO Equipments VALUES('54322','19/10/2021','20000',True,'12345');
INSERT INTO Equipments VALUES('54323','15/11/2021','5000',True,'12345');
INSERT INTO Equipments VALUES('54324','15/11/2022','7000',True,'12345');
INSERT INTO Equipments VALUES('54325','15/11/2021','18000',True,'12345');



create table Waste_Management(
	  Waste_id varchar(12) Primary Key,
      Phone_no varchar(10) unique,
      Lab_id varchar(5),
      foreign key (Lab_id) references Lab(Lab_id)
);

INSERT INTO Waste_Management VALUES('100000000000','8090742246','12345');
INSERT INTO Waste_Management VALUES('100000000001','8090762246','12345');
INSERT INTO Waste_Management VALUES('100000000002','8090882246','12345');



create table Report_Updates(
	  Report_id varchar(12) Primary Key,
      Status bool not null,
      Complition_time varchar(10) not null
);

INSERT INTO Report_Updates VALUES('111111111111',True,'12:36 PM');
INSERT INTO Report_Updates VALUES('111111111112',False,'10:36 PM');
INSERT INTO Report_Updates VALUES('111111111113',True,'05:00 AM');



create table Report(
    Report_id varchar(12),
    Pat_id varchar(5),
    Primary Key(Report_id,Pat_id),
	Complition_time varchar(10) not null,
    Complition_Date varchar(15) not null
); 

INSERT INTO Report VALUES('111111111111','10000','12:36 PM','24/06/2023');
INSERT INTO Report VALUES('111111111112','10003','12:36 PM','24/06/2023');
INSERT INTO Report VALUES('111111111113','10004','10:10 AM','16/06/2023');
INSERT INTO Report VALUES('111111111114','10006','08:00 PM','18/06/2023');
INSERT INTO Report VALUES('111111111115','10009','05:00 PM','18/06/2023');



select Report_Updates.Report_id,Report_Updates.Complition_time
from Report_Updates
where Status=True;