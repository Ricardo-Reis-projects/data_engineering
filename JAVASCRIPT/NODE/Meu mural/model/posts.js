module.exports = {

    posts: [
        {
            id: "1",
            title: "teste",
            description: "Descrição teste"
        },
    ],

    getAll() {
        return this.posts;
    },


    newPost(title, description) {

        this.posts.push({ id: geraID(), title, description });

    }
}

function geraID() {
    return Math.random().toString(36).substr(2, 9);

}
