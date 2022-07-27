//5 – Baseado no seguinte array

//1- calcule a média e imprima no console
var array = [10,23,43,44,56,12,35,77,23,13,31];
const average = array => array.reduce((prev, curr) => prev + curr) / array.length;
average(array) // 15


//2- remova o 5 elemento do array e imprima o total do array no console
var array = [10,23,43,44,56,12,35,77,23,13,31];
var value = 56;
var soma = 0;
array = array.filter(function(item) {
    return item !== value
})
for(var i = 0; i < array.length; i++) {
    soma += array[i];
}
console.log(soma);

//3-gere um novo array somente com números pares e imprima no console
var array = [10,23,43,44,56,12,35,77,23,13,31];
var arrayPar = [];
array.forEach(function(i){
    if ((i % 2) == 0) {
        arrayPar.push(i);       
    }   
});
console.log(arrayPar);

