create or replace procedure recalc_popularity;
/
--initializare popularitate cu 0
 update resurse_oop r 
      set r.popularitate = 0
      --where r.id_res= v_id;
	  ---------------
/
DECLARE 
   CURSOR update_popularitate IS
      SELECT * FROM resurse_oop r FOR UPDATE OF r.popularitate NOWAIT;
BEGIN
   FOR v_linie IN update_popularitate LOOP
       dbms_output.put_line(v_linie.popularitate);
         
         UPDATE resurse_oop r
		 SET r.popularitate= (select count(*) from resursefav where id_res= v_linie.id_res)
		 WHERE CURRENT OF update_popularitate;
      
   END LOOP;
END;
	  ---------------
CURSOR c1
IS
  SELECT id_res, r.popularitate
  FROM resurse_oop
  FOR UPDATE OF r.popularitate;
-------------------
--pentru fiecare resursa id_res = VAL
--se numara de cate ori apare in resurse fav
-- select id_res, count(*) into v_count from resursefav where id_res= VAL
--
-- update resurse_oop r 
  --set r.popularitate = v_count
      --where r.id_res= v_id;
-------------------sau
-- select id_res, count(*) from resursefav 
-- group by id_res
-------------------
/
drop trigger trigger_popularity;
/
Create or replace trigger trigger_popularity
After
    INSERT OR
    UPDATE OR
    DELETE
on resursefav
 FOR EACH ROW
 
DECLARE
v_id number(10);
BEGIN

  CASE      
      WHEN INSERTING THEN
      v_id:= :new.id_res;
      update resurse_oop r 
      set r.popularitate = r.popularitate+1
      where r.id_res= v_id;
      
      WHEN UPDATING then
       DBMS_OUTPUT.PUT_LINE('Updateing'); 
       ---old
       ---new
    
    WHEN DELETING THEN
    v_id:= :old.id_res;
    update resurse_oop r 
      set r.popularitate = r.popularitate-1
      where r.id_res= v_id;
  END CASE;   
END;
/

show errors;

