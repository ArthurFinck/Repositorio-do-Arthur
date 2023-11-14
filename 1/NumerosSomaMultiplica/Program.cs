internal class Program
{
    private static void Main(string[] args)
    {
        //Arthur Finck de Oliveira
        Console.WriteLine("Digite o Primeiro Numero :");
        string auxN1 = Console.ReadLine();
        Console.WriteLine("Digite o Segundo Numero :");
        string auxN2 = Console.ReadLine();

        float Numero1, Numero2, auxCalculo;
        
        Numero1 = float.Parse(auxN1);
        Numero2 = float.Parse(auxN2);
        auxCalculo = (Numero1 + Numero2) * Numero1;
        string Calculo = auxCalculo.ToString("0.00");

        Console.WriteLine($"O primeiro número lido foi {Numero1}, o segundo numero lido foi {Numero2}. O resultado final é: {Calculo}.");
    }
}