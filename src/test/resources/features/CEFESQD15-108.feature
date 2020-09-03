# language: pt
@CEFESQD15_108
Funcionalidade: Obter as condições de valores e parcelas e oferecer ao correntista opções para simulação
  Como sistema produto
  Quero obter as condições de valores e parcelas
  Para oferecer aos correntistas opções para simulação do AA

  @httpcode200
  Esquema do Cenario: Retonar as condições de pagamento e taxa do emprestimo com data sugerida
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
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15-108\Codigo_200_condicoes_pagamentos.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode |
      | emprestimos/v2/simulacoes_crediario |      200 |

  @httpcode200
  Esquema do Cenario: Retonar as condições de pagamento e taxa do emprestimo com data minima de vencimento
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
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e data_minima_vencimento
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15-108\Codigo_200_condicoes_pagamentos.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode |
      | emprestimos/v2/simulacoes_crediario |      200 |

  @httpcode200
  Esquema do Cenario: Retonar as condições de pagamento e taxa do emprestimo com data maxima de vencimento
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
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e data_maxima_vencimento
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15-108\Codigo_200_condicoes_pagamentos.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode |
      | emprestimos/v2/simulacoes_crediario |      200 |

  @httpcode200
  Esquema do Cenario: Retonar as condicoes de pagamento e taxa do emprestimo quando informado um valor de parcela personalizado
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
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e uma parcela personalizada <parcelaPersonalizada>
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15-108/Codigo_200_parcela_personalizada.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode | parcelaPersonalizada |
      | emprestimos/v2/simulacoes_crediario |      200 |                    6 |

  @httpcode200
  Esquema do Cenario: Retonar as condições de pagamento e taxa do emprestimo quando informado o campo id_tipo_valor_simulado igual a 2
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
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e  o id_tipo_valor_simulado igual a <id_tipo_valor_simulado>
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15-108\Codigo_200_condicoes_pagamentos.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode | id_tipo_valor_simulado |
      | emprestimos/v2/simulacoes_crediario |      200 |                      2 |

  @httpcode422
  Esquema do Cenario: Retonar erro httpcode 422 quando a data do primeiro vencimento estiver fora do limite permitido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "valor_simulado": <valor_simulado>,
      "id_tipo_valor_simulado": <id_tipo_valor_simulado>,
      "data_primeiro_vencimento": "<data_primeiro_vencimento>"
      } 

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_422.json"
    E o retorno sera do tipo JSON
    #E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                 | httpcode | valor_simulado | id_tipo_valor_simulado | data_primeiro_vencimento | codigo | mensagem                                | campo                    | mensagemCampo                             | valor      |
      | emprestimos/v2/simulacoes_crediario |      422 |           8000 |                      1 | 2019-01-01               |    422 | Parâmetros fora dos limites permitidos. | data_primeiro_vencimento | data_primeiro_vencimento deve estar entre | 2019-01-01 |

  @httpcode422
  Esquema do Cenario: Retonar erro httpcode 422 quando a quantidade de parcelas estiver fora do limite permitido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "quantidade_parcelas": <quantidade_parcelas>
      }
      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_422.json"
    E o retorno sera do tipo JSON
    #E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | quantidade_parcelas | url                                 | httpcode | codigo | mensagem                                | campo               | mensagemCampo                        | valor |
      |                   1 | emprestimos/v2/simulacoes_crediario |      422 |    422 | Parâmetros fora dos limites permitidos. | quantidade_parcelas | quantidade_parcelas deve estar entre |     1 |

  @httpcode422
  Esquema do Cenario: Retonar erro httpcode 422 quando o valor solicitado estiver fora do limite permitido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "valor_simulado": <valor_simulado>,
      "id_tipo_valor_simulado": <id_tipo_valor_simulado>,
      "data_primeiro_vencimento": "<data_primeiro_vencimento>"
      } 

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_422.json"
    E o retorno sera do tipo JSON
    #E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                 | httpcode | valor_simulado | id_tipo_valor_simulado | data_primeiro_vencimento | codigo | mensagem                                | campo          | mensagemCampo                   | valor |
      | emprestimos/v2/simulacoes_crediario |      422 |             50 |                      1 | 2020-01-30               |    422 | Parâmetros fora dos limites permitidos. | valor_simulado | valor_simulado deve estar entre |    50 |

  @httpcode422
  Esquema do Cenario: Retonar erro httpcode 422 quando informar todos os campos fora do limite permitido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "valor_simulado": <valor_simulado>,
      "id_tipo_valor_simulado": <id_tipo_valor_simulado>,
      "data_primeiro_vencimento": "<data_primeiro_vencimento>"
      } 

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_422.json"
    E o retorno sera do tipo JSON
    E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"

    Exemplos: 
      | url                                 | httpcode | valor_simulado | id_tipo_valor_simulado | data_primeiro_vencimento | codigo | mensagem                                |
      | emprestimos/v2/simulacoes_crediario |      422 |             50 |                      1 | 2020-01-30               |    422 | Parâmetros fora dos limites permitidos. |

  @httpcode400
  Esquema do Cenario: Retonar erro httpcode 400 quando informar todos campos obrigatorios
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      
      } 

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"

    Exemplos: 
      | url                                 | httpcode | codigo  | mensagem              |
      | emprestimos/v2/simulacoes_crediario |      400 | 400 | Solicitação Imprópria |

  @httpcode400
  Esquema do Cenario: Retonar erro httpcode 400 quando informar o campo valor_simulado inválido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "valor_simulado": <valor_simulado>,
      "id_tipo_valor_simulado": <id_tipo_valor_simulado>,
      "data_primeiro_vencimento": "<data_primeiro_vencimento>"
      } 

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_400.json"
    E o retorno sera do tipo JSON
    #E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                 | httpcode | id_tipo_valor_simulado | data_primeiro_vencimento | codigo  | mensagem              | valor_simulado | mensagemCampo                                               | campo                         | valor |
      | emprestimos/v2/simulacoes_crediario |      400 |                      1 | 2020-01-30               | 400 | Solicitação Imprópria | "XXX"          | O campo deve ser numérico.                                  | valorSimulacao                | XXX   |
      | emprestimos/v2/simulacoes_crediario |      400 | "X"                    | 2020-01-30               | 400 | Solicitação Imprópria |           8000 | id_tipo_valor_simulado somente aceita os valores 1, 2 ou 3. | idTipoValorSimulado           | X     |
      | emprestimos/v2/simulacoes_crediario |      400 |                      1 | XXXX                     | 400 | Solicitação Imprópria |           8000 | O formato de data inválido yyyy-mm-dd.                      | dataVencimentoPrimeiraParcela | XXXX  |

  @httpcode4000
  Esquema do Cenario: Retonar erro httpcode 400 quando informar todos os campos inválidos
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "valor_simulado": <valor_simulado>,
      "id_tipo_valor_simulado": <id_tipo_valor_simulado>,
      "data_primeiro_vencimento": <data_primeiro_vencimento>
      } 

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_400.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                 | httpcode | id_tipo_valor_simulado | data_primeiro_vencimento | valor_simulado |
      | emprestimos/v2/simulacoes_crediario |      400 | "X"                    | "XXX"                    | "XXX"          |

  @httpcode400
  Esquema do Cenario: Retonar erro httpcode 400 quando não informado o campo valor_simulado
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      
      "valor_simulado": <valor_simulado>,
      "id_tipo_valor_simulado": <id_tipo_valor_simulado>,
      "data_primeiro_vencimento": <data_primeiro_vencimento>
      } 

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_400.json"
    E o retorno sera do tipo JSON
    #E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                 | httpcode | id_tipo_valor_simulado | data_primeiro_vencimento | codigo  | mensagem              | valor_simulado | campo                    | mensagemCampo     | valor |
      | emprestimos/v2/simulacoes_crediario |      400 |                      1 | "2020-01-30"             | 400 | Solicitação Imprópria | null           | valor_simulado           | Campo Obrigatório | null  |
      | emprestimos/v2/simulacoes_crediario |      400 | null                   | "2020-01-30"             | 400 | Solicitação Imprópria |           8000 | id_tipo_valor_simulado   | Campo Obrigatório | null  |
      | emprestimos/v2/simulacoes_crediario |      400 |                      1 | null                     | 400 | Solicitação Imprópria |           8000 | data_primeiro_vencimento | Campo Obrigatório | null  |

  @httpcode400
  Esquema do Cenario: Retonar as condicoes de pagamento e taxa do emprestimo quando informado um valor de parcela personalizado
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "quantidade_parcelas": <quantidade_parcelas>
      }

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_400.json"
    E o retorno sera do tipo JSON
    #E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | quantidade_parcelas | url                                 | httpcode | codigo  | mensagem              | campo               | mensagemCampo                       | valor |
      | "XXX"               | emprestimos/v2/simulacoes_crediario |      400 | 400 | Solicitação Imprópria | quantidade_parcelas | Campo com valor de formato inválido | XXX   |

  @httpcode4000
  Esquema do Cenario: Retonar as condicoes de pagamento e taxa do emprestimo quando informado um valor de parcela vazio
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "quantidade_parcelas": <quantidade_parcelas>
      }

      """
    Quando realizar chamada na API "<url>" informando o id_simulacao_crediario e o json
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
    E o schema sera valido "schema-CEFESQD15-108\Codigo_400.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | quantidade_parcelas | url                                 | httpcode |
      | ""                  | emprestimos/v2/simulacoes_crediario |      400 |

  @httpcode404
  Esquema do Cenario: Retonar erro httpcode 404 quando informar um id_simulação_crediário inexistente
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "valor_simulado": <valor_simulado>,
      "id_tipo_valor_simulado": <id_tipo_valor_simulado>,
      "data_primeiro_vencimento": "<data_primeiro_vencimento>"
      } 

      """
    Quando realizar chamada na API "<url>" informando o "<id_simulacao_crediario>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15-108\Codigo_404.json"
    E o retorno sera do tipo JSON
    E a API deve retornar o codigo "<codigo>" e mensagem "<mensagem>"

    Exemplos: 
      | url                                  | id_simulacao_crediario               | httpcode | valor_simulado | id_tipo_valor_simulado | data_primeiro_vencimento | codigo | mensagem                 |
      | emprestimos/v2/simulacoes_crediario/ | bdfe4a3d-9164-46a8-bcbb-0f80f208666X |      404 |        1200.00 |                      1 | 2019-08-10               |    404 | Simulação não encontrada |
