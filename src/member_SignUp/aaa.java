package member_SignUp;

public class aaa {

	public static void main(String[] args) {
		
		
		
		
		String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		StringBuffer buffer = new StringBuffer();

		for (int i = 1; i <= 10; i++) {
			
			char random = chars.charAt((int) (Math.random() * 62));
			String password = String.valueOf(random);
//			buffer.append(random);
		}
		System.out.println(buffer.toString());
		
	}

}
