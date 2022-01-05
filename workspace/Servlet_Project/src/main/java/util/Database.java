package util;

import java.sql.Connection;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Database {

	public static Connection getCon() {
		Connection con = null;
		try {
			// Context.xml을 읽어옴
			Context init = new InitialContext();

			// 읽어온 context.xml에서 해당 이름을 가진 리소스를 찾아옴
			DataSource ds = (DataSource) init.lookup("java:/comp/env/jdbc/oracle");

			// 찾아온 리소스에서 콘넥션을 가져옴
			con = ds.getConnection();

		} catch (Exception e) {

			e.printStackTrace();
		}
		return con;
	}

}
