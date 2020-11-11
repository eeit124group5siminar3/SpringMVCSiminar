--------------------------------------------------------
--  已建立檔案 - 星期一-十一月-09-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table RECIPE
--------------------------------------------------------

  CREATE TABLE "SEMINAR"."RECIPE" 
   (	"MEMBER_NO" NUMBER, 
	"RECIPE_ID" NUMBER GENERATED ALWAYS AS IDENTITY MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE  NOKEEP  NOSCALE , 
	"RECIPE_NAME" VARCHAR2(20 BYTE), 
	"CATEGORY" VARCHAR2(20 BYTE), 
	"RECIPE_DESC" VARCHAR2(500 BYTE), 
	"METHOD" VARCHAR2(600 BYTE), 
	"INGREDIENTS_A" VARCHAR2(10 BYTE), 
	"GRAM_A" NUMBER(3,0), 
	"INGREDIENTS_B" VARCHAR2(10 BYTE), 
	"INGREDIENTS_C" VARCHAR2(10 BYTE), 
	"INGREDIENTS_D" VARCHAR2(10 BYTE), 
	"FILENAME" VARCHAR2(30 BYTE), 
	"DATA" BLOB
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"   NO INMEMORY 
 LOB ("DATA") STORE AS SECUREFILE "SYS_LOB0000079153C00010$$"(
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192
  NOCACHE LOGGING  NOCOMPRESS  KEEP_DUPLICATES 
  STORAGE(INITIAL 106496 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
REM INSERTING into SEMINAR.RECIPE
SET DEFINE OFF;
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,43,'排骨飯c','雞肉','1','1','1',1,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (21,14,'水餃','雞肉','好吃','method1111111111','豬肉餡',0,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,15,'咖哩飯','雞肉','讚','method2','咖哩塊',1,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,16,'陽春麵','豬肉','棒','method3','麵食',1,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,17,'雞腿飯','雞肉','多汁','method4','雞腿',1,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,117,'3333333333','雞肉',null,null,null,0,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (0,19,'壽司','雞肉','軟Q','method666666','飯',0,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,20,'牛肉麵','牛肉','很好吃','method7','麵',1,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,21,'拉麵','豬肉','非常好吃','method8','麵',1,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (0,32,'排骨飯a','豬肉',null,null,'111',222,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,115,'111111111','雞肉',null,null,null,0,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (0,39,'排骨飯b','豬肉',null,null,'111',1,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (1,116,'222222','雞肉',null,null,null,0,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (0,50,'排骨飯d','雞肉','5555555','5555555','555',111,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (21,48,'排骨飯d','雞肉','5555555','5555555','555',111,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (0,22,'水餃bbbbb','雞肉',null,null,null,0,null,null,null,null);
Insert into SEMINAR.RECIPE (MEMBER_NO,RECIPE_ID,RECIPE_NAME,CATEGORY,RECIPE_DESC,METHOD,INGREDIENTS_A,GRAM_A,INGREDIENTS_B,INGREDIENTS_C,INGREDIENTS_D,FILENAME) values (21,26,'水餃c','雞肉',null,null,null,0,null,null,null,null);
--------------------------------------------------------
--  DDL for Index RECIPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SEMINAR"."RECIPE_PK" ON "SEMINAR"."RECIPE" ("RECIPE_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table RECIPE
--------------------------------------------------------

  ALTER TABLE "SEMINAR"."RECIPE" MODIFY ("RECIPE_ID" NOT NULL ENABLE);
  ALTER TABLE "SEMINAR"."RECIPE" ADD CONSTRAINT "RECIPE_PK" PRIMARY KEY ("RECIPE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
