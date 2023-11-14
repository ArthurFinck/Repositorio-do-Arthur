internal class Program
{
    private static void Main(string[] args)
    {
        //Arthur Finck de Oliveira
        int A = 10; 
        int B = 20; 

        A = A + B;
        B = A - B;
        A = A - B;

        Console.WriteLine($"A = {A}, B = {B}");
    }
}