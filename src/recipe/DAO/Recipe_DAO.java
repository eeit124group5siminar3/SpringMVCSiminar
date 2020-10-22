package recipe.DAO;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import recipe.recipe_bean.Recipe_Obj;

//建構子
public class Recipe_DAO {
	
	DataSource ds=null;
	InitialContext ctxt=null;
	Connection conn=null;
	Recipe_Obj rObj=new Recipe_Obj();
	
	public Recipe_DAO() {
//		System.out.println("enter recipe_DAO");
		try {
			ctxt=new InitialContext();
//			System.out.println("ctxt success");
		} catch (NamingException e) {
			e.printStackTrace();
		}
		try {
			ds=(DataSource)ctxt.lookup("java:comp/env/jdbc/xe");
//			System.out.println("ds success");

		} catch (NamingException e) {
			e.printStackTrace();
		}
		try {
			System.out.println(ds);
			conn=ds.getConnection();
//			System.out.println("conn success");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}                                                  
	
	public boolean insert(Recipe_Obj recipe_check) throws FileNotFoundException {
			String sql="insert into recipe ("
					+ "recipe_id,"     //"concat(\'a\',member_no.nextval)"
					+ "recipe_desc,"
					+ "category,"          //3
					+ "recipe_name,"
					+ "method,"            
					+ "ingredients_A,"		//6
					+ "ingredients_B,"
					+ "ingredients_C,"     
					+ "ingredients_D)"      //9
//					+ "FileName)"
//					+ "data)"
					+ "values(concat(\'a\',Q1.nextval),?,?,?,?,?,?,?,?)";
			Recipe_Obj rObj=new Recipe_Obj();
			
			try (PreparedStatement insert = conn.prepareStatement(sql);
			) {
				conn.setAutoCommit(false);
				System.out.println("set value to DB");
//				System.out.println(rObj.getFileName());
//				File file=new File(rObj.getFileName());
//				FileInputStream fis=new FileInputStream(file);
				
//				insert.setString(1, recipe_check.getRec_id());
				insert.setString(1, recipe_check.getDesc());
				insert.setString(2, recipe_check.getCate());
				insert.setString(3, recipe_check.getName());
				insert.setString(4, recipe_check.getMethod());
				insert.setString(5, recipe_check.getIngredients_A());
				insert.setString(6, recipe_check.getIngredients_B());
				insert.setString(7, recipe_check.getIngredients_C());
				insert.setString(8, recipe_check.getIngredients_D());
//				insert.setString(10,recipe_check.getFileName());
//				insert.setBinaryStream(11,fis);
				
				insert.execute();
				insert.clearParameters();

				conn.commit();
				insert.close();		
		} catch(SQLException e) {
			e.printStackTrace();
			System.out.println("SQL error");

		}
			return true;
	}
	
	
	
  
	public boolean update(Recipe_Obj rObj) {
		String sql="update recipe set recipe_desc=?,category=?,recipe_name=?,method=?,ingredients_A=?,ingredients_B=?,ingredients_C=?,ingredients_D=? where recipe_id=? ";
//				+ "FileName=?  "			//9
//				+ "data=? "
					//11
		
		try (
				PreparedStatement update=conn.prepareStatement(sql);
				){
							
			System.out.println("set value to DB");
//			File file = new File(rObj.getFileName());
//			FileInputStream fis = new FileInputStream(file);
//			System.out.println(rObj.getRec_id());
			update.setString(1, rObj.getDesc());
			update.setString(2, rObj.getCate());
			update.setString(3, rObj.getName());
			update.setString(4, rObj.getMethod());
			update.setString(5, rObj.getIngredients_A());
			update.setString(6, rObj.getIngredients_B());
			update.setString(7, rObj.getIngredients_C());
			update.setString(8, rObj.getIngredients_D());
//			update.setString(9, file.getName());
//			update.setBinaryStream(10, fis);
			update.setString(9, rObj.getRec_id());

			update.executeUpdate();
			update.clearParameters();


		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;

	}
	
	public boolean delete(Recipe_Obj rObj) {
		String sql="delete from recipe where recipe_id=? order by recipe_id";
		try (
				PreparedStatement delete=conn.prepareStatement(sql);
				){
				
			conn.setAutoCommit(false);
			System.out.println("delete data from db");
			delete.setString(1, rObj.getRec_id());

			delete.executeUpdate();
			delete.clearParameters();

			conn.commit();
			delete.close();	

		} catch (Exception e) {
			e.printStackTrace();
		}
		return true;
	}
	
	//搜尋出使用者某個食譜的table
	public ArrayList<Recipe_Obj> partSearch(Recipe_Obj rObj) {
//	public void partSearch(Recipe_Obj rObj) {
		ArrayList<Recipe_Obj> list=new ArrayList<Recipe_Obj>();
		String sql="select "
				+ "recipe_name, "
				+ "recipe_desc, "
				+ "category, "
				+ "method, "
				+ "ingredients_A, "
				+ "ingredients_B, "
				+ "ingredients_C, "
				+ "ingredients_D from recipe "
				+ "where recipe_id =?";
		try (
				PreparedStatement partSearch=conn.prepareStatement(sql);
				){

				conn.setAutoCommit(false);
				partSearch.setString(1,rObj.getRec_id());
				ResultSet rs=partSearch.executeQuery();
				partSearch.clearParameters();
//				System.out.println(rObj.getName());
				
				while(rs.next()) {
//					rObj.setRec_id(rs.getString("recipe_id"));
//					rObj.setDesc(rs.getString("recipe_desc"));
//					rObj.setCate(rs.getString("category"));
//					rObj.setName(rs.getString("recipe_name"));
//					rObj.setMethod(rs.getString("method"));
//					rObj.setIngredients_A(rs.getString("ingredients_A"));
//					rObj.setIngredients_B(rs.getString("ingredients_B"));
//					rObj.setIngredients_C(rs.getString("ingredients_C"));
//					rObj.setIngredients_D(rs.getString("ingredients_D"));
//					rObj.setFileName(rs.getString(9));
//					rObj.setData(rs.getBinaryStream(10));
					Recipe_Obj bean=new Recipe_Obj();
					bean.setName(rs.getString("recipe_name"));
					bean.setDesc(rs.getString("recipe_desc"));
					bean.setCate(rs.getString("category"));
					bean.setMethod(rs.getString("method"));
					bean.setIngredients_A(rs.getString("ingredients_A"));
					bean.setIngredients_B(rs.getString("ingredients_B"));
					bean.setIngredients_C(rs.getString("ingredients_C"));
					bean.setIngredients_D(rs.getString("ingredients_D"));
					bean.setRec_id(rObj.getRec_id());
					
					list.add(bean);
					}	

				conn.commit();
				partSearch.close();	

			} catch (Exception e) {
			e.printStackTrace();
			}
		return list;
	}
	
	//關鍵字搜尋
	public List<Recipe_Obj> ListOfsearch(Recipe_Obj rObj) {
		ArrayList<Recipe_Obj> list=new ArrayList<Recipe_Obj>();
		String sql="select recipe_name, "
				+ "recipe_desc,  "
				+ "method, "
				+ "ingredients_A from recipe "
				+ "where category=?";
//				+ "gram_A, "
//				+ "FileName, "
//				+ "data "
//				+ "
		try (
				PreparedStatement search=conn.prepareStatement(sql);				
				){
				conn.setAutoCommit(false);
				search.setString(1,rObj.getCate());
				ResultSet rs1 = search.executeQuery();
				search.clearParameters();
				
				
				while(rs1.next()) {
					System.out.println(rs1.getString("recipe_name"));
					System.out.println(rs1.getString("recipe_desc"));
					System.out.println(rs1.getString("method"));
					System.out.println(rs1.getString("ingredients_A"));	
					Recipe_Obj bean=new Recipe_Obj();
					bean.setName(rs1.getString("recipe_name"));
					bean.setDesc(rs1.getString("recipe_desc"));
					bean.setMethod(rs1.getString("method"));
					bean.setIngredients_A(rs1.getString("ingredients_A"));
					list.add(bean);
					}	

				
				conn.commit();
				search.close();	

			} catch (Exception e) {
			e.printStackTrace();
			}
		return list;

	}

	//--------搜尋所有資料放入list-------------
	public List<Recipe_Obj> ListOfJavaBean() {
		ArrayList<Recipe_Obj> list=new ArrayList<Recipe_Obj>();		
		try (
			Statement stmt=conn.createStatement();
			ResultSet rs=stmt.executeQuery("select * from recipe order by recipe_id");
			){
			

				while(rs.next()) {
					Recipe_Obj bean=new Recipe_Obj();
					bean.setRec_id(rs.getString("recipe_id"));
					bean.setDesc(rs.getString("recipe_desc"));
					bean.setCate(rs.getString("category"));
					bean.setName(rs.getString("recipe_name"));
					bean.setMethod(rs.getString("method"));
					bean.setIngredients_A(rs.getString("ingredients_A"));
					bean.setIngredients_B(rs.getString("ingredients_B"));
					bean.setIngredients_C(rs.getString("ingredients_C"));
					bean.setIngredients_D(rs.getString("ingredients_D"));
//					bean.setFileName(rs.getString(9));
//					bean.setData(rs.getBinaryStream(10));
						
					list.add(bean);
				}
			}catch (SQLException e) {
				e.printStackTrace();
				throw new RuntimeException("getPageProducts()發生例外: " + e.getMessage());

			}
			return list;
	}
	
	
//--------搜尋所有資料放入Map-------------
//	public Map<String,Recipe_Obj> MapOfJavaBean() {
//		Map<String, Recipe_Obj> map = new HashMap<String, Recipe_Obj>();	
//		try (
//			Statement stmt=conn.createStatement();
//			ResultSet rs=stmt.executeQuery("select * from recipe");
//			){
//				while(rs.next()) {
//					map.put("name",rs.getString("name"));
//					map.put("desc",rs.getString("recipe_desc"));
//					map.put("cate",rs.getString("category"));
//					map.put("rec_id",rs.getString("recipe_id"));
//					map.put("method",rs.getString("method"));
//					map.put("ingredients_A",rs.getString("ingredients_A"));
//					map.put("ingredients_B",rs.getString("ingredients_B"));
//					map.put("ingredients_C",rs.getString("ingredients_C"));
//					map.put("ingredients_D",rs.getString("ingredients_D"));
//				}
//}

}


