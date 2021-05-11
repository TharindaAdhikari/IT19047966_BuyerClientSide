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
	var status = validateItemForm(); 
	if (status != true) 
 	{ 
 		$("#alertError").text(status); 
 		$("#alertError").show(); 
 		return; 
	} 
	// If valid------------------------
 		var type = ($("#hidItemIDSave").val() == "") ? "POST" : "PUT"; 
 		
 		$.ajax( 
 	{ 
 		url : "BuyerAPI", 
	 	type : type, 
 		data : $("#formItem").serialize(), 
 		dataType : "text", 
 		complete : function(response, status) 
 	{ 
 	onItemSaveComplete(response.responseText, status); 
 	} 
 	});
});

// UPDATE==========================================
$(document).on("click", ".btnUpdate", function(event) 
{ 
 	$("#hidItemIDSave").val($(this).data("bid")); 
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
 onItemDeleteComplete(response.responseText, status); 
 } 
 }); 
});


// CLIENT-MODEL================================================================
function validateItemForm() 
{ 
	// CODE
	if ($("#bName").val().trim() == "") 
 	{ 
 		return "Insert Item Code."; 
 	} 
	// NAME
	if ($("#bAddress").val().trim() == "") 
 	{ 
 		return "Insert Item Name."; 
 	}
 	// PRICE-------------------------------
	if ($("#bEmail").val().trim() == "") 
 	{ 
 		return "Insert Item Price."; 
 	} 
	
	// DESCRIPTION------------------------
	if ($("#bDate").val().trim() == "") 
 	{ 
 		return "Insert Item Description."; 
 	}
 	// DESCRIPTION------------------------
	if ($("#pNo").val().trim() == "") 
 	{ 
 		return "Insert Item Descripti."; 
 	}  
return true; 
}

// Function on items==========
function onItemSaveComplete(response, status)
{ 
	if (status == "success") 
 	{ 
 		var resultSet = JSON.parse(response); 
 		if (resultSet.status.trim() == "success") 
 		{ 
 			$("#alertSuccess").text("Successfully saved."); 
 			$("#alertSuccess").show(); 
 			$("#divItemsGrid").html(resultSet.data); 
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
 		
 		
 		$("#hidItemIDSave").val(""); 
 		$("#formItem")[0].reset(); 
}

// function iems Delete====================

function onItemDeleteComplete(response, status)
{ 
if (status == "success") 
 { 
 var resultSet = JSON.parse(response); 
 if (resultSet.status.trim() == "success") 
 { 
 $("#alertSuccess").text("Successfully deleted."); 
 $("#alertSuccess").show(); 
 $("#divItemsGrid").html(resultSet.data); 
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




