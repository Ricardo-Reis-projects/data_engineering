//Criando uma classe Pessoa, e utlizando o medodo constructor para criar 
// seus atributos/ campos
class Person {
    constructor(name, age) {
        this.name = name;
        this.age = age;
    }

    greetings() {
        console.log("Olá, tudo bom? Menu nome é", this.name);
    }

}
//let joao = new Person("joão", 20);
//joao.greetings()


module.exports = Person