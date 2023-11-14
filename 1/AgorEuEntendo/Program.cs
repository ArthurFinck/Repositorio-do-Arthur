internal class Program
{
    // Arthur Finck de Oliveira
    private static void Main(string[] args)
    {
        byte Valor1;
        short Valor2;
        int Valor3;
        long Valor4;
        float Valor5;

        Console.WriteLine("Digite o Primeiro Valor");
        string auxV1 = Console.ReadLine();
        Console.WriteLine("Digite o Segundo Valor");
        string auxV2 = Console.ReadLine();
        Console.WriteLine("Digite o Terceiro Valor");
        string auxV3 = Console.ReadLine();
        Console.WriteLine("Digite o Quarto Valor");
        string auxV4 = Console.ReadLine();
        Console.WriteLine("Digite o Quinto Valor");
        string auxV5 = Console.ReadLine();

        Valor1 = byte.Parse(auxV1);
        Valor2 = short.Parse(auxV2);
        Valor3 = int.Parse(auxV3);
        Valor4 = long.Parse(auxV4);
        Valor5 = float.Parse(auxV5);

        double total = Valor1 + Valor2 + Valor3 + Valor4 + Valor5;
        decimal media = (decimal)total/5;

        int ParteInt = (int)media;
        char Caracter;
        Caracter = (char)ParteInt;

        Console.WriteLine($"Soma: {total}  Média: {media}  Parte Inteira: {ParteInt}  Carácter: {Caracter}");
    }
}