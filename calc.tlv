\m4_TLV_version 1d: tl-x.org
\SV

   // =========================================
   // Welcome!  Try the tutorials via the menu.
   // =========================================

   // Default Makerchip TL-Verilog Code Template
   
   // Macro providing required top-level module definition, random
   // stimulus support, and Verilator config.
   m4_makerchip_module   // (Expanded in Nav-TLV pane.)
   m4_include_lib(['https://raw.githubusercontent.com/stevehoover/LF-Building-a-RISC-V-CPU-Core/main/lib/calc_viz.tlv'])
   /* verilator lint_on WIDTH */
\TLV
   
   $reset = *reset;
   $val1[31:0] = >>1$out;
   $val2[31:0] = {28'b0, $val2_rand[3:0]};
   
   // testing feature flags
   $disable_sum = 1'b0;
   $disable_diff = 1'b0;
   $disable_prod = 1'b0;
   $disable_quot = 1'b0;
   
   $sum[31:0] = $disable_sum == 1'b1 ? $val1 :
                                       $val1 + $val2;
   $diff[31:0] = $disable_diff == 1'b1 ? $val1 :
                                         $val1 - $val2;
   $prod[31:0] = $disable_prod == 1'b1 ? $val1 :
                                         $val1 * $val2;
   $quot[31:0] = $disable_quot == 1'b1 ? $val1 :
                                         $val1 / $val2;
   
   $out[31:0] = $reset == 1'b1 ? 32'b0 :
                $op[1:0] == 2'b00 ? $sum :
                $op == 2'b01 ? $diff :
                $op == 2'b10 ? $prod :
                $quot;
   
   m4+calc_viz()
\SV
   endmodule
