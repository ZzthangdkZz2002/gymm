package swp12.gym.common;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Component;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Component
public class GoogleUtils {

    private final static String GOOGLE_CLIENT_ID = "183838572195-7pihdf1po39ofnqomot2iohs5ok5dmjf.apps.googleusercontent.com";
    private final static String GOOGLE_CLIENT_SECRET = "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";
    private final static String GOOGLE_REDIRECT_URI = "http://localhost:8080/login-google";
    private final static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";
    private final static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";
    private  final static String GOOGLE_GRANT_TYPE = "authorization_code";

    public String getToken(final String code) throws ClientProtocolException, IOException {

        String response = Request.Post(GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", GOOGLE_CLIENT_ID)
                        .add("client_secret", GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();
        ObjectMapper mapper = new ObjectMapper();
        JsonNode node = mapper.readTree(response).get("access_token");
        return node.textValue();
    }

    public GooglePojo getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        System.out.println(response);
        ObjectMapper mapper = new ObjectMapper();
        GooglePojo googlePojo = mapper.readValue(response, GooglePojo.class);
        System.out.println(googlePojo);
        return googlePojo;
    }

    public UserDetails buildCustomer(GooglePojo googlePojo) {
        return getUserDetails(googlePojo, "ROLE_CUSTOMER");
    }

    private UserDetails getUserDetails(GooglePojo googlePojo, String role_customer) {
        boolean enabled = true;
        boolean accountNonExpired = true;
        boolean credentialsNonExpired = true;
        boolean accountNonLocked = true;
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority(role_customer));
        return new User(googlePojo.getEmail(), "", enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
    }

    public UserDetails buildAdmin(GooglePojo googlePojo) {
        return getUserDetails(googlePojo, "ROLE_ADMIN");
    }

    public UserDetails buildTrainer(GooglePojo googlePojo) {
        return getUserDetails(googlePojo, "ROLE_TRAINER");
    }

    public UserDetails buildEmployee(GooglePojo googlePojo) {
        return getUserDetails(googlePojo, "ROLE_EMPLOYEE");
    }
}