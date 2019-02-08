CREATE SEQUENCE seq_hsa
START WITH 1000 
MINVALUE 1
MAXVALUE 99999999999999
INCREMENT BY 1 
CACHE 20;

CREATE TABLE tb_hsa 
(
    USER_ID         NUMBER (10)    NOT NULL,
    USER_NAME       VARCHAR2 (50)  NOT NULL,
    USER_BIRTHDATE  VARCHAR2 (50),  
    CONSTRAINT user_pk_hsa PRIMARY KEY (USER_ID)
);



CREATE OR REPLACE PACKAGE emp_mgmt_hsa AS 
	PROCEDURE prc_hsa_insert  (NOME IN VARCHAR2, CAMPODATA IN VARCHAR2, RETORNO OUT VARCHAR2);
	PROCEDURE prc_hsa_up (NOME IN VARCHAR2, CAMPODATA IN VARCHAR2, ID IN NUMBER, RETORNO OUT VARCHAR2);
	PROCEDURE prc_hsa_del (id IN NUMBER, RETORNO OUT VARCHAR2);
END emp_mgmt_hsa;

CREATE PACKAGE BODY emp_mgmt_hsa AS 
PROCEDURE prc_hsa_insert (NOME IN VARCHAR2, CAMPODATA IN VARCHAR2, RETORNO OUT VARCHAR2) IS 
	BEGIN 
		
		INSERT INTO tb_hsa (USER_ID,         USER_NAME,            USER_BIRTHDATE)
			VALUES    (seq_hsa.NEXTVAL, prc_hsa_insert.NOME,      prc_hsa_insert.CAMPODATA);
                
		IF ROWCOUNT >1
			THEN RETORNO := 'SUCESSO';
		ELSE RETORNO := 'FALHA';	
	END;	

PROCEDURE prc_hsa_up(NOME IN VARCHAR2, CAMPODATA IN VARCHAR2, ID IN NUMBER, RETORNO OUT VARCHAR2) IS 
	BEGIN
		UPDATE tb_hsa 
		SET USER_NAME = prc_hsa_up.NOME, USER_BIRTHDATE = prc_hsa_up.CAMPODATA
		WHERE USER_ID = prc_hsa_up.ID;
		RETORNO := 'SUCESSO';
	END;

PROCEDURE prc_hsa_del(id IN NUMBER, RETORNO OUT VARCHAR2) IS 
	BEGIN 
		DELETE FROM tb_hsa 
		WHERE tb_hsa.USER_NAME = prc_hsa_del.id;
		RETORNO := 'SUCESSO';
	END;	
END emp_mgmt_hsa;

DECLARE
 RETORNO VARCHAR(8);
BEGIN 
  emp_mgmt_hsa.prc_hsa_insert('AAAA',  '10/10/2010', RETORNO);
  dbms_output.put_line(RETORNO);
  emp_mgmt_hsa.prc_hsa_up('ALINE', '01/01/2001', 1, RETORNO);
  dbms_output.put_line(RETORNO);
  emp_mgmt_hsa.prc_hsa_del(1, RETORNO)
  dbms_output.put_line(RETORNO);
END;


SELECT * FROM TB_HSA