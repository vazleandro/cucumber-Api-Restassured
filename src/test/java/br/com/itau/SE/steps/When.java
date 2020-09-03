package br.com.itau.SE.steps;

import static br.com.itau.SE.steps.Given.bodyRequestJson;
import static br.com.itau.SE.steps.Given.token;

import br.com.itau.SE.dao.ConnectSql;
import br.com.itau.SE.properties.Propriedades;
import br.com.itau.SE.utils.Request.methodo;
import br.com.itau.SE.utils.RetornaJsonRequest;
import br.com.itau.SE.utils.Token;
import cucumber.api.java.it.Quando;
import gherkin.deps.com.google.gson.JsonObject;
import gherkin.deps.com.google.gson.JsonParser;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class When {

	public static String uriBase;
	public static Response response;
	public static methodo metodo;
	
	String idSimulacaoCrediario;
	String idPlanoPagamento;
	String jsonPreCadastro;
	String jsonPlanosPagamento;
	String jsonIdPagamento;
	String jsonIdPropostaCrediario;
	String jsonEfetivacao;
	String idPropostaCrediario;

	Propriedades url = new Propriedades();
	Token authorization = new Token();
	RequestSpecification request = RestAssured.given();
	RetornaJsonRequest json = new RetornaJsonRequest();
	
	

	@Quando("^o correntista tiver seu limite de tentativas excedido$")
	public void oCorrentistaTiverSeuLimiteDeTentativasExcedido() throws Throwable {

		ConnectSql.insereLimiteDeSimulacoesExcedidas();
	}

	@Quando("^realizar chamada na API \"([^\"]*)\"$")
	public void realizarChamadaNaAPI(String api) throws Throwable {

		request = authorization.headerApi(request, token).body(bodyRequestJson);// .log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" e nao setar o contetype no header$")
	public void realizarChamadaNaAPIENaoSetarOContetypeNoHeader(String api) throws Throwable {

		request = authorization.headerApi500(request, token).body(bodyRequestJson);// .log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" onde execdeu o numero de tentativas$")
	public void realizarChamadaNaAPIOndeExecdeuONumeroDeTentativas(String api) throws Throwable {

		request = authorization.headerApi(request, token).body(bodyRequestJson);

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o \"([^\"]*)\"$")
	public void realizarChamadaNaAPIInformandoO(String api, String id_simulacao_crediario) throws Throwable {

		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api + id_simulacao_crediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediario(String api) throws Throwable {

		
		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;

		jsonPlanosPagamento = json.jsonPlanosPagamento(response);
		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanosPagamento).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e data_minima_vencimento$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEData_minima_vencimento(String api)
			throws Throwable {
		

		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;

		jsonPlanosPagamento = json.jsonPlanosPagamento(response);
		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanosPagamento).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;
	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e data_maxima_vencimento$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEData_maxima_vencimento(String api)
			throws Throwable {
		
		
		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;

		jsonPlanosPagamento = json.jsonPlanosPagamento(response);
		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanosPagamento).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;
	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e o json$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEOJson(String api, String jsonRequest) throws Throwable {

		
		request = authorization.headerApi(request, token).body(jsonRequest).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;

		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);
				
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e uma parcela personalizada (\\d+)$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEUmaParcelaPersonalizada(String api,
			int qtd_parcela) throws Throwable {
	
		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;

		
		jsonPlanosPagamento = json.jsonPlanosPagamento(response);
		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanosPagamento).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);

		String jsonPlanoPagamentoPersonalizado = "{\r\n  \"quantidade_parcelas\":" + qtd_parcela + "\r\n}";
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanoPagamentoPersonalizado).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;
	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando uma parcela personalizada$")
	public void realizarChamadaNaAPIInformandoUmaParcelaPersonalizada(String api, String json) throws Throwable {

		// 108

		request = authorization.headerApi(request, token).body(json).log().all();
		uriBase = url.uriBase(api + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e  o id_tipo_valor_simulado igual a (\\d+)$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEOId_tipo_valor_simuladoIgualA(String api,
			int id_tipo_valor_simulado) throws Throwable {

		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;

		
		jsonPlanosPagamento = json.jsonPlanosPagamentoIdTipoValorSimuladoEspecifico(response, id_tipo_valor_simulado);
		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);

	
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanosPagamento).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;
	}


	@Quando("^realizar chamada na API de proposta \"([^\"]*)\" informando um id_proposta$")
	public void realizarChamadaNaAPIDePropostaInformandoUmId_proposta(String api) throws Throwable {

		request = authorization.headerApiProposta(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().put(uriBase+ "/" + "8ea742c5-3d80-4785-8845-a7a9081e88ae");
		metodo = methodo.PUT;
		
	}
	
	
	@Quando("^realizar chamada na API de proposta \"([^\"]*)\"$")
	public void realizarChamadaNaAPIDeProposta(String api) throws Throwable {
		
		// API 1202

		request = authorization.headerApiProposta(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		metodo = methodo.POST;
	}
	

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e o id_plano_pagamento$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEOId_plano_pagamento(String api) throws Throwable {

		// API 503

		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		
		jsonPlanosPagamento = json.jsonPlanosPagamento(response);
		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);
		
	
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanosPagamento).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);

		jsonIdPagamento = json.retornaJsonIdPlanoParcelamento(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonIdPagamento).log().all();
		uriBase = url.uriBase(api + "/" + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e nao informando o id_plano_pagamento$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioENaoInformandoOId_plano_pagamento(String api,
			String json) throws Throwable {
		
		// API 503
		JsonObject jsonObject;
		String jsonIdPlanoPagamento;
		
		request = authorization.headerApi(request, token).body(json);
		uriBase = url.uriBase("emprestimos/v2/simulacoes_crediario");
		response = request.when().post(uriBase);

		jsonObject = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();
		idSimulacaoCrediario = jsonObject.get("data").getAsJsonObject().get("id_simulacao_crediario").getAsString();
		

		jsonIdPlanoPagamento = "{\"id_plano_parcelamento\":\"" + "" + "\"}";

		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonIdPlanoPagamento).log().all();
		uriBase = url.uriBase(api + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e informar um id_plano_pagamento inexistente$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEInformarUmId_plano_pagamentoInexistente(
			String api, String json) throws Throwable {

		// API 503
		JsonObject jsonObject;
		String jsonIdPlanoPagamento;
		
		request = authorization.headerApi(request, token).body(json);
		uriBase = url.uriBase("emprestimos/v2/simulacoes_crediario");
		response = request.when().post(uriBase);

		jsonObject = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();
		idSimulacaoCrediario = jsonObject.get("data").getAsJsonObject().get("id_simulacao_crediario").getAsString();

		idPlanoPagamento = "78c46486-a1e9-4e31-86e3-3a7aee763caT";

		jsonIdPlanoPagamento = "{\"id_plano_parcelamento\":\"" + idPlanoPagamento + "\"}";

		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonIdPlanoPagamento).log().all();
		uriBase = url.uriBase(api + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;

	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario inexistente$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioInexistente(String api) throws Throwable {

		// API 503

		String jsonIdPlanoPagamento;
		idPlanoPagamento = "78c46486-a1e9-4e31-86e3-3a7aee763caT";
		idSimulacaoCrediario = "78c46486-a1e9-4e31-86e3-3a7aee763caT";

		jsonIdPlanoPagamento = "{\"id_plano_parcelamento\":\"" + idPlanoPagamento + "\"}";

		request = authorization.headerApi(request, token).body(jsonIdPlanoPagamento).log().all();
		uriBase = url.uriBase(api + idSimulacaoCrediario);
		response = request.when().put(uriBase);
		metodo = methodo.PUT;
	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e o id_plano_pagamento e na sequencia chamar a API \"([^\"]*)\" de pre-proposta inteface com o canal$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEOId_plano_pagamentoENaSequenciaChamarAAPIDePrePropostaIntefaceComOCanal(String api, String apiInterfaceProposta) throws Throwable {
		
	
		//1628
		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		
		
		jsonPlanosPagamento = json.jsonPlanosPagamento(response);
		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanosPagamento).log().all();
		uriBase = url.uriBase(api) + "/" + idSimulacaoCrediario;
		response = request.when().put(uriBase);

		jsonIdPagamento = json.retornaJsonIdPlanoParcelamento(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonIdPagamento).log().all();
		uriBase = url.uriBase(api) + "/" + idSimulacaoCrediario;
		response = request.when().put(uriBase);

		JsonObject propostaCrediario = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();
		idPropostaCrediario = propostaCrediario.get("data").getAsJsonObject().get("id_proposta_crediario")
				.getAsString();
		
		jsonIdPropostaCrediario = "{\r\n    \"codigo_situacao_negociacao\": 8,\r\n    \"codigo_tipo_meio_formalizacao\": 7,\r\n    \"codigo_tipo_meio_liberacao\": 4,\r\n    \"codigo_tipo_meio_recebimento\": 1\r\n}\r\n";

		request = RestAssured.given();
		token = authorization.geraTokenProposta();
		uriBase = url.uriBase(apiInterfaceProposta);
		
		request = authorization.headerApiProposta(request, token).body(jsonIdPropostaCrediario).log().all();
		response = request.when().put(uriBase+ "/" + idPropostaCrediario);
		metodo = methodo.PUT;

	}
	
	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_simulacao_crediario e o id_plano_pagamento e na sequencia chamar a API \"([^\"]*)\" para liberação do dinheiro na conta do cliente$")
	public void realizarChamadaNaAPIInformandoOId_simulacao_crediarioEOId_plano_pagamentoENaSequenciaChamarAAPIParaLiberaçãoDoDinheiroNaContaDoCliente(String api, String apiInterfaceProposta) throws Throwable {

		//15-111
		request = authorization.headerApi(request, token).body(bodyRequestJson).log().all();
		uriBase = url.uriBase(api);
		response = request.when().post(uriBase);
		
		jsonPlanosPagamento = json.jsonPlanosPagamento(response);
		idSimulacaoCrediario = json.retornaidSimulacaoCrediario(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonPlanosPagamento).log().all();
		uriBase = url.uriBase(api) + "/" + idSimulacaoCrediario;
		response = request.when().put(uriBase);

		
		jsonIdPagamento = json.retornaJsonIdPlanoParcelamento(response);
		
		request = RestAssured.given();
		request = authorization.headerApi(request, token).body(jsonIdPagamento).log().all();
		uriBase = url.uriBase(api) + "/" + idSimulacaoCrediario;
		response = request.when().put(uriBase);

		JsonObject propostaCrediario = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();
		idPropostaCrediario = propostaCrediario.get("data").getAsJsonObject().get("id_proposta_crediario")
				.getAsString();
		
		jsonIdPropostaCrediario = "{\r\n    \"codigo_situacao_negociacao\": 8,\r\n    \"codigo_tipo_meio_formalizacao\": 7,\r\n    \"codigo_tipo_meio_liberacao\": 4,\r\n    \"codigo_tipo_meio_recebimento\": 1\r\n}\r\n";

		request = RestAssured.given();
		token = authorization.geraTokenProposta();
		uriBase = url.uriBase(apiInterfaceProposta);
		
		request = authorization.headerApiProposta(request, token).body(jsonIdPropostaCrediario).log().all();
		response = request.when().put(uriBase+ "/" + idPropostaCrediario);

		
		jsonEfetivacao = "{\r\n    \"codigo_situacao_negociacao\": 3\r\n}";
		
		request = RestAssured.given();
		token = authorization.geraTokenProposta();
		uriBase = url.uriBase(apiInterfaceProposta);
		request = authorization.headerApiProposta(request, token).body(jsonEfetivacao).log().all();
		
		response = request.when().put(uriBase+ "/" + idPropostaCrediario);
		metodo = methodo.PUT;

		
	}
	
	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_proposta inexistente$")
	public void realizarChamadaNaAPIInformandoOId_propostaInexistente(String apiInterfaceProposta) throws Throwable {
	 
		idPropostaCrediario = "e989dd41-c2ab-427b-a3db-d7bbface146c";
		
		request = RestAssured.given();
		token = authorization.geraTokenProposta();
		uriBase = url.uriBase(apiInterfaceProposta);
		request = authorization.headerApiProposta(request, token).body(bodyRequestJson).log().all();
		
		response = request.when().put(uriBase+ "/" + idPropostaCrediario);
		metodo = methodo.PUT;
		
	}

	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_proposta$")
	public void realizarChamadaNaAPIInformandoOId_proposta(String apiInterfaceProposta) throws Throwable {
	    
		idPropostaCrediario = "e989dd41-c2ab-427b-a3db-d7bbface146c";
		
		request = RestAssured.given();
		token = authorization.geraTokenProposta();
		uriBase = url.uriBase(apiInterfaceProposta);
		request = authorization.headerApiProposta(request, token).body(bodyRequestJson).log().all();
		
		response = request.when().put(uriBase+ "/" + idPropostaCrediario);
		metodo = methodo.PUT;
		
	}
	
	@Quando("^realizar chamada na API \"([^\"]*)\" informando o id_proposta inexistente invalido$")
	public void realizarChamadaNaAPIInformandoOId_propostaInexistenteInvalido(String apiInterfaceProposta) throws Throwable {

		idPropostaCrediario = "abc";
		
		request = RestAssured.given();
		token = authorization.geraTokenProposta();
		uriBase = url.uriBase(apiInterfaceProposta);
		request = authorization.headerApiProposta(request, token).body(bodyRequestJson).log().all();
		
		response = request.when().put(uriBase+ "/" + idPropostaCrediario);
		metodo = methodo.PUT;
		
	}

}
