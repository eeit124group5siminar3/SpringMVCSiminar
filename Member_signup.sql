CREATE TABLE MEMBER_SIGNUP(
MEMBER_NO VARCHAR2(255) not null, 
MEMBER_EMAIL VARCHAR2(225) not null, 
MEMBER_PASSWORD VARCHAR2(50) not null, 
MEMBER_NAME VARCHAR2(225) not null, 
MEMBER_BIRTHDAY DATE not null, 
MEMBER_ID VARCHAR2(20) not null,
MEMBER_CELLPHONE VARCHAR2(225) not null, 
MEMBER_ADDRESS VARCHAR2(100) not null,
MEMBER_GUI_NUMBER NUMBER(8,0),
MEMBER_PERMISSIONS NUMBER(1,0), 
MEMBER_GG NUMBER(5), 
MEMBER_LOCK_ACC VARCHAR2(20 BYTE) 
)