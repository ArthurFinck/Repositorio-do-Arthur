// See https://aka.ms/new-console-template for more information
//Arthur Finck de Oliveira
Console.WriteLine("Digite seu Nome");
string nome = Console.ReadLine();
foreach (char caractere in nome)
        {
            int valorInteiro = (int)caractere;
            double divisao = (double)valorInteiro / 4;
            int parteInteira = (int)divisao;
            double parteFracionada = divisao - parteInteira;
            int resto = valorInteiro % 4;

            Console.WriteLine($"{caractere} = {valorInteiro} = {valorInteiro} / 4 = {divisao} = {parteInteira},{parteFracionada:F2} = {parteInteira} = {parteFracionada:F2} = {resto}");
        }
