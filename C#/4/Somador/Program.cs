// See https://aka.ms/new-console-template for more information
//Arthur Finck de Oliveira
int cont = 0;
for(int i=0; i <=10; i++)
{
    if(i % 5 == 0 || i % 3 ==0)
    {
        Console.WriteLine($"Descartado: {i}");
        continue;
    }
    cont = cont + i;
    Console.WriteLine($"Valor Atual: {i}, Total: {cont}");
    
}
