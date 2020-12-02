--------------------------------------------------------
--  已建立檔案 - 星期二-十二月-01-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table BOOKMARK
--------------------------------------------------------

  CREATE TABLE "SEMINAR"."BOOKMARK" 
   (	"MEMBER_NO" NUMBER, 
	"RECIPE_ID" VARCHAR2(20 BYTE), 
	"ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE 
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into SEMINAR.BOOKMARK
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index BOOKMARK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEMINAR"."BOOKMARK_PK" ON "SEMINAR"."BOOKMARK" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table BOOKMARK
--------------------------------------------------------

  ALTER TABLE "SEMINAR"."BOOKMARK" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SEMINAR"."BOOKMARK" ADD CONSTRAINT "BOOKMARK_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;