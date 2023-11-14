internal class Program
{
    private static void Main(string[] args)
    {
        // Arthur Finck de Oliveira
        Console.WriteLine("Digite o valor da nota fiscal");
        string auxVlr = Console.ReadLine();

        float NotaFiscal = float.Parse(auxVlr);

        if(NotaFiscal >= 7000)
        {
            float Imposto = (float)(NotaFiscal * 0.03);
            float NotaFiscalImposto = Imposto+NotaFiscal;
            Console.WriteLine($"Valor da nota fiscal: {NotaFiscalImposto}");
            Console.WriteLine($"Percentual aplicado: 3%");
            Console.WriteLine($"Valor do Imposto: {Imposto}");
        }
        else if(NotaFiscal >= 3000 && NotaFiscal < 7000)
        {
            float Imposto = (float)(NotaFiscal * 0.028);
            float NotaFiscalImposto = Imposto+NotaFiscal;
            Console.WriteLine($"Valor da nota fiscal: {NotaFiscalImposto}");
            Console.WriteLine($"Percentual aplicado: 2,8%");
            Console.WriteLine($"Valor do Imposto: {Imposto}");
        }
        else if(NotaFiscal >= 1000 && NotaFiscal <3000)
        {
            float Imposto = (float)(NotaFiscal * 0.025);
            float NotaFiscalImposto = Imposto+NotaFiscal;
            Console.WriteLine($"Valor da nota fiscal: {NotaFiscalImposto}");
            Console.WriteLine($"Percentual aplicado: 2,5%");
            Console.WriteLine($"Valor do Imposto: {Imposto}");
        }
        else
        {
            float Imposto = (float)(NotaFiscal * 0.02);
            float NotaFiscalImposto = Imposto+NotaFiscal;
            Console.WriteLine($"Valor da nota fiscal: {NotaFiscalImposto}");
            Console.WriteLine($"Percentual aplicado: 2%");
            Console.WriteLine($"Valor do Imposto: {Imposto}");
        }
    }
}