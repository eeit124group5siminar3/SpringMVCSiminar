package tw.group5.member_SignUp;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import net.bytebuddy.asm.Advice.This;

public class text {

	public static void main(String[] args) {

		
		String[] check = new String[5];

		String a = "a";
		String b = "b";
		String c = "c";
		String d = "d";
		String e = "e";
		
	
		
		if (a.equals("a")) {
			check[0] = "2";	
		}
		if (b.equals("b")) {
			check[1] = "3";		
		}
		if (c.equals("c")) {
			check[2] = "12";
		}
		if (d.equals("d")) {
			check[3] = "6";
		}
		if (e.equals("e")) {
			check[4] = "4";
		}
		
		
		
		for(int i=0 ; i<check.length;i++) {
			System.out.println(check[i]);
		}
		
		
		
	}

}
