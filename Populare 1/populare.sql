CREATE TABLE test_csv(
  oras VARCHAR2(30),
  latitudine number(12,10),
  longitudine number(12,10),
  cod_postal integer
  )
-- drop table test_csv
CREATE TABLE localitate(
  localit varchar2(30)
  )
  
-- drop table localitate
CREATE TABLE nume_resursa(
  resursa varchar2(30)
  )

-- dbms_random.value(43.50,48.49) - longitudine
-- dbms_random.value(20.50,29.49) - latitudine
-- dbms_random.value(19.5,99999.49) - cod postal

--id_user=nextval, user = random 
  --100 fav/cont
   --insert into resursefav ( id_user, id_res ) values ((currentval),( random))
DECLARE
  localitat varchar2(30);
  p_nume varchar2(30);
BEGIN
  for i IN 1..5 LOOP
      select * into localitat from (select * from localitate order by dbms_random.value) where rownum = 1 ;
      select * into p_nume from (select * from nume_resursa order by dbms_random.value) where rownum = 1 ;
      insert into resurse_oop r(id_res, r.obiect, id_user) values(seq_resurse.nextval, pizzerie(p_nume, dbms_random.value(20,29), dbms_random.value(43,48), localitat, to_char(dbms_random.value(111111111,999999999), '999999999')), dbms_random.value(1,5000));
  END LOOP;
END;
/
show errors;