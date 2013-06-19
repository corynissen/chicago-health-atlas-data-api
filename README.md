chicago-health-atlas-data-api
=============================

Access to chicago health atlas data via http

Usage:

http://174.129.49.183/cgi-bin/R/health_data returns all data in json format

Use json=F to deliver in tabular format   
Use zip=chicago zip code to subset by zip code

Examples:

return all data in tabular form
http://174.129.49.183/cgi-bin/R/health_data?json=F 

return all data in json form
http://174.129.49.183/cgi-bin/R/health_data

return all data for zip 60707 in json form
http://174.129.49.183/cgi-bin/R/health_data?zip=60707

return all data for zip 60707 in tabular form
http://174.129.49.183/cgi-bin/R/health_data?zip=60707&json=F

