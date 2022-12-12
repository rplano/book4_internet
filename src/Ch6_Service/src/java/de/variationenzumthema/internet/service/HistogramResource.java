package de.variationenzumthema.internet.service;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Request;
import javax.ws.rs.core.UriInfo;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * HistogramResource
 *
 * A restful resource.
 *
 * @see javapapers.com/java/restful-web-services-with-java-jax-rs-using-jersey/
 * @see www.mkyong.com/webservices/jax-rs/restfull-java-client-with-java-net-url/
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Path("/histogram")
public class HistogramResource {

    public HistogramResource() {
        super();
    }

    /**
     * Read a HighScore from database. 
     * URI: /service/histogram/ 
     * Method: GET
     * Resource: {"data":[5, 11, 15, 20, 17, 20]}
     * Status: 200
     */
    @GET    
    @Produces(MediaType.APPLICATION_JSON)
    public HistogramData getHistogram() {
        return new HistogramData();
    }
}