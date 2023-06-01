const Person = require("./Person");
const Alumn = require("./Alumn");


//console.log(marcos);
//console.log(marcos.name);

let marcos = new Alumn("Marcos", 30, '1001');
//utilizando o método da classe Person, que foi herdado pelo Alumn
marcos.greetings()


let jose = new Person("Jose", 30);

jose.greetings()

