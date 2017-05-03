SET SERVEROUTPUT ON;
DROP TABLE MENU_ITEMS;
CREATE TABLE MENU_ITEMS 
(
ITEM_CODE  NUMBER(4) NOT NULL,
SNACK_ITEM VARCHAR2(20) NOT NULL,
COST NUMBER(6,2),
CONSTRAINT PK_ITEM  PRIMARY KEY(ITEM_CODE)
);

INSERT INTO MENU_ITEMS VALUES (1001,'PANI PURI',25.00);
INSERT INTO MENU_ITEMS VALUES (1002,'BHEL PURI',20.00);
INSERT INTO MENU_ITEMS VALUES (1003,'RAGDA PATTICE',30.00);

DECLARE

TYPE snackType IS VARRAY(10) OF MENU_ITEMS.SNACK_ITEM%TYPE;
TYPE  itemType IS VARRAY(10) OF MENU_ITEMS.ITEM_CODE%TYPE;

snack_RE30 snackType := snackType('PAV BHAJI','MYSORE MASALA','SABUDANA WADA');
item_RE30  itemType := itemType(2003,2004,2005);
BEGIN

FORALL i IN snack_RE30.FIRST..snack_RE30.LAST
--INSERT INTO MENU_ITEMS VALUES(2003,snack_RE30(i),30.00); -- gives UNIQUE CONST ERROR
  INSERT INTO MENU_ITEMS VALUES(item_RE30(i),snack_RE30(i),30.00);

END;
/