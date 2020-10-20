--------------------------------------------------------
--  �w�إ��ɮ� - �P���|-�Q��-08-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE PRODUCT 
   (	"PRODUCTID" NUMBER(38,0), 
	"PRODUCT" VARCHAR2(50 BYTE), 
	"PRODUCTERID" VARCHAR2(255 BYTE), 
	"STOCK" NUMBER(38,0), 
	"CONTENT" NUMBER(38,0), 
	"UNIT" VARCHAR2(12 BYTE), 
	"PRICE" NUMBER(12,2), 
	"DISCOUNT" NUMBER(12,2), 
	"ADDEDDATE" DATE, 
	"SHELFTIME" NUMBER(12,0), 
	"COVERIMAGE" BLOB, 
	"FILENAME" VARCHAR2(20 BYTE), 
	"DESCRIPTION" VARCHAR2(255 BYTE), 
	"CATEGORY" NUMBER(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" 
 LOB ("COVERIMAGE") STORE AS SECUREFILE (
  TABLESPACE "SYSAUX" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Index PRODUCT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX PRODUCT_PK ON PRODUCT ("PRODUCTID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX" ;
--------------------------------------------------------
--  DDL for Trigger PRODUCT_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER PRODUCT_TRG 
BEFORE INSERT ON PRODUCT 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.PRODUCTID IS NULL THEN
      SELECT PRODUCT_SEQ.NEXTVAL INTO :NEW.PRODUCTID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER PRODUCT_TRG ENABLE;
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE PRODUCT MODIFY ("PRODUCTID" NOT NULL ENABLE);
  ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_PK PRIMARY KEY ("PRODUCTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSAUX"  ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE PRODUCT ADD CONSTRAINT PRODUCT_FK1 FOREIGN KEY (CATEGORY)
	  REFERENCES PRODUCTCATEGORY (ID) ENABLE;
