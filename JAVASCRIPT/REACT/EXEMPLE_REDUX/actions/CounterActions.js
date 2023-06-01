//criando as action no formato de função com redux para atualizar o estado do contador
//, nomeando o tipo e informando a carga com "payload", se nao for informado a carga, colocar 1
const incrementAction = (value) => { return { type: 'INCREMENT', payload: value || 1 } }
const decrementAction = (value) => { return { type: 'DECREMENT', payload: value || 1 } }


module.exports ={
    incrementAction,
    decrementAction
}