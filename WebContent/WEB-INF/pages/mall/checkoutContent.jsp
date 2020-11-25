<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<div class="row justify-content-center">
		<div class="col-xl-7 ftco-animate">
			<form action="#" class="billing-form">

				<h3 class="mb-4 billing-heading">結帳資訊</h3>
				<div class="row align-items-end">
					<div class="col-md-6">
						<div class="form-group">
							<label for="firstname">收件人姓名</label> <input type="text"
								class="form-control" placeholder="">
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="phone">聯絡電話</label> <input type="text"
								class="form-control" placeholder="">
						</div>
					</div>
					<!-- 					<div class="col-md-6"> -->
					<!-- 						<div class="form-group"> -->
					<!-- 							<label for="lastname">Last Name</label> <input type="text" -->
					<!-- 								class="form-control" placeholder=""> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<div class="w-100"></div>
					<div class="col-md-12">
						<div class="form-group">
							<label for="country">收件地址</label> <input type="text"
								class="form-control" placeholder="">
							<!-- 							<div class="select-wrap"> -->
							<!-- 								<div class="icon"> -->
							<!-- 									<span class="ion-ios-arrow-down"></span> -->
							<!-- 								</div> -->
							<!-- 								<select name="" id="" class="form-control"> -->
							<!-- 									<option value="">France</option> -->
							<!-- 									<option value="">Italy</option> -->
							<!-- 									<option value="">Philippines</option> -->
							<!-- 									<option value="">South Korea</option> -->
							<!-- 									<option value="">Hongkong</option> -->
							<!-- 									<option value="">Japan</option> -->
							<!-- 								</select> -->
							<!-- 							</div> -->
						</div>
					</div>
					<div class="w-100"></div>
					<!-- 					<div class="col-md-6"> -->
					<!-- 						<div class="form-group"> -->
					<!-- 							<label for="streetaddress">Street Address</label> <input -->
					<!-- 								type="text" class="form-control" -->
					<!-- 								placeholder="House number and street name"> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="col-md-6"> -->
					<!-- 						<div class="form-group"> -->
					<!-- 							<input type="text" class="form-control" -->
					<!-- 								placeholder="Appartment, suite, unit etc: (optional)"> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="w-100"></div> -->
					<!-- 					<div class="col-md-6"> -->
					<!-- 						<div class="form-group"> -->
					<!-- 							<label for="towncity">Town / City</label> <input type="text" -->
					<!-- 								class="form-control" placeholder=""> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<!-- 					<div class="col-md-6"> -->
					<!-- 						<div class="form-group"> -->
					<!-- 							<label for="postcodezip">Postcode / ZIP *</label> <input -->
					<!-- 								type="text" class="form-control" placeholder=""> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
					<div class="w-100"></div>

					<div class="col-md-6">
						<div class="form-group">
							<label for="country">收件時間</label>
							<div class="select-wrap">
								<div class="icon">
									<span class="ion-ios-arrow-down"></span>
								</div>
								<select name="" id="" class="form-control">
									<option value="">早上</option>
									<option value="">中午</option>
									<option value="">下午</option>
									<option value="">晚上</option>
								</select>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="emailaddress">統一編號</label> <input type="text"
								class="form-control" placeholder="">
						</div>
					</div>
					<!-- 					<div class="w-100"></div> -->
					<!-- 					<div class="col-md-12"> -->
					<!-- 						<div class="form-group mt-4"> -->
					<!-- 							<div class="radio"> -->
					<!-- 								<label class="mr-3"><input type="radio" name="optradio"> -->
					<!-- 									Create an Account? </label> <label><input type="radio" -->
					<!-- 									name="optradio"> Ship to different address</label> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 					</div> -->
				</div>
			</form>
			<!-- END -->
		</div>
		<div class="col-xl-5">
			<div class="row mt-5 pt-3">
				<div class="col-md-12 d-flex mb-5">
					<div class="cart-detail cart-total p-3 p-md-4">
						<h3 class="billing-heading mb-4">總價</h3>
						<p class="d-flex">
							<span>小計</span> <span>${ShoppingCart.subtotal}</span>
						</p>
						<!-- 						<p class="d-flex"> -->
						<!-- 							<span>Delivery</span> <span>$0.00</span> -->
						<!-- 						</p> -->
						<p class="d-flex">
							<span>折扣</span> <span>${ShoppingCart.total-ShoppingCart.subtotal}</span>
						</p>
						<hr>
						<p class="d-flex total-price">
							<span>總計</span> <span>${ShoppingCart.total}</span>
						</p>
						<p>
							<a href="#" class="btn btn-primary py-3 px-4">結帳</a>
						</p>
					</div>
				</div>
				<!-- 				<div class="col-md-12"> -->
				<!-- 					<div class="cart-detail p-3 p-md-4"> -->
				<!-- 						<h3 class="billing-heading mb-4">Payment Method</h3> -->
				<!-- 						<div class="form-group"> -->
				<!-- 							<div class="col-md-12"> -->
				<!-- 								<div class="radio"> -->
				<!-- 									<label><input type="radio" name="optradio" class="mr-2"> -->
				<!-- 										Direct Bank Tranfer</label> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 						<div class="form-group"> -->
				<!-- 							<div class="col-md-12"> -->
				<!-- 								<div class="radio"> -->
				<!-- 									<label><input type="radio" name="optradio" class="mr-2"> -->
				<!-- 										Check Payment</label> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 						<div class="form-group"> -->
				<!-- 							<div class="col-md-12"> -->
				<!-- 								<div class="radio"> -->
				<!-- 									<label><input type="radio" name="optradio" class="mr-2"> -->
				<!-- 										Paypal</label> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 						<div class="form-group"> -->
				<!-- 							<div class="col-md-12"> -->
				<!-- 								<div class="checkbox"> -->
				<!-- 									<label><input type="checkbox" value="" class="mr-2"> -->
				<!-- 										I have read and accept the terms and conditions</label> -->
				<!-- 								</div> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 						<p> -->
				<!-- 							<a href="#" class="btn btn-primary py-3 px-4">Place an order</a> -->
				<!-- 						</p> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
		</div>
		<!-- .col-md-8 -->
	</div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate-3.0.1.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/jquery.waypoints.min.js"></script>
<script src="js/jquery.stellar.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script src="js/jquery.animateNumber.min.js"></script>
<script src="js/bootstrap-datepicker.js"></script>
<script src="js/scrollax.min.js"></script>
<!--   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--   <script src="js/google-map.js"></script> -->
<script src="js/main.js"></script>
<jsp:include page="../js/mall.jsp" />