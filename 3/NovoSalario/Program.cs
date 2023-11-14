internal class Program
{
    private static void Main(string[] args)
    {
        //Arthur Finck de Oliveira
        Console.WriteLine("Informe o código do cargo (1, 2, 3 ou 4):");
        string auxCodigoCargo = Console.ReadLine();

        Console.WriteLine("Informe o salário atual do funcionário:");
        string auxSalarioAtual = Console.ReadLine();

        int codigoCargo = int.Parse(auxCodigoCargo);
        double salarioAtual = double.Parse(auxSalarioAtual);

        double aumento = 0;
        switch (codigoCargo)
        {
            case 1:
            case 4:
                aumento = salarioAtual * 0.10;
                break;
            case 2:
                aumento = salarioAtual * 0.20;
                break;
            case 3:
                aumento = salarioAtual * 0.30;
                break;
            default:
                aumento = salarioAtual * 0.40;
                break;
        }

        double novoSalario = salarioAtual + aumento;
        double diferenca = novoSalario - salarioAtual;

        Console.WriteLine($"Salário Antigo: R${salarioAtual:F2}");
        Console.WriteLine($"Novo Salário: R${novoSalario:F2}");
        Console.WriteLine($"Diferença: R${diferenca:F2}");
    }
}
