// This file includes a sample plugin using the plugin framework.
//

#include <string>
#include "Plugin"

#include "hasPrint.hh"

PLUGIN(hasPrint,Foo) {
public:
    ~Foo() {}

    // Define the plugin methods.
    std::string print(void) {
        return "Foo::print";
    }
};

PLUGIN_DEFS(hasPrint, Foo);
