package member_SignUp;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

import org.omg.CORBA.PRIVATE_MEMBER;

import com.sun.java_cup.internal.runtime.Symbol;

import active.test;

public class TEST {

	public static void main(String[] args) {	

		int ok=0;
		
		Map<String, Integer> map = new HashMap<>();
		map.put("A", 10);
		map.put("B", 11);
		map.put("C", 12);
		map.put("D", 13);
		map.put("E", 14);
		map.put("F", 15);
		map.put("G", 16);
		map.put("H", 17);
		map.put("I", 34);
		map.put("J", 18);
		map.put("K", 19);
		map.put("L", 20);
		map.put("M", 21);
		map.put("N", 22);
		map.put("O", 35);
		map.put("P", 23);
		map.put("Q", 24);
		map.put("R", 25);
		map.put("S", 26);
		map.put("T", 27);
		map.put("U", 28);
		map.put("V", 29);
		map.put("W", 32);
		map.put("X", 30);
		map.put("Y", 31);
		map.put("Z", 33);
		
		Scanner aa = new Scanner(System.in);
		String a = aa.nextLine().toUpperCase();

		
		
		if(a.length() == 10) {		
			//把輸入的資料丟到LIST
			char[] id_array=a.toCharArray();
			
			//取第一個英文字母
			char id_char = id_array[0];
			String id1=String.valueOf(id_char);

			System.out.println(id1);
			
			//轉型成INT型態
			int id_1= Integer.valueOf(map.get(id1)); //取英文對應MAP的值
			int id_x1=id_1/10; //取出十位數
			int id_xx1=id_1 % 10; //取出個位數
			int id_2= Integer.valueOf(a.substring(1, 2));
			int id_3= Integer.valueOf(a.substring(2, 3));
			int id_4= Integer.valueOf(a.substring(3, 4));
			int id_5= Integer.valueOf(a.substring(4, 5));
			int id_6= Integer.valueOf(a.substring(5, 6));
			int id_7= Integer.valueOf(a.substring(6, 7));
			int id_8= Integer.valueOf(a.substring(7, 8));
			int id_9= Integer.valueOf(a.substring(8, 9));
			int id_10= Integer.valueOf(a.substring(9, 10));
			System.out.println(id_1);
			System.out.println(id_x1+","+id_xx1+","+id_2+","+id_3+","+id_4+","+id_5+","+id_6+","+id_7+","+id_8+","+id_9+","+id_10);
			
			
			ok=((id_x1*1)+(id_xx1*9)+(id_2*8)+(id_3*7)+(id_4*6)+(id_5*5)+(id_6*4)+(id_7*3)+(id_8*2)+(id_9*1));
			int okk=10-(ok%10);
			System.out.println(ok);
			System.out.println(okk);

			
			
			
		}
	}
	
//	public static void main(String[] args) {
//		Scanner a =new Scanner(System.in);
//		String s= a.nextLine().toUpperCase();
////		String s = "A323456789";
//		String checkHead = "ABCDEFGHJKLMNPQRSTUVWXYZIO"; // 字母代號對照表
//		if (s.length()==10){
//			char[] c = s.toUpperCase().toCharArray();	// 建立 c 陣列，同時將s字串轉大寫後，轉成字元陣列放入 c 陣列
//			int[] ID = new int [c.length];			// 建立一個運算用的整數陣列，空間為 c 的字元個數
//			// 驗證首位字母是否合法 (該字元是否能在checkHead[]找到), 驗證第一位是否為 1 or 2 (1=男生, 2=女生)
//			if (checkHead.indexOf(c[0]) == -1 || (c[1] != '1' && c[1] != '2'))
//				System.out.println("格式不合法");
//			else{
//				int sum=0;
//				ID[0] = checkHead.indexOf(c[0])+10;	// 第一個英文字運算
//				sum+=ID[0]/10;				// .. 將商數加總 sum += ID[0]/10 
//				ID[0]%=10;				// .. 取餘數放回 ID[0] 以便之後的運算
//				for (int i=1; i<10; i++)		// 將身分證後9碼轉成整數型態 (ASCII碼-48)
//					ID[i] = (int)c[i]-48;
//				for (int i=0; i<9; i++){		// 代入公式:
//					ID[i]*=(9-i);			// 總和 sum += (ID[0])*9 + ID[1]*8 + ID[2]*7 + ... + ID[9]*1
//					sum+=ID[i];
//				}
//				// 檢查(10-sum%10)是否相等於檢查碼，且 sum%10(餘數)為0時，檢查碼為0 => (10-sum%10)%10
//				if ((10-sum%10)%10 == ID[9])
//					System.out.println("合法.");
//				else
//					System.out.println("不合法");
//			}
//		}
//		else
//			System.out.println("長度不合法");
//	}


}
