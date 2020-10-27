--------------------------------------------------------
--  DDL for Table MARKET_PRODUCT_TOTAL
--------------------------------------------------------

  CREATE TABLE MARKET_PRODUCT_TOTAL" 
   (	"EMAIL" VARCHAR2(255 BYTE), 
	"MARKET_NAME" VARCHAR2(50 BYTE), 
	"PRODUCT_ID" NUMBER, 
	"PRODUCT_NAME" VARCHAR2(50 BYTE), 
	"PRODUCT_AREA" VARCHAR2(50 BYTE), 
	"PRODUCT_CATEGORY" VARCHAR2(50 BYTE), 
	"PRICE" NUMBER(10,0), 
	"REPORT" NUMBER(10,0), 
	"UNIT" VARCHAR2(20 BYTE), 
	"DISCOUNT" NUMBER(10,2), 
	"PUT_OUT" NUMBER, 
	"QUANTITY" NUMBER(10,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;

   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."EMAIL" IS '�H�c';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."MARKET_NAME" IS '�������W';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."PRODUCT_ID" IS '�ӫ~id';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."PRODUCT_NAME" IS '�ӫ~�W��';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."PRODUCT_AREA" IS '�ӫ~�X���a';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."PRODUCT_CATEGORY" IS '�ӫ~���O(0)';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."PRICE" IS '����';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."REPORT" IS '���|(0)';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."UNIT" IS '���(0)';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."DISCOUNT" IS '�馩(0)';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."PUT_OUT" IS '�W�[�U�[(0)';
   COMMENT ON COLUMN "ROOT"."MARKET_PRODUCT_TOTAL"."QUANTITY" IS '�ƶq(0)';
REM INSERTING into ROOT.MARKET_PRODUCT_TOTAL
SET DEFINE OFF;

--------------------------------------------------------
--  DDL for Index MARKET_PRODUCT_TOTAL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX MARKET_PRODUCT_TOTAL_PK" ON "ROOT"."MARKET_PRODUCT_TOTAL" ("PRODUCT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Trigger MARKET_PRODUCT_TOTAL_TRG
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE TRIGGER MARKET_PRODUCT_TOTAL_TRG" 
BEFORE INSERT ON MARKET_PRODUCT_TOTAL 
FOR EACH ROW 
BEGIN
  <<COLUMN_SEQUENCES>>
  BEGIN
    IF INSERTING AND :NEW.PRODUCT_ID IS NULL THEN
      SELECT MARKET_PRODUCT_TOTAL_SEQ.NEXTVAL INTO :NEW.PRODUCT_ID FROM SYS.DUAL;
    END IF;
  END COLUMN_SEQUENCES;
END;
/
ALTER TRIGGER MARKET_PRODUCT_TOTAL_TRG" ENABLE;
--------------------------------------------------------
--  Constraints for Table MARKET_PRODUCT_TOTAL
--------------------------------------------------------

  ALTER TABLE MARKET_PRODUCT_TOTAL" MODIFY ("PRODUCT_ID" NOT NULL ENABLE);
  ALTER TABLE MARKET_PRODUCT_TOTAL" ADD CONSTRAINT "MARKET_PRODUCT_TOTAL_PK" PRIMARY KEY ("PRODUCT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;

--------------------------------------------------------
--  Insert Data
--------------------------------------------------------

Insert into MARKET_PRODUCT_TOTAL (EMAIL,MARKET_NAME,PRODUCT_ID,PRODUCT_NAME,PRODUCT_AREA,PRODUCT_CATEGORY,PRICE,REPORT,UNIT,DISCOUNT,PUT_OUT,QUANTITY) values (null,null,132,'�h�B','�x�W',null,66,null,'kg',null,null,12);
Insert into MARKET_PRODUCT_TOTAL (EMAIL,MARKET_NAME,PRODUCT_ID,PRODUCT_NAME,PRODUCT_AREA,PRODUCT_CATEGORY,PRICE,REPORT,UNIT,DISCOUNT,PUT_OUT,QUANTITY) values (null,null,133,'�n��','�饻',null,777,null,'kg',null,null,65);
Insert into MARKET_PRODUCT_TOTAL (EMAIL,MARKET_NAME,PRODUCT_ID,PRODUCT_NAME,PRODUCT_AREA,PRODUCT_CATEGORY,PRICE,REPORT,UNIT,DISCOUNT,PUT_OUT,QUANTITY) values (null,null,131,'���','�x�W',null,200,null,'kg',null,null,30);