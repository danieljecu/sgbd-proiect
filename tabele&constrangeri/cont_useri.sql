--sequence e un iteraror si se acceseaza cu:
--seq_resurse.currval , seq_resurse.nextval
DROP SEQUENCE seq_useri;
/
CREATE SEQUENCE seq_useri
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 10;
/
DROP TABLE cont_useri;
/
CREATE TABLE cont_useri
  (
    id_user  NUMBER(10) ,
    username VARCHAR2(15) UNIQUE,
    email    VARCHAR2(20),
    pass     VARCHAR2(15),
    PRIMARY KEY(id_user)
  );
/

insert into cont_useri(id_user,username,email,pass) values(seq_useri.nextval,'SirAlex','alex@yahoo.com','pass');
/
COMMIT;