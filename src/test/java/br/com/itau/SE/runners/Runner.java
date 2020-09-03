package br.com.itau.SE.runners;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.SnippetType;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(

	features = "classpath:features", tags = {"@CEFESQD15_111"},
//	features = "classpath:features", tags = {"@CEFESQD15_491","@httpcode200"}, - Executar cenários especificos (executa todos os cenarios httpcode200 da feature 491).
		glue = "br.com.itau.SE.steps",
		plugin = {
				"pretty", "html:target/report-html",
				"json:target/cucumber-reports/cucumber.json" },
		monochrome = true,
		snippets = SnippetType.CAMELCASE,
		dryRun = false,
		strict = true)

public class Runner {

}