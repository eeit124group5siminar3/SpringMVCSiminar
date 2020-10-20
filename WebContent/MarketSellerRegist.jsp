<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% 
response.setContentType("text/html;charset=UTF-8");
response.setHeader("Cache-Control","no-cache"); // HTTP 1.1
response.setHeader("Pragma","no-cache"); // HTTP 1.0
response.setDateHeader ("Expires", -1); // Prevents caching at the proxy server
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
fieldset {
	width: 500px;
	border: 3px double red;
}
</style>
<body>
	<form action="./MarketSellerServlet" method="post"
		onsubmit="submitTest();">
		<fieldset>

			<legend>個人資料</legend>
			<div>
				<label>暱稱:</label> <input type="text" id="account" name="reg_seller"
					size="20" onblur="checkname()"> <span id="idspName"></span><br />
			</div>
			<hr>
			<div>
				<label>信箱(帳號)</label> <input type="text" id="email"
					name="reg_seller" onblur="checkemail()"> <span
					id="idspEmail"></span><br />
			</div>
			<hr>
			<div>
				<label>密碼:</label> <input type="password" id="pwd" maxlength="15"
					name="reg_seller" onblur="checkpassword()"> <span
					id="idspPwd"></span><br />
			</div>
			<div id="divp">
				<span>(1.不可空白,2.至少8個字且必須包含英文字母、數字)</span>
				<hr>
			</div>

			<div>
				<label>確認密碼:</label> <input type="password" id="pwd2" maxlength="15"
					onblur="checkpassword2()"> <span id="idspPwd2"></span><br />
			</div>
			<hr>
			<div>
				<label>手機:</label> <input type="tel" id="cellphone"
					name="reg_seller" onblur="checkcellphone()"> <span
					id="idspCell"></span><br />
			</div>
			<hr>
			<div>
				<label>地址:</label> <input type="text" id="address" name="reg_seller"
					onblur="checkaddres()"> <span id="idspAdd"></span><br />

			</div>


		</fieldset>


		<div class="st2">
			<input type="submit" name="submit" value="送出">
		</div>

		<script>
          function checkname(){
                //取得account元素
                let theNameOBJ =document.getElementById("account");
                //取得account元素值
                let theNameOBJVal =theNameOBJ.value;
                let sp =document.getElementById("idspName");
                
                
                
                if(theNameOBJVal==""){
                    sp.innerHTML="<font color='red'>名稱不可為空白</font>";
                    return false;
                }
                else {
                    sp.innerHTML="<font color='green'>OK</font>";
                }
          }
          function checkemail(){
              let theEmailOBJ = document.getElementById("email");
              let theEmailOBJVal = theEmailOBJ.value;
              let sp =document.getElementById("idspEmail");
              let rex =/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;

              if(theEmailOBJVal==""){
                sp.innerHTML="<font color='red'>信箱不能空白</font>";
                return false;
              }
              else if(rex.test(theEmailOBJVal)){
                  sp.innerHTML="<font color='green'>OK</font>";
                  
              }
              else {
                    sp.innerHTML="<font color='red'>格式錯誤</font>";
                    return false;
                }
          }

          function checkpassword(){
              let thePasswordOBJ = document.getElementById("pwd");
              let thePasswordOBJVal = thePasswordOBJ.value;
              let thePasswordValLen = thePasswordOBJVal.length;
              let sp =document.getElementById("idspPwd");
              let flag1=false,flag2=false
              
              if(thePasswordOBJVal==""){
                sp.innerHTML="<font color='red'>密碼不可為空白</font>";
                return false;
              }
              else if(thePasswordValLen>=8){
                for(let i=0;i<thePasswordValLen;i++) {
                        let ch =thePasswordOBJVal.charAt(i).toUpperCase();
                        if (ch>="A" && ch<="Z" ) {
                            
                            flag1=true;
                        }
                         if (flag1) break;
    
                    }
                    if (flag1) 
                        sp.innerHTML="<font color='green'>OK</font>";
                        else{
                        sp.innerHTML="<font color='red'>必須包含英文字母、數字</font>";
                        return false;
                        }
                 
              }else {
                    sp.innerHTML="<font color='red'>密碼長度至少8個</font>";
                    return false;
                }           
          }
          function checkpassword2(){
            let thePasswordOBJ = document.getElementById("pwd");
            let thePasswordOBJVal = thePasswordOBJ.value;
            let thePasswordOBJ2 =document.getElementById("pwd2");
            let thePasswordOBJVal2 = thePasswordOBJ2.value;
            let sp =document.getElementById("idspPwd2");
            if(thePasswordOBJVal2==""){
                sp.innerHTML="<font color='red'>不可為空白</font>";
                return false;
              }

            else if(thePasswordOBJVal2==thePasswordOBJVal){
                  sp.innerHTML="<font color='green'>OK</font>";
            }else{
                sp.innerHTML="<font color='red'>兩次密碼不相同</font>";
                return false;
            }
          }
          function checkcellphone(){
              let theCellphoneOBJ = document.getElementById("cellphone");
              let theCellphoneOBJVal =theCellphoneOBJ.value;
              let sp =document.getElementById("idspCell");
           if(theCellphoneOBJVal==""){
                sp.innerHTML="<font color='red'>不可為空白</font>";
                return false;
              }
              else{
                sp.innerHTML="<font color='green'>OK</font>";
              }
          }
           function checkaddres(){
            let theAddressOBJ = document.getElementById("address");
              let theAddressOBJVal =theAddressOBJ.value;
              let sp =document.getElementById("idspAdd");
            if(theAddressOBJVal==""){
                sp.innerHTML="<font color='red'>不可為空白</font>";
                return false;
              }
              else{
                sp.innerHTML="<font color='green'>OK</font>";
              }
           }     
//            function submitTest(){
//                //取得account元素
//                let theNameOBJ =document.getElementById("account");
//                //取得account元素值
//                let theNameOBJVal =theNameOBJ.value;
//                let sp =document.getElementById("idspName"); 
//                if(theNameOBJVal==""){
//                    sp.innerHTML="<font color='red'>名稱不可為空白</font>";
//                    return false;
//                }
               
             
//                let theEmailOBJ = document.getElementById("email");
//                let theEmailOBJVal = theEmailOBJ.value;
//                let sp =document.getElementById("idspEmail");
//                let rex =/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/;

//                if(theEmailOBJVal==""){
//                 sp.innerHTML="<font color='red'>信箱不能空白</font>";
//                  return false;
//                }
//                else if(rex.test(theEmailOBJVal)){
//                   sp.innerHTML="<font color='green'>OK</font>";
//                    return true;
//                }
//                else {
//                      sp.innerHTML="<font color='red'>格式錯誤</font>";
//                      return false;
//                  }
//            }


            
        </script>

	</form>
</body>
</html>