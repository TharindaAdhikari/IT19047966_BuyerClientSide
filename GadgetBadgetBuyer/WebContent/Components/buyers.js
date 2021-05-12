/**
 * 
 */

$(document).ready(function()
{ 
	if ($("#alertSuccess").text().trim() == "") 
 	{ 
 	$("#alertSuccess").hide(); 
 	} 
 	$("#alertError").hide(); 
});

 // SAVE ============================================
$(document).on("click", "#btnSave", function(event) 
{ 
	// Clear alerts---------------------
 	$("#alertSuccess").text(""); 
 	$("#alertSuccess").hide(); 
 	$("#alertError").text(""); 
 	$("#alertError").hide(); 
	// Form validation-------------------
	var status = validateBuyerForm(); 
	if (status != true) 
 	{ 
 		$("#alertError").text(status); 
 		$("#alertError").show(); 
 		return; 
	} 
	// If valid------------------------
 		var type = ($("#hidBuyerIDSave").val() == "") ? "POST" : "PUT"; 
 		
 		$.ajax( 
 	{ 
 		url : "BuyerAPI", 
	 	type : type, 
 		data : $("#formBuyer").serialize(), 
 		dataType : "text", 
 		complete : function(response, status) 
 	{ 
 	onBuyerSaveComplete(response.responseText, status); 
 	} 
 	});
});

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
 	$("#hidBuyerIDSave").val($(this).data("bid")); 
 	$("#bName").val($(this).closest("tr").find('td:eq(0)').text()); 
	$("#bAddress").val($(this).closest("tr").find('td:eq(1)').text()); 
 	$("#bEmail").val($(this).closest("tr").find('td:eq(2)').text()); 
 	$("#bDate").val($(this).closest("tr").find('td:eq(3)').text());
 	$("#pNo").val($(this).closest("tr").find('td:eq(4)').text()); 
});

// DELETE=====================================================
$(document).on("click", ".btnRemove", function(event)
{ 
 $.ajax( 
 { 
 url : "BuyerAPI", 
 type : "DELETE", 
 data : "bID=" + $(this).data("bid"),
 dataType : "text", 
 complete : function(response, status) 
 { 
 onBuyerDeleteComplete(response.responseText, status); 
 } 
 }); 
});


// CLIENT-MODEL================================================================
function validateBuyerForm() 
{ 
	// BuyerName
	if ($("#bName").val().trim() == "") 
 	{ 
 		return "Please Insert Buyer Name."; 
 	} 
	// BuyerAddress
	if ($("#bAddress").val().trim() == "") 
 	{ 
 		return "Please Insert Buyer Address."; 
 	}
 	// BuyerEmail
	if ($("#bEmail").val().trim() == "") 
 	{ 
 		return "Please Insert Buyer Email."; 
 	} 
	// BuyerDate
	if ($("#bDate").val().trim() == "") 
 	{ 
 		return "Please Insert Buyer Date."; 
 	}
 	// BuyerPhoneNo
	if ($("#pNo").val().trim() == "") 
 	{ 
 		return "Please Insert Buyer Phone No."; 
 	}  
return true; 
}

// Function on buyers==========
function onBuyerSaveComplete(response, status)
{ 
	if (status == "success") 
 	{ 
 		var resultSet = JSON.parse(response); 
 		if (resultSet.status.trim() == "success") 
 		{ 
 			$("#alertSuccess").text("Successfully saved."); 
 			$("#alertSuccess").show(); 
 			$("#divBuyerGrid").html(resultSet.data); 
 		} else if (resultSet.status.trim() == "error") 
 		{ 
 			$("#alertError").text(resultSet.data); 
 			$("#alertError").show(); 
 		} 
 	}else if (status == "error") 
 	{ 
 			$("#alertError").text("Error while saving."); 
 			$("#alertError").show(); 
 		} else
 		{ 
 			$("#alertError").text("Unknown error while saving.."); 
 			$("#alertError").show(); 
 		}
 		
 		
 		$("#hidBuyerIDSave").val(""); 
 		$("#formBuyer")[0].reset(); 
}

// function buyer Delete====================

function onBuyerDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divBuyerGrid").html(resultSet.data); 
 } else if (resultSet.status.trim() == "error") 
 { 
 $("#alertError").text(resultSet.data); 
 $("#alertError").show(); 
 } 
 } else if (status == "error") 
 { 
 $("#alertError").text("Error while deleting."); 
 $("#alertError").show(); 
 } else
 { 
 $("#alertError").text("Unknown error while deleting.."); 
 $("#alertError").show(); 
 } 
}




