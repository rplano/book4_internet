
function sendGetRequest(url) {
    var urn = document.getElementById("urnGET").value;
    url = url + urn;
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE) {
            document.getElementById("responseGET").innerHTML = xmlhttp.responseText;
            document.getElementById("statusCodeGET").innerHTML = xmlhttp.status;
        }
    }
    xmlhttp.open("GET", url, true);
    xmlhttp.send();
}

function sendPutJsonRequest(url) {
    var urn = document.getElementById("urnPUT").value;
    url = url + urn;
    var json = document.getElementById("jsonPUT").value;
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE) {
            document.getElementById("responsePUT").innerHTML = xmlhttp.responseText;
            document.getElementById("statusCodePUT").innerHTML = xmlhttp.status;
        }
    }
    xmlhttp.open("PUT", url, true);
    xmlhttp.setRequestHeader("Content-type", "application/json");
    //xmlhttp.setRequestHeader("Content-type", "application/xml");
    xmlhttp.send(json);
}

function sendPostRequest(urn) {
    var json = document.getElementById("jsonPOST").value;
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE) {
            document.getElementById("responsePOST").innerHTML = xmlhttp.responseText;
            document.getElementById("statusCodePOST").innerHTML = xmlhttp.status;
        }
    }
    xmlhttp.open("POST", urn, true);
    xmlhttp.setRequestHeader("Content-type", "application/json");
    //xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    xmlhttp.send(json);
}

function sendDeleteRequest(url) {
    var urn = document.getElementById("urnDELETE").value;
    url = url + urn;
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (xmlhttp.readyState == XMLHttpRequest.DONE) {
            document.getElementById("responseDELETE").innerHTML = xmlhttp.responseText;
            document.getElementById("statusCodeDELETE").innerHTML = xmlhttp.status;
        }
    }
    xmlhttp.open("DELETE", url, true);
    xmlhttp.send();
}