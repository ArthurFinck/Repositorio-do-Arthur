internal class Program
{
    private static void Main(string[] args)
    {
        // Arthur Finck de Oliveira
        Console.WriteLine("Qual sua idade?");
        string auxIdade = Console.ReadLine();

        int Idade = int.Parse(auxIdade);

        if (Idade >= 18)
        {
            Console.WriteLine($"Você é adulto");
        }
        else if (Idade > 12 && Idade < 18)
        {
            Console.WriteLine($"Você é adolescente");
        }
        else
        {
            Console.WriteLine($"Você é criança");
        }
    }
}