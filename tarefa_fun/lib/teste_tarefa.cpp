#include <iostream>
#include <boost/multiprecision/cpp_dec_float.hpp>

/*
* Algoritmo para calcular uma série 
* serie que calcula e^x dado um input x nos reais entre 0 <= x <=1 e recebe um erro
* o erro é a diferença entre (n+1 - n) ao dar um erro menor que o estabelecido acabe
* o algoritmo só pode receber o x e o erro e o erro obviamente junto com a soma tem que ser atualizado a cada iteração
*/

namespace mp = boost::multiprecision;

mp::cpp_dec_float_50 calculo_exp(mp::cpp_dec_float_50 x, mp::cpp_dec_float_50 erro) {
    // Inicialize a soma com o primeiro termo da série
    mp::cpp_dec_float_50 soma = 1.0;
    mp::cpp_dec_float_50 termo = 1.0;

    // Inicie o índice i com 1
    int i = 1;

    // Calcula a série até que a diferença entre duas iterações consecutivas seja menor que o erro
    while (termo > erro) {
        // Atualize o termo atual
        termo *= x / i;

        // Atualize a soma
        soma += termo;

        // Atualize o índice
        ++i;
        std::cout<<"\n Iteração " << i << "  COM o erro "<<  std::setprecision(30) << erro << "A soma fica " << std::setprecision(40) << soma << std::endl;
    }

    return soma;
}

int main() {
    mp::cpp_dec_float_50 x, erro;
    std::cout << "Digite o valor de x (entre 0 e 1): ";
    std::cin >> x;
    std::cout << "Digite o valor do erro desejado: ";
    std::cin >> erro;

    mp::cpp_dec_float_50 resultado = calculo_exp(x, erro);
    std::cout << "e^" << x << " = " << resultado << std::endl;

    return 0;
}
