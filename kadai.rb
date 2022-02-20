# Start the CGI program that receives and returns the data
require 'cgi'
cgi = CGI.new
# After receiving the data, return the response in HTML format
cgi.out("type" => "text/html", "charset" => "UTF-8") {
    # Take out the data of "goya" used as a marker of information with the description cgi ['goya'] and assign it to a local variable.
    html_middle = ""
    get = cgi['kadai']
    goyas = get.split('*')
    goyas.each do |goya| 
        record = goya.split(' ')
        html_middle += "<tr> 
                            <td>#{record[0]}</td>
                            <td>#{record[1]}</td>
                            <td>#{record[2]}</td>
                            <td>#{record[3]}</td>
                            <td>#{record[4]}</td>
                        </tr>"
    end
    
    "<!DOCTYPE html>
    <html lang=\"en\">
    <head>
        <meta charset=\"UTF-8\">
        <title>CGI||Application</title>

   
    </head>
    <body>
        <header>
            <h1>自家消費ではない　goyaの情報を表示します</h1>
        </header>
        <div class=\"container\">
            <table>
                <tr>
                    <th>Length</th>
                    <th>Weight</th>
                    <th>Quality</th>
                    <th>Give for</th>
                    <th>date</th>
                    

                    
                </tr>
                    " + html_middle + "
            </table>
        </div>

        <div class=\"back\">
            <a href=\"/\">Back</a>
        </div>
    </body>
    </html>"    
}
