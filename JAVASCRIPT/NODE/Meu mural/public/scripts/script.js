// esse passo faz com que assim que a página atualizar, 
// executa a função updatePost();
document.addEventListener('DOMContentLoaded', () => {
    updatePosts();
})

function updatePosts() {
    //chamada para o back-end
    //fetch(url,options).then(callback)

    fetch("http://192.168.0.18:3000/api/all").then(res => {
        return res.json()
    }).then(json => {
        let postElements = '';

        //transformando a variavel json de string para objeto
        let posts = JSON.parse(json);

        //criando post html
        posts.forEach((post) => {
            let postElement = ` <div id=${post.id} class="card mb-4">
                                    <div class="card-header">
                                        <h5 class="card-title">${post.title}</h5>
                                    </div>
                                    <div class="card-body">
                                        <div class="card-text">${post.description}</div>
                                    </div>
                                </div>`

            postElements += postElement;
        })


        document.getElementById("posts").innerHTML = postElements;

    })
}

function newPost() {

    let title = document.getElementById("title").value;
    let description = document.getElementById("desc").value;

    let post = { title, description };

    //header do metodo post
    const options = {
        method: "POST",
        Headers: new Headers({'content-type': 'application/json' }),
        body: JSON.stringify(post) //adicionando os posts no array do backend
    }

    fetch("http://192.168.0.18:3000/api/new", options).then(res => {
        console.log(res);
        updatePosts();
        document.getElementById("title").value = "";
        document.getElementById("desc").value = "";
    })

        
}