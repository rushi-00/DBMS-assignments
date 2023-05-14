/* Name : Rushikesh Chobhe
   Batch : AS2
   Roll No : 34
   CURSOR  : Here we have increased the book price by 10% by using cursor 
*/   
  
delimiter //
create procedure books_upda()
begin
	declare vfinished int default 0;
	declare i int(100);
	declare n varchar(20);
	declare p varchar(20);
	declare t varchar(20);
	declare a varchar(20);
	declare pr int(255);
	
	
declare lms_cursor cursor for select * from books;
declare continue handler for not found set vfinished=1;

open lms_cursor;
getdata:loop
     fetch  lms_cursor into i,n,p,t,a,pr;
     if vfinished=1 then
     leave getdata;
     end if;
    set pr=pr+0.10 * pr;
    insert into book_dump values(i,n,p,t,a,pr);
    end loop getdata;
    close lms_cursor;
    end //


 +--------+----------------------+----------------+-----------------+------------+-------+
| bookid | bookname             | publisher      | booktitle       | bookauthor | price |
+--------+----------------------+----------------+-----------------+------------+-------+
|     22 | basic c              | s k publishers | learn c         | dr pradip  |   122 |
|     25 | engineering physics  | dc publishers  | advance physics | aniket     |   150 |
|     37 | software engineering | fj publishers  | se              | dr dhanrao |    60 |
|     38 | dbms                 | rm publishers  | learn dbms      | mr uday    |   140 |
|     45 | data structures      | rk publishers  | ds              | dr pawar   |   211 |
|     46 | operating system     | jk publishers  | os              | dr pawar   |    75 |
+--------+----------------------+----------------+-----------------+------------+-------+
6 rows in set (0.00 sec)


mysql>     call books_upda();
    -> //
Query OK, 0 rows affected (0.62 sec)

mysql> select * from book_dump;
    -> //
+--------+----------------------+----------------+-----------------+------------+-------+
| bookid | bookname             | publisher      | booktitle       | bookauthor | price |
+--------+----------------------+----------------+-----------------+------------+-------+
|     22 | basic c              | s k publishers | learn c         | dr pradip  |   134 |
|     25 | engineering physics  | dc publishers  | advance physics | aniket     |   165 |
|     37 | software engineering | fj publishers  | se              | dr dhanrao |    66 |
|     38 | dbms                 | rm publishers  | learn dbms      | mr uday    |   154 |
|     45 | data structures      | rk publishers  | ds              | dr pawar   |   232 |
|     46 | operating system     | jk publishers  | os              | dr pawar   |    83 |
+--------+----------------------+----------------+-----------------+------------+-------+
