internal class Program
{
    private static void Main(string[] args)
    {
        //Arthur Finck de Oliveira
       Random random = new Random();
        int valorSistema = random.Next(0, 11);

        Console.WriteLine("O sistema sorteou um número entre 0 e 10. Tente adivinhar qual é:");

        int valorUsuario = int.Parse(Console.ReadLine());

        if (valorUsuario < 0 || valorUsuario > 10)
        {
            Console.WriteLine($"{valorUsuario} está fora da faixa de valor permitida!");
        }
        else if (valorUsuario < valorSistema)
        {
            Console.WriteLine("Errou! Deveria ter digitado um valor maior!");
        }
        else if (valorUsuario > valorSistema)
        {
            Console.WriteLine("Errou! Deveria ter digitado um valor menor!");
        }
        else
        {
            Console.WriteLine("Parabéns! Você acertou o número!");
        }
    }
}