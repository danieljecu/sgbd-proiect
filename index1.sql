explain plan for select * from resurse_oop r
where UPPER(r.obiect.nume) like 'C%';
select * from table (dbms_xplan.display);
/
Drop index ix_nume;
Create index ix_nume on resurse_oop (UPPER(obiect.nume));
/
----------------------------------------------------
explain plan for 
 select r.id_res, r.OBIECT.nume  from resurse_oop r 
where r.obiect.latitudine between  37.173926 - 1 and  37.173926 + 1
and r.obiect.longitudine between 27.574707 - 1 and 27.574707 + 1;
select * from table (dbms_xplan.display);
/
Drop index ix_location;
CREATE INDEX ix_location ON resurse_oop (obiect.latitudine, obiect.longitudine);
/
-----------------------------------------------
explain plan for select * from resurse_oop;
select * from table (dbms_xplan.display);
/
--Drop index bitmap_tip_res;
--create bitmap index bitmap_tip_res on resurse_oop(obiect.tip_res);

Drop index b_tip_res;
create index b_tip_res on resurse_oop(obiect.tip_res);
