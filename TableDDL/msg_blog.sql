CREATE TABLE MSG_BLOG 
(
  MSG_MEMBER_NO NUMBER 
, MSG_CONTENT VARCHAR2(600 BYTE) 
, BLOG_ID NUMBER NOT NULL 
, ID NUMBER GENERATED ALWAYS AS IDENTITY INCREMENT BY 1 MAXVALUE 999999 MINVALUE 1 NOCACHE ORDER NOT NULL 
, MSG_DATE DATE 
, MEMBER_NAME VARCHAR2(500 BYTE) 
, CONSTRAINT MSG_BLOG_PK PRIMARY KEY 
  (
    ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX MSG_BLOG_PK ON MSG_BLOG (ID ASC) 
      LOGGING 
      TABLESPACE USERS 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        NEXT 1048576 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE USERS 
PCTFREE 10 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NO INMEMORY 
NOPARALLEL;

ALTER TABLE MSG_BLOG
ADD CONSTRAINT MSG_BLOG_FK1 FOREIGN KEY
(
  BLOG_ID 
)
REFERENCES BLOG
(
  BLOG_ID 
)
ON DELETE CASCADE ENABLE;
