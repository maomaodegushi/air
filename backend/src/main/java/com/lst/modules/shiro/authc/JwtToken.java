package com.lst.modules.shiro.authc;
 
import org.apache.shiro.authc.AuthenticationToken;
 
/**
 * @author lee
 **/
public class JwtToken implements AuthenticationToken {
	
	private static final long serialVersionUID = 1L;
	private String token;
 
    public JwtToken(String token) {
        this.token = token;
    }
 
    @Override
    public Object getPrincipal() {
        return token;
    }
 
    @Override
    public Object getCredentials() {
        return token;
    }
}
