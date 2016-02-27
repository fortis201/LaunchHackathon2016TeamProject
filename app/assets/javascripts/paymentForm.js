(function paymentModal() {
	console.log('test');

	// TODO: 
	// Make payemnt go to appropriate vendor
	// 

	var 
	formOpen = "<form type='POST' action='/payment'>",
	emailInput = "<input type='text' placeholder='Email Address' name='email' /><br>",
	ccInput = "<input type='text' placeholder='Credit Card Number' name='ccNumber' /><br>",
	cvvInput = "<input type='text' placeholder='CVV' name='cvv' /><br>",
	submitButton = "<input type='submit' value='Submit' />",
	formClose = "</form>";

	document.getElementById('pay').innerHTML = formOpen + emailInput + ccInput + cvvInput + submitButton + formClose;

})()