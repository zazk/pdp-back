package pe.com.pdp.cliente;

import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.xml.bind.DatatypeConverter;

import com.fasterxml.jackson.databind.ObjectMapper;

public class Cliente {
//grant_type=password&username=bill&password=abc123
    private static final String GRANT_TYPE = "password";
    private static final String CLIENT_ID = "SERVICIOS_MIRAFLORES";
    private static final String CLIENT_SECRET = "R34CH$3rv1c3_p4ssWord_$s3cr3t";
    private static final String TOKEN_URL = "http://localhost:8080/pdp-rest/oauth/token";

    
    public static void main(String[] args) {
    	try {
    		AccessToken a = Cliente.getToken("arturo" , "123456");
    		System.out.println(a.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
    public static AccessToken getToken(String usuario , String password)  throws MalformedURLException, IOException {
    	
    	
    	 String urlParameters = "?grant_type=" + GRANT_TYPE + "&username=" + usuario + "&password=" + password;
         String userpass = CLIENT_ID + ":" + CLIENT_SECRET;
         String basicAuth = "Basic " + DatatypeConverter.printBase64Binary(userpass.getBytes());

         URL tokenURL = new URL(TOKEN_URL + urlParameters);
         HttpURLConnection conn = (HttpURLConnection) tokenURL.openConnection();
         conn.setRequestMethod("POST");
         conn.setRequestProperty("Authorization", basicAuth);

         int responseCode = conn.getResponseCode();
         String response = getString(conn);
         System.out.println(response);

         ObjectMapper mapper = new ObjectMapper();
         AccessToken accessToken = mapper.readValue(response, AccessToken.class);

         return accessToken;
    	
    }
    
    private static String getString(HttpURLConnection conn) throws IOException {
        String response="";
//        try (BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
//            String inputLine;
//            StringBuilder sb = new StringBuilder();
//            while ((inputLine = in.readLine()) != null) {
//                sb.append(inputLine);
//            }
//            response = sb.toString();
//        }
        return response;
    }

    public static class AccessToken {

        @JsonProperty(value = "access_token")
        private String accessToken;
        @JsonProperty(value = "token_type")
        private String tokenType;
        @JsonProperty(value = "refresh_token")
        private String refreshToken;
        @JsonProperty(value = "expires_in")
        private int expiresIn;
        @JsonProperty(value = "scope")
        private String scope;

        public String getAccessToken() {
            return accessToken;
        }

        public void setAccessToken(String accessToken) {
            this.accessToken = accessToken;
        }

        public String getTokenType() {
            return tokenType;
        }

        public void setTokenType(String tokenType) {
            this.tokenType = tokenType;
        }

        public String getRefreshToken() {
            return refreshToken;
        }

        public void setRefreshToken(String refreshToken) {
            this.refreshToken = refreshToken;
        }

        public int getExpiresIn() {
            return expiresIn;
        }

        public void setExpiresIn(int expiresIn) {
            this.expiresIn = expiresIn;
        }

        public String getScope() {
            return scope;
        }

        public void setScope(String scope) {
            this.scope = scope;
        }

        @Override
        public String toString() {
            return "AccessToken[access_token: '" + accessToken + "'; token_type: '" + tokenType + "'; expires_in: " + expiresIn + "; scope: '" + scope + "']";
        }
    }

}
