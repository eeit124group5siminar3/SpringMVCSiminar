
  CREATE TABLE "SEMINAR"."ACTSIGNUP" 
   (	"ACTID" NUMBER NOT NULL ENABLE, 
	"SIGNSTADATE" DATE, 
	"SIGNSTATIME" TIMESTAMP (6), 
	"SIGNENDDATE" DATE, 
	"SIGNENDTIME" TIMESTAMP (6), 
	"ACTNUM" NUMBER(5,0), 
	"SIGSTAT" NVARCHAR2(50), 
	 PRIMARY KEY ("ACTID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  TABLESPACE "USERS"  ENABLE, 
	 FOREIGN KEY ("ACTID")
	  REFERENCES "SEMINAR"."ACTIVEFARMER" ("ACTID") ENABLE
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;

