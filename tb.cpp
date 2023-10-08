#include <stdlib.h>
#include <stdint.h>
#include <iostream>
#include "verilated.h"
#include "verilated_vcd_c.h"
#include <Vtop.h>

#define MAX_TIME 20
uint64_t cnt = 0;


int main() {
  Vtop *to = new Vtop;
  Verilated::traceEverOn(true);
  VerilatedVcdC *trace = new VerilatedVcdC;
  to->trace(trace, 5);
  trace->open("waveform.vcd");
  to->res = 0;
  while (cnt < MAX_TIME) {
    to->clk^=1;
    to->D ^= 1;
    if(cnt % 10 == 2) to->load = 1;
    to->eval();
    trace->dump(cnt);
    cnt++;
    to->load = 0;
  }
  trace->close();
  exit(0);

}
