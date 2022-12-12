<!DOCTYPE html>
<html>
    <body>
        <h1>Upload</h1>
        <p>Select a file to upload:</p>
        <form action="uploadLogic.jsp" method="POST" enctype="multipart/form-data">
            <input type="file" name="file"/><br/>
            <input type="submit" value="Upload Image"/>
        </form>
    </body>
</html>