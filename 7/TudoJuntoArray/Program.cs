internal class Program
{
    private static void Main(string[] args)
    {
        List<string> lista = new List<string>();

        //-----------------Adicionando elemetos a lista, aqui serão adicionados em ordem, ou seja, cada item adicionado sera o ultimo da lista(o i-esimo item representa a posição de um elemento) -------------------------
        lista.Add("Item 1");
        lista.Add("Item 2");
        lista.Add("Item 3");

        //--------------Adicionando itens no INICIO da lista, o " 0 ' significa que o item vai ocupar a primeira posição.---------------

        lista.Insert(0, "Item 4 ");
        lista.Insert(0, "Item 5 ");

        //--------------------Removendo o ultimo item da lista, que atualmente seria o "item 3" com o  indice 5.-----------------------
        int indiceARemover = 4;

        //Quando você usa lista.Count em um contexto, como no if, ele serve para verificar se o índice indiceARemover está dentro dos limites válidos da lista. Por exemplo, se lista.Count for 5, 
        //isso significa que a lista tem 5 elementos e os índices válidos vão de 0 a 4.

        if (indiceARemover < lista.Count)
        {
            lista.RemoveAt(indiceARemover); // aqui poderia ser usado somente o numero do indice, no caso o numero 4.
        }
        //----------- Removendo o primeiro item da lista--------------------

        if (lista.Count > 0)
        { // Esse if verifica se a lista não esta vazia. Aqui foi usado um lista.Count(usado para verificar a quantidade de itens num indice, nesse caso serão 4, pois inicialmente haviam 5 e enrtão removemos o ultimo item, assim restando 4 indices)
            lista.RemoveAt(0);
        }

        //------------------retirar a primeira ocorrencia de um item especifico. A ocorrencia  é o conteudo dentro da string desejada, nesse caso "Item 1"---------------------------
        string itemToRemove = "Item 1"; // aqui definimos a string que queremos remover da lista.

        if (lista.Contains(itemToRemove))
        { // Aqui usamos o lista.Contains para verificar se a string que queremos retirar-("Item 1")- está dentro da lista
            lista.Remove(itemToRemove); // apenas usando o "Remove" e não o "RemoveAt", porque queremos remover uma string específic, e não o indice dela.
        }

        //------------------Localizar a primeira ocorrencia de um item na lista -----------------------

        string itemProcurado = "Item 2"; // determinamos a ocorrencia da string que qerenos localizar
        int indice = lista.IndexOf(itemProcurado);
        //IMPORTANTE --- O método IndexOf retorna o índice da primeira ocorrência dessa string na lista. 

        if(indice != -1) // Por que o "-1"?  Se a string não for encontrada na lista, o método retornará -1. Portanto, verificamos se indice não é igual a -1 para confirmar que encontramos o item e, em seguida, exibimos o índice onde ele foi encontrado.
        {   
            System.Console.WriteLine($"A primeira ocorrencia de {itemProcurado} está no índice {indice}");
        }
        else 
        {
            System.Console.WriteLine($"O item {itemProcurado} não foi achado na lista.");
        }

        //-----------Parte de Imprimir a lista:------------- 

        //----------Imprimir todos os itens da lista ------------

        System.Console.WriteLine("Lista Completa:\n ");
        // COMENTARIO SOBRE COMO FUNCIONA O FOREACH AQUI ===== | string item: Isso declara uma variável chamada item do tipo string. Essa variável será usada para armazenar cada elemento da lista à medida que percorremos a lista.
        //in lista: Isso especifica a coleção que estamos percorrendo, que é a lista chamada lista.
        foreach(string item  in lista) 
        {
            System.Console.WriteLine($"{item}");
        }

        //--------- Imprimir a quantidade de itens---------------

        System.Console.WriteLine($"\nA quantidade de de itens na lista é: {lista.Count}");

        //--------Verificar se a lista esta cheia ou vazia------------

        if(lista.Count == 0 )
        {
            System.Console.WriteLine("\nA lista está vazia! ");
        }
        else
        {
            System.Console.WriteLine("\nA lista não está vazia");
        }



    }
}