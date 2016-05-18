DROP TABLE resursePersonale;
/
CREATE TABLE resursePersonale
  (
    id_user VARCHAR2(4) 
    id_res  NUMBER(10, 0) unique 
    PRIMARY KEY(id_res) -- o resursa nu poate apartine la mai multi useri
    --index (id_user,id_res)
  );
/
ALTER TABLE resursePersonale
ADD CONSTRAINT fkDC_resurse
  FOREIGN KEY (id_res)
  REFERENCES resurse_oop(id_res)
  ON DELETE CASCADE;
 /
ALTER TABLE resursePersonale
ADD CONSTRAINT fkSN_user
  FOREIGN KEY (id_user)
  REFERENCES cont_useri(id_user)
   ON DELETE SET NULL;
 /
-------------------------------------------
DROP TABLE resursefav;
/
CREATE TABLE resursefav
  (
    id_user VARCHAR2(4) not null,
    id_res  NUMBER(10) ,
    PRIMARY KEY(id_user,id_res) --index (id_user,id_res)
  );
/
ALTER TABLE resursefav
ADD CONSTRAINT fkDC_resurse
  FOREIGN KEY (id_res)
  REFERENCES resurse_oop(id_res)
  ON DELETE CASCADE;
 /
ALTER TABLE resursefav
ADD CONSTRAINT fkDC_user
  FOREIGN KEY (id_user)
  REFERENCES cont_useri(id_user)
   ON DELETE CASCADE;
 /