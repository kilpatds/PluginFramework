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
