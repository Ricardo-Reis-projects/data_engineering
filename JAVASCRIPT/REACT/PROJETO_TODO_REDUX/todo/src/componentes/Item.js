class Item {

    //criando variavel de classe para criar id incremental no construtor
    static lastId = 0;

    
    constructor(text){

        this.id = Item.lastId++
        this.text = text;
        this.done = false;
    }

}


export default Item;