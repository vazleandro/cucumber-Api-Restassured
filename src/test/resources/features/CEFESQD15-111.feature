# language: pt
@CEFESQD15_111
Funcionalidade: Liberar dinheiro da contratação na conta do cliente
  Como Sistema Produto
  Quero efetivar a proposta de contratação do produto Crediário
  Para liberar o valor negociado na conta do cliente

  @httpcode200
  Esquema do Cenario: Verificar se ao chamar a API Liberar dinheiro da contratação na conta do cliente é retornado Httpcode200.
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
       {
      "cliente": {
        "agencia": 1500,
        "conta": "0001079",
        "codigo_validacao_conta":6,
        "numero_titular_conta": "000001",
        "cpf_cnpj": "01204588104",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341"
      },
      "autoatendimento": true
      }

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o id_plano_pagamento e na sequencia chamar a API "<url_interface_canal>" para liberação do dinheiro na conta do cliente
    Entao e retornado Httpcode <httpcode>
    E o codigo de negociacao é <codigo_situacao_negociacao>
    E o schema sera valido "schema-CEFESQD15_111\Codigo_200.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode | url_interface_canal                | codigo_situacao_negociacao |
      | emprestimos/v2/simulacoes_crediario |      200 | emprestimos/v2/propostas_crediario |                          3 |

  @httpcode403
  Esquema do Cenario: Verificar se ao chamar a API Liberar dinheiro da contratação na conta do cliente é retornado Httpcode403 quando informar token inválido
    Dado que eu realize autenticacao via token "Token invalido"
    Dado que utilize o json
      """
       {
      "cliente": {
        "agencia": 1500,
        "conta": "0001079",
        "codigo_validacao_conta":6,
        "numero_titular_conta": "000001",
        "cpf_cnpj": "01204588104",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341"
      },
      "autoatendimento": true
      }

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o id_plano_pagamento e na sequencia chamar a API "<url_interface_canal>" para liberação do dinheiro na conta do cliente
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_111\Codigo_403.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode | url_interface_canal                |
      | emprestimos/v2/simulacoes_crediario |      403 | emprestimos/v2/propostas_crediario |

  @httpcode422
  Esquema do Cenario: Verificar se ao chamar a API Liberar dinheiro da contratação na conta do cliente é retornado Httpcode422 quando nao encontrar o id_proposta.
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
       {
      "codigo_situacao_negociacao": 3
      }

      """
    Quando realizar chamada na API "<url>" informando o id_proposta inexistente
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_111\Codigo_422.json"
    E o retorno sera do tipo JSON
    E codigo sera  "<codigo>" e mensagem "<mensagem>"

    Exemplos: 
      | url                                | httpcode | codigo | mensagem                              |
      | emprestimos/v2/propostas_crediario |      422 |    422 | Dados da pré-proposta não encontrados |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API Liberar dinheiro da contratação na conta do cliente é retornado Httpcode400 quando não informar o codigo_situacao_negociacao.
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "codigo_situacao_negociacao": <codigo_situacao_negociacao>
      }

      """
    Quando realizar chamada na API "<url>" informando o id_proposta
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_111\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>" array

    Exemplos: 
      | url                                | httpcode | codigo | mensagem              | campo                      | mensagemCampo  | valor | codigo_situacao_negociacao |
      | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | codigo_situacao_negociacao | Campo inválido |       | ""                         |
      | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | codigo_situacao_negociacao | Campo inválido |       | "XX"                       |

  @httpcode500
  Esquema do Cenario: Verificar se ao chamar a API Liberar dinheiro da contratação na conta do cliente é retornado Httpcode422 quando nao encontrar o id_proposta.
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
       {
      "codigo_situacao_negociacao": 3
      }

      """
    Quando realizar chamada na API "<url>" informando o id_proposta inexistente invalido
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_111\Codigo_500.json"
    E o retorno sera do tipo JSON
    E codigo sera  "<codigo>" e mensagem "<mensagem>"

    Exemplos: 
      | url                                | httpcode | codigo | mensagem                 |
      | emprestimos/v2/propostas_crediario |      500 |    500 | Invalid UUID string: abc |
