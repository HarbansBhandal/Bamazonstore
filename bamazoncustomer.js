var mysql = require('mysql');
var inquirer = require('inquirer');
var products = [];

var connection = mysql.createConnection({
	host:'localhost',
	port:3306,
	user:'root',
	password:'hello', //your password boi
	database:'bamazon'
});

connection.query('SELECT * FROM products', function(err,res){
	if (err) throw err;
	for (var i = 0; i < res.length; i++) {
		// products.push('ID: ' + res[i].item_id + '| Item: ' + res[i].product_name + " | Price: $" + res[i].price);
		console.log('ID: ' + res[i].item_id + ' | Item: ' + res[i].product_name + " | Price: $" + res[i].price);
		// console.log(products);
	};
	//line seperator, inquirer just loops 
	// products.push(new inquirer.Separator());

	//NEED THIS
	idChoice();
});

function idChoice(){
	inquirer.prompt([
		{
			type:'input',
			name:'idChoice',
			message:'Input ID of item you wish to purchase:',
		},
		{
			type:'input',
			name:'unitChoice',
			message:'Input amount of units you wish to purchase:',
		}

	]).then(function(answers){
		

		quantityCheck(answers.idChoice, answers.unitChoice);


		

	});
};

function quantityCheck(id, units){
	connection.query('SELECT * FROM products', function(err,res){
		if (err) throw err;

		
		if(res[id-1] === undefined){
			console.log("That's not one of the choices! Do it again!");
			idChoice();
		}else if(units > res[id-1].stock_quantity){
			console.log('Why do you need so many? Try again.');
			idChoice();
		}else{
			updateProduct(id, res[id-1].stock_quantity ,units, res[id-1].product_name, res[id-1].price, res[id-1].product_sales);
		}
	});
};

function updateProduct(id,initialUnits,units,whatYouBought,price,productSales){
	connection.query('UPDATE products SET ? WHERE ?',
		[
			{
				stock_quantity: initialUnits - units,
				product_sales: productSales + price*units
			},
			{
				item_id: id
			}
		],
	 function(err,res){
	 	console.log('\nGet lost. Here is your',units,'unit(s) of',whatYouBought + '.' +'\n'); 	
	 	console.log("That'll be $" + units*price + '.\n');
	 	connection.end();
	 });
}

