package br.com.itau.SE.utils;

import gherkin.deps.com.google.gson.JsonObject;
import gherkin.deps.com.google.gson.JsonParser;
import io.restassured.response.Response;

public class RetornaJsonRequest {
	
	JsonObject jsonObject;
	String valor_minimo_disponivel;
	String valor_maximo_disponivel;
	String data_sugerida_primeiro_vencimento;
	String jsonPlanosPagamento;
	String idSimulacaoCrediario;
	String jsonIdPagamento;
	String idPlanoPagamento;
	
	double valor_minimo_disponivelConvertido;
	double valor_maximo_disponivelConvertido;
	double valor_simulado;


	public String jsonPlanosPagamentoIdTipoValorSimuladoEspecifico(Response response, int id_tipo_valor_simulado) {

		
		jsonObject = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();

		valor_minimo_disponivel = jsonObject.get("data").getAsJsonObject().get("condicoes_contratacao")
				.getAsJsonObject().get("valor_minimo_disponivel").getAsString();

		data_sugerida_primeiro_vencimento = jsonObject.get("data").getAsJsonObject().get("condicoes_contratacao")
				.getAsJsonObject().get("data_sugerida_primeiro_vencimento").getAsString();

		valor_minimo_disponivelConvertido = Double.parseDouble(valor_minimo_disponivel);
		valor_simulado = valor_minimo_disponivelConvertido + 1000;

		valor_maximo_disponivel = jsonObject.get("data").getAsJsonObject().get("condicoes_contratacao")
				.getAsJsonObject().get("valor_maximo_disponivel").getAsString();
		valor_maximo_disponivelConvertido = Double.parseDouble(valor_maximo_disponivel);

		if (valor_simulado > valor_maximo_disponivelConvertido) {
			valor_simulado = valor_minimo_disponivelConvertido;
		}

		jsonPlanosPagamento = "{\"valor_simulado\":" + valor_simulado + "," +
								"\"id_tipo_valor_simulado\":"+ id_tipo_valor_simulado + "," +
								" \"data_primeiro_vencimento\": \"" + data_sugerida_primeiro_vencimento + "\"}";

		return jsonPlanosPagamento;
	}

	public String jsonPlanosPagamento(Response response) {

		
		jsonObject = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();

		valor_minimo_disponivel = jsonObject.get("data").getAsJsonObject().get("condicoes_contratacao")
				.getAsJsonObject().get("valor_minimo_disponivel").getAsString();

		data_sugerida_primeiro_vencimento = jsonObject.get("data").getAsJsonObject().get("condicoes_contratacao")
				.getAsJsonObject().get("data_sugerida_primeiro_vencimento").getAsString();

		valor_minimo_disponivelConvertido = Double.parseDouble(valor_minimo_disponivel);
		valor_simulado = valor_minimo_disponivelConvertido + 1000;

		valor_maximo_disponivel = jsonObject.get("data").getAsJsonObject().get("condicoes_contratacao")
				.getAsJsonObject().get("valor_maximo_disponivel").getAsString();
		valor_maximo_disponivelConvertido = Double.parseDouble(valor_maximo_disponivel);

		if (valor_simulado > valor_maximo_disponivelConvertido) {
			valor_simulado = valor_minimo_disponivelConvertido;
		}

		jsonPlanosPagamento = "{\"valor_simulado\":" + valor_simulado + "," +
								"\"id_tipo_valor_simulado\": 1,"+ 
								" \"data_primeiro_vencimento\": \"" + data_sugerida_primeiro_vencimento + "\"}";

		return jsonPlanosPagamento;
	}

	
	public String retornaidSimulacaoCrediario(Response response) {

		
		jsonObject = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();
		idSimulacaoCrediario = jsonObject.get("data").getAsJsonObject().get("id_simulacao_crediario").getAsString();

		return idSimulacaoCrediario;
	}
	

	public String retornaJsonIdPlanoParcelamento(Response response) {

		JsonObject planosPagamento = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();

		idPlanoPagamento = planosPagamento.get("data").getAsJsonObject().get("planos_parcelamento").getAsJsonArray()
				.get(0).getAsJsonObject().get("id_plano_parcelamento").getAsString();

		jsonIdPagamento = "{\"id_plano_parcelamento\":\"" + idPlanoPagamento + "\"}";

		return jsonIdPagamento;
	}

}
