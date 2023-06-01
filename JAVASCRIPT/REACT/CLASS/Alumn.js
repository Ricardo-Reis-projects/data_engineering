const Person = require("./Person");


//Criando a classe Alumn e herdando os campos da classe Person
class Alumn extends Person {

    constructor(name, age, turma) {
        //importando campos nome e idade da classe Person
        super(name, age)
        this.turma = turma;
    }

    /*
    //Sobescrevendo o metodo greetings da classe Person, somente para a classe Alumn
    greetings() {
        console.log("Olá, tudo bom? Menu nome é", this.name, "e estou na turma:", this.turma );
    }
    */
}

module.exports = Alumn;