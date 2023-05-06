#include <unistd.h>
#include "py/mpconfig.h"
#include "platform.h"
#include "xuartps_hw.h"



// Receive single character
int mp_hal_stdin_rx_chr(void) {

return XUartPs_RecvByte(STDOUT_BASEADDRESS);

}

// Send string of given length
void mp_hal_stdout_tx_strn(const char *str, mp_uint_t len) {

    while (len--) {
    	XUartPs_SendByte(STDOUT_BASEADDRESS,*str++);
    }

}
