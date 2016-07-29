#!/bin/env python

from twisted.web import static, twcgi

class PerlScript(twcgi.FilteredScript):
    filter = '/usr/bin/perl' # Points to the perl parser

resource = static.File("/usr/local/dhcpstatus/scripts") # Points to the perl website
resource.processors = {".cgi": PerlScript}
                                          # processed by PerlScript
resource.indexNames = ['dhcpstatus.cgi']
