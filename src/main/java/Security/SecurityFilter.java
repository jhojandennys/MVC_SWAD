package Security;

import JWT.JWTUt;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import java.io.IOException;

@WebFilter(filterName = "SecurityFilter", urlPatterns = "/*")
public class SecurityFilter extends HttpFilter {
    private JWTUt JWTtUt = new JWTUt();

    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        String requestURI = req.getRequestURI();

                // Allow access to the specified URL without authentication
                if (requestURI.equals("/SWAD_Camas/auth/")) {
                    chain.doFilter(req, res);
                    return;
                }
       
        String authorization = req.getHeader("Authorization");

        if (authorization != null && authorization.startsWith("Bearer ")) {
            String token = authorization.substring(7).trim();

            if (JWTtUt.validateToken(token)) {
                chain.doFilter(req, res);
                return;
            } else {
                res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Token inválido o expirado");
                return;
            }
        }
        res.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Falta token de autenticación");
    }
}
