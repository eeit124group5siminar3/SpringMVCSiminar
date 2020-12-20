package tw.group5.util;

public class MarketMakeTable {
	
	public static final String host = "127.0.0.1";
	public static final String DB_ORACLE = "ORACLE";

	public static final String DB_TYPE = DB_ORACLE;

	private static final String DBURL_Oracle = "jdbc:oracle:thin:@127.0.0.1:1521/XEPDB1";
	public static final String USERID_Oracle = "seminar";
	public static final String PSWD_Oracle = "seminar";

	// 刪除活動表格ACTFARMER
	private static final String DROP_MARKET_ORDER = "DROP TABLE MARKET_ORDER";
	// 刪除活動訂單ACTORD
	private static final String DROP_ACTORD = "DROP TABLE ACTORD";

	
	
	// 新增活動表格ACTFARMER
	private static final String CREATE_ACTFARMER_ORACLE = "CREATE TABLE MARKET_ORDER ("
			+"OID NUMBER(38,0) generated always as identity (start with 1 increment by 1 noCache) primary key not null,"
			+"CELLPHONE VARCHAR2(300 BYTE)," 
			+"BUYER VARCHAR2(255 BYTE)," 
			+"BUY_TIME DATE," 
			+"ADDRESS VARCHAR2(255 BYTE)," 
			+"BUYERID NUMBER(38,0)," 
			+"ALLPRICE NUMBER(38,0)"
			+")";

	// 新增活動訂單ACTORD
	private static final String CREATE_ACTORD_ORACLE = "Create Table market_order_detail ("
			+"detailId NUMBER(38,0) generated always as identity (start with 1 increment by 1 noCache) primary key not null,"
			+"MEMNAME VARCHAR2(255 BYTE)," 
			+"MEMTEL VARCHAR2(255 BYTE)," 
			+"MEMEMAIL VARCHAR2(20 BYTE),"
			+"ACTID NUMBER(38,0) REFERENCES ACTFARMER(ACTID) on DELETE cascade," 
			+"ORDACTNUM NUMBER(3,0),"
			+"TOTALPRICE NUMBER(10,2)," 
			+"ORDSTATE NUMBER(2,0)," 
			+"ORDTIME TIMESTAMP (6)," 
			+"MEMNO NUMBER(10,0),"
			+"PAYWAY VARCHAR2(200 BYTE),"
			+"ACTORDREMARKS CLOB"
			+" ) ";

	
	
	public static String getDropActfarmer() {
		String drop=DROP_ACTFARMER;
		return drop;
	}
	
	public static String getDropActord() {
		String drop=DROP_ACTORD;
		return drop;
	}
	
	public static String getCreateActfarmer() {
		String create = CREATE_ACTFARMER_ORACLE;
		return create;
	}
	
	public static String getCreateActord() {
		String create = CREATE_ACTORD_ORACLE;
		return create;
	}

	public static String getDburlOracle() {
		return DBURL_Oracle;
	}

	public static String getUseridOracle() {
		return USERID_Oracle;
	}

	public static String getPswdOracle() {
		return PSWD_Oracle;
	}


}
