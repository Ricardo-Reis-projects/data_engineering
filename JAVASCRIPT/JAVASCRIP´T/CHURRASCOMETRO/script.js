// Carne                - 400 gr por pessoa, acima de 6 horas -  650 gr
// Cerveja              - 1200 ml por pessoa, acima de 6 horas - 2000 ml
// Refrigerante/agua    - 1000 ml por pessoa, acima de 6 horas - 1500 ml

// Crianças valem por 0,5


//acessando/linkando os elementos criados na tela no html, para pegar os dados

let inputAdultos = document.getElementById("adultos");
let inputCriancas = document.getElementById("criancas");
let inputDuracao = document.getElementById("duracao");

let resultado = document.getElementById("resultado");


function calcular(){

    let adultos = inputAdultos.value;
    let criancas = inputCriancas.value;
    let duracao = inputDuracao.value;

    let qtdTotalCarne = carnePorPessoa(duracao) * adultos  + (carnePorPessoa(duracao)/2 * criancas);
    let qtdTotalCerveja = cervejaPorPessoa(duracao) * adultos;
    let qtdTotalBebidas = bebidasPorPessoa(duracao) * adultos  + (bebidasPorPessoa(duracao)/2 * criancas);


    resultado.innerHTML = `<p>${qtdTotalCarne / 1000} kg de Carne</p>`
    resultado.innerHTML += `<p>${Math.ceil(qtdTotalCerveja / 355)} Latas de Cerveja</p>`
    resultado.innerHTML += `<p>${Math.ceil(qtdTotalBebidas / 2000)} Pet's de 2 litros de Bebidas</p>`

}


function carnePorPessoa(duracao){
    if(duracao >=6 ){
        return 650;
    } else {
        return 400;
    }
}

function cervejaPorPessoa(duracao){
     if(duracao >=6 ){
        return 2000;
    } else {
        return 1200;
    }
}

function bebidasPorPessoa(duracao){
    if(duracao >=6 ){
       return 1500;
   } else {
       return 1000;
   }
}