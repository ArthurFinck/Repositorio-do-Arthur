using System.Text;
class Program
{
    //Arthur Finck de Oliveira
    string mensagem;


    private double[] NovoSalario(int codigoCargo, double salarioAtual)
    {
        double[] valores = new double[3];
        double aumento;
        switch (codigoCargo)
        {
            case 1:
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

        valores[0] = salarioAtual;
        valores[1] = novoSalario;
        valores[2] = diferenca;
        return valores;
    }

    private string Idade1(int idade)
    {
        if (idade >= 18)
        {
            mensagem = "Você é adulto";
        }
        else if (idade > 12 && idade < 18)
        {
            mensagem = "Você é adolescente";
        }
        else
        {
            mensagem = "Você é criança";
        }

        return mensagem;
    }

    private float[] NotaFiscal2(float NotaFiscal)
    {
        float[] valores = new float[2];
        if (NotaFiscal >= 7000)
        {
            float Imposto = (float)(NotaFiscal * 0.03);
            float NotaFiscalImposto = Imposto + NotaFiscal;

            valores[0] = Imposto;
            valores[1] = NotaFiscalImposto;

        }
        else if (NotaFiscal >= 3000 && NotaFiscal < 7000)
        {
            float Imposto = (float)(NotaFiscal * 0.028);
            float NotaFiscalImposto = Imposto + NotaFiscal;
            valores[0] = Imposto;
            valores[1] = NotaFiscalImposto;

        }
        else if (NotaFiscal >= 1000 && NotaFiscal < 3000)
        {
            float Imposto = (float)(NotaFiscal * 0.025);
            float NotaFiscalImposto = Imposto + NotaFiscal;
            valores[0] = Imposto;
            valores[1] = NotaFiscalImposto;

        }
        else
        {
            float Imposto = (float)(NotaFiscal * 0.02);
            float NotaFiscalImposto = Imposto + NotaFiscal;
            valores[0] = Imposto;
            valores[1] = NotaFiscalImposto;

        }
        return valores;
    }

    private float[] SomaMultiplica(float numero1, float numero2)
    {
        float[] valores = new float[2];
        float Calculo = (numero1 + numero2) * numero1;
        valores[0] = numero1;
        valores[1] = numero2;
        valores[2] = Calculo;
        return valores;
    }

    private decimal Salario5(decimal Salario)
    {
        decimal SalarioMais = Salario * 1.25m;
        return SalarioMais;
    }

    private string CifraDeCesar(string textoPlano)
    {
        string textoCifrado = "";
        foreach (char caractere in textoPlano)
        {
            int codigo = caractere + 4;
            textoCifrado += (char)codigo;
        }
        return textoCifrado;
    }

    private string CifraDeCesarDecifra(string textoCifrado)
    {
        string textoDecifrado = "";
        foreach (char caractere in textoCifrado)
        {
            int codigo = caractere - 4;
            textoDecifrado += (char)codigo;
        }
        return textoDecifrado;
    }
    private StringBuilder CifradeCesarStringBuilder1(string textoPlano)
    {
        StringBuilder textoCifrado = new StringBuilder();

        foreach (char caractere in textoPlano)
        {
            int codigo = caractere + 4;
            textoCifrado.Append((char)codigo);
        }
        return textoCifrado;
    }

    private StringBuilder CifradeCesarStringBuilder2(string textoCifrado)
    {
        StringBuilder textoDecifrado = new StringBuilder();

        foreach (char caractere in textoCifrado)
        {
            int codigo = caractere - 4;
            textoDecifrado.Append((char)codigo);
        }
        return textoDecifrado;
    }

    Program()
    {
        while(ativida != 0)
        Console.WriteLine($"Informe a atividade: 1 - Idade | 2 - NotaFiscal | 3 - NovoSalario | 4 - SomaMultiplica | 5 - Salário | 6 - CifraDeCesarString | 7 - CifradeCesarStringBuilder | 0 - Sair");
        int atividade = int.Parse(Console.ReadLine());

        switch (atividade)
        {
            case 1:
                Console.WriteLine("Qual sua idade?");
                int idade = int.Parse(Console.ReadLine());
                string mensagemIdade = Idade1(idade);
                Console.WriteLine(mensagemIdade);
                break;
            case 2:
                Console.WriteLine("Digite o valor da nota fiscal");
                float NotaFiscal = float.Parse(Console.ReadLine());
                float[] resultadoNotaFiscal = NotaFiscal2(NotaFiscal);
                Console.WriteLine($"O valor do imposto é {resultadoNotaFiscal[0]} reais\nO valor da nota fiscal com o imposto é {resultadoNotaFiscal[1]} reais");
                break;
            case 3:
                Console.WriteLine("Informe o código do cargo (1, 2, 3 ou 4):");
                int codigoCargo = int.Parse(Console.ReadLine());
                Console.WriteLine("Informe o salário atual do funcionário:");
                double salarioAtual = double.Parse(Console.ReadLine());
                double[] resultadoSalario = NovoSalario(codigoCargo, salarioAtual);
                Console.WriteLine("Salário Antigo: R$" + resultadoSalario[0] + "\nNovo Salário: R$" + resultadoSalario[1] + "\nDiferença: R$" + resultadoSalario[2]);
                break;
            case 4:
                Console.WriteLine("Digite o Primeiro Numero :");
                float numero1 = int.Parse(Console.ReadLine());
                Console.WriteLine("Digite o Segundo Numero :");
                float numero2 = int.Parse(Console.ReadLine());
                float[] resulatoSomaMultiplica = SomaMultiplica(numero1, numero2);
                Console.WriteLine($"O primeiro número lido foi {resulatoSomaMultiplica[0]}, o segundo numero lido foi {resulatoSomaMultiplica[1]}. O resultado final é: {resulatoSomaMultiplica[2]}.");
                break;
            case 5:
                Console.WriteLine("Informe seu nome: ");
                string nome = Console.ReadLine();
                Console.WriteLine("Informe seu salário atual: ");
                decimal Salario = decimal.Parse(Console.ReadLine());
                decimal SalarioMais = Salario5(Salario);
                Console.WriteLine($"{nome}, seu salrio atual é: {SalarioMais}");
                break;
            case 6:
                Console.WriteLine("1. Cifrar um texto");
                Console.WriteLine("2. Decifrar um texto");
                string opcao = Console.ReadLine();


                if (opcao == "1")
                {
                    Console.WriteLine("Digite o texto a ser cifrado:");
                    string textoPlano = Console.ReadLine();
                    string resultado = CifraDeCesar(textoPlano);
                    Console.WriteLine(resultado);

                }
                else
                {
                    Console.WriteLine("Digite o texto a ser decifrado:");
                    string textoCifrado = Console.ReadLine();
                    string resultado = CifraDeCesarDecifra(textoCifrado);
                    Console.WriteLine(resultado);
                }
                break;
            case 7:
                Console.WriteLine("1. Cifrar um texto");
                Console.WriteLine("2. Decifrar um texto");
                string opcao2 = Console.ReadLine();


                if (opcao2 == "1")
                {
                    Console.WriteLine("Digite o texto a ser cifrado:");
                    string textoPlano = Console.ReadLine();
                    StringBuilder resultado = CifradeCesarStringBuilder1(textoPlano);
                    Console.WriteLine(resultado);
                }
                else
                {
                    Console.WriteLine("Digite o texto a ser decifrado:");
                    string textoCifrado = Console.ReadLine();
                    StringBuilder resultado = CifradeCesarStringBuilder2(textoCifrado);
                    Console.WriteLine(resultado);
                }
                break;
        }
    }

    static void Main(string[] args)
    {
        new Program();
    }
}