document.addEventListener('DOMContentLoaded', () => {

    let squares = document.querySelectorAll(".square");

    squares.forEach((square) => {
        square.addEventListener('click', handleClick);
    })
})

function handleClick(event) {

     console.log(event.target);

    let square = event.target;
    let postion = square.id;

    if (handleMove(postion)) {

        setTimeout(() => {
            alert(" O jogo Acabou! O vencedor foi: " + playerTime);
        }, 10);

    };
    updateSquare(postion);
}


function updateSquare(postion) {
    let square = document.getElementById(postion.toString());
    let symbol = board[postion];
    square.innerHTML = `<div class='${symbol}'></div>`
}

/*
function updateSquares() {
    let square = document.getElementById(postion.tostring());
    let symbol = board[postion];
    square.innerHTML = `<div class='${symbol}'></div>`

    
    let squares = document.querySelectorAll(".square");

    squares.forEach((square) => {
        let postion = square.id;
        let symbol = board[postion];


        if (symbol != '') {
            square.innerHTML = `<div class='${symbol}'></div>`
        }


    })
}
 */