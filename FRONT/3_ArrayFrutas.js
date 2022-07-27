var frutas = ['Abacate', 'Abacaxi', 'Acai', 'Acerola', 'Amora', 'Araticum', 'Banana', 'Biriba', 'Cacau', 'Caja'];

//1- descubra o tamanho do array e imprima no console
console.log(frutas.length);

//2- remova o 5 elemento do array e imprima no console
var frutas = ['Abacate', 'Abacaxi', 'Acai', 'Acerola', 'Amora', 'Araticum', 'Banana', 'Biriba', 'Cacau', 'Caja'];
var value = 'Amora'
frutas = frutas.filter(function(item) {
    return item !== value
})

//3- adicione a fruta laranja antes da fruta cacau e imprima no console
var frutas = ['Abacate', 'Abacaxi', 'Acai', 'Acerola', 'Amora', 'Araticum', 'Banana', 'Biriba', 'Cacau', 'Caja'];
frutas.splice(8, 0, "Laranja");
console.log(frutas.join());

//4 - Adicione mamão antes da fruta Araticum e imprima no console
var frutas = ['Abacate', 'Abacaxi', 'Acai', 'Acerola', 'Amora', 'Araticum', 'Banana', 'Biriba', 'Cacau', 'Caja'];
frutas.splice(5, 0, "Mamão");
console.log(frutas.join());







