package de.variationenzumthema.internet.service;

import de.variationenzumthema.internet.highscore.HighScore;
import de.variationenzumthema.internet.highscore.HighScoreDao;
import java.util.List;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

/**
 * MIT License (http://choosealicense.com/licenses/mit/)
 *
 * HighScoreResource
 *
 * A restful resource.
 *
 * @see javapapers.com/java/restful-web-services-with-java-jax-rs-using-jersey/
 * @see
 * www.mkyong.com/webservices/jax-rs/restfull-java-client-with-java-net-url/
 *
 * @see http://www.VariationenZumThema.de/
 * @author Ralph P. Lano
 */
@Path("/highscores")
public class HighScoresResource {

    public HighScoresResource() {
        super(); 
    }

    /**
     * Read all HighScores from database. <br/>
     * URI: /service/highscores/ <br/>
     * Method: GET <br/>
     * Representation:
     * [{"score":42,"userId":"ralph"},{"score":12,"userId":"vince"}]
     * <br/>
     * Status: 200
     */
    @GET
    @Produces({MediaType.APPLICATION_JSON})
    public List<HighScore> getHighScores() {
        return HighScoreDao.getInstance().findAll();
    }

    /**
     * Read a HighScore from database. <br/>
     * URI: /service/highscores/ralph <br/>
     * Method: GET <br/>
     * Representation: {"score":42,"userId":"ralph"} <br/>
     * Status: 200 or 404
     */
    @GET
    @Path("/{param}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response getHighScore(@PathParam("param") String userId) {
        HighScore hs = HighScoreDao.getInstance().findById(userId);
        if (hs != null) {
            return Response.status(200).entity(hs).build();
        } else {
            return Response.status(404).entity("Unknown userId.").build();
        }
    }

    /**
     * Get number of HighScores in database. <br/>
     * URI: /service/highscores/count <br/>
     * Method: GET <br/>
     * Representation: 3 <br/>
     * Status: 200
     */
    @GET
    @Path("/count")
    @Produces(MediaType.TEXT_PLAIN)
    public String getHighScoresCount() {
        return String.valueOf(HighScoreDao.getInstance().findAll().size());
    }

    /**
     * Modify a HighScore in the database. <br/>
     * URI: /service/highscores/ <br/>
     * Method: PUT <br/>
     * Representation: {"score":111,"userId":"ralph"} <br/>
     * Status: 204 or 404
     */
    @PUT
    @Path("/{param}")
    @Consumes(MediaType.APPLICATION_JSON)
    public Response putHighScore(@PathParam("param") String userId, HighScore hs) {
        if ((userId != null) && (hs != null)) {
            if (userId.equals(hs.getUserId())) {
                if (HighScoreDao.getInstance().findById(userId) != null) {
                    HighScoreDao.getInstance().merge(hs);
                    String result = "HighScore updated: " + hs.getUserId();
                    return Response.status(204).entity(result).build();
                }
            }
        }
        return Response.status(404).entity("Not Found").build();
    }

    /**
     * Create a new HighScore in the database. <br/>
     * URI: /service/highscores/ <br/>
     * Method: POST <br/>
     * Representation: {"score":111,"userId":"fish"} <br/>
     * Status: 201 or 409
     */
    @POST
    @Consumes(MediaType.APPLICATION_JSON)
    public Response postHighScore(HighScore hs) {
        if (HighScoreDao.getInstance().findById(hs.getUserId()) == null) {
            HighScoreDao.getInstance().save(hs);
            String result = "HighScore created: " + hs.getUserId();
            return Response.status(201).entity(result).build();
        }
        return Response.status(409).entity("Conflict (resource already exists)").build();
    }

    /**
     * Delete a HighScore from the database. <br/>
     * URI: /service/highscores/ralph <br/>
     * Method: DELETE <br/>
     * Representation: n/a <br/>
     * Status: 204 or 404
     */
    @DELETE
    @Path("/{param}")
    public Response deleteHighScore(@PathParam("param") String userId) {
        if (HighScoreDao.getInstance().findById(userId) != null) {
            HighScore hs = HighScoreDao.getInstance().findById(userId);
            HighScoreDao.getInstance().delete(hs);
            String result = "HighScore deleted: " + hs.getUserId();
            return Response.status(204).entity(result).build();
        }
        return Response.status(404).entity("Not Found").build();

    }

//    @POST
//    @Path("/")
//    @Produces(MediaType.TEXT_HTML)
//    @Consumes(MediaType.APPLICATION_FORM_URLENCODED)
//    public Response postHighScore(@FormParam("userId") String userId,
//            @FormParam("score") Integer score,
//            @Context HttpServletResponse servletResponse) throws IOException {
//        if (HighScoreDao.getInstance().findById(userId) != null) {
//            return Response.status(409).entity("Conflict (resource already exists)").build();
//        } else {
//            HighScore hs = new HighScore(userId, score);
//            HighScoreDao.getInstance().save(hs);
//            return Response.status(201).entity(hs).build();            
//        }
//        //servletResponse.sendRedirect(".");
//    }
//    @PUT
//    @Produces(MediaType.TEXT_HTML)
//    @Consumes(MediaType.APPLICATION_JSON)
//    public void putHighScore(@PathParam("userId") String userId,
//            @PathParam("score") Integer score,
//            @Context HttpServletResponse servletResponse) throws IOException {
//        HighScore hs = new HighScore(userId, score);
//        HighScoreDao.getInstance().merge(hs);
//        servletResponse.sendRedirect(".");
//    }
//    @PUT
//    @Consumes(MediaType.APPLICATION_XML)
//    public Response putHighScore(JAXBElement<HighScore> highScoreElement) {
//        HighScore hs = highScoreElement.getValue();
//        HighScoreDao.getInstance().merge(hs);
//        Response response;
////        if (productService.getProducts().containsKey(product.getId())) {
////            response = Response.noContent().build();
////        } else {
//        response = Response.created(uriInfo.getAbsolutePath()).build();
////        }
////        productService.createProduct(product);
//        return response;
//    }
//    @GET
//    @Path("/")
//    @Produces(MediaType.TEXT_XML)
//    public List<HighScore> getHighScoresAsHtml() {
//        return HighScoreDao.getInstance().findAll();
//    }
}
