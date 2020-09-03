package br.com.itau.SE.properties;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Propriedades {

	public File criaDiretorio(boolean sucess) throws Throwable {

		Properties prop = getProp();
		File diretorio;

		if (sucess) {
			diretorio = new File(prop.getProperty("prop.diretorio"));
			if (!diretorio.exists()) {
				diretorio.mkdir();
			}
		} else {
			diretorio = new File(prop.getProperty("prop.diretorioErro"));
			if (!diretorio.exists()) {
				diretorio.mkdir();
			}
		}
		return diretorio;
	}

	public Properties getProp() throws IOException {
		Properties propriedade = new Properties();
		FileInputStream file = new FileInputStream("src/test/resources/properties/dados.properties");
		propriedade.load(file);

		return propriedade;
	}

	public String uriBase(String url) {

		String ambiente = null;
		Properties propriedades;

		try {
			propriedades = getProp();
			ambiente = propriedades.getProperty("prop.ambiente");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ambiente.concat(url);
	}

	public String uriStringConexaoSql() throws IOException {

		Properties propriedades;
		Propriedades prop = new Propriedades();
		propriedades = prop.getProp();

		String urlConexaoSql = propriedades.getProperty("prop.sql.ambiente");

		return urlConexaoSql;

	}

}
