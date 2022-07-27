//4 – Crie uma função para formatar um valor em moeda brasileira R$
var moeda = 750000.00;
var moedaFormatada = atual.toLocaleString('pt-br',{style: 'currency', currency: 'BRL'});
console.log(moedaFormatada);
