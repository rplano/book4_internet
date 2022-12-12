<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>
        <style type="text/css">
        </style>
    </head>
    <body>
        <h2>WorldMap</h2>
        <script type="text/javascript">
            // from http://stackoverflow.com/questions/12460378/how-to-get-json-from-url-in-javascript
            var getJSON = function(url, callback) {
                var xhr = new XMLHttpRequest();
                xhr.open("get", url, true);
                xhr.responseType = "json";
                xhr.onload = function() {
                    var status = xhr.status;
                    if (status == 200) {
                        callback(null, xhr.response);
                    } else {
                        callback(status);
                    }
                };
                xhr.send();
            };

            getJSON("worldmap",
                    function(err, data) {
                        if (err != null) {
                            alert("Something went wrong: " + err);
                        } else {
                            // from view-source:http://alignedleft.com/content/03-tutorials/01-d3/140-making-a-scatterplot/1.html
                            //Width and height
                            var w = 350;
                            var h = 200;

                            //Create SVG element
                            var svg = d3.select("body")
                                    .append("svg")
                                    .attr("width", w)
                                    .attr("height", h);

                            svg.selectAll("circle")
                                    .data(data.data)
                                    .enter()
                                    .append("circle")
                                    .attr("cx", function(d) {
                                        return d[0];
                                    })
                                    .attr("cy", function(d) {
                                        return d[1];
                                    })
                                    .attr("r", 3);
                        }
                    });

        </script>
    </body>
</html>
