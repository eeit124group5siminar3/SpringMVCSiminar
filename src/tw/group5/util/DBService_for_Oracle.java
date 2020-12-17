package tw.group5.util;

import org.hibernate.id.insert.IdentifierGeneratingInsert;

public class DBService_for_Oracle {
	public static final String host = "127.0.0.1";
	public static final String DB_ORACLE = "ORACLE";

	public static final String DB_TYPE = DB_ORACLE;


	private static final String DBURL_Oracle = "jdbc:oracle:thin:@127.0.0.1:1521/XEPDB1";
	public static final String USERID_Oracle = "seminar";
	public static final String PSWD_Oracle = "seminar";


	private static final String DROP_PRODUCT = "DROP TABLE PRODUCT";

	private static final String DROP_PRODUCTCATEGORY = "DROP TABLE PRODUCTCATEGORY";
	private static final String DROP_PRODUCTFAVORITE = "DROP TABLE PRODUCTFAVORITE";

	private static final String DROP_ORDERFORM = "DROP TABLE ORDERFORM";

	private static final String DROP_ORDERDETAILS = "DROP TABLE  ORDERDETAILS ";

	private static final String CREATE_Product_Oracle = "Create TABLE PRODUCT ("
			+"PRODUCTID NUMBER(38,0) generated always as identity (start with 1 increment by 1 noCache) primary key not null," 
			+"PRODUCT VARCHAR2(50 BYTE)," 
		    +"PRODUCTERID NUMBER REFERENCES MEMBER_SIGNUP(MEMBER_NO) on DELETE cascade," 
			+"STOCK NUMBER(38,0)," 
			+"CONTENT NUMBER(38,0)," 
			+"UNIT VARCHAR2(12 BYTE)," 
			+"PRICE NUMBER(12)," 
			+"DISCOUNT NUMBER(12,2)," 
			+"ADDEDDATE DATE," 
			+"SHELFTIME NUMBER(12,0)," 
			+"COVERIMAGE BLOB," 
			+"FILENAME VARCHAR2(255 BYTE)," 
			+"DESCRIPTION VARCHAR2(255 BYTE)," 
			+"CATEGORY NUMBER(20),"
			+"VIEWS NUMBER(20),"
			+"SOLD NUMBER(20),"
			+"STATUS NUMBER(2),"
			+"SCORE NUMBER(3,2),"
			+"SCORENUM NUMBER(20),"
			+"EXPIREDDATE DATE"
			+ " ) ";

//	private static final String CREATE_ProductCategory_Oracle = "CREATE TABLE PRODUCTCATEGORY (	"
//			+"ID NUMBER(20,0) generated always as identity (start with 1 increment by 1 noCache) primary key not null," 
//			+"NAME VARCHAR2(20 BYTE)"
//			+ " ) ";
	
	private static final String CREATE_OrderForm_Oracle = " CREATE TABLE ORDERFORM (" 
			+"ORDERID NUMBER(20,0) generated always as identity (start with 1 increment by 1 noCache) primary key not null," 
			+"BUYERID NUMBER REFERENCES MEMBER_SIGNUP(MEMBER_NO) on DELETE cascade," 
			+"BUYERNAME VARCHAR2(255 BYTE),"
			+"ADDRESS VARCHAR2(100 BYTE),"
			+"TEL VARCHAR2(255 BYTE)," 
			+"BNO VARCHAR2(20 BYTE)," 
			+"TOTAL NUMBER(20)," 
			+"ORDERDATE DATE,"
			+"SHIPPINGTIME NUMBER(20)"
			+ " )";
	
	private static final String CREATE_OrderDetails_Oracle = "Create Table ORDERDETAILS ("
			+"ITEMID NUMBER(20,0) generated always as identity (start with 1 increment by 1 noCache) primary key not null," 
			+"ORDERID NUMBER(20,0) REFERENCES ORDERFORM(ORDERID) on DELETE cascade," 
			+"PRODUCTID NUMBER(38,0)," 
			+"PRODUCTERID NUMBER REFERENCES MEMBER_SIGNUP(MEMBER_NO) on DELETE cascade," 
			+"DESCRIPTION VARCHAR2(255 BYTE)," 
			+"AMOUNT NUMBER(38,0)," 
			+"UNITPRICE NUMBER(12)," 
			+"DISCOUNT NUMBER(12,2)," 
			+"STATUS NUMBER(20,0)," 
			+"SHIPPINGDATE DATE"
			+ " )";
	
	private static final String CREATE_ProductFavorite_Oracle = "CREATE TABLE PRODUCTFAVORITE (	"
	+"ID NUMBER(20,0) generated always as identity (start with 1 increment by 1 noCache) primary key not null," 
	+"USERID NUMBER(38,0),"
	+"PRODUCTID NUMBER(38,0),"
	+"STATUS NUMBER(20,0)"
	+ " ) ";

	
//	private static final String[] INSERT_ProductCategory_ORACLE = {"葉菜","根莖","瓜果","茶葉","水果"};



	public static String getDropProduct() {
		String drop = DROP_PRODUCT;
		return drop;
	}

	public static String getCreateProduct() {
		String create = CREATE_Product_Oracle;
		return create;
	}
	
	public static String getDropProductCategory() {
		String drop = DROP_PRODUCTCATEGORY;
		return drop;
	}

//	public static String getCreateProductCategory() {
//		String create = CREATE_ProductCategory_Oracle;
//		
//		return create;
//	}

	public static String getDropOrderForm() {
		String drop = DROP_ORDERFORM;
		return drop;
	}

	public static String getCreateOrderFrom() {
		String create = CREATE_OrderForm_Oracle;
		return create;
	}
	
	
	public static String getDropOrderDetails() {
		String drop = DROP_ORDERDETAILS;
		return drop;
	}

	public static String getCreateOrderDetails() {
		String create = CREATE_OrderDetails_Oracle;
		return create;
	}
	
//	public static String[] getInsertProductCategory() {
//		String[] insert=INSERT_ProductCategory_ORACLE;
//		return insert;
//	}
	
	public static String getDbUrl() {
		String url = DBURL_Oracle;
		return url;
	}

	public static String getUser() {
//		String user = "hr";
		return USERID_Oracle;
	}

	public static String getPassword() {
//		String pswd = "hr";
		return PSWD_Oracle;
	}
	
	public static String getDropProductFavorite() {
		String drop = DROP_PRODUCTFAVORITE;
		return drop;
	}

	public static String getCreateProductFavorite() {
		String create = CREATE_ProductFavorite_Oracle;
		return create;
	}

}
