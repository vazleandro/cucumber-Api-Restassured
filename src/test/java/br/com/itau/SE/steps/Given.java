package br.com.itau.SE.steps;

import br.com.itau.SE.properties.Propriedades;
import br.com.itau.SE.utils.Token;
import cucumber.api.java.es.Dado;
import io.restassured.RestAssured;
import io.restassured.specification.RequestSpecification;

public class Given {

	public static String token;
	public static String bodyRequestJson;

	Propriedades url = new Propriedades();
	Token authorization = new Token();
	RequestSpecification request = RestAssured.given();

	@Dado("^que eu realize autenticacao via token$")
	public void queEuRealizeAutenticacaoViaToken() throws Throwable {

		token = authorization.geraToken();

	}
	
	@Dado("^que eu realize autenticacao via token proposta$")
	public void queEuRealizeAutenticacaoViaTokenProposta() throws Throwable {
		
		token = authorization.geraTokenProposta();
	}
	

	@Dado("^que utilize o json$")
	public void queUtilizeOJson(String json) throws Throwable {

		// ConnectSql.deleteCicloDeSimulacoes("2010025");
		bodyRequestJson = json;

	}

	@Dado("^que eu realize autenticacao via token \"([^\"]*)\"$")
	public void queEuRealizeAutenticacaoViaToken(String tokenExpriado) throws Throwable {

		token = tokenExpriado;
	}

}
