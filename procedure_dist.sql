--Toate locatiile din vecinatate where 

set SERVEROUTPUT on;
DECLARE
--coordonate facultate
   ulat number(8,4) := 47.173926; 
   ulong number(8,4) := 27.574707; 
--raza e in grade !problem!
   raza number:= 1;
---------------------------------------
--cursor c_locatii_vecinatate(ulat number(8,4), ulong number(8,4), raza number) 
--is  
---------------------------------------
v_linie_c c_locatii_vecinatate%rowtype;

BEGIN 
   dbms_output.put_line('Variable ulat: ' || ulat);
   dbms_output.put_line('Variable ulong: ' || ulong);
   dbms_output.put_line('Variable raza: ' || raza);
   --parametri (ulat, ulong, raza)
   select r.id_res from resurse_oop r 
where r.obiect.latidudine between  ulat - raza and  ulat + raza
and r.obiect.longitudine between ulong - raza and ulat + raza;
END;
/