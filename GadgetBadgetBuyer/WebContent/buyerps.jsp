<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ page import="model.Buyer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Buyer Client Side</title>

<link rel="stylesheet" href="View/bootstrap.min.css">
<script src="Components/jquery-3.6.0.min.js"></script>
<script src="Components/buyers.js"></script>
<script src="Components/boostrap.min.js"></script>

<link rel="stylesheet" href="View/newboos.css">

<!------ Include the above in your HEAD tag ---------->

<link href="https://fonts.googleapis.com/css?family=Oleo+Script:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Teko:400,700"
	rel="stylesheet">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">

</head>
<body>

	<section id="contact">
		<div class="container">
			<div class="contact-section">
				<div class="row">
					<!-- css -->
					<div class="section-content">
						<h1 class="section-header">
							Products in <span class="content-header wow fadeIn "
								data-wow-delay="0.2s" data-wow-duration="2s"> Gadget
								Badget System</span>
						</h1>
						<h3>New technological products from us</h3>
					</div>
					<div class="col-6">
						<div class="leftside">
							<form id="formBuyer" name="formBuyer">
								<div class="col-md-6 form-line">
									<div class="form-group">
										<label for="BuyerName">Buyer Name</label> <input id="bName"
											name="bName" type="text" class="form-control form-control-sm">
										<br>
									</div>
									<div class="form-group">
										<label for="BuyerAddress">Buyer Address</label> <input
											id="bAddress" name="bAddress" type="text"
											class="form-control form-control-sm"> <br>
									</div>
									<div class="form-group">
										<label for="BuyerEmail">Buyer Email</label> <input id="bEmail"
											name="bEmail" type="text"
											class="form-control form-control-sm"> <br>
									</div>
									<div class="form-group">
										<label for="BuyerDate">Buyer Date</label> <input id="bDate"
											name="bDate" type="text" class="form-control form-control-sm">
										<br>
									</div>
									<div class="form-group">
										<label for="PhoneNo">Buyer Phone Num</label> <input id="pNo"
											name="pNo" type="text" class="form-control form-control-sm">
										<br>
									</div>
									<div id="savedBu">
										<input id="btnSave" name="btnSave" type="button" value="Save"
											class="btn btn-outline-warning">
									</div>
									<input type="hidden" id="hidBuyerIDSave" name="hidBuyerIDSave"
										value="">
								</div>
							</form>
							<div id="alertSuccess" class="alert alert-success"></div>
							<div id="alertError" class="alert alert-danger"></div>
							<br>
						</div>
					</div>

					<div class="col-6">
						<div class="rightside">
							<div id="divBuyerGrid">
								<%
								Buyer buyerObj = new Buyer();
								out.print(buyerObj.readBuyers());
								%>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>