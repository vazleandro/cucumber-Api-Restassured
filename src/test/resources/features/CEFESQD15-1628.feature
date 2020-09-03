# language: pt
@CEFESQD15_1628
Funcionalidade: Cadastro Inicial da Pre-Proposta
  Como Sistema Produto
  Quero Disponibilizar uma interface de criação de propostas
  Para os canais de distribuição solicitem a criação de propostas de contratação de crediário

  @httpcode403
  Esquema do Cenario: Verificar se ao chamar a API Cadastro Inicial da Pre-Proposta Interface com o canal informando uma credencial não autorizada é retornado erro 403
    Dado que eu realize autenticacao via token "Token invalido"
    Dado que utilize o json
      """
      
      {
      "codigo_situacao_negociacao": 8,
      "codigo_tipo_meio_formalizacao": 7,
      "codigo_tipo_meio_liberacao": 4,
      "codigo_tipo_meio_recebimento": 1
      
      }
      """
    Quando realizar chamada na API de proposta "<url>" informando um id_proposta
    Entao e retornado Httpcode <httpcode>

    Exemplos: 
      | url                                | httpcode |
      | emprestimos/v2/propostas_crediario |      403 |

  @httpcode200
  Esquema do Cenario: Verificar se ao chamar a API Cadastro Inicial da Pre-Proposta Interface com o canal retorna httpcode200 e codigo_situacao_negociacao igual 8 - Confirmada
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
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o id_plano_pagamento e na sequencia chamar a API "<url_interface_canal>" de pre-proposta inteface com o canal
    Entao e retornado Httpcode <httpcode>
    E o codigo de negociacao é <codigo_situacao_negociacao>
    E o schema sera valido "schema-CEFESQD15_1628\Codigo_200.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode | url_interface_canal                | codigo_situacao_negociacao |
      | emprestimos/v2/simulacoes_crediario |      200 | emprestimos/v2/propostas_crediario |                          8 |

  @httpcode200
  Esquema do Cenario: Verificar se ao chamar a API Cadastro Inicial da Pre-Proposta Interface com o canal retorna httpcode200 e codigo_situacao_negociacao igual 5 - Cancelada
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
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o id_plano_pagamento e na sequencia chamar a API "<url_interface_canal>" de pre-proposta inteface com o canal
    Entao e retornado Httpcode <httpcode>
    E o codigo de negociacao é <codigo_situacao_negociacao>
    E o schema sera valido "schema-CEFESQD15_1628\Codigo_200.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode | url_interface_canal                | codigo_situacao_negociacao |
      | emprestimos/v2/simulacoes_crediario |      200 | emprestimos/v2/propostas_crediario |                          5 |
      
  @httpcode422
  Esquema do Cenario: Verificar se ao chamar a API Cadastro Inicial da Pre-Proposta Interface com o canal retorna httpcode422 quando houver alguma inconsistência na consulta da base
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
       {
      "codigo_situacao_negociacao": 8,
      "codigo_tipo_meio_formalizacao": 7,
      "codigo_tipo_meio_liberacao": 4,
      "codigo_tipo_meio_recebimento": 1
      
      }
      """
    Quando realizar chamada na API de proposta "<url>" informando um id_proposta
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_1628\Codigo_422.json"
    E o retorno sera do tipo JSON
    E codigo sera  "<codigo>" e mensagem "<mensagem>"

    Exemplos: 
      | url                                | httpcode | codigo | mensagem                              |
      | emprestimos/v2/propostas_crediario |      422 |    422 | Dados da pré-proposta não encontrados |
