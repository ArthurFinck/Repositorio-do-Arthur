// See https://aka.ms/new-console-template for more information
Random x = new Random();
int valorSistema = x.Next(0,99);

Console.WriteLine("Tente adivinhar o número sorteado entre 0 e 99:");

    for(;;)
    {
        int valorUsuario = int.Parse(Console.ReadLine());
        if (valorUsuario == -1)
        {
            break;
        }
        if (valorUsuario == valorSistema)
        {
            Console.WriteLine("Parabéns! Você acertou o número!");
            break;
        }
        else if (valorUsuario > valorSistema)
        {
            Console.WriteLine("Errou! Deveria ter digitado um valor menor!");
            continue;
        }
        else
        {
            Console.WriteLine("Errou! Deveria ter digitado um valor maior!");
            continue;
        }
    }
        