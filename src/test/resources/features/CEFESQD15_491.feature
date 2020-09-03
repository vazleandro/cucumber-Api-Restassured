# language: pt
@CEFESQD15_491
Funcionalidade: Devolver condições de contratação
  Como sistema produto
  Quero verificar se o cliente é elegível para simular o crédito
  Para limitar a quantidade de simulações realizadas no canal e devolver condições de contratação

  @httpcode200
  Esquema do Cenario: Devolver condições de contratação quando cliente seguir com simulação
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "00002010025",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341",
        "agencia": "1500",
        "conta": "0056002",
        "codigo_validacao_conta": 2,
        "numero_titular_conta": "000001"
      },
      "autoatendimento": <canal_autoatendimento>
      }

      """
    Quando realizar chamada na API "<url>"
    Entao o cliente pode seguir com a simulação Httpcode <httpcode>
    #E sera inserido em Banco de dados o ciclo para o correntista "<cpf_cnpj_cliente>" "<canal_autoatendimento>"
    E o schema sera valido "schema-CEFESQD15_491\Codigo_200.json"
    E o retorno sera do tipo JSON
    E a API deve retornar "valor_minimo_disponivel" "valor_maximo_disponivel" "quantidade_minima_parcela" "quantidade_maxima_parcela" "valor_minimo_parcela" "valor_maximo_parcela" "data_minima_vencimento" "data_maxima_vencimento" "data_sugerida_primeiro_vencimento" "taxa_minima_juros" "taxa_maxima_juros"

    Exemplos: 
      | canal_autoatendimento | url                                 | httpcode |
      | true                  | emprestimos/v2/simulacoes_crediario |      200 |

@httpcode200
  Esquema do Cenario: Devolver condições de contratação quando cliente seguir com simulação
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "00002010025",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341",
        "agencia": "1500",
        "conta": "0056002",
        "codigo_validacao_conta": 2,
        "numero_titular_conta": "000001"
      },
      "autoatendimento": <canal_autoatendimento>
      }

      """
    Quando realizar chamada na API "<url>"
    Entao o cliente pode seguir com a simulação Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_491\Codigo_200_false.json"
    E o retorno sera do tipo JSON
    E a API deve retornar "valor_minimo_disponivel" "valor_maximo_disponivel" "quantidade_minima_parcela" "quantidade_maxima_parcela" "valor_minimo_parcela" "valor_maximo_parcela" "data_minima_vencimento" "data_maxima_vencimento" "data_sugerida_primeiro_vencimento" "taxa_minima_juros" "taxa_maxima_juros"

    Exemplos: 
      | canal_autoatendimento | url                                 | httpcode |
      | false                 | emprestimos/v2/simulacoes_crediario |      200 |

  @httpcode422
  Esquema do Cenario: Devolver mensagem informando limite de simulacoes excedidas e tempo de descanso
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
       {
      "cliente": {
        "cpf_cnpj": "08962261667",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341",
        "agencia": "1500",
        "conta": "0008238",
        "codigo_validacao_conta": 1,
        "numero_titular_conta": "000001"
      },
      "autoatendimento": <canal_autoatendimento>
      }
      """
    #Quando o correntista tiver seu limite de tentativas excedido
    Quando realizar chamada na API "<url>"
    Entao o cliente nao pode seguir com a simulação Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_491\Codigo_422.json"
    E o retorno sera do tipo JSON
    E a API deve retornar quantidade_simulacoes_permitidas, quantidade_simulacoes_submetidas, quantidade_dias_descanso e valores

    Exemplos: 
      | canal_autoatendimento | url                                 | httpcode |
      | true                  | emprestimos/v2/simulacoes_crediario |      422 |

  @httpcode400
  Esquema do Cenario: Validar mensagem Httpcode 400 campo nao informado
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      
      "cliente": { 
      "cpf_cnpj": "<cpf_cnpj_cliente>",
      "tipo_instituicao_financeira": "<tipo_instituicao>",
      "codigo_instituicao_financeira": "<banco_cliente>",
      "agencia": "<agencia_cliente>",
      "conta": "<conta_cliente>",
      "codigo_validacao_conta": "<codigo_validacao_conta_cliente>",
      "numero_titular_conta": "<numero_titular_conta>"
      },
      "autoatendimento": <canal_autoatendimento>
      }

      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_491\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | banco_cliente | agencia_cliente | conta_cliente | codigo_validacao_conta_cliente | numero_titular_conta | cpf_cnpj_cliente | canal_autoatendimento | url                                 | httpcode | tipo_instituicao | codigo | mensagem              | campo                               | mensagemCampo                                          | valor |
      |           341 |                 |       0056002 |                              2 |               000001 |      00002010025 | true                  | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.agencia                     | Agencia do cliente deve conter 4 digitos               |       |
      |               |            1500 |       0056002 |                              2 |               000001 |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.codigoInstituicaoFinanceira | Código de instituição financeira deve conter 3 digitos |       |
      |           341 |            1500 |               |                              2 |               000001 |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.conta                       | Conta do cliente deve conter 7 digitos                 |       |
      |           341 |            1500 |       0056002 |                                |               000001 |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.codigoValidacaoConta        | O campo deve ser numérico e sem espaços.               |       |
      |           341 |            1500 |       0056002 |                              2 |                      |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.numeroTitularConta          | O campo deve ser numérico e sem espaços.               |       |
      |           341 |            1500 |       0056002 |                              2 |               000001 |                  | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.cpfCnpj                     | O campo deve ser numérico e sem espaços.               |       |
      |           341 |            1500 |       0056002 |                              2 |               000001 |      00002010025 | ""                    | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | autoAtendimento                     | must not be null                                       | null  |
      |           341 |            1500 |       0056002 |                              2 |               000001 |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |                  |    400 | Solicitação Imprópria | cliente.tipoInstituicaoFinanceira   | O campo deve ser numérico e sem espaços.               |       |

  @httpcode400
  Esquema do Cenario: Validar mensagem Httpcode 400 campo nao informar nenhum campo de entrada
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      
      "cliente": { 
      }
      
      }

      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_491\Codigo_400.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode |
      | emprestimos/v2/simulacoes_crediario |      400 |

  @httpcode400
  Esquema do Cenario: Validar mensagem Httpcode 400 campo inválido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      
      "cliente": {
      "cpf_cnpj": "<cpf_cnpj_cliente>",
      "tipo_instituicao_financeira": "<tipo_instituicao>",
      "codigo_instituicao_financeira": "<banco_cliente>",
      "agencia": "<agencia_cliente>",
      "conta": "<conta_cliente>",
      "codigo_validacao_conta": "<codigo_validacao_conta_cliente>",
      "numero_titular_conta": "<numero_titular_conta>"
      },
      "autoatendimento": <canal_autoatendimento>
      }

      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_491\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | banco_cliente | agencia_cliente | conta_cliente | codigo_validacao_conta_cliente | numero_titular_conta | cpf_cnpj_cliente | canal_autoatendimento | url                                 | httpcode | tipo_instituicao | codigo | mensagem              | campo                               | mensagemCampo                            | valor   |
      |           341 | XXXX            |       0056002 |                              2 |               000001 |      00002010025 | true                  | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.agencia                     | O campo deve ser numérico e sem espaços. | XXXX    |
      | XXX           |            1500 |       0056002 |                              2 |               000001 |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.codigoInstituicaoFinanceira | O campo deve ser numérico e sem espaços. | XXX     |
      |           341 |            1500 | XXXXXXX       |                              2 |               000001 |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.conta                       | O campo deve ser numérico e sem espaços. | XXXXXXX |
      |           341 |            1500 |       0056002 | X                              |               000001 |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.codigoValidacaoConta        | O campo deve ser numérico e sem espaços. | X       |
      |           341 |            1500 |       0056002 |                              2 | X                    |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.numeroTitularConta          | O campo deve ser numérico e sem espaços. | X       |
      |           341 |            1500 |       0056002 |                              2 |               000001 | XXX              | false                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | cliente.cpfCnpj                     | O campo deve ser numérico e sem espaços. | XXX     |
      |           341 |            1500 |       0056002 |                              2 |               000001 |      00002010025 | false                 | emprestimos/v2/simulacoes_crediario |      400 | XXX              |    400 | Solicitação Imprópria | cliente.tipoInstituicaoFinanceira   | O campo deve ser numérico e sem espaços. | XXX     |
      |           341 |            1500 |       0056002 |                              2 |               000001 |      00002010025 | "XXX"                 | emprestimos/v2/simulacoes_crediario |      400 |              004 |    400 | Solicitação Imprópria | autoatendimento                     | Campo com valor de formato inválido      | XXX     |

  @httpcode403
  Esquema do Cenario: Validar mensagem de acesso nao autorizado
    Dado que eu realize autenticacao via token "Token invalido"
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "00002010025",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341",
        "agencia": "1500",
        "conta": "0056002",
        "codigo_validacao_conta": 2,
        "numero_titular_conta": "000001"
      },
      "autoatendimento": <canal_autoatendimento>
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>

    Exemplos: 
      | canal_autoatendimento | url                                 | httpcode |
      | true                  | emprestimos/v2/simulacoes_crediario |      403 |

  # Cancelado:
  ## E-mail Fabio > No caso do token inválido não temos ação, pois em casos de 401 ou 403, o próprio gateway nega a requisição. A chamada não chega a bater na nossa API. Nossa validação é apenas um duplo check da integridade do token.
  @httpcode422
  Esquema do Cenario: Validar mensagem Htttpcode 422 informando inconsistencia
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
         {
      "cliente": {
        "cpf_cnpj": "00051051046",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341",
        "agencia": "1500",
        "conta": "0001079",
        "codigo_validacao_conta": 8,
        "numero_titular_conta": "000001"
      },
      "autoatendimento": <canal_autoatendimento>
      }

      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_491\Codigo_422.json"
    E o retorno sera do tipo JSON
    E a API deve retornar o codigo "<codigo>"

    Exemplos: 
      | canal_autoatendimento | url                                 | httpcode | codigo  |
      | true                  | emprestimos/v2/simulacoes_crediario |      422 | E422_02 |
