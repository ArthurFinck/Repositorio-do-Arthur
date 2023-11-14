// See https://aka.ms/new-console-template for more information
//Arthur Finck de Oliveira
Console.WriteLine("Digite um número:");
int x = int.Parse(Console.ReadLine());
int y;
for (; ; )
{
    if (x % 2 == 0)
    {
        y = x / 2;
    }
    else
    {
        y = 3 * x + 1;
    }
    Console.WriteLine(y);
    x = y;
    if (x == 1)
    {
        break;
    }
}