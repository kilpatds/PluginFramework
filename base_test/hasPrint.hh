#ifndef HASPRINT_H
#define HASPRINT_H 1

#include <string>

class hasPrint {
public:
    virtual std::string print(void) { return "Override me"; }; // = 0
    virtual ~hasPrint() {};
    hasPrint() {};
};

#endif
