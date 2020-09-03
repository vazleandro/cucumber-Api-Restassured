# language: pt
@CEFESQD15_503
Funcionalidade: Devolver o resumo da simulacao ao canal
  Como sistema produto
  Quero Devolver o resumo da simulação
  Para Para o canal poder apresentar os dados para o cliente

  @httpcode200
  Esquema do Cenario: Devolver o resumo da simulacao ao canal
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "agencia": 1500,
        "conta": "0007204",
        "codigo_validacao_conta":4,
        "numero_titular_conta": "000001",
        "cpf_cnpj": "07204007247",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341"
      },
      "autoatendimento": true
      }
      

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o id_plano_pagamento
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_503\Codigo_200.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode |
      | emprestimos/v2/simulacoes_crediario |      200 |

  @httpcode400
  Esquema do Cenario: Validar mensagem Httpcode 400 quando nao informar o campo id_plano_pagamento
    Dado que eu realize autenticacao via token
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e nao informando o id_plano_pagamento
      """
      {
      "cliente": {
        "agencia": 1500,
        "conta": "0007204",
        "codigo_validacao_conta":4,
        "numero_titular_conta": "000001",
        "cpf_cnpj": "07204007247",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341"
      },
      "autoatendimento": true
      }
      

      """
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_503\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | quantidade_parcelas | url                                  | httpcode | codigo | mensagem              | campo                 | mensagemCampo     | valor |
      |                  12 | emprestimos/v2/simulacoes_crediario/ |      400 |    400 | Solicitação Imprópria | id_plano_parcelamento | Campo Obrigatório | null  |

  @httpcode404
  Esquema do Cenario: Validar mensagem Httpcode 404 quando informar o campo id_plano_pagamento inexistente
    Dado que eu realize autenticacao via token
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e informar um id_plano_pagamento inexistente
      """
      {
      "cliente": {
        "agencia": 1500,
        "conta": "0007204",
        "codigo_validacao_conta":4,
        "numero_titular_conta": "000001",
        "cpf_cnpj": "07204007247",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341"
      },
      "autoatendimento": true
      }

      """
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_503\Codigo_404.json"
    E o retorno sera do tipo JSON
    E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"

    Exemplos: 
      | quantidade_parcelas | url                                  | httpcode | codigo | mensagem                              |
      |                  12 | emprestimos/v2/simulacoes_crediario/ |      404 |    404 | Plano de parcelamento nao encontrado. |

  @httpcode404
  Esquema do Cenario: Validar mensagem Httpcode 404 quando informar o campo id_simulacao_crediario inexistente
    Dado que eu realize autenticacao via token
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario inexistente
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_503\Codigo_404.json"
    E o retorno sera do tipo JSON
    E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"

    Exemplos: 
      | quantidade_parcelas | url                                  | httpcode | codigo | mensagem                 |
      |                  12 | emprestimos/v2/simulacoes_crediario/ |      404 |    404 | Simulação não encontrada |
