package de.variationenzumthema.internet.securityfilter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.*;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * SecurityFilter
 *
 * Shows how to implement security using a filter.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class SecurityFilter implements Filter {

    private FilterConfig config;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpReq = (HttpServletRequest) request;
        HttpServletResponse httpResp = (HttpServletResponse) response;
        HttpSession session = httpReq.getSession();
         
        String user = (String)session.getAttribute("User");
        if ( user != null  ) {
            chain.doFilter(request, response);
        } else {
            httpResp.sendRedirect("../index.jsp");
            return;
        }
    }

    @Override
    public void destroy() {
        // does nothing
    }

}
