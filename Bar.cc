// 
// $Id: foo.cc,v 1.5 2008/05/01 03:56:02 kilpatds Exp $
// GPL.  Copyright 2003, Douglas Kilpatrick.
//
// This file includes a sample plugin using the plugin framework.
//

#include <string>
#include "Plugin"

#include "hasPrint.hh"

PLUGIN(hasPrint,Bar) {
public:
    ~Bar() {}

    // Define the plugin methods.
    std::string print(void) {
        return "Bar::print";
    }
};

PLUGIN_DEFS(hasPrint, Bar);
