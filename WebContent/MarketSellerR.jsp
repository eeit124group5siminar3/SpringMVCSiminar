<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
	<fieldset>

		<legend>個人資料</legend>

		<form action="./MarketServlet" method="post">
			<div>
				<label>暱稱:</label> <input type="text" id="account" name="name"
					size="20"> <span id="idspName"></span><br />
			</div>
			<hr>
			<div>
				<label>信箱(帳號)</label> <input type="text" id="email" name="email">
				<span id="idspEmail"></span><br />
			</div>
			<hr>
			<div>
				<label>密碼:</label> <input type="password" id="pwd" maxlength="15"
					name="password"> <span id="idspPwd"></span><br />
			</div>
			<div id="divp">
				<span>(1.不可空白,2.至少8個字且必須包含英文字母、數字)</span>
				<hr>
			</div>

			<div>
				<label>確認密碼:</label> <input type="password" id="pwd2" maxlength="15">
				<span id="idspPwd2"></span><br />
			</div>
			<hr>
			<div>
				<label>手機:</label> <input type="tel" id="cellphone" name="cellphone">
				<span id="idspCell"></span><br />
			</div>
			<hr>
			<div>
				<label>地址:</label> <input type="text" id="address" name="address">
				<span id="idspAdd"></span><br />

			</div>

			<div class="st2">
				<input type="submit" name="submit" value="送出">
			</div>

		</form>
	</fieldset>

</body>
</html>