package de.variationenzumthema.internet.ipblockingfilter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * IPBlockingFilter
 *
 * Use a filter to allow/block traffic from a certain IP.
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
public class IPBlockingFilter implements Filter {

    private FilterConfig config;

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.config = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {

        String ip = request.getRemoteAddr();
        if (!ip.startsWith("127.0.")) {
            chain.doFilter(request, response);

        } else {
            if (response instanceof HttpServletResponse) {
                ((HttpServletResponse) response).sendError(
                        HttpServletResponse.SC_FORBIDDEN,
                        "Your IP has been blocked!");
            }
        }

    }

    @Override
    public void destroy() {
        // does nothing
    }

}
