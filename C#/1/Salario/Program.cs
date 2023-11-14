internal class Program
{
    private static void Main(string[] args)
    {
        //Arthur Finck De Oliveira
        Console.WriteLine("Informe seu nome: ");
        string nome = Console.ReadLine();
        Console.WriteLine("Informe seu salário atual: ");
        string auxSalario = Console.ReadLine();

        decimal Salario, SalarioMais;
        Salario = decimal.Parse(auxSalario);

        SalarioMais = Salario * 1.25m;

        Console.WriteLine($"{nome}, seu salrio atual é: {SalarioMais}");
    }
}