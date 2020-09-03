package br.com.itau.SE.evidencias;

import br.com.itau.SE.utils.Request.methodo;
import cucumber.api.Scenario;
public class EvidenciasRelatorio {

	public void evidenciasAPI(Scenario scenario, methodo metodo, String uriBase, int statusCode, String response, String requestBody) {

		scenario.write("[ METHODO ] \n" + metodo);
		scenario.write("[ REQUEST URL ] \n" + uriBase);
		scenario.write("[ BODY REQUEST ] \n" + requestBody);
		scenario.write("[ HTTP CODE ] \n" + statusCode);
		scenario.write("[ RESPONSE BODY ] \n" + response);	

	}
	
	public void evidenciasAPIEmptyResponse(Scenario scenario, methodo metodo, String uriBase, int statusCode,String requestBody) {

		scenario.write("[ METHODO ] \n" + metodo);
		scenario.write("[ REQUEST URL ] \n" + uriBase);
		scenario.write("[ BODY REQUEST ] \n" + requestBody);
		scenario.write("[ HTTP CODE ] \n" + statusCode);
		
	}
}
