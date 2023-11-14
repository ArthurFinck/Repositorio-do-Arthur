internal class Program
{
    private static void Main(string[] args)
    //Arthur Finck de Oliveira
    {
        for (int i = 1; i <= 1000000; i++)
        {
            if( (i % 11 == 00) && (i % 13 == 00) && (i % 17 == 00) )
            {
                Console.WriteLine($"O primeiro número divisível por 11, 13 e 17 entre 1 em 1.000.000 é: {i}");
                break;  
            }

        }
        
    }
}