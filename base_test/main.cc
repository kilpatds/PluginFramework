// This file demonstrates how to use the plugin framework in the main
// application.
//

#include <stdio.h>
#include <stdlib.h>
#include <iostream>

#include "Plugin"
#include "hasPrint.hh"

PLUGIN_BASE()

using std::cout;
using std::cerr;
using std::endl;

int main(int argc, const char *const argv[])
{
    hasPrint *p = NULL;

    if (argc != 2) {
	cerr << "Usage: " << argv[0] << " <PluginName>" << endl;
	return EXIT_FAILURE;
    }

    try {
	// Autoload
	p = Plugin<hasPrint>::getPlugin(argv[1]);
    } catch (std::runtime_error &e) {
	cerr << "Failed to load plugin: " << e.what() << endl;
	exit(EXIT_FAILURE);
    }

    cout << p->print() << endl;
    return 0;
}



