internal class Program
{
    private static void Main(string[] args)
    {
        //Arthur Finck de Oliveira
        Console.WriteLine("Digite o comprimento em cm :");
        string auxComprimento = Console.ReadLine();
        Console.WriteLine("Digite a largura em cm :");
        string auxLargura = Console.ReadLine();
        Console.WriteLine("Digite a altura em cm :");
        string auxAltura = Console.ReadLine();
        Console.WriteLine("Digite o peso em kg :");
        string auxPeso = Console.ReadLine();

        float Comprimento, Largura, Altura, Peso;

        Comprimento = float.Parse(auxComprimento);
        Largura = float.Parse(auxLargura);
        Altura = float.Parse(auxAltura);
        Peso = float.Parse(auxPeso);


        float PesoCubico;
        PesoCubico = (Comprimento * Largura * Altura) * Peso;

        Console.WriteLine($"O valor do peso cúbico é: {PesoCubico}");
    }
}