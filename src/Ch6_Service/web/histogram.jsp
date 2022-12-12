<!DOCTYPE html>
<html>
    <head>
        <script type="text/javascript" src="https://d3js.org/d3.v4.min.js"></script>
        <style type="text/css">
            div.bar {
                display: inline-block;
                width: 20px;
                height: 75px;	/* Gets overriden by D3-assigned height below */
                margin-right: 2px;
                background-color: teal;
            }

        </style>
    </head>
    <body>
        <h1>Histogram</h1>
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

            getJSON("service/histogram",
                    function(err, data) {
                        if (err != null) {
                            alert("Something went wrong: " + err);
                        } else {
                            // from http://alignedleft.com/tutorials/d3/making-a-bar-chart
                            d3.select("body").selectAll("div")
                                    //.data(dataset)
                                    .data(data.data)
                                    .enter()
                                    .append("div")
                                    .attr("class", "bar")
                                    .style("background-color", function(d) {
                                        return "rgb(155, 102, " + d * 10 + ")"
                                    })
                                    .style("height", function(d) {
                                        var barHeight = d * 5;
                                        return barHeight + "px";
                                    });
                        }
                    });

        </script>
    </body>
</html>
