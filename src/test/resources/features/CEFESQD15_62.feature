# language: pt
@mensagemCockpit
Funcionalidade: Retornar informação piloto para o cockpit
  Como um Gestor
  Eu preciso possuir o controle do piloto atraves de parametrizacao do SEVEN
  Para que eu possa ligar ou desligar o piloto

  Contexto: 
    Dado que o usuario informe o nome da transacao a ser executado
    E informe sua racf e senha
    E informe a comunicacao "PJTCPIMS"

  Esquema do Cenario: Realizar a validacao da mensagem ao cockpit
    Dado que eu informe o passo a ser executado "<passo>"
    Quando utilizar os parametros Agencia "<agencia>" Conta "<conta>" Dac "<dac10>" produto "<produto>" segmento "<segmento>" canal "<canal>"
    E realizar a consulta ao Seven
    Entao a resposta tera a seguinte mensagem "<mensagem>" para o cenario "<cenario>"

    Exemplos: 
      | passo | agencia | conta   | dac10 | produto   | segmento | canal | mensagem                                                                                | cenario |
      |    03 |    1500 | 0001010 |     1 | 000000083 | L000     |    11 | IN-SIT-PROC: P  - COD-MENS: 0300{  - INF-ERRO: BLOQ DO INVESTIMENTO APOS A FORMALIZACAO | msg_1   |
      |    03 |    1500 | 0001010 |     1 | 000000083 |     4000 |    11 | IN-SIT-PROC: P  - COD-MENS: 0300{  - INF-ERRO: BLOQ DO INVESTIMENTO APOS A FORMALIZACAO | msg_2   |
      |    03 |    1500 | 0001010 |     1 | 000000083 |     3000 |    11 | IN-SIT-PROC: P  - COD-MENS: 0300{  - INF-ERRO: BLOQ DO INVESTIMENTO APOS A FORMALIZACAO | msg_3   |
      |    03 |    1000 | 0001010 |     1 | 000000083 |     3000 |    11 | IN-SIT-PROC: P  - COD-MENS: 0300A  - INF-ERRO: O INVESTIMENTO DO CLIENTE SERA BLOQUEADO | msg_4   |
      |    03 |    1000 | 0001010 |     1 | 000000083 | L000     |    11 | IN-SIT-PROC: P  - COD-MENS: 0300A  - INF-ERRO: O INVESTIMENTO DO CLIENTE SERA BLOQUEADO | msg_5   |
      |    03 |    1000 | 0001010 |     1 | 000000083 |     4000 |    11 | IN-SIT-PROC: P  - COD-MENS: 0300A  - INF-ERRO: O INVESTIMENTO DO CLIENTE SERA BLOQUEADO | msg_6   |
      |    03 |    1234 | 0001010 |     1 | 000000083 |     4000 |    11 | IN-SIT-PROC: P  - COD-MENS: 0300A  - INF-ERRO: O INVESTIMENTO DO CLIENTE SERA BLOQUEADO | msg_7   |
      |    03 |    1234 | 0001010 |     1 | 000000083 |     3000 |    11 | IN-SIT-PROC: P  - COD-MENS: 0300A  - INF-ERRO: O INVESTIMENTO DO CLIENTE SERA BLOQUEADO | msg_8   |
      |    03 |    1234 | 0001010 |     1 | 000000083 | L000     |    11 | IN-SIT-PROC: P  - COD-MENS: 0300A  - INF-ERRO: O INVESTIMENTO DO CLIENTE SERA BLOQUEADO | msg_9   |
      |    03 |    1500 | 0001010 |     1 | 000000079 | L000     |    11 | IN-SIT-PROC: P  - COD-MENS: 0000{  - INF-ERRO: PROCESSAMENTO EFETUADO COM SUCESSO       | msg_10  |
      |    03 |    1500 | 0001010 |     1 | 000000083 | L000     |    12 | IN-SIT-PROC: P  - COD-MENS: 0000{  - INF-ERRO: PROCESSAMENTO EFETUADO COM SUCESSO       | msg_11  |
