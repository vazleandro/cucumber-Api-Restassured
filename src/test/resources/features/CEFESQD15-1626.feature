# language: pt
@CEFESQD15_1626
Funcionalidade: Cadastro Inicial da Pre-Proposta
  Como Sistema Produto
  Quero Realizar o cadastro inicial da proposta de contratação de crediário
  Para Que o cliente possa confirmar interesse nas condições da mesma e enviá-la para análise

  @httpcode200
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas retorna o httpcode 200 e o id_proposta_crediario
    Dado que eu realize autenticacao via token proposta
    Dado que utilize o json
      """
      {
      "id_proposta_convivencia": "000113048",
      "id_produto_financeiro": 76,
      "valor_solicitado": 8500.50,
      "percentual_valor_solicitado_financiado": 97.65,
      "valor_iof": 204.77,
      "percentual_valor_iof_financiado": 2.35,
      "valor_total_proposta": 8705.27,
      "percentual_valor_total_proposta_financiado": 100,
      "condicoes_simulacao": {
        "id_plano_comercializacao": 100991,
        "id_tipo_aprovacao_credito": 3
      },
      "cliente": {
      "agencia": 1500,
        "conta": "0001079",
        "codigo_validacao_conta":6,
        "numero_titular_conta": "000001",
        "cpf_cnpj": "01204588104",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341",
         "id_tipo_pessoa": "F"
      
      },
      "precificacao": {
        "percentual_taxa_juro_nominal_mensal": 3.91,
        "percentual_taxa_juro_nominal_anual": 0.476756573135,
        "percentual_taxa_juro_mora": 1.0391,
        "percentual_taxa_multa_atraso":  2,
        "percentual_cet_mensal": 0.31,
        "percentual_cet_anual": 3.9
      },
      "parcelamento": {
        "quantidade_parcelas": 16,
        "valor_parcela": 747.5,
        "data_vencimento_primeira_parcela": "2020-03-20",
        "data_vencimento_ultima_parcela": "2021-06-21"
      
      }
      }

      """
    Quando realizar chamada na API de proposta "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_1626\Codigo_200.json"
    E o retorno sera do tipo JSON
    E o id_proposta_crediario sera "<id_proposta_crediario>"

    Exemplos: 
      | url                                | httpcode | id_proposta_crediario |
      | emprestimos/v2/propostas_crediario |      200 | notNull               |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas e nao informar os campos obrigatórios
    Dado que eu realize autenticacao via token proposta
    Dado que utilize o json
      """
      {
      "id_proposta_convivencia": <id_proposta_convivencia>,
      "id_produto_financeiro": <id_produto_financeiro>,
      
      "valor_solicitado": <valor_solicitado>,
      "percentual_valor_solicitado_financiado": <percentual_valor_solicitado_financiado>,
      "valor_iof": <valor_iof>,
      "percentual_valor_iof_financiado": <percentual_valor_iof_financiado>,
      "valor_total_proposta": <valor_total_proposta>,
      "percentual_valor_total_proposta_financiado": <percentual_valor_total_proposta_financiado>,
      "condicoes_simulacao": {
      "id_plano_comercializacao": <id_plano_comercializacao>,
      "id_tipo_aprovacao_credito": <id_tipo_aprovacao_credito>
      },
      "cliente":{
      "cpf_cnpj": "<cpf_cnpj>",
      "id_tipo_pessoa": "<id_tipo_pessoa>",
      "tipo_instituicao_financeira": "<tipo_instituicao_financeira>",
      "codigo_instituicao_financeira": "<codigo_instituicao_financeira>",
      "agencia": "<agencia>",
      "conta": "<conta>",
      "codigo_validacao_conta": <codigo_validacao_conta>,
      "numero_titular_conta": "<numero_titular_conta>"
      },
      
      "precificacao": {
        "percentual_taxa_juro_nominal_mensal": <percentual_taxa_juro_nominal_mensal>,
        "percentual_taxa_juro_nominal_anual": <percentual_taxa_juro_nominal_anual>,
        "percentual_taxa_juro_mora": <percentual_taxa_juro_mora>,
        "percentual_taxa_multa_atraso": <percentual_taxa_multa_atraso>,
        "percentual_cet_mensal": <percentual_cet_mensal>,
        "percentual_cet_anual": <percentual_cet_anual>
      },
      "parcelamento": {
        "quantidade_parcelas": <quantidade_parcelas>,
        "valor_parcela": <valor_parcela>,
        "data_vencimento_primeira_parcela": "<data_vencimento_primeira_parcela>",
        "data_vencimento_ultima_parcela": "<data_vencimento_ultima_parcela>"
      }
      }
      """
    Quando realizar chamada na API de proposta "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_1626\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>" array

    Exemplos: 
      | id_proposta_convivencia | id_produto_financeiro | id_plano_comercializacao | id_tipo_aprovacao_credito | cpf_cnpj       | id_tipo_pessoa | tipo_instituicao_financeira | codigo_instituicao_financeira | agencia | conta   | codigo_validacao_conta | numero_titular_conta | valor_solicitado | percentual_valor_solicitado_financiado | valor_iof | percentual_valor_iof_financiado | valor_total_proposta | percentual_valor_total_proposta_financiado | percentual_taxa_juro_nominal_mensal | percentual_taxa_juro_nominal_anual | percentual_taxa_juro_mora | percentual_taxa_multa_atraso | percentual_cet_mensal | percentual_cet_anual | quantidade_parcelas | valor_parcela | data_vencimento_primeira_parcela | data_vencimento_ultima_parcela | url                                | httpcode | codigo | mensagem              | campo                                      | mensagemCampo                                                | valor |
      | ""                      |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | idPropostaConvivencia                      | O Id de Proposta Convivencia deve conter no maximo 9 digitos |       |
      |               123456789 | ""                    |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | codigoProdutoFinanceiro                    | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 | ""                       |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | condicoesSimulacao.idPlanoComercializacao  | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 | ""                        | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | condicoesSimulacao.idTipoAprovacaoCredito  | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 |                         2 |                | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.cpfCnpjCliente                     | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | null           |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.codigoTipoPessoa                   | Codigo tipo pessoa deve conter 1 caracter                    | null  |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                             |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.tipoInstituicaoFinanceira          | Tipo de instituição financeira deve conter 3 digitos         |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                               |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.codigoInstituicaoFinanceira        | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |         | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.agenciaCliente                     | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 |         |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.contaCliente                       | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 |         | ""                     |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.codigoValidacaoContaCliente        | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 |         |                      5 |                      |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.numeroTitularContaCliente          | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 | ""               |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | valorSolicitado                            | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 | ""                                     |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | percetualValorSolicitadoFinanciado         | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 | ""        |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | valorIOF                                   | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 | ""                              |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | percetualValorIOFFinanciado                | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 | ""                   |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | valorTotal                                 | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 | ""                                         |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | percetualValorTotalPropostaFinanciado      | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 | ""                                  |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | precificacao.percentualTaxaJuroMensal      | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 | ""                                 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | precificacao.percentualTaxaJuroAnual       | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 | ""                        |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | precificacao.percentualTaxaJuroMora        | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 | ""                           |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | precificacao.percentualTaxaMultaAtraso     | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 | ""                    |                  3.9 |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | precificacao.percentualCETMensal           | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 | ""                   |                  16 |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | precificacao.percentualCETAnual            | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 | ""                  |         747.5 | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | parcelamento.quantidadeParcelas            | O campo deve ser numérico e sem espaços.                     |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 | ""            | 2020-03-20                       | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | parcelamento.valorParcela                  | O campo deve ser numérico.                                   |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 |                                  | 2021-06-21                     | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | parcelamento.dataVencimentoPrimeiraParcela | O formato de data inválido yyyy-mm-dd.                       |       |
      |               123456789 |                    76 |                123456789 |                         2 | 12345678901234 | F              |                         004 |                           341 |    1234 | 0012345 |                      5 |               000005 |          8500.50 |                                  97.65 |    204.77 |                            2.35 |              8705.27 |                                        100 |                                3.91 |                     0.476756573135 |                    1.0391 |                            2 |                  0.31 |                  3.9 |                  16 |         747.5 | 2020-03-20                       |                                | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | parcelamento.dataVencimentoUltimaParcela   | O formato de data inválido yyyy-mm-dd.                       |       |

  @httpcode403
  Esquema do Cenario: Verificar se ao chamar a API Cadastro Inicial da Pre-Proposta Interface com o canal informando uma credencial não autorizada é retornado erro 403
    Dado que eu realize autenticacao via token "Token invalido"
    Dado que utilize o json
      """
      {
      "id_proposta_convivencia": "000113048",
      "id_produto_financeiro": 76,
      "valor_solicitado": 8500.50,
      "percentual_valor_solicitado_financiado": 97.65,
      "valor_iof": 204.77,
      "percentual_valor_iof_financiado": 2.35,
      "valor_total_proposta": 8705.27,
      "percentual_valor_total_proposta_financiado": 100,
      "condicoes_simulacao": {
        "id_plano_comercializacao": 100991,
        "id_tipo_aprovacao_credito": 3
      },
      "cliente": {
      "agencia": 1500,
        "conta": "0001079",
        "codigo_validacao_conta":6,
        "numero_titular_conta": "000001",
        "cpf_cnpj": "01204588104",
        "tipo_instituicao_financeira": "004",
        "codigo_instituicao_financeira": "341",
         "id_tipo_pessoa": "F"
      
      },
      "precificacao": {
        "percentual_taxa_juro_nominal_mensal": 3.91,
        "percentual_taxa_juro_nominal_anual": 0.476756573135,
        "percentual_taxa_juro_mora": 1.0391,
        "percentual_taxa_multa_atraso":  2,
        "percentual_cet_mensal": 0.31,
        "percentual_cet_anual": 3.9
      },
      "parcelamento": {
        "quantidade_parcelas": 16,
        "valor_parcela": 747.5,
        "data_vencimento_primeira_parcela": "2020-03-20",
        "data_vencimento_ultima_parcela": "2021-06-21"
      
      }
      }

      """
    Quando realizar chamada na API de proposta "<url>"
    Entao e retornado Httpcode <httpcode>

    #E o schema sera valido "schema-CEFESQD15_1626\Codigo_403.json"
    #E o retorno sera do tipo JSON
    Exemplos: 
      Exemplos:

      | url                                | httpcode |
      | emprestimos/v2/propostas_crediario |      403 |

  @httpcode400
  Esquema do Cenario: Verificar se ao chamar a API / propostas_analisadas para atualização do ciclo do correntista e informar os campos inválidos
    Dado que eu realize autenticacao via token proposta
    Dado que utilize o json
      """
      {
      "valor_solicitado": 8500.50,
      "percentual_valor_solicitado_financiado": 97.65,
      "valor_iof": 204.77,
      "percentual_valor_iof_financiado": 2.35,
      "valor_total_proposta": 8705.27,
      "percentual_valor_total_proposta_financiado": 100,
      "id_proposta_convivencia": <id_proposta_convivencia>,
      "id_produto_financeiro": <id_produto_financeiro>,
      "condicoes_simulacao": {
      "id_plano_comercializacao": <id_plano_comercializacao>,
      "id_tipo_aprovacao_credito": <id_tipo_aprovacao_credito>
      },
      "cliente":{
      "cpf_cnpj": "<cpf_cnpj>",
      "id_tipo_pessoa": "<id_tipo_pessoa>",
      "tipo_instituicao_financeira": "<tipo_instituicao_financeira>",
      "codigo_instituicao_financeira": "<codigo_instituicao_financeira>",
      "agencia": "<agencia>",
      "conta": "<conta>",
      "codigo_validacao_conta": <codigo_validacao_conta>,
      "numero_titular_conta": "<numero_titular_conta>"
      },
      "precificacao": {
        "percentual_taxa_juro_nominal_mensal": 3.91,
        "percentual_taxa_juro_nominal_anual": 0.476756573135,
        "percentual_taxa_juro_mora": 1.0391,
        "percentual_taxa_multa_atraso":  2,
        "percentual_cet_mensal": 0.31,
        "percentual_cet_anual": 3.9
      },
      "parcelamento": {
        "quantidade_parcelas": 16,
        "valor_parcela": 747.5,
        "data_vencimento_primeira_parcela": "2020-03-20",
        "data_vencimento_ultima_parcela": "2021-06-21"
      
      }
      }

      """
    Quando realizar chamada na API de proposta "<url>"
    Entao e retornado Httpcode <httpcode>
    E o schema sera valido "schema-CEFESQD15_1626\Codigo_400.json"
    E o retorno sera do tipo JSON
    E a API deve retornar codigo "<codigo>" mensagem "<mensagem>" campo "<campo>"  mensagem "<mensagemCampo>" valor "<valor>" array

    Exemplos: 
      | id_proposta_convivencia | id_produto_financeiro | id_plano_comercializacao | id_tipo_aprovacao_credito | cpf_cnpj         | id_tipo_pessoa | tipo_instituicao_financeira | codigo_instituicao_financeira | agencia | conta    | codigo_validacao_conta | numero_titular_conta | url                                | httpcode | codigo | mensagem              | campo                                     | mensagemCampo                                                        | valor            |
      |             11111111111 |                    76 |                123456789 |                         2 |   12345678901234 | F              |                         004 |                           341 |    1234 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | idPropostaConvivencia                     | O Id de Proposta Convivencia deve conter no maximo 9 digitos         |      11111111111 |
      |               123456789 |               1234567 |                123456789 |                         2 |   12345678901234 | F              |                         004 |                           341 |    1234 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | codigoProdutoFinanceiro                   | O Id de Produto Financeiro deve conter no maximo 6 digitos           |          1234567 |
      |               123456789 |                    76 |               1234567890 |                         2 |   12345678901234 | F              |                         004 |                           341 |    1234 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | condicoesSimulacao.idPlanoComercializacao | O Id de plano comercializacao deve conter no maximo 9 digitos        |       1234567890 |
      |               123456789 |                    76 |                123456789 |                       123 |   12345678901234 | F              |                         004 |                           341 |    1234 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | condicoesSimulacao.idTipoAprovacaoCredito | O Id de tipo de aprovacao de crédito deve conter no maximo 2 digitos |              123 |
      |               123456789 |                    76 |                123456789 |                         2 | 1234567890123400 | F              |                         004 |                           341 |    1234 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.cpfCnpjCliente                    | CPF/CNPJ do cliente deve conter no maximo 15 digitos                 | 1234567890123400 |
      |               123456789 |                    76 |                123456789 |                         2 |   12345678901234 | XX             |                         004 |                           341 |    1234 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.codigoTipoPessoa                  | Codigo tipo pessoa deve conter 1 caracter                            | XX               |
      |               123456789 |                    76 |                123456789 |                         2 |   12345678901234 | F              |                        1234 |                           341 |    1234 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.tipoInstituicaoFinanceira         | Tipo de instituição financeira deve conter 3 digitos                 |             1234 |
      |               123456789 |                    76 |                123456789 |                         2 |   12345678901234 | F              |                         004 |                          1234 |    1234 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.codigoInstituicaoFinanceira       | Código de instituição financeira deve conter 3 digitos               |             1234 |
      |               123456789 |                    76 |                123456789 |                         2 |   12345678901234 | F              |                         004 |                           341 |   12345 |  0012345 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.agenciaCliente                    | Agencia do cliente deve conter 4 digitos                             |            12345 |
      |               123456789 |                    76 |                123456789 |                         2 |   12345678901234 | F              |                         004 |                           341 |    1234 | 00123456 |                      5 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.contaCliente                      | Conta do cliente deve conter 7 digitos                               |         00123456 |
      |               123456789 |                    76 |                123456789 |                         2 |   12345678901234 | F              |                         004 |                           341 |    1234 |  0012345 |                     12 |               000005 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.codigoValidacaoContaCliente       | Dac do cliente deve conter 1 digitos                                 |               12 |
      |               123456789 |                    76 |                123456789 |                         2 |   12345678901234 | F              |                         004 |                           341 |    1234 |  0012345 |                      5 |              1234567 | emprestimos/v2/propostas_crediario |      400 |    400 | Solicitação Imprópria | cliente.numeroTitularContaCliente         | Numero titular da conta do cliente deve conter no maximo 6 digitos   |          1234567 |
