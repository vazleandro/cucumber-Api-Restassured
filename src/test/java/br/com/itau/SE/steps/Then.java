package br.com.itau.SE.steps;

import static br.com.itau.SE.steps.Given.bodyRequestJson;
import static br.com.itau.SE.steps.When.metodo;
import static br.com.itau.SE.steps.When.response;
import static br.com.itau.SE.steps.When.uriBase;
import static io.restassured.module.jsv.JsonSchemaValidator.matchesJsonSchemaInClasspath;
import static org.hamcrest.Matchers.empty;
import static org.hamcrest.Matchers.equalTo;
import static org.hamcrest.Matchers.not;
import static org.hamcrest.Matchers.notNullValue;

import java.io.IOException;
import java.util.List;
import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import br.com.itau.SE.dao.ConnectSql;
import br.com.itau.SE.evidencias.EvidenciasRelatorio;
import br.com.itau.SE.model.QuantidadeSimulacoes;
import br.com.itau.SE.properties.Propriedades;
import br.com.itau.SE.utils.Token;
import cucumber.api.Scenario;
import cucumber.api.java.After;
import cucumber.api.java.pt.Entao;
import io.restassured.RestAssured;
import io.restassured.http.ContentType;
import io.restassured.path.json.JsonPath;
import io.restassured.specification.RequestSpecification;

public class Then {

	Propriedades url = new Propriedades();
	Token authorization = new Token();
	RequestSpecification request = RestAssured.given();

	@Entao("^o cliente pode seguir com a simulação Httpcode (\\d+)$")
	public void oClientePodeSeguirComASimulaçãoHttpcode(int httpcode) throws Throwable {

		System.out.println("body" + response.body().prettyPrint());
		response.then().statusCode(httpcode);

	}

	@Entao("^e retornado Httpcode (\\d+)$")
	public void eRetornadoHttpcode(int httpcode) throws Throwable {

		System.out.println("body" + response.body().prettyPrint());
		response.then().statusCode(httpcode);

	}

	@Entao("^o schema sera valido \"([^\"]*)\"$")
	public void oSchemaSeraValido(String nameSchema) throws Throwable {

		response.then().body(matchesJsonSchemaInClasspath(nameSchema));

	}

	@Entao("^o retorno sera do tipo JSON$")
	public void oRetornoSeraDoTipoJSON() throws Throwable {

		response.then().contentType(ContentType.JSON);

	}

	@Entao("^a API deve retornar \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
	public void aAPIDeveRetornar(String valor_minimo_disponivel, String valor_maximo_disponivel,
			String quantidade_minima_parcela, String quantidade_maxima_parcela, String valor_minimo_parcela,
			String valor_maximo_parcela, String data_minima_vencimento, String data_maxima_vencimento,
			String data_sugerida_primeiro_vencimento, String taxa_minima_juros, String taxa_maxima_juros)
			throws Throwable {

		String condicoes_contratacao = "data.condicoes_contratacao.";
		response.then()

				.body(condicoes_contratacao + valor_minimo_disponivel, notNullValue())
				.body(condicoes_contratacao + valor_maximo_disponivel, notNullValue())
				.body(condicoes_contratacao + quantidade_minima_parcela, notNullValue())
				.body(condicoes_contratacao + quantidade_maxima_parcela, notNullValue())
				.body(condicoes_contratacao + valor_minimo_parcela, notNullValue())
				.body(condicoes_contratacao + valor_maximo_parcela, notNullValue())
				.body(condicoes_contratacao + data_minima_vencimento, notNullValue())
				.body(condicoes_contratacao + data_maxima_vencimento, notNullValue())
				.body(condicoes_contratacao + data_sugerida_primeiro_vencimento, notNullValue())
				.body(condicoes_contratacao + taxa_minima_juros, notNullValue())
				.body(condicoes_contratacao + taxa_maxima_juros, notNullValue())

				.body(condicoes_contratacao + valor_minimo_disponivel, not(empty()))
				.body(condicoes_contratacao + valor_maximo_disponivel, not(empty()))
				.body(condicoes_contratacao + quantidade_minima_parcela, not(empty()))
				.body(condicoes_contratacao + quantidade_maxima_parcela, not(empty()))
				.body(condicoes_contratacao + valor_minimo_parcela, not(empty()))
				.body(condicoes_contratacao + valor_maximo_parcela, not(empty()))
				.body(condicoes_contratacao + data_minima_vencimento, not(empty()))
				.body(condicoes_contratacao + data_maxima_vencimento, not(empty()))
				.body(condicoes_contratacao + data_sugerida_primeiro_vencimento, not(empty()))
				.body(condicoes_contratacao + taxa_minima_juros, not(empty()))
				.body(condicoes_contratacao + taxa_maxima_juros, not(empty()));
	}

	@Entao("^a API deve retornar \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
	public void aAPIDeveRetornar(String id_simulacao_crediario, String valor_minimo_disponivel,
			String valor_maximo_disponivel, String quantidade_minima_parcela, String quantidade_maxima_parcela,
			String valor_minimo_parcela, String valor_maximo_parcela, String data_minima_vencimento,
			String data_maxima_vencimento, String data_sugerida_primeiro_vencimento, String taxa_minima_juros,
			String taxa_maxima_juros) throws Throwable {

		String condicoes_contratacao = "condicoes_contratacao.";
		response.then().body(id_simulacao_crediario, notNullValue())
				.body(condicoes_contratacao + valor_minimo_disponivel, notNullValue())
				.body(condicoes_contratacao + valor_maximo_disponivel, notNullValue())
				.body(condicoes_contratacao + quantidade_minima_parcela, notNullValue())
				.body(condicoes_contratacao + quantidade_maxima_parcela, notNullValue())
				.body(condicoes_contratacao + valor_minimo_parcela, notNullValue())
				.body(condicoes_contratacao + valor_maximo_parcela, notNullValue())
				.body(condicoes_contratacao + data_minima_vencimento, notNullValue())
				.body(condicoes_contratacao + data_maxima_vencimento, notNullValue())
				.body(condicoes_contratacao + data_sugerida_primeiro_vencimento, notNullValue())
				.body(condicoes_contratacao + taxa_minima_juros, notNullValue())
				.body(condicoes_contratacao + taxa_maxima_juros, notNullValue())

				.body(id_simulacao_crediario, not(empty()))
				.body(condicoes_contratacao + valor_minimo_disponivel, not(empty()))
				.body(condicoes_contratacao + valor_maximo_disponivel, not(empty()))
				.body(condicoes_contratacao + quantidade_minima_parcela, not(empty()))
				.body(condicoes_contratacao + quantidade_maxima_parcela, not(empty()))
				.body(condicoes_contratacao + valor_minimo_parcela, not(empty()))
				.body(condicoes_contratacao + valor_maximo_parcela, not(empty()))
				.body(condicoes_contratacao + data_minima_vencimento, not(empty()))
				.body(condicoes_contratacao + data_maxima_vencimento, not(empty()))
				.body(condicoes_contratacao + data_sugerida_primeiro_vencimento, not(empty()))
				.body(condicoes_contratacao + taxa_minima_juros, not(empty()))
				.body(condicoes_contratacao + taxa_maxima_juros, not(empty()));

	}

	@Entao("^a API deve retornar \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\" \"([^\"]*)\"$")
	public void aAPIDeveRetornar(String id_oferta, String cpf_cnpj_cliente, String banco_cliente,
			String agencia_cliente, String conta_cliente, String codigo_validacao_conta_cliente,
			String valor_minimo_disponivel, String valor_maximo_disponivel, String valor_minimo_parcela,
			String valor_maximo_parcela, String prazo_minimo, String prazo_maximo, String data_vencimento_minima,
			String data_vencimento_maxima, String data_primeiro_vencimento_sugerida) throws Throwable {

		response.then().body(id_oferta, notNullValue())
					   .body(cpf_cnpj_cliente, notNullValue())
					   .body(banco_cliente, notNullValue())
					   .body(agencia_cliente, notNullValue())
					   .body(conta_cliente, notNullValue())
					   .body(codigo_validacao_conta_cliente, notNullValue())
					   .body(valor_minimo_disponivel, notNullValue())
					   .body(valor_maximo_disponivel, notNullValue())
					   .body(valor_minimo_parcela, notNullValue())
					   .body(valor_maximo_parcela, notNullValue())
					   .body(prazo_minimo, notNullValue())
					   .body(prazo_maximo, notNullValue())
					   .body(data_vencimento_minima, notNullValue())
					   .body(data_vencimento_maxima, notNullValue())
					   .body(data_primeiro_vencimento_sugerida, notNullValue())

					   .body(id_oferta, not(empty())).body(cpf_cnpj_cliente, not(empty()))
					   .body(banco_cliente, not(empty()))
					   .body(agencia_cliente, not(empty()))
					   .body(conta_cliente, not(empty()))
					   .body(codigo_validacao_conta_cliente, not(empty()))
					   .body(valor_minimo_disponivel, not(empty()))
					   .body(valor_maximo_disponivel, not(empty()))
					   .body(valor_minimo_parcela, not(empty()))
					   .body(valor_maximo_parcela, not(empty()))
					   .body(prazo_minimo, not(empty()))
					   .body(prazo_maximo, not(empty()))
					   .body(data_vencimento_minima, not(empty()))
					   .body(data_vencimento_maxima, not(empty()))
					   .body(data_primeiro_vencimento_sugerida, not(empty()));

	}

	@Entao("^o cliente nao pode seguir com a simulação Httpcode (\\d+)$")
	public void oClienteNaoPodeSeguirComASimulaçãoHttpcode(int httpcode) throws Throwable {

		response.then().statusCode(httpcode);
		
	}

	@Entao("^a API deve retornar quantidade_simulacoes_permitidas, quantidade_simulacoes_submetidas, quantidade_dias_descanso e valores$")
	public void aAPIDeveRetornarQuantidade_simulacoes_permitidasQuantidade_simulacoes_submetidasQuantidade_dias_descansoEValores()
			throws Throwable {

		JsonPath path = response.getBody().jsonPath();

		List<QuantidadeSimulacoes> simulacoes = path.getList(".", QuantidadeSimulacoes.class);

		QuantidadeSimulacoes responseNumeroMaximoTentativas = simulacoes.stream()
				.filter(item -> item.getCodigo().equals("quantidade_simulacoes_permitidas")).findFirst().orElse(null);

		QuantidadeSimulacoes responseTentativasSubmetidas = simulacoes.stream()
				.filter(item -> item.getCodigo().equals("quantidade_simulacoes_submetidas")).findFirst().orElse(null);

		QuantidadeSimulacoes responseDiasDescanso = simulacoes.stream()
				.filter(item -> item.getCodigo().equals("quantidade_dias_descanso")).findFirst().orElse(null);

		Assert.assertThat(responseNumeroMaximoTentativas, notNullValue());
		Assert.assertThat(responseTentativasSubmetidas, notNullValue());
		Assert.assertThat(responseDiasDescanso, notNullValue());

		Assert.assertThat(responseNumeroMaximoTentativas.getMensagem(), notNullValue());
		Assert.assertThat(responseTentativasSubmetidas.getMensagem(), notNullValue());
		Assert.assertThat(responseDiasDescanso.getMensagem(), notNullValue());

	}

	@Entao("^a API deve retornar codigo \"([^\"]*)\" mensagem \"([^\"]*)\" campo \"([^\"]*)\"  mensagem \"([^\"]*)\" valor \"([^\"]*)\"$")
	public void aAPIDeveRetornarCodigoCampoMensagemValor(String codigo, String mensagem, String campo,
			String mensagemCampo, String valor) throws Throwable {

		response.then().body("codigo",CoreMatchers.hasItems(codigo))
        .body("mensagem", CoreMatchers.hasItems(mensagem))
		.body("campos.campo", CoreMatchers.hasItems(CoreMatchers.hasItems(campo)))
		.body("campos.mensagem".toString(),
				CoreMatchers.hasItems(CoreMatchers.hasItems(CoreMatchers.containsString(mensagemCampo))))
		.body("campos.valor", CoreMatchers.hasItems(CoreMatchers.hasItems(valor)));
	}

	@Entao("^a API deve retornar codigo \"([^\"]*)\" mensagem \"([^\"]*)\" campo \"([^\"]*)\"  mensagem \"([^\"]*)\" valor \"([^\"]*)\" array$")
	public void aAPIDeveRetornarCodigoMensagemCampoMensagemValorArray(String codigo, String mensagem, String campo,
			String mensagemCampo, String valor) throws Throwable {

		response.then().body("codigo",CoreMatchers.hasItems(codigo))
		        .body("mensagem", CoreMatchers.hasItems(mensagem))
				.body("campos.campo", CoreMatchers.hasItems(CoreMatchers.hasItems(campo)))
				.body("campos.mensagem".toString(),
						CoreMatchers.hasItems(CoreMatchers.hasItems(CoreMatchers.containsString(mensagemCampo))))
				.body("campos.valor", CoreMatchers.hasItems(CoreMatchers.hasItems(valor)));

	}

	@Entao("^a API deve retornar o codigo \"([^\"]*)\"$")
	public void aAPIDeveRetornarOCodigoMensagem(String codigo) throws Throwable {
		
		response.then().body("codigo", CoreMatchers.hasItems(codigo));
	}

	@Entao("^a API deve retornar o codigo \"([^\"]*)\" mensagem \"([^\"]*)\"$")
	public void aAPIDeveRetornarOCodigoMensagem(String codigo, String mensagem) throws Throwable {
		
		response.then().body("codigo", equalTo(codigo)).body("mensagem", equalTo(mensagem));

	}

	@Entao("^sera inserido em Banco de dados o ciclo para o correntista \"([^\"]*)\" \"([^\"]*)\"$")
	public void seraInseridoEmBancoDeDadosOCicloParaOCorrentista(String cpf, boolean canal_atendimento)
			throws Throwable {

		boolean cicloInserido = ConnectSql.consultaCicloDeSimulacoes(cpf.trim());

		if (canal_atendimento) {
			Assert.assertTrue(cicloInserido);
			ConnectSql.deleteCicloDeSimulacoes(cpf.trim());

		} else {
			Assert.assertFalse(cicloInserido);
		}

	}

	@Entao("^a API deve retornar codigo \"([^\"]*)\" mensagem \"([^\"]*)\" campo \"([^\"]*)\"  mensagem \"([^\"]*)\"$")
	public void aAPIDeveRetornarCodigoMensagemCampoMensagem(String codigo, String mensagem, String campo,
			String mensagemCampo) throws Throwable {

		response.then().body("codigo", equalTo(codigo))
					   .body("mensagem", equalTo(mensagem))
					   .body("campos.campo", CoreMatchers.hasItems(campo)).body("campos.valor", not(empty()))
					   .body("campos.mensagem".toString(),
						CoreMatchers.hasItems(CoreMatchers.hasItems(CoreMatchers.containsString(mensagemCampo))));

	}

	@Entao("^a API deve retornar o codigo \"([^\"]*)\" e mensagem \"([^\"]*)\"$")
	public void aAPIDeveRetornarOCodigoEMensagem(String codigo, String mensagem) throws Throwable {

		response.then().body("codigo", CoreMatchers.hasItems(codigo))
		.body("mensagem".toString(),CoreMatchers.hasItems(CoreMatchers.containsString(mensagem)));

	}

	@Entao("^codigo sera  \"([^\"]*)\" e mensagem \"([^\"]*)\"$")
	public void codigoSeraEMensagem(String codigo, String mensagem) throws Throwable {
		response.then().body("codigo", CoreMatchers.hasItems(codigo))
		                .body("mensagem".toString(),CoreMatchers.hasItems(CoreMatchers.containsString(mensagem)));
	}

	@Entao("^o id_proposta_crediario sera \"([^\"]*)\"$")
	public void oId_proposta_crediarioSera(String id_proposta_crediario) throws Throwable {

		if (id_proposta_crediario.equals("notNull")) {
			response.then().body("id_proposta_crediario", notNullValue());
		} else {
			response.then().body("id_proposta_crediario", equalTo(null));
		}

	}
	
	@Entao("^o codigo de negociacao é (\\d+)$")
	public void oCodigoDeNegociacaoÉ(int codigo_situacao_negociacao) throws Throwable {
		
		response.then().body("data.codigo_situacao_negociacao", equalTo(codigo_situacao_negociacao));
		
	}
	

	@After
	public void relatorioCucumber(Scenario scenario) throws IOException {

		EvidenciasRelatorio relatorio = new EvidenciasRelatorio();

		if (response.then().log().body().extract().statusCode() == 201 || (response.then().log().body().extract().statusCode() == 403 )) {

			relatorio.evidenciasAPIEmptyResponse(scenario, metodo, uriBase,
					response.then().log().status().extract().statusCode(), bodyRequestJson);

		}
		else {
			relatorio.evidenciasAPI(scenario, metodo, uriBase, response.then().log().status().extract().statusCode(),
					response.then().log().body().extract().jsonPath().prettyPrint(), bodyRequestJson);
		}

	}

}
