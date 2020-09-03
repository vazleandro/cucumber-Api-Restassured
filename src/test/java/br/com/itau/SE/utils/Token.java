package br.com.itau.SE.utils;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import br.com.itau.SE.properties.Propriedades;
import gherkin.deps.com.google.gson.JsonObject;
import gherkin.deps.com.google.gson.JsonParser;
import io.restassured.RestAssured;
import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class Token {

	public String geraToken() throws IOException {

		JsonObject access_token;
		String token;
		Response response = null;
		RequestSpecification request = RestAssured.given();

		Properties propriedades;
		Propriedades prop = new Propriedades();
		propriedades = prop.getProp();

		request.header("x-itau-flowID", propriedades.getProperty("prop.x-itau-flowID"));
		request.header("x-itau-correlationID", propriedades.getProperty("prop.x-itau-correlationID"));
		propriedades.getProperty("Host", propriedades.getProperty("prop.Host"));

		request.formParams(bodyToken());

		response = request.given().post((propriedades.getProperty("prop.api.token")));

		access_token = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();
		token = access_token.get("access_token").getAsString();

		return token;

	}

	public String geraTokenProposta() throws IOException {

		JsonObject access_token;
		String token;
		Response response = null;
		RequestSpecification request = RestAssured.given();

		Properties propriedades;
		Propriedades prop = new Propriedades();
		propriedades = prop.getProp();

		request.header("x-itau-flowID", propriedades.getProperty("prop.x-itau-flowID"));
		request.header("x-itau-correlationID", propriedades.getProperty("prop.x-itau-correlationID.proposta"));
		propriedades.getProperty("Host", propriedades.getProperty("prop.Host"));

		request.formParams(bodyTokenProposta()).log().all();

		response = request.given().post((propriedades.getProperty("prop.api.token")));

		access_token = new JsonParser().parse(response.getBody().asString()).getAsJsonObject();
		token = access_token.get("access_token").getAsString();

		return token;

	}
	
	public static Map<String, String> bodyTokenProposta() throws IOException {

		Map<String, String> requestParams = new HashMap<String, String>();
		Properties propriedades;
		Propriedades prop = new Propriedades();
		propriedades = prop.getProp();

		requestParams.put("client_id", propriedades.getProperty("prop.client_id.proposta"));
		requestParams.put("client_secret", propriedades.getProperty("prop.client_secret.proposta"));
		requestParams.put("grant_type", propriedades.getProperty("prop.grant_type"));

		return requestParams;

	}

	
	public static Map<String, String> bodyToken() throws IOException {

		Map<String, String> requestParams = new HashMap<String, String>();
		Properties propriedades;
		Propriedades prop = new Propriedades();
		propriedades = prop.getProp();

		requestParams.put("client_id", propriedades.getProperty("prop.client_id"));
		requestParams.put("client_secret", propriedades.getProperty("prop.client_secret"));
		requestParams.put("grant_type", propriedades.getProperty("prop.grant_type"));

		return requestParams;

	}

	public RequestSpecification headerApiProposta(RequestSpecification request, String token) throws IOException {

		Properties propriedades;
		Propriedades prop = new Propriedades();
		propriedades = prop.getProp();

		request.header("Content-Type", propriedades.getProperty("prop.Content-Type.header"))
				.header("Authorization", "Bearer " + token)
				.header("x-itau-apikey", propriedades.getProperty("prop.x-itau-apikey.header.proposta"));

		return request;
	}

	
	public RequestSpecification headerApi(RequestSpecification request, String token) throws IOException {

		Properties propriedades;
		Propriedades prop = new Propriedades();
		propriedades = prop.getProp();

		request.header("Content-Type", propriedades.getProperty("prop.Content-Type.header"))
				.header("Authorization", "Bearer " + token)
				.header("x-itau-apikey", propriedades.getProperty("prop.x-itau-apikey.header"));

		return request;
	}
	
 	public RequestSpecification headerApi500(RequestSpecification request, String token) throws IOException {

		Properties propriedades;
		Propriedades prop = new Propriedades();
		propriedades = prop.getProp();

		request.header("Authorization", "Bearer " + token).header("x-itau-apikey",
				propriedades.getProperty("prop.x-itau-apikey.header"));

		return request;
	}

	public RequestSpecification queryParamApi(RequestSpecification request, String campo, String value)
			throws IOException {

		request.queryParams(campo, value);

		return request;
	}

}
