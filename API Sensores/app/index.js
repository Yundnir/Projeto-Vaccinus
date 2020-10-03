//Importando o módulo Sensors e atribuindo a uma constante para acesso as funções do mesmo.
const sensors = require('./sensors.js')

/*Atribuindo o retorno da função lm35 a variável temperatura.
Exemplo atribuindo valores diferentes de minimo 15 e máximo 18
temperatura = sensors.lm35(15,18)
Os valores padrões de temperatura são min: 18 max: 25*/
temperatura = sensors.lm35(10,15)

/*Utilizando a função console.log() para exibir no terminal o retorno da função,
incrementando com uma string para facilitar a interpretação.*/
console.log('Temperatura: ' + temperatura.toFixed(2))





