<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%
    /**
     * MIT License (http://choosealicense.com/licenses/mit/)
     *
     * Apache Commons FileUpload Example
     *
     * @see
     * https://commons.apache.org/proper/commons-fileupload/using.html
     *
     * @author Ralph P. Lano
     */
    int maxFileSize = 5000 * 1024;  // 5 MB
    int maxMemSize = 1000 * 1024;   // 1 MB

    // Check that we have a file upload request
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if (isMultipart) {
        // Configure a repository (to ensure a secure temp location is used)
        ServletContext servletContext = this.getServletConfig().getServletContext();

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();
        // maximum size that will be stored in memory
        factory.setSizeThreshold(maxMemSize);
        // location to save data that is larger than maxMemSize.
        File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
        factory.setRepository(repository);

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);
        // maximum file size to be uploaded.
        upload.setSizeMax(maxFileSize);

        // Parse the request
        List<FileItem> items = upload.parseRequest(request);
        Iterator<FileItem> iter = items.iterator();
        while (iter.hasNext()) {
            FileItem item = iter.next();
            if (!item.isFormField()) {
                String filePath = servletContext.getRealPath("/");
                File uploadedFile = new File(filePath + item.getName());
                item.write(uploadedFile);
            }
        }
        out.println("Upload successful!");

    } else {
        out.println("No file uploaded");
    }
%>