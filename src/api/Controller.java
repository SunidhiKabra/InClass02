package api;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.net.ssl.HttpsURLConnection;

public class Controller extends HttpServlet{
	
	private static HttpURLConnection con;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws MalformedURLException,
    ProtocolException, ServletException, IOException {

		String url = "ec2-18-216-97-75.us-east-2.compute.amazonaws.com:3000/admin_login";
        String urlParameters = "username=admin1&password=password1";
        byte[] postData = urlParameters.getBytes(StandardCharsets.UTF_8);
		
        try {

            URL myurl = new URL(url);
            con = (HttpURLConnection) myurl.openConnection();

            con.setDoOutput(true);
            con.setRequestMethod("POST");
            con.setRequestProperty("User-Agent", "Java client");
            con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");

            try (DataOutputStream wr = new DataOutputStream(con.getOutputStream())) {
                wr.write(postData);
            }

            StringBuilder content;

            try (BufferedReader in = new BufferedReader(
                    new InputStreamReader(con.getInputStream()))) {

                String line;
                content = new StringBuilder();

                while ((line = in.readLine()) != null) {
                    content.append(line);
                    content.append(System.lineSeparator());
                }
            }

            System.out.println(content.toString());

        } 
        catch(Exception e) {
        	e.printStackTrace();
        }
	}
}
