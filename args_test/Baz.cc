// 
// $Id: foo.cc,v 1.5 2008/05/01 03:56:02 kilpatds Exp $
// GPL.  Copyright 2003, Douglas Kilpatrick.
//
// This file includes a sample plugin using the plugin framework.
//

#include <string>
#include "Plugin"

#include "takesArg.hh"

PLUGIN(takesArg,Baz) {
    private:
	std::string arg;

    public:
	~Baz() {}
	Baz(std::string a) : arg(a) {}

	// Define the plugin methods.
	std::string print(void) {
	    return "Baz::" + arg;
	}
};

/* Magic? */
PLUGIN_DEFS(takesArg,Baz,std::string)
