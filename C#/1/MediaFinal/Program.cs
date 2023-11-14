internal class Program
{
    private static void Main(string[] args)
    {
        int e = 2, f = 3, g;
        g = e++ + --f - e;;
        Console.WriteLine(f);
    }
}