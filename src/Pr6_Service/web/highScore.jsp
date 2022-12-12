<!DOCTYPE html>
<html>
    <head>
        <script src="webservice.js" type="text/javascript" async="false"></script>
    </head>    
    <body>
        <h1>HighScore</h1>
        <table border="1" cellpadding="1" cellspacing="1">
            <tbody>
                <tr>
                    <td style="text-align: center;">
                        <strong>URL</strong></td>
                    <td>
                        <div style="width: 200px; font-weight: bold; text-align: center;">GET</div>
                    </td>
                    <td style="text-align: center;">
                        <div style="width: 200px; font-weight: bold; text-align: center;">PUT</div>
                    </td>
                    <td style="text-align: center;">
                        <div style="width: 200px; font-weight: bold; text-align: center;">POST</div>
                    </td>
                    <td style="text-align: center;">
                        <div style="width: 240px; font-weight: bold; text-align: center;">DELETE</div>
                    </td>
                </tr>
                <tr>
                    <td>
                        highscores/</td>
                    <td>
Use below without args
                    </td>
                    <td>n/a</td>
                    <td>
<a href="#" onclick="sendPostRequest('service/highscores/');return false;">
    POST</a><br/>
<input type="text" size="25" id="jsonPOST" value='{"userId":"fish","score":222}'><br/>
<span id="responsePOST">&nbsp;</span><br/>
<span id="statusCodePOST">&nbsp;</span>
                    </td>
                    <td>n/a</td>
                </tr>
                <tr>
                    <td>
                        highscores/ralph</td>
                    <td>
<a href="#" onclick="sendGetRequest('service/highscores/');return false;">
    GET</a> highscores/
<input type="text" size="5" id="urnGET" value="ralph"><br/><br/>
<span id="responseGET">&nbsp;</span><br/>
<span id="statusCodeGET">&nbsp;</span>
                    </td>
                    <td>
<a href="#" onclick="sendPutJsonRequest('service/highscores/');return false;">
    PUT</a> highscores/
<input type="text" size="5" id="urnPUT" value="ralph"><br/>
<input type="text" size="25" id="jsonPUT" value='{"userId":"ralph","score":111}'><br/>
<span id="responsePUT">&nbsp;</span><br/>
<span id="statusCodePUT">&nbsp;</span>                       
                    </td>
                    <td>
n/a                        
                    </td>
                    <td>
<a href="#" onclick="sendDeleteRequest('service/highscores/');return false;">
    DELETE</a> highscores/
<input type="text" size="5" id="urnDELETE" value="ralph"><br/>
<span id="responseDELETE">&nbsp;</span><br/>
<span id="statusCodeDELETE">&nbsp;</span><br/><br/>
                    </td>
                </tr>
            </tbody>
        </table>        
    </body>
</html>
