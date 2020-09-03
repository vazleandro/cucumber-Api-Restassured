# language: pt
@CEFESQD15_502
Funcionalidade: Serviço Atualizar Quantidade de Tentativas
  Como sistema produto
  Quero Contabilizar a quantidade de PNs submetidas por client
  Para podermos conhecer o histórico de tentativas realizadas pelo correntista e verificar se o mesmo poderá ou não solicitar outra simulação em um momento futuro

  @httpcode201
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista o campo QTD_SIMU_ENVD é incrementado +1.
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "08962261669"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>

    Exemplos: 
      | url                                                      | httpcode |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      201 |

  @httpcode403
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista informando uma credencial não autorizada é retornado erro 403
    Dado que eu realize autenticacao via token "Token invalido"
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "08962261669"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_403.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                                      | httpcode |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      403 |

  @httpcode422
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo, quando não encontrado o ciclo para o correntista é retornado erro 422.
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "12345678901"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_422.json"
    E codigo sera  "<codigo>" e mensagem "<mensagem>"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem                                                   |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      422 |    422 | O cliente informado não possui um ciclo de simulação ativo |

  @httpcode500
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo e houver algum problema quando processar a requisição é retornado erro 500.
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "08962261669"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>" e nao setar o contetype no header
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_500.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                                      | httpcode |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      500 |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista e nao informar o campo cpf_cnpj
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
      
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem              | campo                  | mensagemCampo     | valor |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |    400 | Solicitação Imprópria | cliente.cpfCnpjCliente | Campo obrigatório | null  |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista e nao informar o campo id_proposta_crediario
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "08962261669"
      },
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem              | campo               | mensagemCampo     | valor |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |    400 | Solicitação Imprópria | idPropostaCrediario | Campo obrigatório | null  |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista e informar o campo cpf_cnpj inválido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "XXXXXXXXXXX"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON

    Exemplos: 
      | url                                                      | httpcode |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista e informar o campo data_envio inválido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "08962261669"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "XXXXX",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem              | campo     | mensagemCampo                          | valor |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |    400 | Solicitação Imprópria | dataEnvio | O formato de data inválido yyyy-mm-dd. | XXXXX |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista e informar o campo hora_envio inválido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "08962261669"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "2020-01-16",
      "hora_envio": "XXXX",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem              | campo     | mensagemCampo                                                      | valor |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |    400 | Solicitação Imprópria | horaEnvio | Hora em que o cliente submeteu a proposta deve conter 8 caracteres | XXXX  |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista e não informar os campos obrigatório
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
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem              | campo                  | mensagemCampo     | valor |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |    400 | Solicitação Imprópria | cliente.cpfCnpjCliente | Campo obrigatório | null  |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista e informar os campos  inválidos
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "XXXXXXXXXXX"
      },
      "id_proposta_crediario": "XXXXXXX",
      "data_envio": "XXXXXX",
      "hora_envio": "XXXXXX",
      "aprovada": "XXXX"
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem              | campo    | mensagemCampo       | valor |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |    400 | Solicitação Imprópria | aprovada | Campo inconsistente | XXXX  |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista quando informado cpf_cnpj com tamanho inválido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "089622616698788"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214",
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem              | campo                  | mensagemCampo                                        | valor           |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |    400 | Solicitação Imprópria | cliente.cpfCnpjCliente | CNPJ/CPF do cliente deve conter no máximo 14 digitos | 089622616698788 |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista quando informado id_proposta_crediario com tamanho inválido
    Dado que eu realize autenticacao via token
    Dado que utilize o json
      """
      {
      "cliente": {
        "cpf_cnpj": "08962261669"
      },
      "id_proposta_crediario": "97f98d67-ba5f-4d80-aa84-b2d5df1ca214xxxxx",
      "data_envio": "2020-01-16",
      "hora_envio": "23:59:59",
      "aprovada": true
      }
      """
    Quando realizar chamada na API "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_502\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>"

    Exemplos: 
      | url                                                      | httpcode | codigo | mensagem              | campo               | mensagemCampo                                                           | valor                                     |
      | emprestimos/v2/simulacoes_crediario/propostas_analisadas |      400 |    400 | Solicitação Imprópria | idPropostaCrediario | Identificador da proposta de crediário deve conter no máximo 36 digitos | 97f98d67-ba5f-4d80-aa84-b2d5df1ca214xxxxx |
