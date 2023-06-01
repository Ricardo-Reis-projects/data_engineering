//criando as ações e o reducer para atualizar o estado da lista
const addItemAction = (item) => { return { type: "ADD_ITEM", payload: item } }

module.exports = { addItemAction }