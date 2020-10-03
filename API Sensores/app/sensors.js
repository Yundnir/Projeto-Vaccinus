function lm35(min, med, max) {
    min = typeof min == 'undefined' ? 2 : min; //Parâmetro alterado. Precisa definir
    //med = typeof med == 'undefined' ? 5 : med; //Parâmetro criado para temperatura média da vacina
    max = typeof max == 'undefined' ? 8 : max; //Parâmetro alterado. Precisa definir
    
    let random = Math.random() * (max - min) + min;

    return random
}

module.exports = {lm35};
