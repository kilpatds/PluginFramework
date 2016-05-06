
#ifndef HASPRINT_H
#define HASPRINT_H 1

#include <string>

class takesArg {
public:
    virtual std::string print(void) = 0;
    virtual ~takesArg() {};
    takesArg() {};
};

#endif
