package br.com.itau.SE.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import br.com.itau.SE.properties.Propriedades;

public class ConnectSql {

	static String connectionUrl;
		
	public static void insereLimiteDeSimulacoesExcedidas() throws IOException {

		Propriedades properties = new Propriedades();
		connectionUrl = properties.uriStringConexaoSql();

		Date dataAtual = new Date();

		SimpleDateFormat formatador = new SimpleDateFormat("yyyy-MM-dd");
		String data = formatador.format(dataAtual);

		String insertCicloSql = "insert into TBSE058_PARM_CICL_SIMU_EMPT(NUM_CPF_CNPJ,DAT_INIO_VIGE,QTD_SIMU_ENVD,IND_DESO) values (00011016768,'"+ data + "',10,'N')";
		String deleteCicloSql = "delete from TBSE058_PARM_CICL_SIMU_EMPT where NUM_CPF_CNPJ = 11016768";

		try (Connection con = DriverManager.getConnection(connectionUrl);
				PreparedStatement stmt = con.prepareStatement(deleteCicloSql);) {

			stmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		try (Connection con = DriverManager.getConnection(connectionUrl);
				PreparedStatement stmt = con.prepareStatement(insertCicloSql);) {

			stmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void deleteCicloDeSimulacoes(String cpf) throws IOException {

		Propriedades properties = new Propriedades();
		connectionUrl = properties.uriStringConexaoSql();

		String deleteCicloSql = "delete from TBSE058_PARM_CICL_SIMU_EMPT where NUM_CPF_CNPJ in (" + cpf + ")";

		try (Connection con = DriverManager.getConnection(connectionUrl);
				PreparedStatement stmt = con.prepareStatement(deleteCicloSql);) {

			stmt.execute();

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public static boolean consultaCicloDeSimulacoes(String cpf) throws IOException {

		Propriedades properties = new Propriedades();
		connectionUrl = properties.uriStringConexaoSql();
		boolean ciclo = false;

		String consultaCicloSql = "select * from TBSE058_PARM_CICL_SIMU_EMPT where NUM_CPF_CNPJ =" + cpf;

		try (Connection con = DriverManager.getConnection(connectionUrl);
				PreparedStatement stmt = con.prepareStatement(consultaCicloSql);) {

			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				ciclo = true;
				rs.close();
				System.out.println("[>> Log Ciclo encontrado << ]");

			} else {
				ciclo = false;
				rs.close();
				System.out.println("[>> Log Ciclo Não encontrado << ]");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ciclo;
	}

}
