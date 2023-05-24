/*Reference Tables ?*/

create table studies(PNAME varchar(20),INSTITUTE varchar(20),COURSE varchar(20),COURSE_FEE int);
insert into studies
 values('ANAND','SABHARI','PGDCA',4500),
 ('ALTAF','COIT','DCA',7200),
 ('JULIANA','BDPS','MCA',22000),
 ('KAMALA','PRAGATHI','DCA',5000),
 ('MARY','SABHARI','PGDCA ',4500);
CREATE TABLE software(PNAME varchar(20),TITLE varchar(20),DEVELOPIN varchar(20),SCOST decimal(10,2),DCOST int,SOLD int)
INSERT INTO software values('MARY','README','CPP',300,1200,84),
 ('ANAND','PARACHUTES','BASIC',399.95,600,43),
 ('VIMALA','VIDEO TITLING','PASCAL',7500,16000,9),
 ('JULIANA','INVENTORY','COBOL',3000,3500,1),
 ('KAMALA','PAYROLL PKG.','DBASE',9000,20000,7),
 ('MARY','FINANCIAL ACCT.','ORACLE',18000,85000,4),
 ('HONEY','CODE_GENERATOR','C',4500,20000,23),
 ('RAM','CODE','C',450,2000,2);
 
CREATE TABLE programmer(PNAME VARCHAR(20),DOB DATE,DOJ DATE,GENDER VARCHAR(1),PROF1 VARCHAR(15),PROF2 VARCHAR(15),SALARY INT)
INSERT INTO programmer values('ANAND','12-Apr-66','21-Apr-92','M','PASCAL','BASIC',3200 ),
 ('ALTAF','02-Jul-64','13-Nov-90','M','CLIPPER','COBOL',2800),
 ('JULIANA','31-Jan-60','21-Apr-90','F','COBOL','COBOL',3000),
 ('KAMALA','30-Oct-65','02-Jan-92','F','C','C',2900),
 ('MARY','24-Jun-65','01-Feb-65','F','C','ORACLE',4500);
select * from studies;
select * from software;
select * from programmer;



/* Queries Started */


/*1. Find out the selling cost AVG for packages developed in Pascal. */
select avg(scost) as avg from software where developin='Pascal';

/*2. Display Names, Ages of all Programmers. */
select distinct PName as Name ,year(getdate())-year(DOB)  as age from programmer

/*3. Display the Names of those who have done the DAP Course. */
select PName as Name  from studies where course='DAP'

/*4. Display the Names and Date of Births of all Programmers Born in January. */
select PName , DOB , DATENAME ( Month , DOB ) as Month  from Programmer where DATENAME ( Month , DOB )= 'JANUARY'

/*5. What is the Highest Number of copies sold by a Package? */
select max(sold) as maximum from software;

/*6. Display lowest course Fee. */
select min(course_fee) as Low_coursefee from studies;

/*7. How many programmers done the PGDCA Course? */
select count(*) as number_of_programers from studies where course='PGDCA';

/*8. How much revenue has been earned thru sales of Packages Developed in C.*/
select sum(scost) as Revenue from software where DEVELOPIN='c';

/*9. Display the Details of the Software Developed by Ramesh. */
select * from software where Pname='ramesh';

/*10. How many Programmers Studied at Sabhari? */
select count(*) no_of_programers from studies where INSTITUTE='SABHARI';

/*11. Display details of Packages whose sales crossed the 2000 Mark. */
select * from software where scost*sold>=2000;

/*12. Display the Details of Packages for which Development Cost have been recovered. */
select * from software where (scost*sold)>dcost;

/*13. What is the cost of the costliest software development in Basic? */
select max(scost) as Costliest_software from software where DEVELOPIN='BASIC';

/*14. How many Packages Developed in DBASE? */
select count(TITLE) number_of from software where developin='DBASE';

/*15. How many programmers studied in Pragathi? */
select count(Pname) as Number_of_programmers from studies where institute='pragathi'

/*16. How many Programmers Paid 5000 to 10000 for their course? */
select count(*) as number_of_programmers from studies where course_fee between 5000 and 10000;

/*17. What is AVG Course Fee */
select avg(course_fee) as Avg from studies;

/*18. Display the details of the Programmers Knowing C.*/
select * from programmer where prof1='C' and prof2='C';

/*19. How many Programmers know either COBOL or PASCAL. */
select * from programmer where (PROF1 ='COBOL' or PROF1='PASCAL') and (PROF2 ='COBOL' or PROF2='PASCAL' )

/*20. How many Programmers Don’t know PASCAL and C */
select count(pname) As 'No.of Programmer' from programmer where prof1 not in( 'PASCAL' , 'C' ) and prof2 not in( 'PASCAL' , 'C' )

/*21. How old is the Oldest Male Programmer. */
select max(year( getdate ())- year ( DOB )) As Age from Programmer where gender = 'M';

/*22. What is the AVG age of Female Programmers? */
select avg( year ( getdate ())- year ( DOB )) As Age from Programmer where gender = 'F'

/*23. Calculate the Experience in Years for each Programmer and Display with their names in Descending order */
select distinct pname As Name , year ( getdate ())- year ( DOJ ) As 'Experience' from Programmer Order by pname Desc

/*.24 Who are the Programmers who celebrate their Birthday’s During the Current Month?*/
select pname as Name from programmer where month( getdate ())= month( DOB )

/*25. How many Female Programmers are there? */
Select count ( PName ) 'No.of Female Programmer' from Programmer where gender = 'F'

/*26. What are the Languages studied by Male Programmers. */
select Distinct prof1 as 'Langauge' From programmer where gender = 'M' UNION select Distinct Prof2 as 'Langauge' From programmer where gender = 'M'

/*27. What is the AVG Salary? */
select avg(Salary ) 'Average Salary' from programmer

/*28. How many people draw salary 2000 to 4000? */
select count(pname) 'No.of Programer' from programmer where salary Between 2000 and 4000

/*29. Display the details of those who don’t know Clipper, COBOL or PASCAL. */
select distinct * from programmer where prof1 not in( 'CLIPPER' , 'COBOL' , 'PASCAL' ) and prof2 not in( 'CLIPPER' , 'COBOL' , 'PASCAL' )

/*30. Display the Cost of Package Developed By each Programmer. */
select pname,sum(scost*dcost) as Total_cost from software group by pname;

/*31. Display the sales values of the Packages Developed by the each Programmer. */
select pname,sum(scost*sold) as Total_sold from software group by pname;

/*32. Display the Number of Packages sold by Each Programmer. */
select PName , Count ( scold ) 'No.of Sold' from software group by PName

/*33. Display the sales cost of the packages Developed by each Programmer Language wise*/
select developin,sum(scost) from software group by developin;

/*34. Display each language name with AVG Development Cost, AVG Selling Cost and AVG Price per Copy.*/
select developin,avg(dcost) as Avg_Developemnt_cost,avg(scost) as Avg_Software_cost,avg(scost / sold) as Avg_price_per_copy from software group by developin;

/*35. Display each programmer’s name, costliest and cheapest Packages Developed by him or her.*/
select pname as Name,MAX(dcost) as costliest,min(dcost) as cheapest from software group by pname;

/*36. Display each institute name with number of Courses, Average Cost per Course*/
select institute,count(course) as no_of_courses,avg(course_fee) as average_course_fee from studies group by institute

/*37. Display each institute Name with Number of Students.*/
select institute,count(pname) as no_of_students from studies group by institute;

/*38.Display Names of Male and Female Programmers. Gender also.*/
select distinct pname,gender from programmer order by gender

/*39. Display the Name of Programmers and Their Packages.*/
select distinct pname as name,title from software order by pname;

/*40. Display the Number of Packages in Each Language Except C and C++.*/
select count(title) as no_of_packages from software where developin not in ('C','C++');

/*41. Display the Number of Packages in Each Language for which Development Cost is less than 1000.*/
select count(title) as no_of_packages,developin as Language_Developed from software where dcost<1000 group by developin;

/*42. Display AVG Difference between SCOST, DCOST for Each Package*/
select title,avg(scost-dcost) as Average from software group by title;

/*43. Display the total SCOST, DCOST and amount to Be Recovered for each Programmer for Those Whose Cost has not yet been Recovered*/
select sum(scost )as Sold_cost, sum(dcost ) as Development_cost, sum( dcost -( scost * dcost )) as Amount_recovered from software group by pname having sum(dcost )> sum(sold * scost )

/*44.Display Highest, Lowest and Average Salaries for those earning more than 2000.*/
select max(salary) as Higest_salary,min(salary) as min_salary,avg(salary) from programmer where salary>2000;

/*45.Who is the Highest Paid C Programmers?*/
select * from programmer where salary=(select max(salary) from programmer where prof1='C' and prof2='C');

/*46.Who is the Highest Paid Female COBOL Programmer?*/
select * from programmer where salary=(select max(salary) from programmer where prof1='COBOL' and prof2='COBOL' and gender='F');

/*47.Display the names of the highest paid programmers for each Language.*/
select a.prof,max(a.salary) from (select PROF1 as prof ,MAX(salary) as salary from programmer group by prof1 
union
select PROF2 as prof ,MAX(salary) as salary from programmer group by prof2) as a group by a.prof;

/*48.Who is the least experienced Programmer.*/
select pname As Name , year( getdate ())- year ( DOJ ) As Experience from programmer where year(getdate ())- year( DOJ )=( select min ( year( getdate ())- year( DOJ )) from programmer )

/*49.Who is the most experienced male programmer knowing PASCAL.*/
select pname As Name , year( getdate ())- year ( DOJ ) As Experience from programmer where year(getdate ())- year( DOJ )=( select max ( year( getdate ())- year( DOJ )) from programmer ) and gender='M' and prof1='PASCAL' and prof2='PASCAL'

/*50.Which Language is known by only one Programmer?*/
select prof1 as prof from programmer group by prof1 having prof1 not in ( select Prof2 from Programmer ) and count ( prof1 )= 1 union select prof2 from programmer group by prof2 having prof2 not in ( select prof1 from programmer ) and count ( prof2 )= 1 ;

/*51.Who is the Above Programmer Referred in 50?*/ 
select pname from programmer  where Prof1 in (select prof1 as prof from programmer group by prof1 having prof1 not in ( select Prof2 from Programmer ) and count ( prof1 )= 1 union select prof2 from programmer group by prof2 having prof2 not in ( select prof1 from programmer ) and count ( prof2 )= 1 )


/*52.Who is the Youngest Programmer knowing DBASE?*/
select year ( getdate ())- year ( DOB ) Age , pname Name , Prof1 , Prof2 from Programmer where year ( getdate ())- year ( DOB ) = ( select min ( year ( getdate ())- year ( DOB )) from Programmer where Prof1 like 'DBASE' or Prof2 like 'DBASE' );

/*53.Which Female Programmer earning more than 3000 does not know C, C++, ORACLE or DBASE?*/
select * from programmer where gender = 'F' and salary > 3000 and ( prof1 not in( 'C' , 'C++' , 'ORACLE' , 'DBASE' ) or prof2 not in( 'C' , 'C++' , 'ORACLE' , 'DBASE' ));

/*54.Which Institute has most number of Students?*/
select top 1 institute,count(pname) as no_of_students from studies group by institute order by 2 desc;

/*55.What is the Costliest course?*/
select course from studies where course_fee = ( select max ( course_fee ) from studies )

/*56.Which course has been done by the most of the Students?*/
select Top 1 course , count ( pname ) 'No of Student' from studies group by Course order by 2 Desc

/*57.Which Institute conducts costliest course.*/
select institute , course , course_fee from studies where course_fee = ( select max (course_fee ) from studies )

/*58.Display the name of the Institute and Course, which has below AVG coursefee.*/
select institute , course , course_fee from studies where course_fee < ( select avg(course_fee ) from studies )

/*59.Display the names of the courses whose fees are within 1000 (+ or -) of the Average Fee,*/
select institute as 'Institute' , course , course_Fee from studies where course_fee <( select avg ( course_fee )+ 1000 from studies ) or course_fee > ( select avg ( course_fee )- 1000 from studies )

/*60.Which package has the Highest Developmentcost?*/
select title , dcost from software where dcost =( select max ( dcost ) from software )

/*61.Which course has below AVG number of Students?*/
select course , count ( pname ) 'No of Student' from studies group by course having count ( pname ) < (select avg(a.Count1)  from (select count(pname) as Count1 from studies a group by course) as a)

/*62.Which Package has the lowest selling cost?*/
select title , scost from software where scost = ( select min ( scost ) from software );select title , scost from software where scost = ( select min ( scost ) from software );

/*63.Who Developed the Package that has sold the least number of copies?*/
select pname , scost from software where scost = ( select min ( scost ) from software );

/*64.Which language has used to develop the package, which has the highest sales amount?*/
select developin , scost from software where scost = ( select max ( scost ) from software );

/*65. How many copies of package that has the least difference between development and selling cost where sold.*/
select count(title)as No_of_copies  from software where title =( select title from software where (dcost - scost )=( select min ( dcost -scost ) from software  ))

/*66. Which is the costliest package developed in PASCAL.*/
select title from software where dcost = ( select max ( dcost ) from software where developin = 'PASCAL') 

/*67. Which language was used to develop the most number of Packages?*/
select developin from software group by developin having(count(title))=(select max(a.Count1)  from (select  count(title) as Count1 from software  group by developin) as a)

/*68. Which programmer has developed the highest number of Packages?*/
select pname from software group by pname having(count(title))=(select max(a.Count1)  from (select  pname,count(title) as Count1 from software  group by pname) as a)

/*69. Who is the Author of the Costliest Package?*/
select pname , dcost from software where dcost = ( select max (dcost ) from software )

/*70. Display the names of the packages, which have sold less than the AVG number of copies.*/
select title from software where sold < ( select avg ( sold ) from Software)

/*71. Who are the authors of the Packages, which have recovered more than double the Development cost?*/
select pname from software where sold * scost > 2 *dcost

/*72. Display the programmer Name and the cheapest packages developed by them in each language.*/
select pname , title from software where dcost in ( select min (dcost ) from software group by developin )

/*73. Display the language used by each programmer to develop the Highest Selling and Lowest-selling package.*/
select pname , developin from software where sold in ( select max (sold ) from software group by pname ) union select pname , developin from software where sold in ( select min (sold ) from software group by pname) 

/*74. Who is the youngest male Programmer born in 1965?*/
select pname from programmer where DOB =( select max ( DOB)  from programmer where year ( DOB ) like '1965' )

/*75. Who is the oldest Female Programmer who joined in 1992?*/
select pname from programmer where DOB =( select min ( DOB)  from programmer where year ( DOJ ) like '1992' and gender='F' )

/*76. In which year was the most number of Programmers born.*/
select year(DOB) as year from programmer group by year(DOB) having count(pname)=(select max(a.count1) from (select count(pname) as count1 from programmer group by year(DOB) ) as a)

/*77. In which month did most number of programmers join?*/
select month(DOJ) as month from programmer group by month(DOJ) having count(pname)=(select max(a.count1) from (select count(pname) as count1 from programmer group by year(DOJ) ) as a)

/*78.In which language are most of the programmer’s proficient.*/
select prof1 as Language from programmer group by prof1 having count(pname)=(select max(a.count1) from (select count(pname) as count1 from programmer group by prof1 ) as a)
union select prof2 as Language from programmer group by prof2 having count(pname)=(select max(a.count1) from (select count(pname) as count1 from programmer group by prof2 ) a )

/*79. Who are the male programmers earning below the AVG salary of Female Programmers?*/
select pname from programmer where gender = 'M' and salary < ( select ( avg ( salary )) from programmer where gender = 'F' )

/*80. Who are the Female Programmers earning more than the Highest Paid?*/
 select pname from programmer where gender like 'F' AND salary > ( select ( max ( salary )) from programmer where gender like 'M' )

/*81. Which language has been stated as the proficiency by most of the Programmers? */
 select  prof1 as Language from programmer group by prof1 having count(pname)=(select max(a.count1) from (select count(pname) as count1 from programmer group by prof1 ) as a)
union select prof2 as Language from programmer group by prof2 having count(pname)=(select max(a.count1) from (select count(pname) as count1 from programmer group by prof2 ) a )

/*82. Display the details of those who are drawing the same salary. */
select pname , salary from programmer where salary = any( select salary from programmer p group by salary having salary = p . salary and count (*)> 1 )

/*83. Display the details of the Software Developed by the Male Programmers Earning More than 3000/-. */
select s.* from programmer p , software s where p .pname = s .pname and salary > 3000 and gender = 'M'

/*84. Display the details of the packages developed in Pascal by the Female Programmers. */
select s .* from programmer p , software s where p .pname = s . pname and gender = 'F' and developin = 'Pascal' ;

/*85. Display the details of the Programmers who joined before 1990. */
select * from programmer where year ( DOB )< 1990

/*86. Display the details of the Software Developed in C By female programmers of Pragathi. */
select s.* from software s , studies st , programmer p where s . pname = st . pname and p . pname = s . pname and gender = 'F' and institute = 'Pragathi'

/*87. Display the number of packages, No. of Copies Sold and sales value of each programmer institute wise. */
select st.institute , count ( s .developin ) 'Packages' , count ( s .sold ) 'Sold' , sum ( s .sold * s . scost ) 'Sale_value' from software s , studies st where s . pname = st . pname group by st .institute;

/*88. Display the details of the software developed in DBASE by Male Programmers, who belong to the institute in which most number of Programmers studied.*/
select s.* from software s,programmer p,studies st where s.pname=p.pname and st.pname=s.pname and gender='M' and developin='DBASE'  and institute= (select institute from studies as st group by st.institute having count(pname)=(select max(a.count1) from(select institute,count(pname) as count1 from studies group by institute)a ) )

/*89. Display the details of the software Developed by the male programmers Born before 1965 and female programmers born after 1975. */
select s .* from programmer p , software s where s .pname = p . pname and gender = 'M' and year ( DOB )< 1964 or gender = 'F' and year ( DOB )> 1975

/*90.Display the details of the software that has developed in the language which is neither the first nor the second proficiency of the programmers. ?*/
select s .* from programmer p , software s where s . pname = p . pname and ( developin <> Prof1 and developin <> Prof2 )

/*91. Display the details of the software developed by the male students of Sabhari. */
Select s .* from programmer p , software s ,studies st where p . pname = s . pname and s .pname = st . pname and gender = 'M' and institute = 'Sabhari'

/*92. Display the names of the programmers who have not developed any packages. ?*/
select pname from programmer  where pname not in(select pname from software)

/*93.What is the total cost of the Software developed by the programmers of Apple? */
select sum ( scost ) from software s , studies st where s .pname = st . pname and institute = 'Apple'

/*94. Who are the programmers who joined on the same day?*/
select p1 .pName , p1 . DOJ from programmer p1 , programmer P2 where p1 . DOJ = p2 . DOJ and p1 . pname <> p2 . pname

/*95. Who are the programmers who have the same Prof2? */
select pname from programmer where Prof2 = any( select Prof2 from programmer group by prof2 having count(*)>1)

/*96. Display the total sales value of the software, institute wise. ?*/
select st . institute , sum ( s . sold * s . scost ) 'Sale_Value' from software s , studies st where st . pname = s . pname group by st . institute

/*97. In which institute does the person who developed the costliest package studied. ?*/
select institute from software st , studies s where s . pname = st . pname group by institute,dcost having max ( dcost )= ( select max ( dcost ) from software )

/*98.Which language listed in prof1, prof2 has not been used to develop any package. */
select Prof1 as prof from programmer where Prof1 not in( select developin from software ) UNION select Prof2 as prof from programmer where Prof2 not in ( select developin from software )

/*99.How much does the person who developed the highest selling package earn and what course did HE/SHE undergo. ?*/
select p . salary , st .course from programmer p , software s , studies st where p . pname = s . pname and s . pname = st . pname and scost = ( select max (scost ) from software )

/*100. What is the AVG salary for those whose software sales is more than 50,000/-. ?*/
select avg ( salary ) from programmer p , software s where p . pname = s . pname and sold * scost > 50000

/*101. How many packages were developed by students, who studied in institute that charge the lowest course fee? */
select s.pname,count ( developin ) 'Packages' from software s , studies st where s . pname = st . pname group by s . pname , course_fee having course_fee =( select min ( course_fee ) from studies )

/*102.How many packages were developed by the person who developed the cheapest package, where did HE/SHE study? */
select count (*) from programmer p , software s where s . pname = p . pname group by developin having  min(dcost) = ( select min (dcost ) from software )

/*103. How many packages were developed by the female programmers earning more than the highest paid male programmer? */
select count ( developin ) from programmer p , software s where s . pname = p . pname and gender = 'F' and salary >( select max ( salary ) from programmer p , software s where s . pname = p . pname and gender = 'M' )

/*104. How many packages are developed by the most experienced programmer form BDPS. ?*/
select count (*) from software s , programmer p where p . pname = s . pname group by DOJ having max ( DOJ )=( select max ( DOJ ) from studies st , programmer p , software s where p . pname = s . pname and st . pname = p . pname and (institute = 'BDPS' ))
 
 /*105. List the programmers (form the software table) and the institutes they studied ?*/
 select pname , institute from Studies where pname  in( select pname from software )

 /*106. List each PROF with the number of Programmers having that PROF and the number of the packages in that PROF. ?*/
 select developin,count (*), sum ( scost * sold - dcost ) 'PROFIT' from software where developin in ( select Prof1 from Programmer ) or developin in (select Prof2 from Programmer) group by developin;

 /*107. List the programmer names (from the programmer table) and No. Of Packages each has developed. ?*/
 select s . pname , count ( developin ) from programmer p , software s where p . pname = s . pname group by s . pname