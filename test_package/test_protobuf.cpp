#include <iostream>
#include "messages.pb.h"

#define PROTOBUF_USE_DLLS

int main() {
	Movement mov;
	mov.set_xpos(1);
    mov.set_ypos(33);
    mov.set_zpos(7);

	std::cout << mov.SerializeAsString() << "\n";
	return 0;
}

