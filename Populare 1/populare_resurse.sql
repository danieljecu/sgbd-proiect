DECLARE
  localitat varchar2(30);
  v_nume varchar2(30);
  v_latitudine number(8,4);
  v_latitudine number(8,4);
  v_id_user number(10);
BEGIN
  for i IN 1..5000 LOOP
      select * into localitat from (select * from localitate order by dbms_random.value) where rownum = 1 ;
      select * into v_nume from (select * from nume_resursa order by dbms_random.value) where rownum = 1 ;
       ---------------------
      v_nume:= vnume|| dbms_random.String('A', 5)|| dbms_random.value(1,5000);
      v_id_user:= dbms_random.value(1,5000);
      -- populare pizzerii
      insert into resurse_oop r(id_res, r.obiect, id_user) values
      (seq_resurse.nextval, pizzerie(v_nume, dbms_random.value(43,48), dbms_random.value(20,29), 
      localitat, to_char(dbms_random.value(111111111,999999999), '999999999')), v_id_user  );
      ---------------------
	  -- populare banca nume, lat, longit, oras, adresa, tel,program clienti, descriere
	  insert into resurse_oop r(id_res, r.obiect, id_user) values
      (seq_resurse.nextval, banca(v_nume, dbms_random.value(43,48), dbms_random.value(20,29), 
      localitat, 'Ibraileanu 6', to_char(dbms_random.value(111111111,999999999), '999999999'), 'luni-vineri: 8-20'), v_id_user  );
	  
	  
	  
  END LOOP;
END;
/