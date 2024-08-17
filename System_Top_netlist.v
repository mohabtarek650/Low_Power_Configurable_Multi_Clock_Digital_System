/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Fri Aug 16 03:23:18 2024
/////////////////////////////////////////////////////////////


module RST_SYNC_NUM_STAGES2_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module RST_SYNC_NUM_STAGES2_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   \sync_reg[0] ;

  DFFRQX2M \sync_reg_reg[1]  ( .D(\sync_reg[0] ), .CK(CLK), .RN(RST), .Q(
        SYNC_RST) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(1'b1), .CK(CLK), .RN(RST), .Q(\sync_reg[0] )
         );
endmodule


module DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 ( CLK, RST, unsync_bus, bus_enable, 
        sync_bus, enable_pulse_d );
  input [7:0] unsync_bus;
  output [7:0] sync_bus;
  input CLK, RST, bus_enable;
  output enable_pulse_d;
  wire   enable_flop, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13;
  wire   [1:0] sync_reg;

  DFFRQX2M enable_flop_reg ( .D(sync_reg[1]), .CK(CLK), .RN(n11), .Q(
        enable_flop) );
  DFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[0]), .CK(CLK), .RN(n11), .Q(
        sync_reg[1]) );
  DFFRQX2M \sync_bus_reg[7]  ( .D(n9), .CK(CLK), .RN(n11), .Q(sync_bus[7]) );
  DFFRQX2M \sync_bus_reg[3]  ( .D(n5), .CK(CLK), .RN(n11), .Q(sync_bus[3]) );
  DFFRQX2M \sync_bus_reg[1]  ( .D(n3), .CK(CLK), .RN(n11), .Q(sync_bus[1]) );
  DFFRQX2M \sync_reg_reg[0]  ( .D(bus_enable), .CK(CLK), .RN(n11), .Q(
        sync_reg[0]) );
  DFFRQX2M \sync_bus_reg[5]  ( .D(n7), .CK(CLK), .RN(n11), .Q(sync_bus[5]) );
  DFFRQX2M \sync_bus_reg[6]  ( .D(n8), .CK(CLK), .RN(n11), .Q(sync_bus[6]) );
  DFFRQX2M \sync_bus_reg[4]  ( .D(n6), .CK(CLK), .RN(n11), .Q(sync_bus[4]) );
  DFFRQX2M \sync_bus_reg[2]  ( .D(n4), .CK(CLK), .RN(n11), .Q(sync_bus[2]) );
  DFFRQX2M \sync_bus_reg[0]  ( .D(n2), .CK(CLK), .RN(n11), .Q(sync_bus[0]) );
  DFFRQX4M enable_pulse_d_reg ( .D(n13), .CK(CLK), .RN(n11), .Q(enable_pulse_d) );
  INVX4M U3 ( .A(n1), .Y(n13) );
  BUFX4M U4 ( .A(n1), .Y(n10) );
  INVX6M U5 ( .A(n12), .Y(n11) );
  INVX2M U6 ( .A(RST), .Y(n12) );
  NAND2BX2M U7 ( .AN(enable_flop), .B(sync_reg[1]), .Y(n1) );
  AO22X1M U8 ( .A0(unsync_bus[0]), .A1(n13), .B0(sync_bus[0]), .B1(n10), .Y(n2) );
  AO22X1M U9 ( .A0(unsync_bus[2]), .A1(n13), .B0(sync_bus[2]), .B1(n10), .Y(n4) );
  AO22X1M U10 ( .A0(unsync_bus[4]), .A1(n13), .B0(sync_bus[4]), .B1(n10), .Y(
        n6) );
  AO22X1M U11 ( .A0(unsync_bus[6]), .A1(n13), .B0(sync_bus[6]), .B1(n10), .Y(
        n8) );
  AO22X1M U12 ( .A0(unsync_bus[5]), .A1(n13), .B0(sync_bus[5]), .B1(n10), .Y(
        n7) );
  AO22X1M U13 ( .A0(unsync_bus[1]), .A1(n13), .B0(sync_bus[1]), .B1(n10), .Y(
        n3) );
  AO22X1M U14 ( .A0(unsync_bus[7]), .A1(n13), .B0(sync_bus[7]), .B1(n10), .Y(
        n9) );
  AO22X1M U15 ( .A0(unsync_bus[3]), .A1(n13), .B0(sync_bus[3]), .B1(n10), .Y(
        n5) );
endmodule


module fifo_mem_D_SIZE8_F_DEPTH8_P_SIZE4 ( w_clk, w_rstn, w_full, w_inc, 
        w_addr, r_addr, w_data, r_data );
  input [2:0] w_addr;
  input [2:0] r_addr;
  input [7:0] w_data;
  output [7:0] r_data;
  input w_clk, w_rstn, w_full, w_inc;
  wire   N9, N10, N11, \FIFO_MEM[7][7] , \FIFO_MEM[7][6] , \FIFO_MEM[7][5] ,
         \FIFO_MEM[7][4] , \FIFO_MEM[7][3] , \FIFO_MEM[7][2] ,
         \FIFO_MEM[7][1] , \FIFO_MEM[7][0] , \FIFO_MEM[6][7] ,
         \FIFO_MEM[6][6] , \FIFO_MEM[6][5] , \FIFO_MEM[6][4] ,
         \FIFO_MEM[6][3] , \FIFO_MEM[6][2] , \FIFO_MEM[6][1] ,
         \FIFO_MEM[6][0] , \FIFO_MEM[5][7] , \FIFO_MEM[5][6] ,
         \FIFO_MEM[5][5] , \FIFO_MEM[5][4] , \FIFO_MEM[5][3] ,
         \FIFO_MEM[5][2] , \FIFO_MEM[5][1] , \FIFO_MEM[5][0] ,
         \FIFO_MEM[4][7] , \FIFO_MEM[4][6] , \FIFO_MEM[4][5] ,
         \FIFO_MEM[4][4] , \FIFO_MEM[4][3] , \FIFO_MEM[4][2] ,
         \FIFO_MEM[4][1] , \FIFO_MEM[4][0] , \FIFO_MEM[3][7] ,
         \FIFO_MEM[3][6] , \FIFO_MEM[3][5] , \FIFO_MEM[3][4] ,
         \FIFO_MEM[3][3] , \FIFO_MEM[3][2] , \FIFO_MEM[3][1] ,
         \FIFO_MEM[3][0] , \FIFO_MEM[2][7] , \FIFO_MEM[2][6] ,
         \FIFO_MEM[2][5] , \FIFO_MEM[2][4] , \FIFO_MEM[2][3] ,
         \FIFO_MEM[2][2] , \FIFO_MEM[2][1] , \FIFO_MEM[2][0] ,
         \FIFO_MEM[1][7] , \FIFO_MEM[1][6] , \FIFO_MEM[1][5] ,
         \FIFO_MEM[1][4] , \FIFO_MEM[1][3] , \FIFO_MEM[1][2] ,
         \FIFO_MEM[1][1] , \FIFO_MEM[1][0] , \FIFO_MEM[0][7] ,
         \FIFO_MEM[0][6] , \FIFO_MEM[0][5] , \FIFO_MEM[0][4] ,
         \FIFO_MEM[0][3] , \FIFO_MEM[0][2] , \FIFO_MEM[0][1] ,
         \FIFO_MEM[0][0] , n12, n16, n18, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56,
         n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70,
         n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84,
         n85, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n13, n14, n15, n17,
         n19, n20, n21, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96,
         n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107, n108,
         n109, n110, n111, n112, n113, n114, n115, n116, n117, n118, n119,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131;
  assign N9 = r_addr[0];
  assign N10 = r_addr[1];
  assign N11 = r_addr[2];

  DFFRQX2M \FIFO_MEM_reg[5][7]  ( .D(n69), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[5][7] ) );
  DFFRQX2M \FIFO_MEM_reg[5][6]  ( .D(n68), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[5][6] ) );
  DFFRQX2M \FIFO_MEM_reg[5][5]  ( .D(n67), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[5][5] ) );
  DFFRQX2M \FIFO_MEM_reg[5][4]  ( .D(n66), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[5][4] ) );
  DFFRQX2M \FIFO_MEM_reg[5][3]  ( .D(n65), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[5][3] ) );
  DFFRQX2M \FIFO_MEM_reg[5][2]  ( .D(n64), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[5][2] ) );
  DFFRQX2M \FIFO_MEM_reg[5][1]  ( .D(n63), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[5][1] ) );
  DFFRQX2M \FIFO_MEM_reg[5][0]  ( .D(n62), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[5][0] ) );
  DFFRQX2M \FIFO_MEM_reg[1][7]  ( .D(n37), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[1][7] ) );
  DFFRQX2M \FIFO_MEM_reg[1][6]  ( .D(n36), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[1][6] ) );
  DFFRQX2M \FIFO_MEM_reg[1][5]  ( .D(n35), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[1][5] ) );
  DFFRQX2M \FIFO_MEM_reg[1][4]  ( .D(n34), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[1][4] ) );
  DFFRQX2M \FIFO_MEM_reg[1][3]  ( .D(n33), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[1][3] ) );
  DFFRQX2M \FIFO_MEM_reg[1][2]  ( .D(n32), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[1][2] ) );
  DFFRQX2M \FIFO_MEM_reg[1][1]  ( .D(n31), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[1][1] ) );
  DFFRQX2M \FIFO_MEM_reg[1][0]  ( .D(n30), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[1][0] ) );
  DFFRQX2M \FIFO_MEM_reg[7][7]  ( .D(n85), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[7][7] ) );
  DFFRQX2M \FIFO_MEM_reg[7][6]  ( .D(n84), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[7][6] ) );
  DFFRQX2M \FIFO_MEM_reg[7][5]  ( .D(n83), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[7][5] ) );
  DFFRQX2M \FIFO_MEM_reg[7][4]  ( .D(n82), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[7][4] ) );
  DFFRQX2M \FIFO_MEM_reg[7][3]  ( .D(n81), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[7][3] ) );
  DFFRQX2M \FIFO_MEM_reg[7][2]  ( .D(n80), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[7][2] ) );
  DFFRQX2M \FIFO_MEM_reg[7][1]  ( .D(n79), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[7][1] ) );
  DFFRQX2M \FIFO_MEM_reg[7][0]  ( .D(n78), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[7][0] ) );
  DFFRQX2M \FIFO_MEM_reg[3][7]  ( .D(n53), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[3][7] ) );
  DFFRQX2M \FIFO_MEM_reg[3][6]  ( .D(n52), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[3][6] ) );
  DFFRQX2M \FIFO_MEM_reg[3][5]  ( .D(n51), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[3][5] ) );
  DFFRQX2M \FIFO_MEM_reg[3][4]  ( .D(n50), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[3][4] ) );
  DFFRQX2M \FIFO_MEM_reg[3][3]  ( .D(n49), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[3][3] ) );
  DFFRQX2M \FIFO_MEM_reg[3][2]  ( .D(n48), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[3][2] ) );
  DFFRQX2M \FIFO_MEM_reg[3][1]  ( .D(n47), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[3][1] ) );
  DFFRQX2M \FIFO_MEM_reg[3][0]  ( .D(n46), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[3][0] ) );
  DFFRQX2M \FIFO_MEM_reg[6][7]  ( .D(n77), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[6][7] ) );
  DFFRQX2M \FIFO_MEM_reg[6][6]  ( .D(n76), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[6][6] ) );
  DFFRQX2M \FIFO_MEM_reg[6][5]  ( .D(n75), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[6][5] ) );
  DFFRQX2M \FIFO_MEM_reg[6][4]  ( .D(n74), .CK(w_clk), .RN(n114), .Q(
        \FIFO_MEM[6][4] ) );
  DFFRQX2M \FIFO_MEM_reg[6][3]  ( .D(n73), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[6][3] ) );
  DFFRQX2M \FIFO_MEM_reg[6][2]  ( .D(n72), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[6][2] ) );
  DFFRQX2M \FIFO_MEM_reg[6][1]  ( .D(n71), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[6][1] ) );
  DFFRQX2M \FIFO_MEM_reg[6][0]  ( .D(n70), .CK(w_clk), .RN(n115), .Q(
        \FIFO_MEM[6][0] ) );
  DFFRQX2M \FIFO_MEM_reg[2][7]  ( .D(n45), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[2][7] ) );
  DFFRQX2M \FIFO_MEM_reg[2][6]  ( .D(n44), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[2][6] ) );
  DFFRQX2M \FIFO_MEM_reg[2][5]  ( .D(n43), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[2][5] ) );
  DFFRQX2M \FIFO_MEM_reg[2][4]  ( .D(n42), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[2][4] ) );
  DFFRQX2M \FIFO_MEM_reg[2][3]  ( .D(n41), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[2][3] ) );
  DFFRQX2M \FIFO_MEM_reg[2][2]  ( .D(n40), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[2][2] ) );
  DFFRQX2M \FIFO_MEM_reg[2][1]  ( .D(n39), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[2][1] ) );
  DFFRQX2M \FIFO_MEM_reg[2][0]  ( .D(n38), .CK(w_clk), .RN(n117), .Q(
        \FIFO_MEM[2][0] ) );
  DFFRQX2M \FIFO_MEM_reg[4][7]  ( .D(n61), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[4][7] ) );
  DFFRQX2M \FIFO_MEM_reg[4][6]  ( .D(n60), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[4][6] ) );
  DFFRQX2M \FIFO_MEM_reg[4][5]  ( .D(n59), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[4][5] ) );
  DFFRQX2M \FIFO_MEM_reg[4][4]  ( .D(n58), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[4][4] ) );
  DFFRQX2M \FIFO_MEM_reg[4][3]  ( .D(n57), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[4][3] ) );
  DFFRQX2M \FIFO_MEM_reg[4][2]  ( .D(n56), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[4][2] ) );
  DFFRQX2M \FIFO_MEM_reg[4][1]  ( .D(n55), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[4][1] ) );
  DFFRQX2M \FIFO_MEM_reg[4][0]  ( .D(n54), .CK(w_clk), .RN(n116), .Q(
        \FIFO_MEM[4][0] ) );
  DFFRQX2M \FIFO_MEM_reg[0][7]  ( .D(n29), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[0][7] ) );
  DFFRQX2M \FIFO_MEM_reg[0][6]  ( .D(n28), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[0][6] ) );
  DFFRQX2M \FIFO_MEM_reg[0][5]  ( .D(n27), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[0][5] ) );
  DFFRQX2M \FIFO_MEM_reg[0][4]  ( .D(n26), .CK(w_clk), .RN(n118), .Q(
        \FIFO_MEM[0][4] ) );
  DFFRQX2M \FIFO_MEM_reg[0][3]  ( .D(n25), .CK(w_clk), .RN(n119), .Q(
        \FIFO_MEM[0][3] ) );
  DFFRQX2M \FIFO_MEM_reg[0][2]  ( .D(n24), .CK(w_clk), .RN(n119), .Q(
        \FIFO_MEM[0][2] ) );
  DFFRQX2M \FIFO_MEM_reg[0][1]  ( .D(n23), .CK(w_clk), .RN(n119), .Q(
        \FIFO_MEM[0][1] ) );
  DFFRQX2M \FIFO_MEM_reg[0][0]  ( .D(n22), .CK(w_clk), .RN(n119), .Q(
        \FIFO_MEM[0][0] ) );
  NOR2BX4M U2 ( .AN(n16), .B(w_addr[2]), .Y(n12) );
  INVX4M U3 ( .A(w_data[0]), .Y(n122) );
  INVX4M U4 ( .A(w_data[1]), .Y(n123) );
  INVX4M U5 ( .A(w_data[2]), .Y(n124) );
  INVX4M U6 ( .A(w_data[3]), .Y(n125) );
  INVX4M U7 ( .A(w_data[4]), .Y(n126) );
  INVX4M U8 ( .A(w_data[5]), .Y(n127) );
  INVX4M U9 ( .A(w_data[6]), .Y(n128) );
  INVX4M U10 ( .A(w_data[7]), .Y(n129) );
  INVX2M U11 ( .A(w_addr[1]), .Y(n131) );
  INVX2M U12 ( .A(w_addr[0]), .Y(n130) );
  BUFX6M U13 ( .A(n121), .Y(n118) );
  BUFX6M U14 ( .A(n120), .Y(n117) );
  BUFX6M U15 ( .A(n120), .Y(n116) );
  BUFX6M U16 ( .A(n121), .Y(n115) );
  BUFX6M U17 ( .A(n121), .Y(n114) );
  BUFX2M U18 ( .A(n120), .Y(n119) );
  BUFX2M U19 ( .A(n121), .Y(n120) );
  NOR2BX2M U20 ( .AN(w_inc), .B(w_full), .Y(n16) );
  INVX4M U21 ( .A(n2), .Y(n105) );
  INVX4M U22 ( .A(n2), .Y(n104) );
  INVX4M U23 ( .A(n1), .Y(n113) );
  INVX4M U24 ( .A(n1), .Y(n112) );
  BUFX2M U25 ( .A(w_rstn), .Y(n121) );
  AND3X2M U26 ( .A(n130), .B(n131), .C(n12), .Y(n1) );
  AND3X2M U27 ( .A(n130), .B(n131), .C(n18), .Y(n2) );
  INVX4M U28 ( .A(n3), .Y(n109) );
  INVX4M U29 ( .A(n3), .Y(n108) );
  INVX4M U30 ( .A(n7), .Y(n107) );
  INVX4M U31 ( .A(n7), .Y(n106) );
  INVX4M U32 ( .A(n4), .Y(n111) );
  INVX4M U33 ( .A(n4), .Y(n110) );
  INVX4M U34 ( .A(n8), .Y(n103) );
  INVX4M U35 ( .A(n8), .Y(n102) );
  INVX4M U36 ( .A(n5), .Y(n101) );
  INVX4M U37 ( .A(n5), .Y(n100) );
  INVX4M U38 ( .A(n6), .Y(n99) );
  INVX4M U39 ( .A(n6), .Y(n98) );
  INVX6M U40 ( .A(n94), .Y(n92) );
  INVX6M U41 ( .A(n94), .Y(n93) );
  INVX4M U42 ( .A(n97), .Y(n95) );
  INVX4M U43 ( .A(n97), .Y(n96) );
  OAI2BB2X1M U44 ( .B0(n122), .B1(n111), .A0N(\FIFO_MEM[1][0] ), .A1N(n111), 
        .Y(n30) );
  OAI2BB2X1M U45 ( .B0(n123), .B1(n110), .A0N(\FIFO_MEM[1][1] ), .A1N(n110), 
        .Y(n31) );
  OAI2BB2X1M U46 ( .B0(n124), .B1(n111), .A0N(\FIFO_MEM[1][2] ), .A1N(n111), 
        .Y(n32) );
  OAI2BB2X1M U47 ( .B0(n125), .B1(n110), .A0N(\FIFO_MEM[1][3] ), .A1N(n110), 
        .Y(n33) );
  OAI2BB2X1M U48 ( .B0(n126), .B1(n111), .A0N(\FIFO_MEM[1][4] ), .A1N(n111), 
        .Y(n34) );
  OAI2BB2X1M U49 ( .B0(n127), .B1(n110), .A0N(\FIFO_MEM[1][5] ), .A1N(n110), 
        .Y(n35) );
  OAI2BB2X1M U50 ( .B0(n128), .B1(n111), .A0N(\FIFO_MEM[1][6] ), .A1N(n111), 
        .Y(n36) );
  OAI2BB2X1M U51 ( .B0(n129), .B1(n110), .A0N(\FIFO_MEM[1][7] ), .A1N(n110), 
        .Y(n37) );
  OAI2BB2X1M U52 ( .B0(n122), .B1(n109), .A0N(\FIFO_MEM[2][0] ), .A1N(n109), 
        .Y(n38) );
  OAI2BB2X1M U53 ( .B0(n123), .B1(n108), .A0N(\FIFO_MEM[2][1] ), .A1N(n108), 
        .Y(n39) );
  OAI2BB2X1M U54 ( .B0(n124), .B1(n109), .A0N(\FIFO_MEM[2][2] ), .A1N(n109), 
        .Y(n40) );
  OAI2BB2X1M U55 ( .B0(n125), .B1(n108), .A0N(\FIFO_MEM[2][3] ), .A1N(n108), 
        .Y(n41) );
  OAI2BB2X1M U56 ( .B0(n126), .B1(n109), .A0N(\FIFO_MEM[2][4] ), .A1N(n109), 
        .Y(n42) );
  OAI2BB2X1M U57 ( .B0(n127), .B1(n108), .A0N(\FIFO_MEM[2][5] ), .A1N(n108), 
        .Y(n43) );
  OAI2BB2X1M U58 ( .B0(n128), .B1(n109), .A0N(\FIFO_MEM[2][6] ), .A1N(n109), 
        .Y(n44) );
  OAI2BB2X1M U59 ( .B0(n129), .B1(n108), .A0N(\FIFO_MEM[2][7] ), .A1N(n108), 
        .Y(n45) );
  OAI2BB2X1M U60 ( .B0(n122), .B1(n107), .A0N(\FIFO_MEM[3][0] ), .A1N(n107), 
        .Y(n46) );
  OAI2BB2X1M U61 ( .B0(n123), .B1(n106), .A0N(\FIFO_MEM[3][1] ), .A1N(n106), 
        .Y(n47) );
  OAI2BB2X1M U62 ( .B0(n124), .B1(n107), .A0N(\FIFO_MEM[3][2] ), .A1N(n107), 
        .Y(n48) );
  OAI2BB2X1M U63 ( .B0(n125), .B1(n106), .A0N(\FIFO_MEM[3][3] ), .A1N(n106), 
        .Y(n49) );
  OAI2BB2X1M U64 ( .B0(n126), .B1(n107), .A0N(\FIFO_MEM[3][4] ), .A1N(n107), 
        .Y(n50) );
  OAI2BB2X1M U65 ( .B0(n127), .B1(n106), .A0N(\FIFO_MEM[3][5] ), .A1N(n106), 
        .Y(n51) );
  OAI2BB2X1M U66 ( .B0(n128), .B1(n107), .A0N(\FIFO_MEM[3][6] ), .A1N(n107), 
        .Y(n52) );
  OAI2BB2X1M U67 ( .B0(n129), .B1(n106), .A0N(\FIFO_MEM[3][7] ), .A1N(n106), 
        .Y(n53) );
  OAI2BB2X1M U68 ( .B0(n122), .B1(n105), .A0N(\FIFO_MEM[4][0] ), .A1N(n105), 
        .Y(n54) );
  OAI2BB2X1M U69 ( .B0(n123), .B1(n104), .A0N(\FIFO_MEM[4][1] ), .A1N(n104), 
        .Y(n55) );
  OAI2BB2X1M U70 ( .B0(n124), .B1(n105), .A0N(\FIFO_MEM[4][2] ), .A1N(n105), 
        .Y(n56) );
  OAI2BB2X1M U71 ( .B0(n125), .B1(n104), .A0N(\FIFO_MEM[4][3] ), .A1N(n104), 
        .Y(n57) );
  OAI2BB2X1M U72 ( .B0(n126), .B1(n105), .A0N(\FIFO_MEM[4][4] ), .A1N(n105), 
        .Y(n58) );
  OAI2BB2X1M U73 ( .B0(n127), .B1(n104), .A0N(\FIFO_MEM[4][5] ), .A1N(n104), 
        .Y(n59) );
  OAI2BB2X1M U74 ( .B0(n128), .B1(n105), .A0N(\FIFO_MEM[4][6] ), .A1N(n105), 
        .Y(n60) );
  OAI2BB2X1M U75 ( .B0(n129), .B1(n104), .A0N(\FIFO_MEM[4][7] ), .A1N(n104), 
        .Y(n61) );
  OAI2BB2X1M U76 ( .B0(n122), .B1(n103), .A0N(\FIFO_MEM[5][0] ), .A1N(n103), 
        .Y(n62) );
  OAI2BB2X1M U77 ( .B0(n123), .B1(n102), .A0N(\FIFO_MEM[5][1] ), .A1N(n102), 
        .Y(n63) );
  OAI2BB2X1M U78 ( .B0(n124), .B1(n103), .A0N(\FIFO_MEM[5][2] ), .A1N(n103), 
        .Y(n64) );
  OAI2BB2X1M U79 ( .B0(n125), .B1(n102), .A0N(\FIFO_MEM[5][3] ), .A1N(n102), 
        .Y(n65) );
  OAI2BB2X1M U80 ( .B0(n126), .B1(n103), .A0N(\FIFO_MEM[5][4] ), .A1N(n103), 
        .Y(n66) );
  OAI2BB2X1M U81 ( .B0(n127), .B1(n102), .A0N(\FIFO_MEM[5][5] ), .A1N(n102), 
        .Y(n67) );
  OAI2BB2X1M U82 ( .B0(n128), .B1(n103), .A0N(\FIFO_MEM[5][6] ), .A1N(n103), 
        .Y(n68) );
  OAI2BB2X1M U83 ( .B0(n129), .B1(n102), .A0N(\FIFO_MEM[5][7] ), .A1N(n102), 
        .Y(n69) );
  OAI2BB2X1M U84 ( .B0(n122), .B1(n101), .A0N(\FIFO_MEM[6][0] ), .A1N(n101), 
        .Y(n70) );
  OAI2BB2X1M U85 ( .B0(n123), .B1(n100), .A0N(\FIFO_MEM[6][1] ), .A1N(n100), 
        .Y(n71) );
  OAI2BB2X1M U86 ( .B0(n124), .B1(n101), .A0N(\FIFO_MEM[6][2] ), .A1N(n101), 
        .Y(n72) );
  OAI2BB2X1M U87 ( .B0(n125), .B1(n100), .A0N(\FIFO_MEM[6][3] ), .A1N(n100), 
        .Y(n73) );
  OAI2BB2X1M U88 ( .B0(n126), .B1(n101), .A0N(\FIFO_MEM[6][4] ), .A1N(n101), 
        .Y(n74) );
  OAI2BB2X1M U89 ( .B0(n127), .B1(n100), .A0N(\FIFO_MEM[6][5] ), .A1N(n100), 
        .Y(n75) );
  OAI2BB2X1M U90 ( .B0(n128), .B1(n101), .A0N(\FIFO_MEM[6][6] ), .A1N(n101), 
        .Y(n76) );
  OAI2BB2X1M U91 ( .B0(n129), .B1(n100), .A0N(\FIFO_MEM[6][7] ), .A1N(n100), 
        .Y(n77) );
  OAI2BB2X1M U92 ( .B0(n122), .B1(n99), .A0N(\FIFO_MEM[7][0] ), .A1N(n99), .Y(
        n78) );
  OAI2BB2X1M U93 ( .B0(n123), .B1(n98), .A0N(\FIFO_MEM[7][1] ), .A1N(n98), .Y(
        n79) );
  OAI2BB2X1M U94 ( .B0(n124), .B1(n99), .A0N(\FIFO_MEM[7][2] ), .A1N(n99), .Y(
        n80) );
  OAI2BB2X1M U95 ( .B0(n125), .B1(n98), .A0N(\FIFO_MEM[7][3] ), .A1N(n98), .Y(
        n81) );
  OAI2BB2X1M U96 ( .B0(n126), .B1(n99), .A0N(\FIFO_MEM[7][4] ), .A1N(n99), .Y(
        n82) );
  OAI2BB2X1M U97 ( .B0(n127), .B1(n98), .A0N(\FIFO_MEM[7][5] ), .A1N(n98), .Y(
        n83) );
  OAI2BB2X1M U98 ( .B0(n128), .B1(n99), .A0N(\FIFO_MEM[7][6] ), .A1N(n99), .Y(
        n84) );
  OAI2BB2X1M U99 ( .B0(n129), .B1(n98), .A0N(\FIFO_MEM[7][7] ), .A1N(n98), .Y(
        n85) );
  OAI2BB2X1M U100 ( .B0(n113), .B1(n122), .A0N(\FIFO_MEM[0][0] ), .A1N(n113), 
        .Y(n22) );
  OAI2BB2X1M U101 ( .B0(n112), .B1(n123), .A0N(\FIFO_MEM[0][1] ), .A1N(n112), 
        .Y(n23) );
  OAI2BB2X1M U102 ( .B0(n113), .B1(n124), .A0N(\FIFO_MEM[0][2] ), .A1N(n113), 
        .Y(n24) );
  OAI2BB2X1M U103 ( .B0(n112), .B1(n125), .A0N(\FIFO_MEM[0][3] ), .A1N(n112), 
        .Y(n25) );
  OAI2BB2X1M U104 ( .B0(n113), .B1(n126), .A0N(\FIFO_MEM[0][4] ), .A1N(n113), 
        .Y(n26) );
  OAI2BB2X1M U105 ( .B0(n112), .B1(n127), .A0N(\FIFO_MEM[0][5] ), .A1N(n112), 
        .Y(n27) );
  OAI2BB2X1M U106 ( .B0(n113), .B1(n128), .A0N(\FIFO_MEM[0][6] ), .A1N(n113), 
        .Y(n28) );
  OAI2BB2X1M U107 ( .B0(n112), .B1(n129), .A0N(\FIFO_MEM[0][7] ), .A1N(n112), 
        .Y(n29) );
  AND3X2M U108 ( .A(n12), .B(n130), .C(w_addr[1]), .Y(n3) );
  AND3X2M U109 ( .A(n12), .B(n131), .C(w_addr[0]), .Y(n4) );
  AND2X2M U110 ( .A(w_addr[2]), .B(n16), .Y(n18) );
  AND3X2M U111 ( .A(w_addr[1]), .B(n130), .C(n18), .Y(n5) );
  AND3X2M U112 ( .A(w_addr[1]), .B(w_addr[0]), .C(n18), .Y(n6) );
  AND3X2M U113 ( .A(w_addr[0]), .B(n12), .C(w_addr[1]), .Y(n7) );
  AND3X2M U114 ( .A(w_addr[0]), .B(n131), .C(n18), .Y(n8) );
  MX2X2M U115 ( .A(n10), .B(n9), .S0(N11), .Y(r_data[0]) );
  MX4X1M U116 ( .A(\FIFO_MEM[0][0] ), .B(\FIFO_MEM[1][0] ), .C(
        \FIFO_MEM[2][0] ), .D(\FIFO_MEM[3][0] ), .S0(n93), .S1(n96), .Y(n10)
         );
  MX4X1M U117 ( .A(\FIFO_MEM[4][0] ), .B(\FIFO_MEM[5][0] ), .C(
        \FIFO_MEM[6][0] ), .D(\FIFO_MEM[7][0] ), .S0(n92), .S1(n95), .Y(n9) );
  MX2X2M U118 ( .A(n13), .B(n11), .S0(N11), .Y(r_data[1]) );
  MX4X1M U119 ( .A(\FIFO_MEM[0][1] ), .B(\FIFO_MEM[1][1] ), .C(
        \FIFO_MEM[2][1] ), .D(\FIFO_MEM[3][1] ), .S0(n93), .S1(n96), .Y(n13)
         );
  MX4X1M U120 ( .A(\FIFO_MEM[4][1] ), .B(\FIFO_MEM[5][1] ), .C(
        \FIFO_MEM[6][1] ), .D(\FIFO_MEM[7][1] ), .S0(n92), .S1(n95), .Y(n11)
         );
  MX2X2M U121 ( .A(n15), .B(n14), .S0(N11), .Y(r_data[2]) );
  MX4X1M U122 ( .A(\FIFO_MEM[0][2] ), .B(\FIFO_MEM[1][2] ), .C(
        \FIFO_MEM[2][2] ), .D(\FIFO_MEM[3][2] ), .S0(n93), .S1(n96), .Y(n15)
         );
  MX4X1M U123 ( .A(\FIFO_MEM[4][2] ), .B(\FIFO_MEM[5][2] ), .C(
        \FIFO_MEM[6][2] ), .D(\FIFO_MEM[7][2] ), .S0(n92), .S1(n95), .Y(n14)
         );
  MX2X2M U124 ( .A(n19), .B(n17), .S0(N11), .Y(r_data[3]) );
  MX4X1M U125 ( .A(\FIFO_MEM[0][3] ), .B(\FIFO_MEM[1][3] ), .C(
        \FIFO_MEM[2][3] ), .D(\FIFO_MEM[3][3] ), .S0(n93), .S1(n96), .Y(n19)
         );
  MX4X1M U126 ( .A(\FIFO_MEM[4][3] ), .B(\FIFO_MEM[5][3] ), .C(
        \FIFO_MEM[6][3] ), .D(\FIFO_MEM[7][3] ), .S0(n92), .S1(n95), .Y(n17)
         );
  MX2X2M U127 ( .A(n21), .B(n20), .S0(N11), .Y(r_data[4]) );
  MX4X1M U128 ( .A(\FIFO_MEM[0][4] ), .B(\FIFO_MEM[1][4] ), .C(
        \FIFO_MEM[2][4] ), .D(\FIFO_MEM[3][4] ), .S0(n93), .S1(n96), .Y(n21)
         );
  MX4X1M U129 ( .A(\FIFO_MEM[4][4] ), .B(\FIFO_MEM[5][4] ), .C(
        \FIFO_MEM[6][4] ), .D(\FIFO_MEM[7][4] ), .S0(n92), .S1(n95), .Y(n20)
         );
  MX2X2M U130 ( .A(n87), .B(n86), .S0(N11), .Y(r_data[5]) );
  MX4X1M U131 ( .A(\FIFO_MEM[0][5] ), .B(\FIFO_MEM[1][5] ), .C(
        \FIFO_MEM[2][5] ), .D(\FIFO_MEM[3][5] ), .S0(n93), .S1(n96), .Y(n87)
         );
  MX4X1M U132 ( .A(\FIFO_MEM[4][5] ), .B(\FIFO_MEM[5][5] ), .C(
        \FIFO_MEM[6][5] ), .D(\FIFO_MEM[7][5] ), .S0(n92), .S1(n95), .Y(n86)
         );
  MX2X2M U133 ( .A(n89), .B(n88), .S0(N11), .Y(r_data[6]) );
  MX4X1M U134 ( .A(\FIFO_MEM[0][6] ), .B(\FIFO_MEM[1][6] ), .C(
        \FIFO_MEM[2][6] ), .D(\FIFO_MEM[3][6] ), .S0(n93), .S1(n96), .Y(n89)
         );
  MX4X1M U135 ( .A(\FIFO_MEM[4][6] ), .B(\FIFO_MEM[5][6] ), .C(
        \FIFO_MEM[6][6] ), .D(\FIFO_MEM[7][6] ), .S0(n92), .S1(n95), .Y(n88)
         );
  MX2X2M U136 ( .A(n91), .B(n90), .S0(N11), .Y(r_data[7]) );
  MX4X1M U137 ( .A(\FIFO_MEM[0][7] ), .B(\FIFO_MEM[1][7] ), .C(
        \FIFO_MEM[2][7] ), .D(\FIFO_MEM[3][7] ), .S0(n93), .S1(n96), .Y(n91)
         );
  MX4X1M U138 ( .A(\FIFO_MEM[4][7] ), .B(\FIFO_MEM[5][7] ), .C(
        \FIFO_MEM[6][7] ), .D(\FIFO_MEM[7][7] ), .S0(n92), .S1(n95), .Y(n90)
         );
  INVX2M U139 ( .A(N10), .Y(n97) );
  INVX2M U140 ( .A(N9), .Y(n94) );
endmodule


module fifo_rd_P_SIZE4 ( r_clk, r_rstn, r_inc, sync_wr_ptr, rd_addr, empty, 
        gray_rd_ptr );
  input [3:0] sync_wr_ptr;
  output [2:0] rd_addr;
  output [3:0] gray_rd_ptr;
  input r_clk, r_rstn, r_inc;
  output empty;
  wire   N89, N90, N91, N92, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17,
         n18, n19, n20, n21, n2, n3, n5, n6, n7, n22;

  DFFRQX4M \rd_ptr_reg[1]  ( .D(n20), .CK(r_clk), .RN(n2), .Q(rd_addr[1]) );
  DFFRQX1M \gray_rd_ptr_reg[0]  ( .D(N89), .CK(r_clk), .RN(n2), .Q(
        gray_rd_ptr[0]) );
  DFFRQX1M \gray_rd_ptr_reg[3]  ( .D(N92), .CK(r_clk), .RN(n2), .Q(
        gray_rd_ptr[3]) );
  DFFRQX1M \gray_rd_ptr_reg[2]  ( .D(N91), .CK(r_clk), .RN(n2), .Q(
        gray_rd_ptr[2]) );
  DFFRQX1M \gray_rd_ptr_reg[1]  ( .D(N90), .CK(r_clk), .RN(n2), .Q(
        gray_rd_ptr[1]) );
  DFFRQX2M \rd_ptr_reg[3]  ( .D(n18), .CK(r_clk), .RN(n2), .Q(N92) );
  DFFRQX2M \rd_ptr_reg[0]  ( .D(n21), .CK(r_clk), .RN(n2), .Q(rd_addr[0]) );
  DFFRX4M \rd_ptr_reg[2]  ( .D(n19), .CK(r_clk), .RN(r_rstn), .QN(n7) );
  INVX6M U3 ( .A(n7), .Y(rd_addr[2]) );
  INVX4M U4 ( .A(n3), .Y(n2) );
  INVX2M U5 ( .A(r_rstn), .Y(n3) );
  INVX2M U6 ( .A(n13), .Y(empty) );
  NOR2X2M U7 ( .A(n6), .B(n12), .Y(n11) );
  XNOR2X2M U8 ( .A(sync_wr_ptr[2]), .B(gray_rd_ptr[2]), .Y(n17) );
  NAND4X2M U9 ( .A(n14), .B(n15), .C(n16), .D(n17), .Y(n13) );
  XNOR2X2M U10 ( .A(sync_wr_ptr[1]), .B(gray_rd_ptr[1]), .Y(n14) );
  XNOR2X2M U11 ( .A(sync_wr_ptr[3]), .B(gray_rd_ptr[3]), .Y(n16) );
  XNOR2X2M U12 ( .A(sync_wr_ptr[0]), .B(gray_rd_ptr[0]), .Y(n15) );
  OAI211X2M U13 ( .A0(n5), .A1(n22), .B0(n8), .C0(n9), .Y(n18) );
  NAND3X2M U14 ( .A(n5), .B(n22), .C(rd_addr[2]), .Y(n8) );
  INVX2M U15 ( .A(N92), .Y(n22) );
  INVX2M U16 ( .A(n10), .Y(n5) );
  NAND2X2M U17 ( .A(rd_addr[1]), .B(n11), .Y(n10) );
  NAND2X2M U18 ( .A(r_inc), .B(n13), .Y(n12) );
  CLKXOR2X2M U19 ( .A(rd_addr[1]), .B(n11), .Y(n20) );
  XNOR2X2M U20 ( .A(n7), .B(rd_addr[1]), .Y(N90) );
  XNOR2X2M U21 ( .A(rd_addr[2]), .B(n10), .Y(n19) );
  XNOR2X2M U22 ( .A(rd_addr[0]), .B(n12), .Y(n21) );
  XNOR2X2M U23 ( .A(rd_addr[1]), .B(n6), .Y(N89) );
  OAI21X2M U24 ( .A0(N92), .A1(n7), .B0(n9), .Y(N91) );
  NAND2X2M U25 ( .A(N92), .B(n7), .Y(n9) );
  INVX2M U26 ( .A(rd_addr[0]), .Y(n6) );
endmodule


module BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_0 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] , n1, n2;

  DFFRQX1M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[3]) );
  DFFRQX1M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[2]) );
  DFFRQX1M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[1]) );
  DFFRQX1M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[0]) );
  DFFRQX1M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[3][0] ) );
  DFFRQX1M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[2][0] ) );
  DFFRQX1M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[1][0] ) );
  DFFRQX1M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[0][0] ) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module fifo_wr_P_SIZE4 ( w_clk, w_rstn, w_inc, sync_rd_ptr, w_addr, gray_w_ptr, 
        full );
  input [3:0] sync_rd_ptr;
  output [2:0] w_addr;
  output [3:0] gray_w_ptr;
  input w_clk, w_rstn, w_inc;
  output full;
  wire   N89, N90, N91, N92, n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n1, n2, n17;

  DFFRQX2M \w_ptr_reg[3]  ( .D(n13), .CK(w_clk), .RN(n1), .Q(N92) );
  DFFRQX2M \gray_w_ptr_reg[0]  ( .D(N89), .CK(w_clk), .RN(n1), .Q(
        gray_w_ptr[0]) );
  DFFRQX2M \gray_w_ptr_reg[1]  ( .D(N90), .CK(w_clk), .RN(n1), .Q(
        gray_w_ptr[1]) );
  DFFRQX2M \gray_w_ptr_reg[3]  ( .D(N92), .CK(w_clk), .RN(n1), .Q(
        gray_w_ptr[3]) );
  DFFRQX2M \gray_w_ptr_reg[2]  ( .D(N91), .CK(w_clk), .RN(n1), .Q(
        gray_w_ptr[2]) );
  DFFRX4M \w_ptr_reg[0]  ( .D(n16), .CK(w_clk), .RN(w_rstn), .Q(w_addr[0]), 
        .QN(n17) );
  DFFRQX4M \w_ptr_reg[2]  ( .D(n14), .CK(w_clk), .RN(n1), .Q(w_addr[2]) );
  DFFRQX4M \w_ptr_reg[1]  ( .D(n15), .CK(w_clk), .RN(n1), .Q(w_addr[1]) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(w_rstn), .Y(n2) );
  NOR2X2M U5 ( .A(n17), .B(n7), .Y(n5) );
  NAND2X2M U6 ( .A(w_inc), .B(n8), .Y(n7) );
  INVX2M U7 ( .A(n8), .Y(full) );
  CLKXOR2X2M U8 ( .A(sync_rd_ptr[3]), .B(gray_w_ptr[3]), .Y(n12) );
  CLKXOR2X2M U9 ( .A(w_addr[1]), .B(n5), .Y(n15) );
  NAND2X2M U10 ( .A(w_addr[1]), .B(n5), .Y(n4) );
  XNOR2X2M U11 ( .A(w_addr[2]), .B(n4), .Y(n14) );
  XNOR2X2M U12 ( .A(w_addr[0]), .B(n7), .Y(n16) );
  XNOR2X2M U13 ( .A(N92), .B(n3), .Y(n13) );
  NAND2BX2M U14 ( .AN(n4), .B(w_addr[2]), .Y(n3) );
  NAND4X2M U15 ( .A(n9), .B(n10), .C(n11), .D(n12), .Y(n8) );
  XNOR2X2M U16 ( .A(sync_rd_ptr[0]), .B(gray_w_ptr[0]), .Y(n9) );
  XNOR2X2M U17 ( .A(sync_rd_ptr[1]), .B(gray_w_ptr[1]), .Y(n10) );
  CLKXOR2X2M U18 ( .A(sync_rd_ptr[2]), .B(gray_w_ptr[2]), .Y(n11) );
  CLKXOR2X2M U19 ( .A(w_addr[2]), .B(w_addr[1]), .Y(N90) );
  CLKXOR2X2M U20 ( .A(w_addr[2]), .B(N92), .Y(N91) );
  XNOR2X2M U21 ( .A(w_addr[1]), .B(n17), .Y(N89) );
endmodule


module BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_1 ( CLK, RST, ASYNC, SYNC );
  input [3:0] ASYNC;
  output [3:0] SYNC;
  input CLK, RST;
  wire   \sync_reg[3][0] , \sync_reg[2][0] , \sync_reg[1][0] ,
         \sync_reg[0][0] , n1, n2;

  DFFRQX2M \sync_reg_reg[1][1]  ( .D(\sync_reg[1][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[1]) );
  DFFRQX2M \sync_reg_reg[0][1]  ( .D(\sync_reg[0][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[0]) );
  DFFRQX2M \sync_reg_reg[3][1]  ( .D(\sync_reg[3][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[3]) );
  DFFRQX2M \sync_reg_reg[2][1]  ( .D(\sync_reg[2][0] ), .CK(CLK), .RN(n1), .Q(
        SYNC[2]) );
  DFFRQX2M \sync_reg_reg[3][0]  ( .D(ASYNC[3]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[3][0] ) );
  DFFRQX2M \sync_reg_reg[2][0]  ( .D(ASYNC[2]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[2][0] ) );
  DFFRQX2M \sync_reg_reg[1][0]  ( .D(ASYNC[1]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[1][0] ) );
  DFFRQX2M \sync_reg_reg[0][0]  ( .D(ASYNC[0]), .CK(CLK), .RN(n1), .Q(
        \sync_reg[0][0] ) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module Async_fifo_D_SIZE8_F_DEPTH8_P_SIZE4 ( i_w_clk, i_w_rstn, i_w_inc, 
        i_r_clk, i_r_rstn, i_r_inc, i_w_data, o_r_data, o_full, o_empty );
  input [7:0] i_w_data;
  output [7:0] o_r_data;
  input i_w_clk, i_w_rstn, i_w_inc, i_r_clk, i_r_rstn, i_r_inc;
  output o_full, o_empty;
  wire   n1, n2, n3, n4;
  wire   [2:0] w_addr;
  wire   [2:0] r_addr;
  wire   [3:0] w2r_ptr;
  wire   [3:0] gray_rd_ptr;
  wire   [3:0] gray_w_ptr;
  wire   [3:0] r2w_ptr;

  fifo_mem_D_SIZE8_F_DEPTH8_P_SIZE4 u_fifo_mem ( .w_clk(i_w_clk), .w_rstn(n1), 
        .w_full(o_full), .w_inc(i_w_inc), .w_addr(w_addr), .r_addr(r_addr), 
        .w_data(i_w_data), .r_data(o_r_data) );
  fifo_rd_P_SIZE4 u_fifo_rd ( .r_clk(i_r_clk), .r_rstn(n3), .r_inc(i_r_inc), 
        .sync_wr_ptr(w2r_ptr), .rd_addr(r_addr), .empty(o_empty), 
        .gray_rd_ptr(gray_rd_ptr) );
  BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_0 u_w2r_sync ( .CLK(i_r_clk), .RST(n3), 
        .ASYNC(gray_w_ptr), .SYNC(w2r_ptr) );
  fifo_wr_P_SIZE4 u_fifo_wr ( .w_clk(i_w_clk), .w_rstn(n1), .w_inc(i_w_inc), 
        .sync_rd_ptr(r2w_ptr), .w_addr(w_addr), .gray_w_ptr(gray_w_ptr), 
        .full(o_full) );
  BIT_SYNC_NUM_STAGES2_BUS_WIDTH4_1 u_r2w_sync ( .CLK(i_w_clk), .RST(n1), 
        .ASYNC(gray_rd_ptr), .SYNC(r2w_ptr) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(i_w_rstn), .Y(n2) );
  INVX2M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(i_r_rstn), .Y(n4) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX1M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  DFFRQX1M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module ClkDiv_0_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module ClkDiv_0 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_0_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n18), .CK(i_ref_clk), .RN(n2), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n17), .CK(i_ref_clk), .SN(n2), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[6]  ( .D(n19), .CK(i_ref_clk), .RN(n2), .Q(count[6]) );
  DFFRQX4M \count_reg[0]  ( .D(n25), .CK(i_ref_clk), .RN(n2), .Q(count[0]) );
  DFFRQX2M \count_reg[5]  ( .D(n20), .CK(i_ref_clk), .RN(n2), .Q(count[5]) );
  DFFRQX2M \count_reg[4]  ( .D(n21), .CK(i_ref_clk), .RN(n2), .Q(count[4]) );
  DFFRQX2M \count_reg[3]  ( .D(n22), .CK(i_ref_clk), .RN(n2), .Q(count[3]) );
  DFFRQX2M \count_reg[2]  ( .D(n23), .CK(i_ref_clk), .RN(n2), .Q(count[2]) );
  DFFRQX2M \count_reg[1]  ( .D(n24), .CK(i_ref_clk), .RN(n2), .Q(count[1]) );
  NOR4X2M U3 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n33) );
  NOR2X4M U4 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  AND3X4M U5 ( .A(n12), .B(n13), .C(n46), .Y(n11) );
  NAND4X2M U6 ( .A(n30), .B(n31), .C(n32), .D(n33), .Y(n15) );
  AO22XLM U7 ( .A0(n1), .A1(count[6]), .B0(N22), .B1(n11), .Y(n19) );
  AO22XLM U8 ( .A0(n1), .A1(count[1]), .B0(N17), .B1(n11), .Y(n24) );
  AO22XLM U9 ( .A0(n1), .A1(count[2]), .B0(N18), .B1(n11), .Y(n23) );
  AO22XLM U10 ( .A0(n1), .A1(count[3]), .B0(N19), .B1(n11), .Y(n22) );
  AO22XLM U11 ( .A0(n1), .A1(count[4]), .B0(N20), .B1(n11), .Y(n21) );
  AO22XLM U12 ( .A0(n1), .A1(count[5]), .B0(N21), .B1(n11), .Y(n20) );
  NAND2BX2M U13 ( .AN(i_div_ratio[2]), .B(edge_flip_half[0]), .Y(n4) );
  OR2X2M U14 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  OAI2BB1XLM U15 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n4), .Y(
        edge_flip_half[1]) );
  INVX4M U16 ( .A(n3), .Y(n2) );
  INVX2M U17 ( .A(i_rst), .Y(n3) );
  CLKBUFX6M U18 ( .A(n10), .Y(n1) );
  OAI21X2M U19 ( .A0(n26), .A1(n27), .B0(i_clk_en), .Y(n10) );
  INVX2M U20 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  INVX2M U21 ( .A(i_div_ratio[5]), .Y(n9) );
  OAI2BB1X1M U22 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(
        edge_flip_half[2]) );
  AO21XLM U23 ( .A0(n5), .A1(i_div_ratio[4]), .B0(n6), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U24 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U25 ( .A0(n6), .A1(n9), .B0(n7), .Y(edge_flip_half[4]) );
  XNOR2X1M U26 ( .A(i_div_ratio[6]), .B(n7), .Y(edge_flip_half[5]) );
  NOR2X1M U27 ( .A(i_div_ratio[6]), .B(n7), .Y(n8) );
  CLKXOR2X2M U28 ( .A(i_div_ratio[7]), .B(n8), .Y(edge_flip_half[6]) );
  MX2X6M U29 ( .A(i_ref_clk), .B(div_clk), .S0(n46), .Y(o_div_clk) );
  AO22X1M U30 ( .A0(n1), .A1(count[0]), .B0(N16), .B1(n11), .Y(n25) );
  CLKINVX1M U31 ( .A(n1), .Y(n46) );
  CLKXOR2X2M U32 ( .A(div_clk), .B(n14), .Y(n18) );
  AOI21X1M U33 ( .A0(n13), .A1(n12), .B0(n1), .Y(n14) );
  OR2X1M U34 ( .A(n15), .B(i_div_ratio[0]), .Y(n12) );
  XNOR2X1M U35 ( .A(odd_edge_tog), .B(n16), .Y(n17) );
  OR2X1M U36 ( .A(n13), .B(n1), .Y(n16) );
  OR3X1M U37 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n27) );
  OR4X1M U38 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n26) );
  CLKNAND2X2M U39 ( .A(n28), .B(i_div_ratio[0]), .Y(n13) );
  MXI2X1M U40 ( .A(n29), .B(n15), .S0(odd_edge_tog), .Y(n28) );
  CLKXOR2X2M U41 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n37) );
  CLKXOR2X2M U42 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n36) );
  CLKXOR2X2M U43 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n35) );
  CLKXOR2X2M U44 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n34) );
  XNOR2X1M U45 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n32) );
  XNOR2X1M U46 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n31) );
  XNOR2X1M U47 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n30) );
  NAND4X1M U48 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n29) );
  NOR4X1M U49 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n41) );
  CLKXOR2X2M U50 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n45) );
  CLKXOR2X2M U51 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n44) );
  CLKXOR2X2M U52 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n43) );
  CLKXOR2X2M U53 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n42) );
  XNOR2X1M U54 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n40) );
  XNOR2X1M U55 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n39) );
  XNOR2X1M U56 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n38) );
endmodule


module CLKDIV_MUX ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n2, n3, n4, n10, n11, n12, n13, n14;
  assign OUT[4] = 1'b0;
  assign OUT[5] = 1'b0;
  assign OUT[6] = 1'b0;
  assign OUT[7] = 1'b0;

  AND2X2M U3 ( .A(n10), .B(n2), .Y(OUT[2]) );
  INVX2M U4 ( .A(IN[1]), .Y(n13) );
  AND2X2M U5 ( .A(n14), .B(n13), .Y(n2) );
  INVXLM U6 ( .A(n8), .Y(n3) );
  INVXLM U7 ( .A(n3), .Y(n4) );
  INVXLM U8 ( .A(n6), .Y(n10) );
  OAI211X2M U9 ( .A0(n4), .A1(n9), .B0(n14), .C0(n13), .Y(OUT[0]) );
  NOR3X8M U10 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NAND4BX2M U11 ( .AN(IN[3]), .B(IN[4]), .C(n12), .D(n11), .Y(n7) );
  NAND4BX2M U12 ( .AN(IN[4]), .B(IN[3]), .C(n12), .D(n11), .Y(n6) );
  NOR4X6M U13 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U14 ( .A(n14), .B(n13), .C(IN[2]), .Y(n5) );
  NAND2X2M U15 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U16 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n12), .Y(n8) );
  INVX2M U17 ( .A(IN[2]), .Y(n12) );
  INVX2M U18 ( .A(IN[0]), .Y(n14) );
  INVX2M U19 ( .A(IN[5]), .Y(n11) );
endmodule


module ClkDiv_1_DW01_inc_0 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module ClkDiv_1 ( i_ref_clk, i_rst, i_clk_en, i_div_ratio, o_div_clk );
  input [7:0] i_div_ratio;
  input i_ref_clk, i_rst, i_clk_en;
  output o_div_clk;
  wire   div_clk, odd_edge_tog, N16, N17, N18, N19, N20, N21, N22, n1, n2, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41,
         n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55;
  wire   [6:0] count;
  wire   [6:0] edge_flip_half;

  ClkDiv_1_DW01_inc_0 add_49 ( .A(count), .SUM({N22, N21, N20, N19, N18, N17, 
        N16}) );
  DFFRQX2M div_clk_reg ( .D(n54), .CK(i_ref_clk), .RN(n2), .Q(div_clk) );
  DFFSQX2M odd_edge_tog_reg ( .D(n55), .CK(i_ref_clk), .SN(n2), .Q(
        odd_edge_tog) );
  DFFRQX2M \count_reg[6]  ( .D(n53), .CK(i_ref_clk), .RN(n2), .Q(count[6]) );
  DFFRQX4M \count_reg[0]  ( .D(n47), .CK(i_ref_clk), .RN(n2), .Q(count[0]) );
  DFFRQX2M \count_reg[5]  ( .D(n52), .CK(i_ref_clk), .RN(n2), .Q(count[5]) );
  DFFRQX2M \count_reg[4]  ( .D(n51), .CK(i_ref_clk), .RN(n2), .Q(count[4]) );
  DFFRQX2M \count_reg[3]  ( .D(n50), .CK(i_ref_clk), .RN(n2), .Q(count[3]) );
  DFFRQX2M \count_reg[2]  ( .D(n49), .CK(i_ref_clk), .RN(n2), .Q(count[2]) );
  DFFRQX2M \count_reg[1]  ( .D(n48), .CK(i_ref_clk), .RN(n2), .Q(count[1]) );
  NAND2BX2M U3 ( .AN(i_div_ratio[2]), .B(edge_flip_half[0]), .Y(n4) );
  NOR4X2M U4 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n33) );
  NOR2X4M U5 ( .A(n5), .B(i_div_ratio[4]), .Y(n6) );
  AND3X4M U6 ( .A(n12), .B(n13), .C(n46), .Y(n11) );
  OR2X2M U7 ( .A(n4), .B(i_div_ratio[3]), .Y(n5) );
  OAI2BB1XLM U8 ( .A0N(i_div_ratio[1]), .A1N(i_div_ratio[2]), .B0(n4), .Y(
        edge_flip_half[1]) );
  NAND4X2M U9 ( .A(n30), .B(n31), .C(n32), .D(n33), .Y(n15) );
  XOR2X1M U10 ( .A(i_div_ratio[2]), .B(count[1]), .Y(n44) );
  AO22XLM U11 ( .A0(n1), .A1(count[6]), .B0(N22), .B1(n11), .Y(n53) );
  AO22XLM U12 ( .A0(n1), .A1(count[1]), .B0(N17), .B1(n11), .Y(n48) );
  AO22XLM U13 ( .A0(n1), .A1(count[2]), .B0(N18), .B1(n11), .Y(n49) );
  AO22XLM U14 ( .A0(n1), .A1(count[3]), .B0(N19), .B1(n11), .Y(n50) );
  AO22XLM U15 ( .A0(n1), .A1(count[4]), .B0(N20), .B1(n11), .Y(n51) );
  AO22XLM U16 ( .A0(n1), .A1(count[5]), .B0(N21), .B1(n11), .Y(n52) );
  OAI2BB1XLM U17 ( .A0N(n4), .A1N(i_div_ratio[3]), .B0(n5), .Y(
        edge_flip_half[2]) );
  INVX4M U18 ( .A(n3), .Y(n2) );
  INVX2M U19 ( .A(i_div_ratio[1]), .Y(edge_flip_half[0]) );
  INVX2M U20 ( .A(i_rst), .Y(n3) );
  CLKBUFX6M U21 ( .A(n10), .Y(n1) );
  OAI21X2M U22 ( .A0(n26), .A1(n27), .B0(i_clk_en), .Y(n10) );
  INVX2M U23 ( .A(i_div_ratio[5]), .Y(n9) );
  AO21XLM U24 ( .A0(n5), .A1(i_div_ratio[4]), .B0(n6), .Y(edge_flip_half[3])
         );
  CLKNAND2X2M U25 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U26 ( .A0(n6), .A1(n9), .B0(n7), .Y(edge_flip_half[4]) );
  XNOR2X1M U27 ( .A(i_div_ratio[6]), .B(n7), .Y(edge_flip_half[5]) );
  NOR2X1M U28 ( .A(i_div_ratio[6]), .B(n7), .Y(n8) );
  CLKXOR2X2M U29 ( .A(i_div_ratio[7]), .B(n8), .Y(edge_flip_half[6]) );
  MX2X6M U30 ( .A(i_ref_clk), .B(div_clk), .S0(n46), .Y(o_div_clk) );
  AO22X1M U31 ( .A0(n1), .A1(count[0]), .B0(N16), .B1(n11), .Y(n47) );
  CLKINVX1M U32 ( .A(n1), .Y(n46) );
  CLKXOR2X2M U33 ( .A(div_clk), .B(n14), .Y(n54) );
  AOI21X1M U34 ( .A0(n13), .A1(n12), .B0(n1), .Y(n14) );
  OR2X1M U35 ( .A(n15), .B(i_div_ratio[0]), .Y(n12) );
  XNOR2X1M U36 ( .A(odd_edge_tog), .B(n16), .Y(n55) );
  OR2X1M U37 ( .A(n13), .B(n1), .Y(n16) );
  OR3X1M U38 ( .A(i_div_ratio[2]), .B(i_div_ratio[3]), .C(i_div_ratio[1]), .Y(
        n27) );
  OR4X1M U39 ( .A(i_div_ratio[4]), .B(i_div_ratio[5]), .C(i_div_ratio[6]), .D(
        i_div_ratio[7]), .Y(n26) );
  CLKNAND2X2M U40 ( .A(n28), .B(i_div_ratio[0]), .Y(n13) );
  MXI2X1M U41 ( .A(n29), .B(n15), .S0(odd_edge_tog), .Y(n28) );
  CLKXOR2X2M U42 ( .A(edge_flip_half[2]), .B(count[2]), .Y(n37) );
  CLKXOR2X2M U43 ( .A(edge_flip_half[1]), .B(count[1]), .Y(n36) );
  CLKXOR2X2M U44 ( .A(edge_flip_half[0]), .B(count[0]), .Y(n35) );
  CLKXOR2X2M U45 ( .A(edge_flip_half[6]), .B(count[6]), .Y(n34) );
  XNOR2X1M U46 ( .A(count[4]), .B(edge_flip_half[4]), .Y(n32) );
  XNOR2X1M U47 ( .A(count[5]), .B(edge_flip_half[5]), .Y(n31) );
  XNOR2X1M U48 ( .A(count[3]), .B(edge_flip_half[3]), .Y(n30) );
  NAND4X1M U49 ( .A(n38), .B(n39), .C(n40), .D(n41), .Y(n29) );
  NOR4X1M U50 ( .A(n42), .B(n43), .C(n44), .D(n45), .Y(n41) );
  CLKXOR2X2M U51 ( .A(i_div_ratio[3]), .B(count[2]), .Y(n45) );
  CLKXOR2X2M U52 ( .A(i_div_ratio[1]), .B(count[0]), .Y(n43) );
  CLKXOR2X2M U53 ( .A(i_div_ratio[7]), .B(count[6]), .Y(n42) );
  XNOR2X1M U54 ( .A(count[4]), .B(i_div_ratio[5]), .Y(n40) );
  XNOR2X1M U55 ( .A(count[5]), .B(i_div_ratio[6]), .Y(n39) );
  XNOR2X1M U56 ( .A(count[3]), .B(i_div_ratio[4]), .Y(n38) );
endmodule


module uart_tx_fsm ( CLK, RST, Data_Valid, ser_done, parity_enable, Ser_enable, 
        mux_sel, busy );
  output [1:0] mux_sel;
  input CLK, RST, Data_Valid, ser_done, parity_enable;
  output Ser_enable, busy;
  wire   busy_c, n4, n5, n6, n7, n8, n9, n1, n2, n3, n10;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFRX1M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(n1), .Q(
        current_state[1]), .QN(n10) );
  DFFRX4M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(n1), .Q(
        current_state[0]), .QN(n3) );
  DFFRX4M busy_reg ( .D(busy_c), .CK(CLK), .RN(n1), .Q(busy) );
  DFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n1), .Q(
        current_state[2]) );
  BUFX2M U3 ( .A(RST), .Y(n1) );
  INVX2M U4 ( .A(n9), .Y(n2) );
  AOI21X2M U5 ( .A0(n6), .A1(n7), .B0(current_state[2]), .Y(next_state[0]) );
  NAND2BX2M U6 ( .AN(ser_done), .B(current_state[0]), .Y(n6) );
  OAI21X2M U7 ( .A0(Data_Valid), .A1(current_state[0]), .B0(n10), .Y(n7) );
  NOR3X6M U8 ( .A(n5), .B(ser_done), .C(current_state[2]), .Y(Ser_enable) );
  OAI21X4M U9 ( .A0(current_state[1]), .A1(n3), .B0(n8), .Y(n9) );
  NAND2X2M U10 ( .A(current_state[1]), .B(n3), .Y(n8) );
  NAND2X2M U11 ( .A(n2), .B(current_state[0]), .Y(n5) );
  OAI2B2X4M U12 ( .A1N(current_state[2]), .A0(n8), .B0(current_state[2]), .B1(
        n9), .Y(mux_sel[0]) );
  OAI21X2M U13 ( .A0(current_state[2]), .A1(current_state[0]), .B0(n8), .Y(
        mux_sel[1]) );
  NOR3X2M U14 ( .A(n10), .B(current_state[2]), .C(n4), .Y(next_state[2]) );
  AOI2B1X1M U15 ( .A1N(parity_enable), .A0(ser_done), .B0(n3), .Y(n4) );
  OAI21X2M U16 ( .A0(current_state[2]), .A1(n3), .B0(n8), .Y(busy_c) );
  AOI21X2M U17 ( .A0(n2), .A1(n5), .B0(current_state[2]), .Y(next_state[1]) );
endmodule


module Serializer_WIDTH8 ( CLK, RST, DATA, Enable, Busy, Data_Valid, ser_out, 
        ser_done );
  input [7:0] DATA;
  input CLK, RST, Enable, Busy, Data_Valid;
  output ser_out, ser_done;
  wire   N23, N24, N25, N27, n1, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n2, n3, n4,
         n26, n27, n28;
  wire   [7:1] DATA_V;
  wire   [2:0] ser_count;
  assign ser_done = N27;

  DFFRX4M \ser_count_reg[2]  ( .D(N25), .CK(CLK), .RN(n3), .QN(n1) );
  NOR2X12M U19 ( .A(n26), .B(n2), .Y(n7) );
  DFFRX1M \ser_count_reg[0]  ( .D(N23), .CK(CLK), .RN(n3), .Q(ser_count[0]), 
        .QN(n27) );
  DFFRX1M \DATA_V_reg[6]  ( .D(n20), .CK(CLK), .RN(n3), .Q(DATA_V[6]) );
  DFFRX1M \DATA_V_reg[5]  ( .D(n21), .CK(CLK), .RN(n3), .Q(DATA_V[5]) );
  DFFRX1M \DATA_V_reg[4]  ( .D(n22), .CK(CLK), .RN(n3), .Q(DATA_V[4]) );
  DFFRX1M \DATA_V_reg[3]  ( .D(n23), .CK(CLK), .RN(n3), .Q(DATA_V[3]) );
  DFFRX1M \DATA_V_reg[2]  ( .D(n24), .CK(CLK), .RN(n3), .Q(DATA_V[2]) );
  DFFRX1M \DATA_V_reg[1]  ( .D(n25), .CK(CLK), .RN(n3), .Q(DATA_V[1]) );
  DFFRX1M \DATA_V_reg[0]  ( .D(n18), .CK(CLK), .RN(n3), .Q(ser_out) );
  DFFRX1M \DATA_V_reg[7]  ( .D(n19), .CK(CLK), .RN(n3), .Q(DATA_V[7]) );
  DFFRX4M \ser_count_reg[1]  ( .D(N24), .CK(CLK), .RN(n3), .Q(ser_count[1]), 
        .QN(n28) );
  INVX6M U3 ( .A(n4), .Y(n3) );
  INVX2M U4 ( .A(RST), .Y(n4) );
  NOR2X8M U5 ( .A(n2), .B(n7), .Y(n5) );
  INVX2M U6 ( .A(Enable), .Y(n26) );
  CLKBUFX6M U7 ( .A(n8), .Y(n2) );
  NOR2BX2M U8 ( .AN(Data_Valid), .B(Busy), .Y(n8) );
  OAI2BB1X2M U9 ( .A0N(ser_out), .A1N(n5), .B0(n6), .Y(n18) );
  AOI22X1M U10 ( .A0(DATA_V[1]), .A1(n7), .B0(DATA[0]), .B1(n2), .Y(n6) );
  OAI2BB1X2M U11 ( .A0N(DATA_V[1]), .A1N(n5), .B0(n14), .Y(n25) );
  AOI22X1M U12 ( .A0(DATA_V[2]), .A1(n7), .B0(DATA[1]), .B1(n2), .Y(n14) );
  OAI2BB1X2M U13 ( .A0N(n5), .A1N(DATA_V[2]), .B0(n13), .Y(n24) );
  AOI22X1M U14 ( .A0(DATA_V[3]), .A1(n7), .B0(DATA[2]), .B1(n2), .Y(n13) );
  OAI2BB1X2M U15 ( .A0N(n5), .A1N(DATA_V[3]), .B0(n12), .Y(n23) );
  AOI22X1M U16 ( .A0(DATA_V[4]), .A1(n7), .B0(DATA[3]), .B1(n2), .Y(n12) );
  OAI2BB1X2M U17 ( .A0N(n5), .A1N(DATA_V[4]), .B0(n11), .Y(n22) );
  AOI22X1M U18 ( .A0(DATA_V[5]), .A1(n7), .B0(DATA[4]), .B1(n2), .Y(n11) );
  OAI2BB1X2M U20 ( .A0N(n5), .A1N(DATA_V[5]), .B0(n10), .Y(n21) );
  AOI22X1M U21 ( .A0(DATA_V[6]), .A1(n7), .B0(DATA[5]), .B1(n2), .Y(n10) );
  OAI2BB1X2M U22 ( .A0N(n5), .A1N(DATA_V[6]), .B0(n9), .Y(n20) );
  AOI22X1M U23 ( .A0(DATA_V[7]), .A1(n7), .B0(DATA[6]), .B1(n2), .Y(n9) );
  AO22X1M U24 ( .A0(n5), .A1(DATA_V[7]), .B0(DATA[7]), .B1(n2), .Y(n19) );
  NOR3X6M U25 ( .A(n1), .B(n27), .C(n28), .Y(N27) );
  OAI32X2M U26 ( .A0(n15), .A1(n27), .A2(n28), .B0(n16), .B1(n1), .Y(N25) );
  NAND2X2M U27 ( .A(Enable), .B(n1), .Y(n15) );
  AOI21X2M U28 ( .A0(Enable), .A1(n28), .B0(N23), .Y(n16) );
  NOR2X2M U29 ( .A(n26), .B(ser_count[0]), .Y(N23) );
  NOR2X2M U30 ( .A(n17), .B(n26), .Y(N24) );
  XNOR2X2M U31 ( .A(ser_count[0]), .B(ser_count[1]), .Y(n17) );
endmodule


module mux ( CLK, RST, IN_0, IN_1, IN_2, IN_3, SEL, OUT );
  input [1:0] SEL;
  input CLK, RST, IN_0, IN_1, IN_2, IN_3;
  output OUT;
  wire   mux_out, n2, n3, n1;

  DFFRX4M OUT_reg ( .D(mux_out), .CK(CLK), .RN(RST), .Q(OUT) );
  INVX2M U3 ( .A(SEL[0]), .Y(n1) );
  OAI2B2X1M U4 ( .A1N(SEL[1]), .A0(n2), .B0(SEL[1]), .B1(n3), .Y(mux_out) );
  AOI22X1M U5 ( .A0(IN_0), .A1(n1), .B0(SEL[0]), .B1(IN_1), .Y(n3) );
  AOI22X1M U6 ( .A0(IN_2), .A1(n1), .B0(IN_3), .B1(SEL[0]), .Y(n2) );
endmodule


module parity_calc_WIDTH8 ( CLK, RST, parity_enable, parity_type, Busy, DATA, 
        Data_Valid, parity );
  input [7:0] DATA;
  input CLK, RST, parity_enable, parity_type, Busy, Data_Valid;
  output parity;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n2,
         n17, n18, n19;
  wire   [7:0] DATA_V;

  DFFRX1M parity_reg ( .D(n8), .CK(CLK), .RN(n17), .Q(parity) );
  DFFRX1M \DATA_V_reg[7]  ( .D(n16), .CK(CLK), .RN(n17), .Q(DATA_V[7]) );
  DFFRX1M \DATA_V_reg[6]  ( .D(n15), .CK(CLK), .RN(n17), .Q(DATA_V[6]) );
  DFFRX1M \DATA_V_reg[5]  ( .D(n14), .CK(CLK), .RN(n17), .Q(DATA_V[5]) );
  DFFRX1M \DATA_V_reg[4]  ( .D(n13), .CK(CLK), .RN(n17), .Q(DATA_V[4]) );
  DFFRX1M \DATA_V_reg[3]  ( .D(n12), .CK(CLK), .RN(n17), .Q(DATA_V[3]) );
  DFFRX1M \DATA_V_reg[2]  ( .D(n11), .CK(CLK), .RN(n17), .Q(DATA_V[2]) );
  DFFRX1M \DATA_V_reg[1]  ( .D(n10), .CK(CLK), .RN(n17), .Q(DATA_V[1]) );
  DFFRX1M \DATA_V_reg[0]  ( .D(n9), .CK(CLK), .RN(n17), .Q(DATA_V[0]) );
  INVX4M U2 ( .A(n18), .Y(n17) );
  INVX2M U3 ( .A(RST), .Y(n18) );
  CLKBUFX8M U4 ( .A(n7), .Y(n2) );
  NOR2BX2M U5 ( .AN(Data_Valid), .B(Busy), .Y(n7) );
  AO2B2X2M U6 ( .B0(DATA[0]), .B1(n2), .A0(DATA_V[0]), .A1N(n2), .Y(n9) );
  AO2B2X2M U7 ( .B0(DATA[1]), .B1(n2), .A0(DATA_V[1]), .A1N(n2), .Y(n10) );
  AO2B2X2M U8 ( .B0(DATA[2]), .B1(n2), .A0(DATA_V[2]), .A1N(n2), .Y(n11) );
  AO2B2X2M U9 ( .B0(DATA[3]), .B1(n2), .A0(DATA_V[3]), .A1N(n2), .Y(n12) );
  AO2B2X2M U10 ( .B0(DATA[4]), .B1(n2), .A0(DATA_V[4]), .A1N(n2), .Y(n13) );
  AO2B2X2M U11 ( .B0(DATA[5]), .B1(n2), .A0(DATA_V[5]), .A1N(n2), .Y(n14) );
  AO2B2X2M U12 ( .B0(DATA[6]), .B1(n2), .A0(DATA_V[6]), .A1N(n2), .Y(n15) );
  AO2B2X2M U13 ( .B0(DATA[7]), .B1(n2), .A0(DATA_V[7]), .A1N(n2), .Y(n16) );
  XNOR2X2M U14 ( .A(DATA_V[2]), .B(DATA_V[3]), .Y(n5) );
  OAI2BB2X1M U15 ( .B0(n1), .B1(n19), .A0N(parity), .A1N(n19), .Y(n8) );
  INVX2M U16 ( .A(parity_enable), .Y(n19) );
  XOR3XLM U17 ( .A(n3), .B(parity_type), .C(n4), .Y(n1) );
  XOR3XLM U18 ( .A(DATA_V[1]), .B(DATA_V[0]), .C(n5), .Y(n4) );
  XOR3XLM U19 ( .A(DATA_V[5]), .B(DATA_V[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U20 ( .A(DATA_V[7]), .B(DATA_V[6]), .Y(n6) );
endmodule


module UART_TX_DATA_WIDTH8 ( CLK, RST, P_DATA, Data_Valid, parity_enable, 
        parity_type, TX_OUT, busy );
  input [7:0] P_DATA;
  input CLK, RST, Data_Valid, parity_enable, parity_type;
  output TX_OUT, busy;
  wire   seriz_done, seriz_en, ser_data, parity, n1, n2;
  wire   [1:0] mux_sel;

  uart_tx_fsm U0_fsm ( .CLK(CLK), .RST(n1), .Data_Valid(Data_Valid), 
        .ser_done(seriz_done), .parity_enable(parity_enable), .Ser_enable(
        seriz_en), .mux_sel(mux_sel), .busy(busy) );
  Serializer_WIDTH8 U0_Serializer ( .CLK(CLK), .RST(n1), .DATA(P_DATA), 
        .Enable(seriz_en), .Busy(busy), .Data_Valid(Data_Valid), .ser_out(
        ser_data), .ser_done(seriz_done) );
  mux U0_mux ( .CLK(CLK), .RST(n1), .IN_0(1'b0), .IN_1(ser_data), .IN_2(parity), .IN_3(1'b1), .SEL(mux_sel), .OUT(TX_OUT) );
  parity_calc_WIDTH8 U0_parity_calc ( .CLK(CLK), .RST(n1), .parity_enable(
        parity_enable), .parity_type(parity_type), .Busy(busy), .DATA(P_DATA), 
        .Data_Valid(Data_Valid), .parity(parity) );
  INVX2M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(RST), .Y(n2) );
endmodule


module uart_rx_fsm_DATA_WIDTH8 ( CLK, RST, S_DATA, Prescale, parity_enable, 
        bit_count, edge_count, par_err, stp_err, strt_glitch, strt_chk_en, 
        edge_bit_en, deser_en, par_chk_en, stp_chk_en, dat_samp_en, data_valid
 );
  input [5:0] Prescale;
  input [3:0] bit_count;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, parity_enable, par_err, stp_err, strt_glitch;
  output strt_chk_en, edge_bit_en, deser_en, par_chk_en, stp_chk_en,
         dat_samp_en, data_valid;
  wire   n52, \sub_40/carry[5] , \sub_40/carry[4] , \sub_40/carry[3] , n1, n2,
         n3, n4, n5, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51;
  wire   [5:0] check_edge;
  wire   [5:0] error_check_edge;
  wire   [2:0] current_state;
  wire   [2:0] next_state;
  assign error_check_edge[0] = Prescale[0];

  DFFRX4M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]), .QN(n41) );
  DFFRQX1M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(n7), .Q(
        current_state[0]) );
  DFFRQX1M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n7), .Q(
        current_state[2]) );
  INVX2M U3 ( .A(n1), .Y(n2) );
  INVX2M U4 ( .A(current_state[2]), .Y(n1) );
  NOR2X2M U5 ( .A(n41), .B(n4), .Y(n20) );
  INVX3M U6 ( .A(n3), .Y(n4) );
  NOR3X2M U7 ( .A(n27), .B(stp_err), .C(par_err), .Y(data_valid) );
  NOR3BX2M U8 ( .AN(n4), .B(n41), .C(n2), .Y(n52) );
  NOR3X2M U9 ( .A(bit_count[0]), .B(strt_glitch), .C(bit_count[3]), .Y(n22) );
  INVXLM U10 ( .A(current_state[0]), .Y(n3) );
  CLKINVX2M U11 ( .A(bit_count[0]), .Y(n28) );
  NOR2X4M U12 ( .A(n5), .B(Prescale[2]), .Y(n9) );
  BUFX2M U13 ( .A(n8), .Y(n5) );
  NAND2X4M U14 ( .A(n41), .B(n13), .Y(dat_samp_en) );
  NOR2X4M U15 ( .A(n1), .B(n14), .Y(stp_chk_en) );
  NOR2X2M U16 ( .A(current_state[1]), .B(n13), .Y(strt_chk_en) );
  OAI21X4M U17 ( .A0(n4), .A1(n42), .B0(n1), .Y(n13) );
  BUFX2M U18 ( .A(n52), .Y(deser_en) );
  AOI2BB2X1M U19 ( .B0(deser_en), .B1(n17), .A0N(n27), .A1N(S_DATA), .Y(n26)
         );
  NAND2X2M U20 ( .A(n13), .B(n14), .Y(edge_bit_en) );
  CLKINVX2M U21 ( .A(n20), .Y(n14) );
  NOR3X2M U22 ( .A(n33), .B(n34), .C(n35), .Y(n32) );
  NAND3BXLM U23 ( .AN(bit_count[2]), .B(bit_count[3]), .C(stp_chk_en), .Y(n33)
         );
  NAND3BXLM U24 ( .AN(stp_chk_en), .B(n15), .C(n16), .Y(next_state[2]) );
  NAND3BXLM U25 ( .AN(n17), .B(deser_en), .C(n18), .Y(n16) );
  AND4X2M U26 ( .A(n44), .B(n45), .C(n46), .D(n47), .Y(n19) );
  OAI2BB1XLM U27 ( .A0N(error_check_edge[0]), .A1N(Prescale[1]), .B0(n5), .Y(
        check_edge[1]) );
  NAND2XLM U28 ( .A(bit_count[1]), .B(n28), .Y(n40) );
  NOR3X2M U29 ( .A(n36), .B(n37), .C(n38), .Y(n31) );
  BUFX2M U30 ( .A(RST), .Y(n7) );
  INVX2M U31 ( .A(Prescale[3]), .Y(n12) );
  INVX2M U32 ( .A(error_check_edge[0]), .Y(check_edge[0]) );
  INVXLM U33 ( .A(Prescale[1]), .Y(error_check_edge[1]) );
  XNOR2X1M U34 ( .A(Prescale[5]), .B(\sub_40/carry[5] ), .Y(
        error_check_edge[5]) );
  OR2X1M U35 ( .A(Prescale[4]), .B(\sub_40/carry[4] ), .Y(\sub_40/carry[5] )
         );
  XNOR2X1M U36 ( .A(\sub_40/carry[4] ), .B(Prescale[4]), .Y(
        error_check_edge[4]) );
  OR2X1M U37 ( .A(Prescale[3]), .B(\sub_40/carry[3] ), .Y(\sub_40/carry[4] )
         );
  XNOR2X1M U38 ( .A(\sub_40/carry[3] ), .B(Prescale[3]), .Y(
        error_check_edge[3]) );
  OR2X1M U39 ( .A(Prescale[2]), .B(Prescale[1]), .Y(\sub_40/carry[3] ) );
  XNOR2X1M U40 ( .A(Prescale[1]), .B(Prescale[2]), .Y(error_check_edge[2]) );
  NAND2BX1M U41 ( .AN(Prescale[1]), .B(check_edge[0]), .Y(n8) );
  AO21XLM U42 ( .A0(n5), .A1(Prescale[2]), .B0(n9), .Y(check_edge[2]) );
  CLKNAND2X2M U43 ( .A(n9), .B(n12), .Y(n10) );
  OAI21X1M U44 ( .A0(n9), .A1(n12), .B0(n10), .Y(check_edge[3]) );
  XNOR2X1M U45 ( .A(Prescale[4]), .B(n10), .Y(check_edge[4]) );
  NOR2X1M U46 ( .A(Prescale[4]), .B(n10), .Y(n11) );
  CLKXOR2X2M U47 ( .A(Prescale[5]), .B(n11), .Y(check_edge[5]) );
  NOR2X1M U48 ( .A(n2), .B(n14), .Y(par_chk_en) );
  CLKINVX1M U49 ( .A(parity_enable), .Y(n18) );
  NAND4X1M U50 ( .A(bit_count[3]), .B(bit_count[0]), .C(n19), .D(n20), .Y(n15)
         );
  OAI21X1M U51 ( .A0(n2), .A1(n21), .B0(n14), .Y(next_state[1]) );
  AOI31X1M U52 ( .A0(n4), .A1(n19), .A2(n22), .B0(current_state[1]), .Y(n21)
         );
  OAI211X1M U53 ( .A0(n23), .A1(n24), .B0(n25), .C0(n26), .Y(next_state[0]) );
  NAND3X1M U54 ( .A(n19), .B(n28), .C(bit_count[3]), .Y(n17) );
  NAND4X1M U55 ( .A(n29), .B(n30), .C(n31), .D(n32), .Y(n25) );
  CLKXOR2X2M U56 ( .A(error_check_edge[5]), .B(edge_count[5]), .Y(n35) );
  CLKXOR2X2M U57 ( .A(error_check_edge[4]), .B(edge_count[4]), .Y(n34) );
  CLKXOR2X2M U58 ( .A(error_check_edge[1]), .B(edge_count[1]), .Y(n38) );
  CLKXOR2X2M U59 ( .A(error_check_edge[0]), .B(edge_count[0]), .Y(n37) );
  CLKXOR2X2M U60 ( .A(error_check_edge[2]), .B(edge_count[2]), .Y(n36) );
  XNOR2X1M U61 ( .A(edge_count[3]), .B(error_check_edge[3]), .Y(n30) );
  MXI2X1M U62 ( .A(n39), .B(n40), .S0(parity_enable), .Y(n29) );
  OR2X1M U63 ( .A(bit_count[1]), .B(n28), .Y(n39) );
  CLKNAND2X2M U64 ( .A(n41), .B(n1), .Y(n24) );
  MXI2X1M U65 ( .A(n42), .B(n43), .S0(n4), .Y(n23) );
  NAND4BX1M U66 ( .AN(bit_count[3]), .B(strt_glitch), .C(n19), .D(n28), .Y(n43) );
  NOR4X1M U67 ( .A(n48), .B(n49), .C(n50), .D(n51), .Y(n47) );
  CLKXOR2X2M U68 ( .A(edge_count[3]), .B(check_edge[3]), .Y(n51) );
  CLKXOR2X2M U69 ( .A(edge_count[2]), .B(check_edge[2]), .Y(n50) );
  CLKXOR2X2M U70 ( .A(edge_count[5]), .B(check_edge[5]), .Y(n49) );
  CLKXOR2X2M U71 ( .A(edge_count[1]), .B(check_edge[1]), .Y(n48) );
  NOR2X1M U72 ( .A(bit_count[2]), .B(bit_count[1]), .Y(n46) );
  XNOR2X1M U73 ( .A(edge_count[4]), .B(check_edge[4]), .Y(n45) );
  XNOR2X1M U74 ( .A(edge_count[0]), .B(check_edge[0]), .Y(n44) );
  NAND3X1M U75 ( .A(n2), .B(current_state[1]), .C(n4), .Y(n27) );
  CLKINVX1M U76 ( .A(S_DATA), .Y(n42) );
endmodule


module edge_bit_counter ( CLK, RST, Enable, Prescale, bit_count, edge_count );
  input [5:0] Prescale;
  output [3:0] bit_count;
  output [5:0] edge_count;
  input CLK, RST, Enable;
  wire   n51, n52, n53, n54, n55, n56, n57, n58, N8, N9, N10, N11, N19, N20,
         N21, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, n4, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, \add_31/carry[5] ,
         \add_31/carry[4] , \add_31/carry[3] , \add_31/carry[2] , n1, n3, n6,
         n8, n22, n24, n26, n28, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50;

  DFFRX4M \bit_count_reg[3]  ( .D(n17), .CK(CLK), .RN(n31), .Q(bit_count[3]), 
        .QN(n4) );
  DFFRQX1M \edge_count_reg[0]  ( .D(N19), .CK(CLK), .RN(n31), .Q(n58) );
  DFFRQX1M \edge_count_reg[1]  ( .D(N20), .CK(CLK), .RN(n31), .Q(n57) );
  DFFRQX1M \edge_count_reg[5]  ( .D(N24), .CK(CLK), .RN(n31), .Q(n53) );
  DFFRQX1M \edge_count_reg[2]  ( .D(N21), .CK(CLK), .RN(n31), .Q(n56) );
  DFFRQX1M \edge_count_reg[3]  ( .D(N22), .CK(CLK), .RN(n31), .Q(n55) );
  DFFRQX4M \bit_count_reg[0]  ( .D(n20), .CK(CLK), .RN(n31), .Q(bit_count[0])
         );
  DFFRQX1M \edge_count_reg[4]  ( .D(N23), .CK(CLK), .RN(n31), .Q(n54) );
  DFFRQX1M \bit_count_reg[1]  ( .D(n19), .CK(CLK), .RN(n31), .Q(n52) );
  DFFRQX1M \bit_count_reg[2]  ( .D(n18), .CK(CLK), .RN(n31), .Q(n51) );
  INVX4M U3 ( .A(n24), .Y(edge_count[5]) );
  INVX2M U4 ( .A(n1), .Y(bit_count[2]) );
  INVX2M U5 ( .A(n51), .Y(n1) );
  INVXLM U6 ( .A(n52), .Y(n3) );
  INVX4M U7 ( .A(n3), .Y(bit_count[1]) );
  INVXLM U8 ( .A(n54), .Y(n6) );
  INVX4M U9 ( .A(n6), .Y(edge_count[4]) );
  NAND2X1M U10 ( .A(bit_count[1]), .B(bit_count[0]), .Y(n10) );
  INVXLM U11 ( .A(n55), .Y(n8) );
  INVX4M U12 ( .A(n8), .Y(edge_count[3]) );
  INVXLM U13 ( .A(n56), .Y(n22) );
  INVX4M U14 ( .A(n22), .Y(edge_count[2]) );
  INVXLM U15 ( .A(n53), .Y(n24) );
  INVXLM U16 ( .A(n57), .Y(n26) );
  INVX6M U17 ( .A(n26), .Y(edge_count[1]) );
  INVXLM U18 ( .A(n58), .Y(n28) );
  INVX6M U19 ( .A(n28), .Y(edge_count[0]) );
  NOR2X4M U20 ( .A(n33), .B(Prescale[2]), .Y(n34) );
  NAND2BX2M U21 ( .AN(Prescale[1]), .B(N25), .Y(n33) );
  NOR4X4M U22 ( .A(n46), .B(n45), .C(n44), .D(n43), .Y(N31) );
  NOR2BX2M U23 ( .AN(N25), .B(edge_count[0]), .Y(n39) );
  NOR2BX2M U24 ( .AN(edge_count[0]), .B(N25), .Y(n38) );
  NAND3X1M U25 ( .A(bit_count[0]), .B(n47), .C(Enable), .Y(n14) );
  INVX6M U26 ( .A(n32), .Y(n31) );
  INVX2M U27 ( .A(RST), .Y(n32) );
  INVX4M U28 ( .A(n13), .Y(n47) );
  CLKINVX2M U29 ( .A(Enable), .Y(n50) );
  NOR2X4M U30 ( .A(n50), .B(N31), .Y(n13) );
  AOI21X2M U31 ( .A0(n48), .A1(Enable), .B0(n13), .Y(n16) );
  NOR2BX2M U32 ( .AN(N8), .B(n47), .Y(N20) );
  NOR2BX2M U33 ( .AN(N9), .B(n47), .Y(N21) );
  NOR2BX2M U34 ( .AN(N10), .B(n47), .Y(N22) );
  NOR2BX2M U35 ( .AN(N11), .B(n47), .Y(N23) );
  OAI32X2M U36 ( .A0(n50), .A1(bit_count[0]), .A2(n13), .B0(n48), .B1(n47), 
        .Y(n20) );
  OAI32X2M U37 ( .A0(n14), .A1(bit_count[2]), .A2(n49), .B0(n15), .B1(n1), .Y(
        n18) );
  AOI21BX2M U38 ( .A0(Enable), .A1(n49), .B0N(n16), .Y(n15) );
  OAI22X1M U39 ( .A0(n16), .A1(n49), .B0(bit_count[1]), .B1(n14), .Y(n19) );
  NOR2X2M U40 ( .A(n30), .B(n47), .Y(N24) );
  XNOR2X2M U41 ( .A(\add_31/carry[5] ), .B(edge_count[5]), .Y(n30) );
  NOR2X2M U42 ( .A(edge_count[0]), .B(n47), .Y(N19) );
  OAI32X2M U43 ( .A0(n9), .A1(n10), .A2(n50), .B0(n11), .B1(n4), .Y(n17) );
  NAND3XLM U44 ( .A(N31), .B(n4), .C(bit_count[2]), .Y(n9) );
  NOR2X2M U45 ( .A(n12), .B(n13), .Y(n11) );
  AOI2BB1X2M U46 ( .A0N(n10), .A1N(n1), .B0(n50), .Y(n12) );
  ADDHX1M U47 ( .A(edge_count[1]), .B(edge_count[0]), .CO(\add_31/carry[2] ), 
        .S(N8) );
  ADDHX1M U48 ( .A(edge_count[2]), .B(\add_31/carry[2] ), .CO(
        \add_31/carry[3] ), .S(N9) );
  ADDHX1M U49 ( .A(edge_count[3]), .B(\add_31/carry[3] ), .CO(
        \add_31/carry[4] ), .S(N10) );
  ADDHX1M U50 ( .A(edge_count[4]), .B(\add_31/carry[4] ), .CO(
        \add_31/carry[5] ), .S(N11) );
  INVX2M U51 ( .A(bit_count[1]), .Y(n49) );
  INVX2M U52 ( .A(bit_count[0]), .Y(n48) );
  INVX2M U53 ( .A(Prescale[0]), .Y(N25) );
  INVX2M U54 ( .A(Prescale[3]), .Y(n37) );
  OAI2BB1X1M U55 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n33), .Y(N26) );
  AO21XLM U56 ( .A0(n33), .A1(Prescale[2]), .B0(n34), .Y(N27) );
  CLKNAND2X2M U57 ( .A(n34), .B(n37), .Y(n35) );
  OAI21X1M U58 ( .A0(n34), .A1(n37), .B0(n35), .Y(N28) );
  XNOR2X1M U59 ( .A(Prescale[4]), .B(n35), .Y(N29) );
  NOR2X1M U60 ( .A(Prescale[4]), .B(n35), .Y(n36) );
  CLKXOR2X2M U61 ( .A(Prescale[5]), .B(n36), .Y(N30) );
  OAI2B2X1M U62 ( .A1N(N26), .A0(n38), .B0(edge_count[1]), .B1(n38), .Y(n42)
         );
  OAI2B2X1M U63 ( .A1N(edge_count[1]), .A0(n39), .B0(N26), .B1(n39), .Y(n41)
         );
  XNOR2X1M U64 ( .A(N30), .B(edge_count[5]), .Y(n40) );
  NAND3X1M U65 ( .A(n42), .B(n41), .C(n40), .Y(n46) );
  CLKXOR2X2M U66 ( .A(N29), .B(edge_count[4]), .Y(n45) );
  CLKXOR2X2M U67 ( .A(N27), .B(edge_count[2]), .Y(n44) );
  CLKXOR2X2M U68 ( .A(N28), .B(edge_count[3]), .Y(n43) );
endmodule


module data_sampling ( CLK, RST, S_DATA, Prescale, edge_count, Enable, 
        sampled_bit );
  input [5:0] Prescale;
  input [5:0] edge_count;
  input CLK, RST, S_DATA, Enable;
  output sampled_bit;
  wire   N58, n19, n20, n21, \add_21/carry[4] , \add_21/carry[3] ,
         \add_21/carry[2] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41;
  wire   [4:0] half_edges;
  wire   [4:0] half_edges_p1;
  wire   [4:0] half_edges_n1;
  wire   [2:0] Samples;

  DFFRQX2M \Samples_reg[2]  ( .D(n21), .CK(CLK), .RN(n1), .Q(Samples[2]) );
  DFFRX4M sampled_bit_reg ( .D(N58), .CK(CLK), .RN(n1), .Q(sampled_bit) );
  DFFRX4M \Samples_reg[0]  ( .D(n19), .CK(CLK), .RN(n1), .Q(Samples[0]) );
  DFFRX4M \Samples_reg[1]  ( .D(n20), .CK(CLK), .RN(n1), .Q(Samples[1]) );
  OAI21X2M U3 ( .A0(Samples[0]), .A1(Samples[1]), .B0(Samples[2]), .Y(n41) );
  NAND2XLM U4 ( .A(Samples[0]), .B(Samples[1]), .Y(n40) );
  AND4X2M U5 ( .A(n34), .B(n35), .C(n36), .D(n37), .Y(n17) );
  NOR4X2M U6 ( .A(n13), .B(n14), .C(n15), .D(n16), .Y(n12) );
  NOR2X4M U7 ( .A(half_edges[1]), .B(half_edges[0]), .Y(n6) );
  OAI21X4M U8 ( .A0(n2), .A1(n5), .B0(n3), .Y(half_edges[2]) );
  XNOR2X8M U9 ( .A(Prescale[4]), .B(n3), .Y(half_edges[3]) );
  NAND2X2M U10 ( .A(n2), .B(n5), .Y(n3) );
  AO21X2M U11 ( .A0(Prescale[1]), .A1(Prescale[2]), .B0(n2), .Y(half_edges[1])
         );
  NOR2X3M U12 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n2) );
  NAND2XLM U13 ( .A(Samples[0]), .B(Enable), .Y(n33) );
  NAND2XLM U14 ( .A(Samples[1]), .B(Enable), .Y(n26) );
  XOR2X1M U15 ( .A(half_edges[1]), .B(edge_count[1]), .Y(n32) );
  NAND2XLM U16 ( .A(Samples[2]), .B(Enable), .Y(n10) );
  NOR3X2M U17 ( .A(n38), .B(edge_count[5]), .C(n39), .Y(n37) );
  CLKINVX3M U18 ( .A(Prescale[1]), .Y(half_edges[0]) );
  BUFX2M U19 ( .A(RST), .Y(n1) );
  CLKINVX1M U20 ( .A(half_edges[2]), .Y(n9) );
  ADDHX1M U21 ( .A(half_edges[2]), .B(\add_21/carry[2] ), .CO(
        \add_21/carry[3] ), .S(half_edges_p1[2]) );
  ADDHX1M U22 ( .A(half_edges[3]), .B(\add_21/carry[3] ), .CO(
        \add_21/carry[4] ), .S(half_edges_p1[3]) );
  ADDHX1M U23 ( .A(half_edges[1]), .B(half_edges[0]), .CO(\add_21/carry[2] ), 
        .S(half_edges_p1[1]) );
  INVX2M U24 ( .A(half_edges[0]), .Y(half_edges_p1[0]) );
  INVX2M U25 ( .A(Prescale[3]), .Y(n5) );
  NOR2X1M U26 ( .A(Prescale[4]), .B(n3), .Y(n4) );
  CLKXOR2X2M U27 ( .A(Prescale[5]), .B(n4), .Y(half_edges[4]) );
  CLKXOR2X2M U28 ( .A(\add_21/carry[4] ), .B(half_edges[4]), .Y(
        half_edges_p1[4]) );
  AO21XLM U29 ( .A0(half_edges[0]), .A1(half_edges[1]), .B0(n6), .Y(
        half_edges_n1[1]) );
  CLKNAND2X2M U30 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U31 ( .A0(n6), .A1(n9), .B0(n7), .Y(half_edges_n1[2]) );
  XNOR2X1M U32 ( .A(half_edges[3]), .B(n7), .Y(half_edges_n1[3]) );
  NOR2X1M U33 ( .A(half_edges[3]), .B(n7), .Y(n8) );
  CLKXOR2X2M U34 ( .A(half_edges[4]), .B(n8), .Y(half_edges_n1[4]) );
  MXI2X1M U35 ( .A(n10), .B(n11), .S0(n12), .Y(n21) );
  CLKXOR2X2M U36 ( .A(half_edges_p1[0]), .B(edge_count[0]), .Y(n16) );
  OR2X1M U37 ( .A(edge_count[5]), .B(n17), .Y(n14) );
  NAND4X1M U38 ( .A(n18), .B(n22), .C(n23), .D(n24), .Y(n13) );
  XNOR2X1M U39 ( .A(edge_count[1]), .B(half_edges_p1[1]), .Y(n24) );
  XNOR2X1M U40 ( .A(edge_count[2]), .B(half_edges_p1[2]), .Y(n23) );
  XNOR2X1M U41 ( .A(edge_count[3]), .B(half_edges_p1[3]), .Y(n22) );
  CLKXOR2X2M U42 ( .A(n25), .B(half_edges_p1[4]), .Y(n18) );
  MXI2X1M U43 ( .A(n26), .B(n11), .S0(n15), .Y(n20) );
  AND4X1M U44 ( .A(n27), .B(n28), .C(n29), .D(n30), .Y(n15) );
  NOR4X1M U45 ( .A(edge_count[5]), .B(n17), .C(n31), .D(n32), .Y(n30) );
  CLKXOR2X2M U46 ( .A(half_edges[0]), .B(edge_count[0]), .Y(n31) );
  XNOR2X1M U47 ( .A(edge_count[3]), .B(half_edges[3]), .Y(n29) );
  CLKXOR2X2M U48 ( .A(n25), .B(half_edges[4]), .Y(n28) );
  CLKINVX1M U49 ( .A(edge_count[4]), .Y(n25) );
  XNOR2X1M U50 ( .A(edge_count[2]), .B(half_edges[2]), .Y(n27) );
  MXI2X1M U51 ( .A(n33), .B(n11), .S0(n17), .Y(n19) );
  CLKXOR2X2M U52 ( .A(half_edges_p1[0]), .B(edge_count[0]), .Y(n39) );
  CLKXOR2X2M U53 ( .A(half_edges_n1[4]), .B(edge_count[4]), .Y(n38) );
  XNOR2X1M U54 ( .A(edge_count[2]), .B(half_edges_n1[2]), .Y(n36) );
  XNOR2X1M U55 ( .A(edge_count[3]), .B(half_edges_n1[3]), .Y(n35) );
  XNOR2X1M U56 ( .A(edge_count[1]), .B(half_edges_n1[1]), .Y(n34) );
  CLKNAND2X2M U57 ( .A(S_DATA), .B(Enable), .Y(n11) );
  AOI21BX1M U58 ( .A0(n40), .A1(n41), .B0N(Enable), .Y(N58) );
endmodule


module deserializer_DATA_WIDTH8 ( CLK, RST, sampled_bit, Enable, edge_count, 
        Prescale, P_DATA );
  input [5:0] edge_count;
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, sampled_bit, Enable;
  wire   N1, N2, N3, N4, N5, N6, N7, n1, n10, n11, n12, n13, n14, n15, n16,
         n17, n2, n3, n4, n5, n6, n7, n8, n9, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;

  DFFRX1M \P_DATA_reg[6]  ( .D(n16), .CK(CLK), .RN(n3), .Q(P_DATA[6]), .QN(n28) );
  DFFRX1M \P_DATA_reg[5]  ( .D(n15), .CK(CLK), .RN(n3), .Q(P_DATA[5]), .QN(n29) );
  DFFRX1M \P_DATA_reg[4]  ( .D(n14), .CK(CLK), .RN(n3), .Q(P_DATA[4]), .QN(n30) );
  DFFRX1M \P_DATA_reg[3]  ( .D(n13), .CK(CLK), .RN(n3), .Q(P_DATA[3]), .QN(n31) );
  DFFRX1M \P_DATA_reg[2]  ( .D(n12), .CK(CLK), .RN(n3), .Q(P_DATA[2]), .QN(n32) );
  DFFRX1M \P_DATA_reg[1]  ( .D(n11), .CK(CLK), .RN(n3), .Q(P_DATA[1]), .QN(n33) );
  DFFRX1M \P_DATA_reg[7]  ( .D(n17), .CK(CLK), .RN(n3), .Q(P_DATA[7]), .QN(n27) );
  DFFRX4M \P_DATA_reg[0]  ( .D(n10), .CK(CLK), .RN(n3), .Q(P_DATA[0]) );
  NOR2X4M U3 ( .A(n5), .B(Prescale[2]), .Y(n6) );
  NAND2BX2M U4 ( .AN(Prescale[1]), .B(N1), .Y(n5) );
  NOR2BX2M U5 ( .AN(edge_count[0]), .B(N1), .Y(n18) );
  NOR2BX2M U6 ( .AN(N1), .B(edge_count[0]), .Y(n19) );
  INVX4M U7 ( .A(n4), .Y(n3) );
  INVX2M U8 ( .A(RST), .Y(n4) );
  INVX4M U9 ( .A(n2), .Y(n34) );
  OAI22X1M U10 ( .A0(n34), .A1(n33), .B0(n2), .B1(n32), .Y(n11) );
  OAI22X1M U11 ( .A0(n34), .A1(n32), .B0(n2), .B1(n31), .Y(n12) );
  OAI22X1M U12 ( .A0(n34), .A1(n31), .B0(n2), .B1(n30), .Y(n13) );
  OAI22X1M U13 ( .A0(n34), .A1(n30), .B0(n2), .B1(n29), .Y(n14) );
  OAI22X1M U14 ( .A0(n34), .A1(n29), .B0(n2), .B1(n28), .Y(n15) );
  OAI22X1M U15 ( .A0(n34), .A1(n28), .B0(n2), .B1(n27), .Y(n16) );
  OAI2BB2X1M U16 ( .B0(n34), .B1(n27), .A0N(sampled_bit), .A1N(n34), .Y(n17)
         );
  OAI2BB2X1M U17 ( .B0(n2), .B1(n33), .A0N(P_DATA[0]), .A1N(n2), .Y(n10) );
  CLKBUFX6M U18 ( .A(n1), .Y(n2) );
  NAND2XLM U19 ( .A(N7), .B(Enable), .Y(n1) );
  INVX2M U20 ( .A(Prescale[0]), .Y(N1) );
  INVX2M U21 ( .A(Prescale[3]), .Y(n9) );
  OAI2BB1X1M U22 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n5), .Y(N2) );
  AO21XLM U23 ( .A0(n5), .A1(Prescale[2]), .B0(n6), .Y(N3) );
  CLKNAND2X2M U24 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U25 ( .A0(n6), .A1(n9), .B0(n7), .Y(N4) );
  XNOR2X1M U26 ( .A(Prescale[4]), .B(n7), .Y(N5) );
  NOR2X1M U27 ( .A(Prescale[4]), .B(n7), .Y(n8) );
  CLKXOR2X2M U28 ( .A(Prescale[5]), .B(n8), .Y(N6) );
  OAI2B2X1M U29 ( .A1N(N2), .A0(n18), .B0(edge_count[1]), .B1(n18), .Y(n22) );
  OAI2B2X1M U30 ( .A1N(edge_count[1]), .A0(n19), .B0(N2), .B1(n19), .Y(n21) );
  XNOR2X1M U31 ( .A(N6), .B(edge_count[5]), .Y(n20) );
  NAND3X1M U32 ( .A(n22), .B(n21), .C(n20), .Y(n26) );
  CLKXOR2X2M U33 ( .A(N5), .B(edge_count[4]), .Y(n25) );
  CLKXOR2X2M U34 ( .A(N3), .B(edge_count[2]), .Y(n24) );
  CLKXOR2X2M U35 ( .A(N4), .B(edge_count[3]), .Y(n23) );
  NOR4X1M U36 ( .A(n26), .B(n25), .C(n24), .D(n23), .Y(N7) );
endmodule


module strt_chk ( CLK, RST, sampled_bit, Enable, strt_glitch );
  input CLK, RST, sampled_bit, Enable;
  output strt_glitch;
  wire   n1;

  DFFRX4M strt_glitch_reg ( .D(n1), .CK(CLK), .RN(RST), .Q(strt_glitch) );
  AO2B2XLM U2 ( .B0(sampled_bit), .B1(Enable), .A0(strt_glitch), .A1N(Enable), 
        .Y(n1) );
endmodule


module par_chk_DATA_WIDTH8 ( CLK, RST, parity_type, sampled_bit, Enable, 
        P_DATA, par_err );
  input [7:0] P_DATA;
  input CLK, RST, parity_type, sampled_bit, Enable;
  output par_err;
  wire   n11, n1, n3, n4, n5, n6, n7, n8, n2, n10;

  DFFRQX1M par_err_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(n11) );
  INVXLM U2 ( .A(n11), .Y(n2) );
  INVX4M U3 ( .A(n2), .Y(par_err) );
  OAI2BB2X1M U4 ( .B0(n1), .B1(n10), .A0N(par_err), .A1N(n10), .Y(n8) );
  XOR3XLM U5 ( .A(n3), .B(n4), .C(n5), .Y(n1) );
  INVX2M U6 ( .A(Enable), .Y(n10) );
  XNOR2X2M U7 ( .A(sampled_bit), .B(parity_type), .Y(n5) );
  XOR3XLM U8 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n4) );
  XNOR2X2M U9 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XOR3XLM U10 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n7), .Y(n3) );
  XNOR2X2M U11 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n7) );
endmodule


module stp_chk ( CLK, RST, sampled_bit, Enable, stp_err );
  input CLK, RST, sampled_bit, Enable;
  output stp_err;
  wire   n2, n1;

  DFFRQX4M stp_err_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(stp_err) );
  OAI2BB2X1M U2 ( .B0(sampled_bit), .B1(n1), .A0N(stp_err), .A1N(n1), .Y(n2)
         );
  CLKINVX1M U3 ( .A(Enable), .Y(n1) );
endmodule


module UART_RX ( CLK, RST, RX_IN, parity_enable, parity_type, Prescale, P_DATA, 
        data_valid, parity_error, framing_error );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, parity_enable, parity_type;
  output data_valid, parity_error, framing_error;
  wire   strt_glitch, strt_chk_en, edge_bit_en, deser_en, par_chk_en,
         stp_chk_en, dat_samp_en, sampled_bit, n1, n2;
  wire   [3:0] bit_count;
  wire   [5:0] edge_count;

  uart_rx_fsm_DATA_WIDTH8 U0_uart_fsm ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .parity_enable(parity_enable), .bit_count(
        bit_count), .edge_count(edge_count), .par_err(parity_error), .stp_err(
        framing_error), .strt_glitch(strt_glitch), .strt_chk_en(strt_chk_en), 
        .edge_bit_en(edge_bit_en), .deser_en(deser_en), .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .dat_samp_en(dat_samp_en), .data_valid(data_valid)
         );
  edge_bit_counter U0_edge_bit_counter ( .CLK(CLK), .RST(n1), .Enable(
        edge_bit_en), .Prescale(Prescale), .bit_count(bit_count), .edge_count(
        edge_count) );
  data_sampling U0_data_sampling ( .CLK(CLK), .RST(n1), .S_DATA(RX_IN), 
        .Prescale(Prescale), .edge_count(edge_count), .Enable(dat_samp_en), 
        .sampled_bit(sampled_bit) );
  deserializer_DATA_WIDTH8 U0_deserializer ( .CLK(CLK), .RST(n1), 
        .sampled_bit(sampled_bit), .Enable(deser_en), .edge_count(edge_count), 
        .Prescale(Prescale), .P_DATA(P_DATA) );
  strt_chk U0_strt_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(strt_chk_en), .strt_glitch(strt_glitch) );
  par_chk_DATA_WIDTH8 U0_par_chk ( .CLK(CLK), .RST(n1), .parity_type(
        parity_type), .sampled_bit(sampled_bit), .Enable(par_chk_en), .P_DATA(
        P_DATA), .par_err(parity_error) );
  stp_chk U0_stp_chk ( .CLK(CLK), .RST(n1), .sampled_bit(sampled_bit), 
        .Enable(stp_chk_en), .stp_err(framing_error) );
  INVX4M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART ( RST, TX_CLK, RX_CLK, RX_IN_S, RX_OUT_P, RX_OUT_V, TX_IN_P, 
        TX_IN_V, TX_OUT_S, TX_OUT_V, Prescale, parity_enable, parity_type, 
        parity_error, framing_error );
  output [7:0] RX_OUT_P;
  input [7:0] TX_IN_P;
  input [5:0] Prescale;
  input RST, TX_CLK, RX_CLK, RX_IN_S, TX_IN_V, parity_enable, parity_type;
  output RX_OUT_V, TX_OUT_S, TX_OUT_V, parity_error, framing_error;


  UART_TX_DATA_WIDTH8 U0_UART_TX ( .CLK(TX_CLK), .RST(RST), .P_DATA(TX_IN_P), 
        .Data_Valid(TX_IN_V), .parity_enable(parity_enable), .parity_type(
        parity_type), .TX_OUT(TX_OUT_S), .busy(TX_OUT_V) );
  UART_RX U0_UART_RX ( .CLK(RX_CLK), .RST(RST), .RX_IN(RX_IN_S), 
        .parity_enable(parity_enable), .parity_type(parity_type), .Prescale(
        Prescale), .P_DATA(RX_OUT_P), .data_valid(RX_OUT_V), .parity_error(
        parity_error), .framing_error(framing_error) );
endmodule


module SYS_CTRL ( CLK, RST, ALU_OUT, ALU_OUT_VLD, FIFO_FULL, RF_RdData, 
        RF_RdData_Valid, UART_RX_DATA, UART_RX_VLD, ALU_FUN, ALU_EN, CLKG_EN, 
        RF_Address, RF_WrEn, RF_RdEn, RF_WrData, UART_TX_DATA, UART_TX_VLD, 
        CLKDIV_EN );
  input [15:0] ALU_OUT;
  input [7:0] RF_RdData;
  input [7:0] UART_RX_DATA;
  output [3:0] ALU_FUN;
  output [3:0] RF_Address;
  output [7:0] RF_WrData;
  output [7:0] UART_TX_DATA;
  input CLK, RST, ALU_OUT_VLD, FIFO_FULL, RF_RdData_Valid, UART_RX_VLD;
  output ALU_EN, CLKG_EN, RF_WrEn, RF_RdEn, UART_TX_VLD, CLKDIV_EN;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n1, n2, n3, n4, n5, n6, n7, n8, n9, ALU_EN, n11,
         n13, n14, n15, n16, n17, n18, n65, n66, n67, n68, n69;
  wire   [3:0] current_state;
  wire   [3:0] next_state;
  assign CLKDIV_EN = 1'b1;
  assign CLKG_EN = ALU_EN;

  NOR2X12M U61 ( .A(n9), .B(n65), .Y(RF_Address[3]) );
  NOR2X12M U62 ( .A(n9), .B(n66), .Y(RF_Address[2]) );
  NAND3BX4M U76 ( .AN(current_state[1]), .B(n62), .C(n11), .Y(n27) );
  DFFRQX2M \current_state_reg[3]  ( .D(n6), .CK(CLK), .RN(n5), .Q(
        current_state[3]) );
  DFFRQX2M \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(n5), .Q(
        current_state[0]) );
  DFFRQX4M \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(n5), .Q(
        current_state[1]) );
  DFFRQX4M \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(n5), .Q(
        current_state[2]) );
  NOR2X8M U3 ( .A(n27), .B(n66), .Y(ALU_FUN[2]) );
  NOR2X4M U4 ( .A(n11), .B(current_state[1]), .Y(n51) );
  BUFX2M U5 ( .A(n22), .Y(n1) );
  NOR3BX2M U6 ( .AN(n51), .B(current_state[2]), .C(n15), .Y(n22) );
  NOR2X6M U7 ( .A(n27), .B(n68), .Y(ALU_FUN[0]) );
  AND2X2M U8 ( .A(current_state[2]), .B(n15), .Y(n62) );
  NAND2X2M U9 ( .A(current_state[1]), .B(n11), .Y(n30) );
  NAND3X2M U10 ( .A(current_state[1]), .B(current_state[0]), .C(n64), .Y(n32)
         );
  INVX2M U11 ( .A(UART_RX_DATA[3]), .Y(n65) );
  INVX2M U12 ( .A(UART_RX_DATA[1]), .Y(n67) );
  INVX2M U13 ( .A(UART_RX_VLD), .Y(n69) );
  INVX4M U14 ( .A(n46), .Y(n9) );
  OR3X2M U15 ( .A(n3), .B(n4), .C(n2), .Y(UART_TX_VLD) );
  INVX2M U16 ( .A(FIFO_FULL), .Y(n7) );
  NOR2BX8M U17 ( .AN(n26), .B(RF_WrEn), .Y(n63) );
  CLKINVX4M U18 ( .A(n27), .Y(ALU_EN) );
  NOR2X4M U19 ( .A(n27), .B(n67), .Y(ALU_FUN[1]) );
  NOR2X1M U20 ( .A(n27), .B(n65), .Y(ALU_FUN[3]) );
  NAND2X2M U21 ( .A(n62), .B(n51), .Y(n28) );
  CLKBUFX6M U22 ( .A(n38), .Y(n2) );
  NOR2BX1M U23 ( .AN(n1), .B(n20), .Y(n38) );
  NAND2X2M U24 ( .A(n28), .B(n32), .Y(n46) );
  NOR2X2M U25 ( .A(n14), .B(n30), .Y(n39) );
  AO21X2M U26 ( .A0(n51), .A1(n64), .B0(n39), .Y(RF_WrEn) );
  NAND2X2M U27 ( .A(n8), .B(n62), .Y(n26) );
  INVX2M U28 ( .A(n64), .Y(n14) );
  CLKBUFX6M U29 ( .A(n52), .Y(n3) );
  NOR2X2M U30 ( .A(n43), .B(n49), .Y(n52) );
  CLKBUFX6M U31 ( .A(n53), .Y(n4) );
  NOR2BX2M U32 ( .AN(n21), .B(n20), .Y(n53) );
  INVX2M U33 ( .A(n30), .Y(n8) );
  NOR2X2M U34 ( .A(n9), .B(n67), .Y(RF_Address[1]) );
  OAI21X2M U35 ( .A0(n9), .A1(n68), .B0(n26), .Y(RF_Address[0]) );
  NOR2X2M U36 ( .A(n63), .B(n68), .Y(RF_WrData[0]) );
  NOR2X2M U37 ( .A(n63), .B(n67), .Y(RF_WrData[1]) );
  NOR2X2M U38 ( .A(n63), .B(n66), .Y(RF_WrData[2]) );
  NOR2X2M U39 ( .A(n63), .B(n65), .Y(RF_WrData[3]) );
  NOR2X2M U40 ( .A(n63), .B(n18), .Y(RF_WrData[4]) );
  NOR2X2M U41 ( .A(n63), .B(n16), .Y(RF_WrData[7]) );
  OAI211X1M U42 ( .A0(n27), .A1(n69), .B0(n44), .C0(n45), .Y(next_state[0]) );
  AOI211X2M U43 ( .A0(n17), .A1(n34), .B0(n46), .C0(n23), .Y(n45) );
  AOI32X1M U44 ( .A0(n69), .A1(n15), .A2(n51), .B0(n1), .B1(n20), .Y(n44) );
  INVX2M U45 ( .A(n35), .Y(n17) );
  OAI2BB1X2M U46 ( .A0N(n43), .A1N(n13), .B0(n47), .Y(n23) );
  NAND4X2M U47 ( .A(n34), .B(n48), .C(n68), .D(n18), .Y(n47) );
  INVX2M U48 ( .A(n32), .Y(RF_RdEn) );
  INVX2M U49 ( .A(n49), .Y(n13) );
  OR3X2M U50 ( .A(n33), .B(n68), .C(n18), .Y(n31) );
  BUFX2M U51 ( .A(RST), .Y(n5) );
  INVX2M U52 ( .A(current_state[3]), .Y(n15) );
  INVX2M U53 ( .A(current_state[0]), .Y(n11) );
  INVX4M U54 ( .A(UART_RX_DATA[0]), .Y(n68) );
  INVX2M U55 ( .A(UART_RX_DATA[2]), .Y(n66) );
  OAI2BB1X2M U56 ( .A0N(ALU_OUT[0]), .A1N(n2), .B0(n61), .Y(UART_TX_DATA[0])
         );
  AOI22X1M U57 ( .A0(RF_RdData[0]), .A1(n3), .B0(ALU_OUT[8]), .B1(n4), .Y(n61)
         );
  OAI2BB1X2M U58 ( .A0N(ALU_OUT[1]), .A1N(n2), .B0(n60), .Y(UART_TX_DATA[1])
         );
  AOI22X1M U59 ( .A0(RF_RdData[1]), .A1(n3), .B0(ALU_OUT[9]), .B1(n4), .Y(n60)
         );
  OAI2BB1X2M U60 ( .A0N(ALU_OUT[2]), .A1N(n2), .B0(n59), .Y(UART_TX_DATA[2])
         );
  AOI22X1M U63 ( .A0(RF_RdData[2]), .A1(n3), .B0(ALU_OUT[10]), .B1(n4), .Y(n59) );
  OAI2BB1X2M U64 ( .A0N(ALU_OUT[3]), .A1N(n2), .B0(n58), .Y(UART_TX_DATA[3])
         );
  AOI22X1M U65 ( .A0(RF_RdData[3]), .A1(n3), .B0(ALU_OUT[11]), .B1(n4), .Y(n58) );
  OAI2BB1X2M U66 ( .A0N(ALU_OUT[4]), .A1N(n2), .B0(n57), .Y(UART_TX_DATA[4])
         );
  AOI22X1M U67 ( .A0(RF_RdData[4]), .A1(n3), .B0(ALU_OUT[12]), .B1(n4), .Y(n57) );
  OAI2BB1X2M U68 ( .A0N(ALU_OUT[5]), .A1N(n2), .B0(n56), .Y(UART_TX_DATA[5])
         );
  AOI22X1M U69 ( .A0(RF_RdData[5]), .A1(n3), .B0(ALU_OUT[13]), .B1(n4), .Y(n56) );
  OAI2BB1X2M U70 ( .A0N(ALU_OUT[6]), .A1N(n2), .B0(n55), .Y(UART_TX_DATA[6])
         );
  AOI22X1M U71 ( .A0(RF_RdData[6]), .A1(n3), .B0(ALU_OUT[14]), .B1(n4), .Y(n55) );
  OAI2BB1X2M U72 ( .A0N(ALU_OUT[7]), .A1N(n2), .B0(n54), .Y(UART_TX_DATA[7])
         );
  AOI22X1M U73 ( .A0(RF_RdData[7]), .A1(n3), .B0(ALU_OUT[15]), .B1(n4), .Y(n54) );
  NOR3X4M U74 ( .A(n15), .B(current_state[2]), .C(n30), .Y(n21) );
  NOR2X4M U75 ( .A(current_state[3]), .B(current_state[2]), .Y(n64) );
  NAND2X4M U77 ( .A(ALU_OUT_VLD), .B(n7), .Y(n20) );
  NAND2X2M U78 ( .A(RF_RdData_Valid), .B(n7), .Y(n43) );
  INVX2M U79 ( .A(n19), .Y(n6) );
  AOI221X2M U80 ( .A0(ALU_EN), .A1(UART_RX_VLD), .B0(n20), .B1(n21), .C0(n1), 
        .Y(n19) );
  NOR3X8M U81 ( .A(current_state[0]), .B(current_state[1]), .C(n14), .Y(n34)
         );
  OAI2B11X2M U82 ( .A1N(n34), .A0(n35), .B0(n36), .C0(n37), .Y(next_state[1])
         );
  AOI22X1M U83 ( .A0(n8), .A1(n42), .B0(n13), .B1(n43), .Y(n36) );
  NOR4X2M U84 ( .A(n2), .B(RF_RdEn), .C(n39), .D(n40), .Y(n37) );
  OAI2B2X1M U85 ( .A1N(n20), .A0(current_state[2]), .B0(current_state[3]), 
        .B1(UART_RX_VLD), .Y(n42) );
  NOR2BX2M U86 ( .AN(UART_RX_DATA[5]), .B(n63), .Y(RF_WrData[5]) );
  NOR2BX2M U87 ( .AN(UART_RX_DATA[6]), .B(n63), .Y(RF_WrData[6]) );
  NOR4X2M U88 ( .A(UART_RX_DATA[4]), .B(UART_RX_DATA[0]), .C(n69), .D(n33), 
        .Y(n40) );
  NAND4X2M U89 ( .A(UART_RX_DATA[2]), .B(n34), .C(UART_RX_DATA[6]), .D(n41), 
        .Y(n33) );
  NOR4X2M U90 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[1]), .C(n65), .D(n16), 
        .Y(n41) );
  NAND4BX1M U91 ( .AN(n23), .B(n24), .C(n25), .D(n26), .Y(next_state[2]) );
  AO21XLM U92 ( .A0(n27), .A1(n28), .B0(UART_RX_VLD), .Y(n25) );
  NAND2X2M U93 ( .A(UART_RX_VLD), .B(n29), .Y(n24) );
  OAI211X2M U94 ( .A0(current_state[3]), .A1(n30), .B0(n31), .C0(n32), .Y(n29)
         );
  AND4X2M U95 ( .A(UART_RX_DATA[5]), .B(UART_RX_DATA[3]), .C(UART_RX_DATA[7]), 
        .D(n50), .Y(n48) );
  NOR4X2M U96 ( .A(UART_RX_DATA[6]), .B(UART_RX_DATA[2]), .C(n69), .D(n67), 
        .Y(n50) );
  NAND3X2M U97 ( .A(n62), .B(current_state[0]), .C(current_state[1]), .Y(n49)
         );
  INVX2M U98 ( .A(UART_RX_DATA[4]), .Y(n18) );
  NAND3X2M U99 ( .A(UART_RX_DATA[0]), .B(n48), .C(UART_RX_DATA[4]), .Y(n35) );
  INVX2M U100 ( .A(UART_RX_DATA[7]), .Y(n16) );
endmodule


module RegFile ( CLK, RST, WrEn, RdEn, Address, WrData, RdData, RdData_VLD, 
        REG0, REG1, REG2, REG3 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input CLK, RST, WrEn, RdEn;
  output RdData_VLD;
  wire   N11, N12, N13, N14, n266, n267, n268, \regArr[15][7] ,
         \regArr[15][6] , \regArr[15][5] , \regArr[15][4] , \regArr[15][3] ,
         \regArr[15][2] , \regArr[15][1] , \regArr[15][0] , \regArr[14][7] ,
         \regArr[14][6] , \regArr[14][5] , \regArr[14][4] , \regArr[14][3] ,
         \regArr[14][2] , \regArr[14][1] , \regArr[14][0] , \regArr[13][7] ,
         \regArr[13][6] , \regArr[13][5] , \regArr[13][4] , \regArr[13][3] ,
         \regArr[13][2] , \regArr[13][1] , \regArr[13][0] , \regArr[12][7] ,
         \regArr[12][6] , \regArr[12][5] , \regArr[12][4] , \regArr[12][3] ,
         \regArr[12][2] , \regArr[12][1] , \regArr[12][0] , \regArr[11][7] ,
         \regArr[11][6] , \regArr[11][5] , \regArr[11][4] , \regArr[11][3] ,
         \regArr[11][2] , \regArr[11][1] , \regArr[11][0] , \regArr[10][7] ,
         \regArr[10][6] , \regArr[10][5] , \regArr[10][4] , \regArr[10][3] ,
         \regArr[10][2] , \regArr[10][1] , \regArr[10][0] , \regArr[9][7] ,
         \regArr[9][6] , \regArr[9][5] , \regArr[9][4] , \regArr[9][3] ,
         \regArr[9][2] , \regArr[9][1] , \regArr[9][0] , \regArr[8][7] ,
         \regArr[8][6] , \regArr[8][5] , \regArr[8][4] , \regArr[8][3] ,
         \regArr[8][2] , \regArr[8][1] , \regArr[8][0] , \regArr[7][7] ,
         \regArr[7][6] , \regArr[7][5] , \regArr[7][4] , \regArr[7][3] ,
         \regArr[7][2] , \regArr[7][1] , \regArr[7][0] , \regArr[6][7] ,
         \regArr[6][6] , \regArr[6][5] , \regArr[6][4] , \regArr[6][3] ,
         \regArr[6][2] , \regArr[6][1] , \regArr[6][0] , \regArr[5][7] ,
         \regArr[5][6] , \regArr[5][5] , \regArr[5][4] , \regArr[5][3] ,
         \regArr[5][2] , \regArr[5][1] , \regArr[5][0] , \regArr[4][7] ,
         \regArr[4][6] , \regArr[4][5] , \regArr[4][4] , \regArr[4][3] ,
         \regArr[4][2] , \regArr[4][1] , \regArr[4][0] , N36, N37, N38, N39,
         N40, N41, N42, N43, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35,
         n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137,
         n138, n139, n140, n141, n142, n143, n144, n145, n146, n147, n148,
         n149, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n4, n5, n6, n7, n8, n9, n10, n11,
         n177, n178, n179, n180, n181, n182, n183, n184, n185, n186, n187,
         n188, n189, n190, n191, n192, n193, n194, n195, n196, n197, n198,
         n199, n200, n201, n202, n203, n204, n205, n206, n207, n208, n209,
         n210, n211, n212, n213, n214, n215, n216, n217, n218, n219, n220,
         n221, n222, n223, n224, n225, n226, n227, n228, n229, n230, n231,
         n232, n233, n234, n235, n236, n237, n238, n239, n240, n241, n242,
         n243, n244, n245, n246, n247, n248, n249, n250, n251, n252, n253,
         n254, n255, n256, n257, n258, n259, n260, n261, n262, n263, n264,
         n265;
  assign N11 = Address[0];
  assign N12 = Address[1];
  assign N13 = Address[2];
  assign N14 = Address[3];

  DFFRHQX8M \regArr_reg[2][6]  ( .D(n71), .CK(CLK), .RN(n246), .Q(REG2[6]) );
  DFFRHQX8M \regArr_reg[2][5]  ( .D(n70), .CK(CLK), .RN(n246), .Q(REG2[5]) );
  DFFRHQX8M \regArr_reg[2][4]  ( .D(n69), .CK(CLK), .RN(n246), .Q(REG2[4]) );
  DFFRHQX8M \regArr_reg[2][3]  ( .D(n68), .CK(CLK), .RN(n246), .Q(REG2[3]) );
  DFFRHQX8M \regArr_reg[2][2]  ( .D(n67), .CK(CLK), .RN(n246), .Q(REG2[2]) );
  DFFRHQX8M \regArr_reg[1][4]  ( .D(n61), .CK(CLK), .RN(n245), .Q(REG1[4]) );
  DFFRHQX8M \regArr_reg[1][3]  ( .D(n60), .CK(CLK), .RN(n245), .Q(REG1[3]) );
  DFFRHQX8M \regArr_reg[1][2]  ( .D(n59), .CK(CLK), .RN(n245), .Q(REG1[2]) );
  DFFRHQX8M \regArr_reg[1][1]  ( .D(n58), .CK(CLK), .RN(n245), .Q(REG1[1]) );
  DFFRQX2M \regArr_reg[13][7]  ( .D(n160), .CK(CLK), .RN(n253), .Q(
        \regArr[13][7] ) );
  DFFRQX2M \regArr_reg[13][6]  ( .D(n159), .CK(CLK), .RN(n253), .Q(
        \regArr[13][6] ) );
  DFFRQX2M \regArr_reg[13][5]  ( .D(n158), .CK(CLK), .RN(n253), .Q(
        \regArr[13][5] ) );
  DFFRQX2M \regArr_reg[13][4]  ( .D(n157), .CK(CLK), .RN(n253), .Q(
        \regArr[13][4] ) );
  DFFRQX2M \regArr_reg[13][3]  ( .D(n156), .CK(CLK), .RN(n253), .Q(
        \regArr[13][3] ) );
  DFFRQX2M \regArr_reg[13][2]  ( .D(n155), .CK(CLK), .RN(n252), .Q(
        \regArr[13][2] ) );
  DFFRQX2M \regArr_reg[13][1]  ( .D(n154), .CK(CLK), .RN(n252), .Q(
        \regArr[13][1] ) );
  DFFRQX2M \regArr_reg[13][0]  ( .D(n153), .CK(CLK), .RN(n252), .Q(
        \regArr[13][0] ) );
  DFFRQX2M \regArr_reg[9][7]  ( .D(n128), .CK(CLK), .RN(n250), .Q(
        \regArr[9][7] ) );
  DFFRQX2M \regArr_reg[9][6]  ( .D(n127), .CK(CLK), .RN(n250), .Q(
        \regArr[9][6] ) );
  DFFRQX2M \regArr_reg[9][5]  ( .D(n126), .CK(CLK), .RN(n250), .Q(
        \regArr[9][5] ) );
  DFFRQX2M \regArr_reg[9][4]  ( .D(n125), .CK(CLK), .RN(n250), .Q(
        \regArr[9][4] ) );
  DFFRQX2M \regArr_reg[9][3]  ( .D(n124), .CK(CLK), .RN(n250), .Q(
        \regArr[9][3] ) );
  DFFRQX2M \regArr_reg[9][2]  ( .D(n123), .CK(CLK), .RN(n250), .Q(
        \regArr[9][2] ) );
  DFFRQX2M \regArr_reg[9][1]  ( .D(n122), .CK(CLK), .RN(n250), .Q(
        \regArr[9][1] ) );
  DFFRQX2M \regArr_reg[9][0]  ( .D(n121), .CK(CLK), .RN(n250), .Q(
        \regArr[9][0] ) );
  DFFRQX2M \regArr_reg[5][7]  ( .D(n96), .CK(CLK), .RN(n248), .Q(
        \regArr[5][7] ) );
  DFFRQX2M \regArr_reg[5][6]  ( .D(n95), .CK(CLK), .RN(n248), .Q(
        \regArr[5][6] ) );
  DFFRQX2M \regArr_reg[5][5]  ( .D(n94), .CK(CLK), .RN(n248), .Q(
        \regArr[5][5] ) );
  DFFRQX2M \regArr_reg[5][4]  ( .D(n93), .CK(CLK), .RN(n248), .Q(
        \regArr[5][4] ) );
  DFFRQX2M \regArr_reg[5][3]  ( .D(n92), .CK(CLK), .RN(n248), .Q(
        \regArr[5][3] ) );
  DFFRQX2M \regArr_reg[5][2]  ( .D(n91), .CK(CLK), .RN(n247), .Q(
        \regArr[5][2] ) );
  DFFRQX2M \regArr_reg[5][1]  ( .D(n90), .CK(CLK), .RN(n247), .Q(
        \regArr[5][1] ) );
  DFFRQX2M \regArr_reg[5][0]  ( .D(n89), .CK(CLK), .RN(n247), .Q(
        \regArr[5][0] ) );
  DFFRQX2M \regArr_reg[15][7]  ( .D(n176), .CK(CLK), .RN(n244), .Q(
        \regArr[15][7] ) );
  DFFRQX2M \regArr_reg[15][6]  ( .D(n175), .CK(CLK), .RN(n254), .Q(
        \regArr[15][6] ) );
  DFFRQX2M \regArr_reg[15][5]  ( .D(n174), .CK(CLK), .RN(n254), .Q(
        \regArr[15][5] ) );
  DFFRQX2M \regArr_reg[15][4]  ( .D(n173), .CK(CLK), .RN(n254), .Q(
        \regArr[15][4] ) );
  DFFRQX2M \regArr_reg[15][3]  ( .D(n172), .CK(CLK), .RN(n254), .Q(
        \regArr[15][3] ) );
  DFFRQX2M \regArr_reg[15][2]  ( .D(n171), .CK(CLK), .RN(n254), .Q(
        \regArr[15][2] ) );
  DFFRQX2M \regArr_reg[15][1]  ( .D(n170), .CK(CLK), .RN(n254), .Q(
        \regArr[15][1] ) );
  DFFRQX2M \regArr_reg[15][0]  ( .D(n169), .CK(CLK), .RN(n254), .Q(
        \regArr[15][0] ) );
  DFFRQX2M \regArr_reg[11][7]  ( .D(n144), .CK(CLK), .RN(n252), .Q(
        \regArr[11][7] ) );
  DFFRQX2M \regArr_reg[11][6]  ( .D(n143), .CK(CLK), .RN(n252), .Q(
        \regArr[11][6] ) );
  DFFRQX2M \regArr_reg[11][5]  ( .D(n142), .CK(CLK), .RN(n251), .Q(
        \regArr[11][5] ) );
  DFFRQX2M \regArr_reg[11][4]  ( .D(n141), .CK(CLK), .RN(n251), .Q(
        \regArr[11][4] ) );
  DFFRQX2M \regArr_reg[11][3]  ( .D(n140), .CK(CLK), .RN(n251), .Q(
        \regArr[11][3] ) );
  DFFRQX2M \regArr_reg[11][2]  ( .D(n139), .CK(CLK), .RN(n251), .Q(
        \regArr[11][2] ) );
  DFFRQX2M \regArr_reg[11][1]  ( .D(n138), .CK(CLK), .RN(n251), .Q(
        \regArr[11][1] ) );
  DFFRQX2M \regArr_reg[11][0]  ( .D(n137), .CK(CLK), .RN(n251), .Q(
        \regArr[11][0] ) );
  DFFRQX2M \regArr_reg[7][7]  ( .D(n112), .CK(CLK), .RN(n249), .Q(
        \regArr[7][7] ) );
  DFFRQX2M \regArr_reg[7][6]  ( .D(n111), .CK(CLK), .RN(n249), .Q(
        \regArr[7][6] ) );
  DFFRQX2M \regArr_reg[7][5]  ( .D(n110), .CK(CLK), .RN(n249), .Q(
        \regArr[7][5] ) );
  DFFRQX2M \regArr_reg[7][4]  ( .D(n109), .CK(CLK), .RN(n249), .Q(
        \regArr[7][4] ) );
  DFFRQX2M \regArr_reg[7][3]  ( .D(n108), .CK(CLK), .RN(n249), .Q(
        \regArr[7][3] ) );
  DFFRQX2M \regArr_reg[7][2]  ( .D(n107), .CK(CLK), .RN(n249), .Q(
        \regArr[7][2] ) );
  DFFRQX2M \regArr_reg[7][1]  ( .D(n106), .CK(CLK), .RN(n249), .Q(
        \regArr[7][1] ) );
  DFFRQX2M \regArr_reg[7][0]  ( .D(n105), .CK(CLK), .RN(n249), .Q(
        \regArr[7][0] ) );
  DFFRQX2M \regArr_reg[14][7]  ( .D(n168), .CK(CLK), .RN(n253), .Q(
        \regArr[14][7] ) );
  DFFRQX2M \regArr_reg[14][6]  ( .D(n167), .CK(CLK), .RN(n253), .Q(
        \regArr[14][6] ) );
  DFFRQX2M \regArr_reg[14][5]  ( .D(n166), .CK(CLK), .RN(n253), .Q(
        \regArr[14][5] ) );
  DFFRQX2M \regArr_reg[14][4]  ( .D(n165), .CK(CLK), .RN(n253), .Q(
        \regArr[14][4] ) );
  DFFRQX2M \regArr_reg[14][3]  ( .D(n164), .CK(CLK), .RN(n253), .Q(
        \regArr[14][3] ) );
  DFFRQX2M \regArr_reg[14][2]  ( .D(n163), .CK(CLK), .RN(n253), .Q(
        \regArr[14][2] ) );
  DFFRQX2M \regArr_reg[14][1]  ( .D(n162), .CK(CLK), .RN(n253), .Q(
        \regArr[14][1] ) );
  DFFRQX2M \regArr_reg[14][0]  ( .D(n161), .CK(CLK), .RN(n253), .Q(
        \regArr[14][0] ) );
  DFFRQX2M \regArr_reg[10][7]  ( .D(n136), .CK(CLK), .RN(n251), .Q(
        \regArr[10][7] ) );
  DFFRQX2M \regArr_reg[10][6]  ( .D(n135), .CK(CLK), .RN(n251), .Q(
        \regArr[10][6] ) );
  DFFRQX2M \regArr_reg[10][5]  ( .D(n134), .CK(CLK), .RN(n251), .Q(
        \regArr[10][5] ) );
  DFFRQX2M \regArr_reg[10][4]  ( .D(n133), .CK(CLK), .RN(n251), .Q(
        \regArr[10][4] ) );
  DFFRQX2M \regArr_reg[10][3]  ( .D(n132), .CK(CLK), .RN(n251), .Q(
        \regArr[10][3] ) );
  DFFRQX2M \regArr_reg[10][2]  ( .D(n131), .CK(CLK), .RN(n251), .Q(
        \regArr[10][2] ) );
  DFFRQX2M \regArr_reg[10][1]  ( .D(n130), .CK(CLK), .RN(n251), .Q(
        \regArr[10][1] ) );
  DFFRQX2M \regArr_reg[10][0]  ( .D(n129), .CK(CLK), .RN(n250), .Q(
        \regArr[10][0] ) );
  DFFRQX2M \regArr_reg[6][7]  ( .D(n104), .CK(CLK), .RN(n248), .Q(
        \regArr[6][7] ) );
  DFFRQX2M \regArr_reg[6][6]  ( .D(n103), .CK(CLK), .RN(n248), .Q(
        \regArr[6][6] ) );
  DFFRQX2M \regArr_reg[6][5]  ( .D(n102), .CK(CLK), .RN(n248), .Q(
        \regArr[6][5] ) );
  DFFRQX2M \regArr_reg[6][4]  ( .D(n101), .CK(CLK), .RN(n248), .Q(
        \regArr[6][4] ) );
  DFFRQX2M \regArr_reg[6][3]  ( .D(n100), .CK(CLK), .RN(n248), .Q(
        \regArr[6][3] ) );
  DFFRQX2M \regArr_reg[6][2]  ( .D(n99), .CK(CLK), .RN(n248), .Q(
        \regArr[6][2] ) );
  DFFRQX2M \regArr_reg[6][1]  ( .D(n98), .CK(CLK), .RN(n248), .Q(
        \regArr[6][1] ) );
  DFFRQX2M \regArr_reg[6][0]  ( .D(n97), .CK(CLK), .RN(n248), .Q(
        \regArr[6][0] ) );
  DFFRQX2M \regArr_reg[12][7]  ( .D(n152), .CK(CLK), .RN(n252), .Q(
        \regArr[12][7] ) );
  DFFRQX2M \regArr_reg[12][6]  ( .D(n151), .CK(CLK), .RN(n252), .Q(
        \regArr[12][6] ) );
  DFFRQX2M \regArr_reg[12][5]  ( .D(n150), .CK(CLK), .RN(n252), .Q(
        \regArr[12][5] ) );
  DFFRQX2M \regArr_reg[12][4]  ( .D(n149), .CK(CLK), .RN(n252), .Q(
        \regArr[12][4] ) );
  DFFRQX2M \regArr_reg[12][3]  ( .D(n148), .CK(CLK), .RN(n252), .Q(
        \regArr[12][3] ) );
  DFFRQX2M \regArr_reg[12][2]  ( .D(n147), .CK(CLK), .RN(n252), .Q(
        \regArr[12][2] ) );
  DFFRQX2M \regArr_reg[12][1]  ( .D(n146), .CK(CLK), .RN(n252), .Q(
        \regArr[12][1] ) );
  DFFRQX2M \regArr_reg[12][0]  ( .D(n145), .CK(CLK), .RN(n252), .Q(
        \regArr[12][0] ) );
  DFFRQX2M \regArr_reg[8][7]  ( .D(n120), .CK(CLK), .RN(n250), .Q(
        \regArr[8][7] ) );
  DFFRQX2M \regArr_reg[8][6]  ( .D(n119), .CK(CLK), .RN(n250), .Q(
        \regArr[8][6] ) );
  DFFRQX2M \regArr_reg[8][5]  ( .D(n118), .CK(CLK), .RN(n250), .Q(
        \regArr[8][5] ) );
  DFFRQX2M \regArr_reg[8][4]  ( .D(n117), .CK(CLK), .RN(n250), .Q(
        \regArr[8][4] ) );
  DFFRQX2M \regArr_reg[8][3]  ( .D(n116), .CK(CLK), .RN(n249), .Q(
        \regArr[8][3] ) );
  DFFRQX2M \regArr_reg[8][2]  ( .D(n115), .CK(CLK), .RN(n249), .Q(
        \regArr[8][2] ) );
  DFFRQX2M \regArr_reg[8][1]  ( .D(n114), .CK(CLK), .RN(n249), .Q(
        \regArr[8][1] ) );
  DFFRQX2M \regArr_reg[8][0]  ( .D(n113), .CK(CLK), .RN(n249), .Q(
        \regArr[8][0] ) );
  DFFRQX2M \regArr_reg[4][7]  ( .D(n88), .CK(CLK), .RN(n247), .Q(
        \regArr[4][7] ) );
  DFFRQX2M \regArr_reg[4][6]  ( .D(n87), .CK(CLK), .RN(n247), .Q(
        \regArr[4][6] ) );
  DFFRQX2M \regArr_reg[4][5]  ( .D(n86), .CK(CLK), .RN(n247), .Q(
        \regArr[4][5] ) );
  DFFRQX2M \regArr_reg[4][4]  ( .D(n85), .CK(CLK), .RN(n247), .Q(
        \regArr[4][4] ) );
  DFFRQX2M \regArr_reg[4][3]  ( .D(n84), .CK(CLK), .RN(n247), .Q(
        \regArr[4][3] ) );
  DFFRQX2M \regArr_reg[4][2]  ( .D(n83), .CK(CLK), .RN(n247), .Q(
        \regArr[4][2] ) );
  DFFRQX2M \regArr_reg[4][1]  ( .D(n82), .CK(CLK), .RN(n247), .Q(
        \regArr[4][1] ) );
  DFFRQX2M \regArr_reg[4][0]  ( .D(n81), .CK(CLK), .RN(n247), .Q(
        \regArr[4][0] ) );
  DFFRQX2M \RdData_reg[7]  ( .D(n47), .CK(CLK), .RN(n245), .Q(RdData[7]) );
  DFFRQX2M \RdData_reg[6]  ( .D(n46), .CK(CLK), .RN(n244), .Q(RdData[6]) );
  DFFRQX2M \RdData_reg[5]  ( .D(n45), .CK(CLK), .RN(n244), .Q(RdData[5]) );
  DFFRQX2M \RdData_reg[4]  ( .D(n44), .CK(CLK), .RN(n244), .Q(RdData[4]) );
  DFFRQX2M \RdData_reg[3]  ( .D(n43), .CK(CLK), .RN(n244), .Q(RdData[3]) );
  DFFRQX2M \RdData_reg[2]  ( .D(n42), .CK(CLK), .RN(n244), .Q(RdData[2]) );
  DFFRQX2M \RdData_reg[1]  ( .D(n41), .CK(CLK), .RN(n244), .Q(RdData[1]) );
  DFFRQX2M \RdData_reg[0]  ( .D(n40), .CK(CLK), .RN(n249), .Q(RdData[0]) );
  DFFRQX2M \regArr_reg[3][0]  ( .D(n73), .CK(CLK), .RN(n246), .Q(REG3[0]) );
  DFFRQX2M \regArr_reg[2][1]  ( .D(n66), .CK(CLK), .RN(n246), .Q(REG2[1]) );
  DFFSQX4M \regArr_reg[3][5]  ( .D(n78), .CK(CLK), .SN(n244), .Q(REG3[5]) );
  DFFSQX4M \regArr_reg[2][0]  ( .D(n65), .CK(CLK), .SN(n244), .Q(REG2[0]) );
  DFFRQX2M RdData_VLD_reg ( .D(n48), .CK(CLK), .RN(n244), .Q(RdData_VLD) );
  DFFRQX2M \regArr_reg[0][3]  ( .D(n52), .CK(CLK), .RN(n245), .Q(REG0[3]) );
  DFFRQX2M \regArr_reg[0][2]  ( .D(n51), .CK(CLK), .RN(n245), .Q(REG0[2]) );
  DFFRQX2M \regArr_reg[0][0]  ( .D(n49), .CK(CLK), .RN(n244), .Q(REG0[0]) );
  DFFRQX2M \regArr_reg[0][1]  ( .D(n50), .CK(CLK), .RN(n244), .Q(REG0[1]) );
  DFFRHQX8M \regArr_reg[0][4]  ( .D(n53), .CK(CLK), .RN(n245), .Q(REG0[4]) );
  DFFRQX2M \regArr_reg[0][5]  ( .D(n54), .CK(CLK), .RN(n245), .Q(REG0[5]) );
  DFFSHQX8M \regArr_reg[2][7]  ( .D(n72), .CK(CLK), .SN(RST), .Q(REG2[7]) );
  DFFRQX4M \regArr_reg[3][4]  ( .D(n77), .CK(CLK), .RN(n246), .Q(REG3[4]) );
  DFFRQX4M \regArr_reg[3][1]  ( .D(n74), .CK(CLK), .RN(n246), .Q(REG3[1]) );
  DFFRQX4M \regArr_reg[3][3]  ( .D(n76), .CK(CLK), .RN(n246), .Q(REG3[3]) );
  DFFRQX4M \regArr_reg[3][6]  ( .D(n79), .CK(CLK), .RN(n247), .Q(REG3[6]) );
  DFFRQX4M \regArr_reg[3][2]  ( .D(n75), .CK(CLK), .RN(n246), .Q(REG3[2]) );
  DFFRQX4M \regArr_reg[3][7]  ( .D(n80), .CK(CLK), .RN(n247), .Q(REG3[7]) );
  DFFRHQX2M \regArr_reg[1][7]  ( .D(n64), .CK(CLK), .RN(n245), .Q(n266) );
  DFFRQX2M \regArr_reg[1][5]  ( .D(n62), .CK(CLK), .RN(n246), .Q(n267) );
  DFFRHQX4M \regArr_reg[0][6]  ( .D(n55), .CK(CLK), .RN(n245), .Q(REG0[6]) );
  DFFRHQX4M \regArr_reg[0][7]  ( .D(n56), .CK(CLK), .RN(n245), .Q(REG0[7]) );
  DFFRHQX4M \regArr_reg[1][6]  ( .D(n63), .CK(CLK), .RN(n246), .Q(REG1[6]) );
  DFFRQX2M \regArr_reg[1][0]  ( .D(n57), .CK(CLK), .RN(n245), .Q(n268) );
  BUFX14M U3 ( .A(n266), .Y(REG1[7]) );
  BUFX32M U4 ( .A(n267), .Y(REG1[5]) );
  BUFX10M U5 ( .A(n268), .Y(REG1[0]) );
  CLKBUFX2M U6 ( .A(n240), .Y(n204) );
  OAI2BB2X1M U7 ( .B0(n257), .B1(n236), .A0N(REG1[0]), .A1N(n236), .Y(n57) );
  BUFX6M U8 ( .A(n255), .Y(n245) );
  NOR2X4M U9 ( .A(n243), .B(N13), .Y(n20) );
  NOR2X4M U10 ( .A(n242), .B(N13), .Y(n15) );
  NOR2BX4M U11 ( .AN(N13), .B(n242), .Y(n23) );
  NOR2BX4M U12 ( .AN(n38), .B(n241), .Y(n32) );
  NOR2BX4M U13 ( .AN(N13), .B(n243), .Y(n26) );
  NOR2BX4M U14 ( .AN(n27), .B(n241), .Y(n18) );
  NOR2BX2M U15 ( .AN(n13), .B(N14), .Y(n27) );
  INVX2M U16 ( .A(N11), .Y(n241) );
  INVX2M U17 ( .A(N12), .Y(n243) );
  MX4XLM U18 ( .A(REG0[0]), .B(REG1[0]), .C(REG2[0]), .D(REG3[0]), .S0(n205), 
        .S1(n203), .Y(n7) );
  MX4XLM U19 ( .A(REG0[1]), .B(REG1[1]), .C(REG2[1]), .D(REG3[1]), .S0(n206), 
        .S1(n202), .Y(n11) );
  MX4XLM U20 ( .A(REG0[2]), .B(REG1[2]), .C(REG2[2]), .D(REG3[2]), .S0(n205), 
        .S1(n202), .Y(n180) );
  MX4XLM U21 ( .A(REG0[4]), .B(REG1[4]), .C(REG2[4]), .D(REG3[4]), .S0(n205), 
        .S1(n203), .Y(n188) );
  MX4XLM U22 ( .A(REG0[5]), .B(REG1[5]), .C(REG2[5]), .D(REG3[5]), .S0(n206), 
        .S1(n203), .Y(n192) );
  MX4XLM U23 ( .A(REG0[6]), .B(REG1[6]), .C(REG2[6]), .D(REG3[6]), .S0(n206), 
        .S1(n203), .Y(n196) );
  MX4XLM U24 ( .A(REG0[7]), .B(REG1[7]), .C(REG2[7]), .D(REG3[7]), .S0(n206), 
        .S1(n203), .Y(n200) );
  INVX8M U25 ( .A(WrData[5]), .Y(n262) );
  INVX8M U26 ( .A(WrData[6]), .Y(n263) );
  CLKBUFX8M U27 ( .A(n204), .Y(n205) );
  CLKBUFX8M U28 ( .A(n242), .Y(n202) );
  BUFX4M U29 ( .A(n29), .Y(n222) );
  BUFX4M U30 ( .A(n31), .Y(n220) );
  BUFX4M U31 ( .A(n33), .Y(n218) );
  BUFX4M U32 ( .A(n34), .Y(n216) );
  BUFX4M U33 ( .A(n35), .Y(n214) );
  BUFX4M U34 ( .A(n36), .Y(n212) );
  BUFX4M U35 ( .A(n37), .Y(n210) );
  BUFX4M U36 ( .A(n39), .Y(n208) );
  CLKBUFX8M U37 ( .A(n204), .Y(n206) );
  CLKBUFX8M U38 ( .A(n201), .Y(n203) );
  BUFX2M U39 ( .A(n242), .Y(n201) );
  BUFX4M U40 ( .A(n17), .Y(n236) );
  BUFX4M U41 ( .A(n19), .Y(n234) );
  BUFX4M U42 ( .A(n21), .Y(n232) );
  BUFX4M U43 ( .A(n14), .Y(n238) );
  BUFX4M U44 ( .A(n22), .Y(n230) );
  BUFX4M U45 ( .A(n24), .Y(n228) );
  BUFX4M U46 ( .A(n25), .Y(n226) );
  BUFX4M U47 ( .A(n28), .Y(n224) );
  BUFX4M U48 ( .A(n17), .Y(n235) );
  BUFX4M U49 ( .A(n29), .Y(n221) );
  BUFX4M U50 ( .A(n31), .Y(n219) );
  BUFX4M U51 ( .A(n33), .Y(n217) );
  BUFX4M U52 ( .A(n34), .Y(n215) );
  BUFX4M U53 ( .A(n19), .Y(n233) );
  BUFX4M U54 ( .A(n21), .Y(n231) );
  BUFX4M U55 ( .A(n22), .Y(n229) );
  BUFX4M U56 ( .A(n24), .Y(n227) );
  BUFX4M U57 ( .A(n25), .Y(n225) );
  BUFX4M U58 ( .A(n28), .Y(n223) );
  BUFX4M U59 ( .A(n35), .Y(n213) );
  BUFX4M U60 ( .A(n36), .Y(n211) );
  BUFX4M U61 ( .A(n37), .Y(n209) );
  BUFX4M U62 ( .A(n39), .Y(n207) );
  BUFX4M U63 ( .A(n14), .Y(n237) );
  INVX4M U64 ( .A(n239), .Y(n265) );
  CLKBUFX8M U65 ( .A(n256), .Y(n244) );
  CLKBUFX8M U66 ( .A(n256), .Y(n246) );
  CLKBUFX8M U67 ( .A(n256), .Y(n247) );
  CLKBUFX8M U68 ( .A(n256), .Y(n248) );
  CLKBUFX8M U69 ( .A(n255), .Y(n249) );
  CLKBUFX8M U70 ( .A(n255), .Y(n250) );
  CLKBUFX8M U71 ( .A(n255), .Y(n251) );
  CLKBUFX8M U72 ( .A(RST), .Y(n252) );
  CLKBUFX8M U73 ( .A(RST), .Y(n253) );
  BUFX4M U74 ( .A(n244), .Y(n254) );
  NOR2BX4M U75 ( .AN(n38), .B(n240), .Y(n30) );
  NAND2X2M U76 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U77 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U78 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U79 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U80 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U81 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U82 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U83 ( .A(n32), .B(n26), .Y(n39) );
  NOR2BX4M U84 ( .AN(n27), .B(n240), .Y(n16) );
  NAND2X2M U85 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U86 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U87 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U88 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U89 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U90 ( .A(n15), .B(n16), .Y(n14) );
  NAND2X2M U91 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U92 ( .A(n20), .B(n18), .Y(n21) );
  BUFX4M U93 ( .A(n12), .Y(n239) );
  BUFX2M U94 ( .A(RST), .Y(n256) );
  BUFX2M U95 ( .A(RST), .Y(n255) );
  AND2X2M U96 ( .A(N14), .B(n13), .Y(n38) );
  NOR2BX4M U97 ( .AN(WrEn), .B(RdEn), .Y(n13) );
  INVX2M U98 ( .A(n241), .Y(n240) );
  INVX2M U99 ( .A(n243), .Y(n242) );
  NAND2BX2M U100 ( .AN(WrEn), .B(RdEn), .Y(n12) );
  INVX8M U101 ( .A(WrData[0]), .Y(n257) );
  INVX8M U102 ( .A(WrData[1]), .Y(n258) );
  INVX8M U103 ( .A(WrData[2]), .Y(n259) );
  INVX8M U104 ( .A(WrData[3]), .Y(n260) );
  INVX8M U105 ( .A(WrData[4]), .Y(n261) );
  INVX8M U106 ( .A(WrData[7]), .Y(n264) );
  OAI2BB2X1M U107 ( .B0(n257), .B1(n222), .A0N(\regArr[8][0] ), .A1N(n222), 
        .Y(n113) );
  OAI2BB2X1M U108 ( .B0(n257), .B1(n220), .A0N(\regArr[9][0] ), .A1N(n220), 
        .Y(n121) );
  OAI2BB2X1M U109 ( .B0(n257), .B1(n218), .A0N(\regArr[10][0] ), .A1N(n218), 
        .Y(n129) );
  OAI2BB2X1M U110 ( .B0(n257), .B1(n216), .A0N(\regArr[11][0] ), .A1N(n216), 
        .Y(n137) );
  OAI2BB2X1M U111 ( .B0(n257), .B1(n214), .A0N(\regArr[12][0] ), .A1N(n214), 
        .Y(n145) );
  OAI2BB2X1M U112 ( .B0(n257), .B1(n212), .A0N(\regArr[13][0] ), .A1N(n212), 
        .Y(n153) );
  OAI2BB2X1M U113 ( .B0(n257), .B1(n210), .A0N(\regArr[14][0] ), .A1N(n210), 
        .Y(n161) );
  OAI2BB2X1M U114 ( .B0(n257), .B1(n208), .A0N(\regArr[15][0] ), .A1N(n208), 
        .Y(n169) );
  OAI2BB2X1M U115 ( .B0(n238), .B1(n257), .A0N(REG0[0]), .A1N(n238), .Y(n49)
         );
  OAI2BB2X1M U116 ( .B0(n237), .B1(n258), .A0N(REG0[1]), .A1N(n238), .Y(n50)
         );
  OAI2BB2X1M U117 ( .B0(n237), .B1(n259), .A0N(REG0[2]), .A1N(n238), .Y(n51)
         );
  OAI2BB2X1M U118 ( .B0(n237), .B1(n260), .A0N(REG0[3]), .A1N(n238), .Y(n52)
         );
  OAI2BB2X1M U119 ( .B0(n237), .B1(n261), .A0N(REG0[4]), .A1N(n238), .Y(n53)
         );
  OAI2BB2X1M U120 ( .B0(n237), .B1(n264), .A0N(REG0[7]), .A1N(n238), .Y(n56)
         );
  OAI2BB2X1M U121 ( .B0(n257), .B1(n232), .A0N(REG3[0]), .A1N(n232), .Y(n73)
         );
  OAI2BB2X1M U122 ( .B0(n257), .B1(n230), .A0N(\regArr[4][0] ), .A1N(n230), 
        .Y(n81) );
  OAI2BB2X1M U123 ( .B0(n257), .B1(n228), .A0N(\regArr[5][0] ), .A1N(n228), 
        .Y(n89) );
  OAI2BB2X1M U124 ( .B0(n257), .B1(n226), .A0N(\regArr[6][0] ), .A1N(n226), 
        .Y(n97) );
  OAI2BB2X1M U125 ( .B0(n257), .B1(n224), .A0N(\regArr[7][0] ), .A1N(n224), 
        .Y(n105) );
  OAI2BB2X1M U126 ( .B0(n258), .B1(n235), .A0N(REG1[1]), .A1N(n236), .Y(n58)
         );
  OAI2BB2X1M U127 ( .B0(n259), .B1(n235), .A0N(REG1[2]), .A1N(n236), .Y(n59)
         );
  OAI2BB2X1M U128 ( .B0(n260), .B1(n235), .A0N(REG1[3]), .A1N(n236), .Y(n60)
         );
  OAI2BB2X1M U129 ( .B0(n261), .B1(n235), .A0N(REG1[4]), .A1N(n236), .Y(n61)
         );
  OAI2BB2X1M U130 ( .B0(n264), .B1(n235), .A0N(REG1[7]), .A1N(n236), .Y(n64)
         );
  OAI2BB2X1M U131 ( .B0(n258), .B1(n233), .A0N(REG2[1]), .A1N(n234), .Y(n66)
         );
  OAI2BB2X1M U132 ( .B0(n259), .B1(n233), .A0N(REG2[2]), .A1N(n234), .Y(n67)
         );
  OAI2BB2X1M U133 ( .B0(n260), .B1(n233), .A0N(REG2[3]), .A1N(n234), .Y(n68)
         );
  OAI2BB2X1M U134 ( .B0(n261), .B1(n233), .A0N(REG2[4]), .A1N(n234), .Y(n69)
         );
  OAI2BB2X1M U135 ( .B0(n258), .B1(n231), .A0N(REG3[1]), .A1N(n232), .Y(n74)
         );
  OAI2BB2X1M U136 ( .B0(n259), .B1(n231), .A0N(REG3[2]), .A1N(n232), .Y(n75)
         );
  OAI2BB2X1M U137 ( .B0(n260), .B1(n231), .A0N(REG3[3]), .A1N(n232), .Y(n76)
         );
  OAI2BB2X1M U138 ( .B0(n261), .B1(n231), .A0N(REG3[4]), .A1N(n232), .Y(n77)
         );
  OAI2BB2X1M U139 ( .B0(n264), .B1(n231), .A0N(REG3[7]), .A1N(n232), .Y(n80)
         );
  OAI2BB2X1M U140 ( .B0(n258), .B1(n229), .A0N(\regArr[4][1] ), .A1N(n230), 
        .Y(n82) );
  OAI2BB2X1M U141 ( .B0(n259), .B1(n229), .A0N(\regArr[4][2] ), .A1N(n230), 
        .Y(n83) );
  OAI2BB2X1M U142 ( .B0(n260), .B1(n229), .A0N(\regArr[4][3] ), .A1N(n230), 
        .Y(n84) );
  OAI2BB2X1M U143 ( .B0(n261), .B1(n229), .A0N(\regArr[4][4] ), .A1N(n230), 
        .Y(n85) );
  OAI2BB2X1M U144 ( .B0(n264), .B1(n229), .A0N(\regArr[4][7] ), .A1N(n230), 
        .Y(n88) );
  OAI2BB2X1M U145 ( .B0(n258), .B1(n227), .A0N(\regArr[5][1] ), .A1N(n228), 
        .Y(n90) );
  OAI2BB2X1M U146 ( .B0(n259), .B1(n227), .A0N(\regArr[5][2] ), .A1N(n228), 
        .Y(n91) );
  OAI2BB2X1M U147 ( .B0(n260), .B1(n227), .A0N(\regArr[5][3] ), .A1N(n228), 
        .Y(n92) );
  OAI2BB2X1M U148 ( .B0(n261), .B1(n227), .A0N(\regArr[5][4] ), .A1N(n228), 
        .Y(n93) );
  OAI2BB2X1M U149 ( .B0(n264), .B1(n227), .A0N(\regArr[5][7] ), .A1N(n228), 
        .Y(n96) );
  OAI2BB2X1M U150 ( .B0(n258), .B1(n225), .A0N(\regArr[6][1] ), .A1N(n226), 
        .Y(n98) );
  OAI2BB2X1M U151 ( .B0(n259), .B1(n225), .A0N(\regArr[6][2] ), .A1N(n226), 
        .Y(n99) );
  OAI2BB2X1M U152 ( .B0(n260), .B1(n225), .A0N(\regArr[6][3] ), .A1N(n226), 
        .Y(n100) );
  OAI2BB2X1M U153 ( .B0(n261), .B1(n225), .A0N(\regArr[6][4] ), .A1N(n226), 
        .Y(n101) );
  OAI2BB2X1M U154 ( .B0(n264), .B1(n225), .A0N(\regArr[6][7] ), .A1N(n226), 
        .Y(n104) );
  OAI2BB2X1M U155 ( .B0(n258), .B1(n223), .A0N(\regArr[7][1] ), .A1N(n224), 
        .Y(n106) );
  OAI2BB2X1M U156 ( .B0(n259), .B1(n223), .A0N(\regArr[7][2] ), .A1N(n224), 
        .Y(n107) );
  OAI2BB2X1M U157 ( .B0(n260), .B1(n223), .A0N(\regArr[7][3] ), .A1N(n224), 
        .Y(n108) );
  OAI2BB2X1M U158 ( .B0(n261), .B1(n223), .A0N(\regArr[7][4] ), .A1N(n224), 
        .Y(n109) );
  OAI2BB2X1M U159 ( .B0(n264), .B1(n223), .A0N(\regArr[7][7] ), .A1N(n224), 
        .Y(n112) );
  OAI2BB2X1M U160 ( .B0(n258), .B1(n221), .A0N(\regArr[8][1] ), .A1N(n222), 
        .Y(n114) );
  OAI2BB2X1M U161 ( .B0(n259), .B1(n221), .A0N(\regArr[8][2] ), .A1N(n222), 
        .Y(n115) );
  OAI2BB2X1M U162 ( .B0(n260), .B1(n221), .A0N(\regArr[8][3] ), .A1N(n222), 
        .Y(n116) );
  OAI2BB2X1M U163 ( .B0(n261), .B1(n221), .A0N(\regArr[8][4] ), .A1N(n222), 
        .Y(n117) );
  OAI2BB2X1M U164 ( .B0(n264), .B1(n221), .A0N(\regArr[8][7] ), .A1N(n222), 
        .Y(n120) );
  OAI2BB2X1M U165 ( .B0(n258), .B1(n219), .A0N(\regArr[9][1] ), .A1N(n220), 
        .Y(n122) );
  OAI2BB2X1M U166 ( .B0(n259), .B1(n219), .A0N(\regArr[9][2] ), .A1N(n220), 
        .Y(n123) );
  OAI2BB2X1M U167 ( .B0(n260), .B1(n219), .A0N(\regArr[9][3] ), .A1N(n220), 
        .Y(n124) );
  OAI2BB2X1M U168 ( .B0(n261), .B1(n219), .A0N(\regArr[9][4] ), .A1N(n220), 
        .Y(n125) );
  OAI2BB2X1M U169 ( .B0(n264), .B1(n219), .A0N(\regArr[9][7] ), .A1N(n220), 
        .Y(n128) );
  OAI2BB2X1M U170 ( .B0(n258), .B1(n217), .A0N(\regArr[10][1] ), .A1N(n218), 
        .Y(n130) );
  OAI2BB2X1M U171 ( .B0(n259), .B1(n217), .A0N(\regArr[10][2] ), .A1N(n218), 
        .Y(n131) );
  OAI2BB2X1M U172 ( .B0(n260), .B1(n217), .A0N(\regArr[10][3] ), .A1N(n218), 
        .Y(n132) );
  OAI2BB2X1M U173 ( .B0(n261), .B1(n217), .A0N(\regArr[10][4] ), .A1N(n218), 
        .Y(n133) );
  OAI2BB2X1M U174 ( .B0(n264), .B1(n217), .A0N(\regArr[10][7] ), .A1N(n218), 
        .Y(n136) );
  OAI2BB2X1M U175 ( .B0(n258), .B1(n215), .A0N(\regArr[11][1] ), .A1N(n216), 
        .Y(n138) );
  OAI2BB2X1M U176 ( .B0(n259), .B1(n215), .A0N(\regArr[11][2] ), .A1N(n216), 
        .Y(n139) );
  OAI2BB2X1M U177 ( .B0(n260), .B1(n215), .A0N(\regArr[11][3] ), .A1N(n216), 
        .Y(n140) );
  OAI2BB2X1M U178 ( .B0(n261), .B1(n215), .A0N(\regArr[11][4] ), .A1N(n216), 
        .Y(n141) );
  OAI2BB2X1M U179 ( .B0(n264), .B1(n215), .A0N(\regArr[11][7] ), .A1N(n216), 
        .Y(n144) );
  OAI2BB2X1M U180 ( .B0(n258), .B1(n213), .A0N(\regArr[12][1] ), .A1N(n214), 
        .Y(n146) );
  OAI2BB2X1M U181 ( .B0(n259), .B1(n213), .A0N(\regArr[12][2] ), .A1N(n214), 
        .Y(n147) );
  OAI2BB2X1M U182 ( .B0(n260), .B1(n213), .A0N(\regArr[12][3] ), .A1N(n214), 
        .Y(n148) );
  OAI2BB2X1M U183 ( .B0(n261), .B1(n213), .A0N(\regArr[12][4] ), .A1N(n214), 
        .Y(n149) );
  OAI2BB2X1M U184 ( .B0(n264), .B1(n213), .A0N(\regArr[12][7] ), .A1N(n214), 
        .Y(n152) );
  OAI2BB2X1M U185 ( .B0(n258), .B1(n211), .A0N(\regArr[13][1] ), .A1N(n212), 
        .Y(n154) );
  OAI2BB2X1M U186 ( .B0(n259), .B1(n211), .A0N(\regArr[13][2] ), .A1N(n212), 
        .Y(n155) );
  OAI2BB2X1M U187 ( .B0(n260), .B1(n211), .A0N(\regArr[13][3] ), .A1N(n212), 
        .Y(n156) );
  OAI2BB2X1M U188 ( .B0(n261), .B1(n211), .A0N(\regArr[13][4] ), .A1N(n212), 
        .Y(n157) );
  OAI2BB2X1M U189 ( .B0(n264), .B1(n211), .A0N(\regArr[13][7] ), .A1N(n212), 
        .Y(n160) );
  OAI2BB2X1M U190 ( .B0(n258), .B1(n209), .A0N(\regArr[14][1] ), .A1N(n210), 
        .Y(n162) );
  OAI2BB2X1M U191 ( .B0(n259), .B1(n209), .A0N(\regArr[14][2] ), .A1N(n210), 
        .Y(n163) );
  OAI2BB2X1M U192 ( .B0(n260), .B1(n209), .A0N(\regArr[14][3] ), .A1N(n210), 
        .Y(n164) );
  OAI2BB2X1M U193 ( .B0(n261), .B1(n209), .A0N(\regArr[14][4] ), .A1N(n210), 
        .Y(n165) );
  OAI2BB2X1M U194 ( .B0(n264), .B1(n209), .A0N(\regArr[14][7] ), .A1N(n210), 
        .Y(n168) );
  OAI2BB2X1M U195 ( .B0(n258), .B1(n207), .A0N(\regArr[15][1] ), .A1N(n208), 
        .Y(n170) );
  OAI2BB2X1M U196 ( .B0(n259), .B1(n207), .A0N(\regArr[15][2] ), .A1N(n208), 
        .Y(n171) );
  OAI2BB2X1M U197 ( .B0(n260), .B1(n207), .A0N(\regArr[15][3] ), .A1N(n208), 
        .Y(n172) );
  OAI2BB2X1M U198 ( .B0(n261), .B1(n207), .A0N(\regArr[15][4] ), .A1N(n208), 
        .Y(n173) );
  OAI2BB2X1M U199 ( .B0(n264), .B1(n207), .A0N(\regArr[15][7] ), .A1N(n208), 
        .Y(n176) );
  OAI2BB2X1M U200 ( .B0(n237), .B1(n262), .A0N(REG0[5]), .A1N(n238), .Y(n54)
         );
  OAI2BB2X1M U201 ( .B0(n237), .B1(n263), .A0N(REG0[6]), .A1N(n238), .Y(n55)
         );
  OAI2BB2X1M U202 ( .B0(n262), .B1(n235), .A0N(REG1[5]), .A1N(n236), .Y(n62)
         );
  OAI2BB2X1M U203 ( .B0(n263), .B1(n235), .A0N(REG1[6]), .A1N(n236), .Y(n63)
         );
  OAI2BB2X1M U204 ( .B0(n262), .B1(n233), .A0N(REG2[5]), .A1N(n234), .Y(n70)
         );
  OAI2BB2X1M U205 ( .B0(n263), .B1(n233), .A0N(REG2[6]), .A1N(n234), .Y(n71)
         );
  OAI2BB2X1M U206 ( .B0(n263), .B1(n231), .A0N(REG3[6]), .A1N(n232), .Y(n79)
         );
  OAI2BB2X1M U207 ( .B0(n262), .B1(n229), .A0N(\regArr[4][5] ), .A1N(n230), 
        .Y(n86) );
  OAI2BB2X1M U208 ( .B0(n263), .B1(n229), .A0N(\regArr[4][6] ), .A1N(n230), 
        .Y(n87) );
  OAI2BB2X1M U209 ( .B0(n262), .B1(n227), .A0N(\regArr[5][5] ), .A1N(n228), 
        .Y(n94) );
  OAI2BB2X1M U210 ( .B0(n263), .B1(n227), .A0N(\regArr[5][6] ), .A1N(n228), 
        .Y(n95) );
  OAI2BB2X1M U211 ( .B0(n262), .B1(n225), .A0N(\regArr[6][5] ), .A1N(n226), 
        .Y(n102) );
  OAI2BB2X1M U212 ( .B0(n263), .B1(n225), .A0N(\regArr[6][6] ), .A1N(n226), 
        .Y(n103) );
  OAI2BB2X1M U213 ( .B0(n262), .B1(n223), .A0N(\regArr[7][5] ), .A1N(n224), 
        .Y(n110) );
  OAI2BB2X1M U214 ( .B0(n263), .B1(n223), .A0N(\regArr[7][6] ), .A1N(n224), 
        .Y(n111) );
  OAI2BB2X1M U215 ( .B0(n262), .B1(n221), .A0N(\regArr[8][5] ), .A1N(n222), 
        .Y(n118) );
  OAI2BB2X1M U216 ( .B0(n263), .B1(n221), .A0N(\regArr[8][6] ), .A1N(n222), 
        .Y(n119) );
  OAI2BB2X1M U217 ( .B0(n262), .B1(n219), .A0N(\regArr[9][5] ), .A1N(n220), 
        .Y(n126) );
  OAI2BB2X1M U218 ( .B0(n263), .B1(n219), .A0N(\regArr[9][6] ), .A1N(n220), 
        .Y(n127) );
  OAI2BB2X1M U219 ( .B0(n262), .B1(n217), .A0N(\regArr[10][5] ), .A1N(n218), 
        .Y(n134) );
  OAI2BB2X1M U220 ( .B0(n263), .B1(n217), .A0N(\regArr[10][6] ), .A1N(n218), 
        .Y(n135) );
  OAI2BB2X1M U221 ( .B0(n262), .B1(n215), .A0N(\regArr[11][5] ), .A1N(n216), 
        .Y(n142) );
  OAI2BB2X1M U222 ( .B0(n263), .B1(n215), .A0N(\regArr[11][6] ), .A1N(n216), 
        .Y(n143) );
  OAI2BB2X1M U223 ( .B0(n262), .B1(n213), .A0N(\regArr[12][5] ), .A1N(n214), 
        .Y(n150) );
  OAI2BB2X1M U224 ( .B0(n263), .B1(n213), .A0N(\regArr[12][6] ), .A1N(n214), 
        .Y(n151) );
  OAI2BB2X1M U225 ( .B0(n262), .B1(n211), .A0N(\regArr[13][5] ), .A1N(n212), 
        .Y(n158) );
  OAI2BB2X1M U226 ( .B0(n263), .B1(n211), .A0N(\regArr[13][6] ), .A1N(n212), 
        .Y(n159) );
  OAI2BB2X1M U227 ( .B0(n262), .B1(n209), .A0N(\regArr[14][5] ), .A1N(n210), 
        .Y(n166) );
  OAI2BB2X1M U228 ( .B0(n263), .B1(n209), .A0N(\regArr[14][6] ), .A1N(n210), 
        .Y(n167) );
  OAI2BB2X1M U229 ( .B0(n262), .B1(n207), .A0N(\regArr[15][5] ), .A1N(n208), 
        .Y(n174) );
  OAI2BB2X1M U230 ( .B0(n263), .B1(n207), .A0N(\regArr[15][6] ), .A1N(n208), 
        .Y(n175) );
  OAI2BB2X1M U231 ( .B0(n257), .B1(n234), .A0N(REG2[0]), .A1N(n234), .Y(n65)
         );
  OAI2BB2X1M U232 ( .B0(n264), .B1(n233), .A0N(REG2[7]), .A1N(n234), .Y(n72)
         );
  OAI2BB2X1M U233 ( .B0(n262), .B1(n231), .A0N(REG3[5]), .A1N(n232), .Y(n78)
         );
  MX4X1M U234 ( .A(\regArr[4][2] ), .B(\regArr[5][2] ), .C(\regArr[6][2] ), 
        .D(\regArr[7][2] ), .S0(n205), .S1(n202), .Y(n179) );
  MX4X1M U235 ( .A(\regArr[4][3] ), .B(\regArr[5][3] ), .C(\regArr[6][3] ), 
        .D(\regArr[7][3] ), .S0(n205), .S1(n202), .Y(n183) );
  MX4X1M U236 ( .A(\regArr[4][4] ), .B(\regArr[5][4] ), .C(\regArr[6][4] ), 
        .D(\regArr[7][4] ), .S0(n205), .S1(n202), .Y(n187) );
  MX4X1M U237 ( .A(\regArr[4][5] ), .B(\regArr[5][5] ), .C(\regArr[6][5] ), 
        .D(\regArr[7][5] ), .S0(n206), .S1(n203), .Y(n191) );
  MX4X1M U238 ( .A(\regArr[4][6] ), .B(\regArr[5][6] ), .C(\regArr[6][6] ), 
        .D(\regArr[7][6] ), .S0(n206), .S1(n203), .Y(n195) );
  MX4X1M U239 ( .A(\regArr[4][7] ), .B(\regArr[5][7] ), .C(\regArr[6][7] ), 
        .D(\regArr[7][7] ), .S0(n206), .S1(n203), .Y(n199) );
  MX4X1M U240 ( .A(\regArr[12][2] ), .B(\regArr[13][2] ), .C(\regArr[14][2] ), 
        .D(\regArr[15][2] ), .S0(n205), .S1(n202), .Y(n177) );
  MX4X1M U241 ( .A(\regArr[12][3] ), .B(\regArr[13][3] ), .C(\regArr[14][3] ), 
        .D(\regArr[15][3] ), .S0(n205), .S1(n202), .Y(n181) );
  MX4X1M U242 ( .A(\regArr[12][4] ), .B(\regArr[13][4] ), .C(\regArr[14][4] ), 
        .D(\regArr[15][4] ), .S0(n205), .S1(n202), .Y(n185) );
  MX4X1M U243 ( .A(\regArr[12][5] ), .B(\regArr[13][5] ), .C(\regArr[14][5] ), 
        .D(\regArr[15][5] ), .S0(n206), .S1(n203), .Y(n189) );
  MX4X1M U244 ( .A(\regArr[12][6] ), .B(\regArr[13][6] ), .C(\regArr[14][6] ), 
        .D(\regArr[15][6] ), .S0(n206), .S1(n203), .Y(n193) );
  MX4X1M U245 ( .A(\regArr[12][7] ), .B(\regArr[13][7] ), .C(\regArr[14][7] ), 
        .D(\regArr[15][7] ), .S0(n206), .S1(n203), .Y(n197) );
  MX4X1M U246 ( .A(\regArr[4][0] ), .B(\regArr[5][0] ), .C(\regArr[6][0] ), 
        .D(\regArr[7][0] ), .S0(n240), .S1(n202), .Y(n6) );
  MX4X1M U247 ( .A(\regArr[4][1] ), .B(\regArr[5][1] ), .C(\regArr[6][1] ), 
        .D(\regArr[7][1] ), .S0(N11), .S1(n202), .Y(n10) );
  MX4X1M U248 ( .A(\regArr[12][0] ), .B(\regArr[13][0] ), .C(\regArr[14][0] ), 
        .D(\regArr[15][0] ), .S0(n204), .S1(n203), .Y(n4) );
  MX4X1M U249 ( .A(\regArr[12][1] ), .B(\regArr[13][1] ), .C(\regArr[14][1] ), 
        .D(\regArr[15][1] ), .S0(n204), .S1(n202), .Y(n8) );
  AO22X1M U250 ( .A0(N43), .A1(n265), .B0(RdData[0]), .B1(n239), .Y(n40) );
  MX4XLM U251 ( .A(n7), .B(n5), .C(n6), .D(n4), .S0(N14), .S1(N13), .Y(N43) );
  MX4X1M U252 ( .A(\regArr[8][0] ), .B(\regArr[9][0] ), .C(\regArr[10][0] ), 
        .D(\regArr[11][0] ), .S0(N11), .S1(n201), .Y(n5) );
  AO22X1M U253 ( .A0(N42), .A1(n265), .B0(RdData[1]), .B1(n12), .Y(n41) );
  MX4XLM U254 ( .A(n11), .B(n9), .C(n10), .D(n8), .S0(N14), .S1(N13), .Y(N42)
         );
  MX4X1M U255 ( .A(\regArr[8][1] ), .B(\regArr[9][1] ), .C(\regArr[10][1] ), 
        .D(\regArr[11][1] ), .S0(N11), .S1(n201), .Y(n9) );
  AO22X1M U256 ( .A0(N41), .A1(n265), .B0(RdData[2]), .B1(n12), .Y(n42) );
  MX4XLM U257 ( .A(n180), .B(n178), .C(n179), .D(n177), .S0(N14), .S1(N13), 
        .Y(N41) );
  MX4X1M U258 ( .A(\regArr[8][2] ), .B(\regArr[9][2] ), .C(\regArr[10][2] ), 
        .D(\regArr[11][2] ), .S0(n205), .S1(n202), .Y(n178) );
  AO22X1M U259 ( .A0(N40), .A1(n265), .B0(RdData[3]), .B1(n12), .Y(n43) );
  MX4XLM U260 ( .A(n184), .B(n182), .C(n183), .D(n181), .S0(N14), .S1(N13), 
        .Y(N40) );
  MX4XLM U261 ( .A(REG0[3]), .B(REG1[3]), .C(REG2[3]), .D(REG3[3]), .S0(n205), 
        .S1(n202), .Y(n184) );
  MX4X1M U262 ( .A(\regArr[8][3] ), .B(\regArr[9][3] ), .C(\regArr[10][3] ), 
        .D(\regArr[11][3] ), .S0(n205), .S1(n202), .Y(n182) );
  AO22X1M U263 ( .A0(N39), .A1(n265), .B0(RdData[4]), .B1(n239), .Y(n44) );
  MX4XLM U264 ( .A(n188), .B(n186), .C(n187), .D(n185), .S0(N14), .S1(N13), 
        .Y(N39) );
  MX4X1M U265 ( .A(\regArr[8][4] ), .B(\regArr[9][4] ), .C(\regArr[10][4] ), 
        .D(\regArr[11][4] ), .S0(n205), .S1(n202), .Y(n186) );
  AO22X1M U266 ( .A0(N38), .A1(n265), .B0(RdData[5]), .B1(n239), .Y(n45) );
  MX4XLM U267 ( .A(n192), .B(n190), .C(n191), .D(n189), .S0(N14), .S1(N13), 
        .Y(N38) );
  MX4X1M U268 ( .A(\regArr[8][5] ), .B(\regArr[9][5] ), .C(\regArr[10][5] ), 
        .D(\regArr[11][5] ), .S0(n206), .S1(n203), .Y(n190) );
  AO22X1M U269 ( .A0(N37), .A1(n265), .B0(RdData[6]), .B1(n239), .Y(n46) );
  MX4XLM U270 ( .A(n196), .B(n194), .C(n195), .D(n193), .S0(N14), .S1(N13), 
        .Y(N37) );
  MX4X1M U271 ( .A(\regArr[8][6] ), .B(\regArr[9][6] ), .C(\regArr[10][6] ), 
        .D(\regArr[11][6] ), .S0(n206), .S1(n203), .Y(n194) );
  AO22X1M U272 ( .A0(N36), .A1(n265), .B0(RdData[7]), .B1(n239), .Y(n47) );
  MX4XLM U273 ( .A(n200), .B(n198), .C(n199), .D(n197), .S0(N14), .S1(N13), 
        .Y(N36) );
  MX4X1M U274 ( .A(\regArr[8][7] ), .B(\regArr[9][7] ), .C(\regArr[10][7] ), 
        .D(\regArr[11][7] ), .S0(n206), .S1(n203), .Y(n198) );
  OAI2BB1X2M U275 ( .A0N(RdData_VLD), .A1N(n13), .B0(n239), .Y(n48) );
endmodule


module ALU_DW_div_uns_0 ( a, b, quotient, remainder, divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   n26, n27, \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] ,
         \u_div/SumTmp[1][2] , \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] ,
         \u_div/SumTmp[1][5] , \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] ,
         \u_div/SumTmp[2][1] , \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] ,
         \u_div/SumTmp[2][4] , \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] ,
         \u_div/SumTmp[3][1] , \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] ,
         \u_div/SumTmp[3][4] , \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] ,
         \u_div/SumTmp[4][2] , \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] ,
         \u_div/SumTmp[5][1] , \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] ,
         \u_div/SumTmp[6][1] , \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] ,
         \u_div/CryTmp[0][2] , \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] ,
         \u_div/CryTmp[0][5] , \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] ,
         \u_div/CryTmp[1][1] , \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] ,
         \u_div/CryTmp[1][4] , \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] ,
         \u_div/CryTmp[1][7] , \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] ,
         \u_div/CryTmp[2][3] , \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] ,
         \u_div/CryTmp[2][6] , \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] ,
         \u_div/CryTmp[3][3] , \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] ,
         \u_div/CryTmp[4][1] , \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] ,
         \u_div/CryTmp[4][4] , \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] ,
         \u_div/CryTmp[5][3] , \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] ,
         \u_div/CryTmp[7][1] , \u_div/PartRem[1][1] , \u_div/PartRem[1][2] ,
         \u_div/PartRem[1][3] , \u_div/PartRem[1][4] , \u_div/PartRem[1][5] ,
         \u_div/PartRem[1][6] , \u_div/PartRem[1][7] , \u_div/PartRem[2][1] ,
         \u_div/PartRem[2][2] , \u_div/PartRem[2][3] , \u_div/PartRem[2][4] ,
         \u_div/PartRem[2][5] , \u_div/PartRem[2][6] , \u_div/PartRem[3][1] ,
         \u_div/PartRem[3][2] , \u_div/PartRem[3][3] , \u_div/PartRem[3][4] ,
         \u_div/PartRem[3][5] , \u_div/PartRem[4][1] , \u_div/PartRem[4][2] ,
         \u_div/PartRem[4][3] , \u_div/PartRem[4][4] , \u_div/PartRem[5][1] ,
         \u_div/PartRem[5][2] , \u_div/PartRem[5][3] , \u_div/PartRem[6][1] ,
         \u_div/PartRem[6][2] , \u_div/PartRem[7][1] , n1, n3, n4, n7, n8, n9,
         n10, n11, n12, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25;

  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n18), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n21), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFHX4M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n16), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n18), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n17), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n17), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n20), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n19), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n19), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n19), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n19), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n21), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n21), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n21), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n21), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n20), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_5_2  ( .A(n3), .B(n20), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n21), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n21), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n20), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n20), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n16), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n19), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n17), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX4M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n18), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFHX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n18), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFHX8M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n15), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFHX8M \u_div/u_fa_PartRem_0_2_2  ( .A(n1), .B(n20), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  NOR2X8M U1 ( .A(b[6]), .B(b[7]), .Y(n25) );
  INVX16M U2 ( .A(b[0]), .Y(n22) );
  BUFX5M U3 ( .A(\u_div/PartRem[3][2] ), .Y(n1) );
  MX2X1M U4 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X6M U5 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  INVX32M U6 ( .A(b[5]), .Y(n17) );
  MX2X1M U7 ( .A(n1), .B(\u_div/SumTmp[2][2] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][3] ) );
  CLKMX2X8M U8 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  AND2X12M U9 ( .A(\u_div/CryTmp[2][6] ), .B(n4), .Y(quotient[2]) );
  BUFX10M U10 ( .A(\u_div/PartRem[6][2] ), .Y(n3) );
  MX2X3M U11 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  MX2X6M U12 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  INVX16M U13 ( .A(b[1]), .Y(n21) );
  INVX12M U14 ( .A(b[2]), .Y(n20) );
  MX2X3M U15 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  MX2X2M U16 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  NAND2X2M U17 ( .A(\u_div/SumTmp[6][0] ), .B(quotient[6]), .Y(n9) );
  BUFX8M U18 ( .A(n25), .Y(n4) );
  CLKAND2X6M U19 ( .A(\u_div/CryTmp[4][4] ), .B(n24), .Y(quotient[4]) );
  BUFX16M U20 ( .A(n14), .Y(quotient[5]) );
  AND4X8M U21 ( .A(\u_div/CryTmp[7][1] ), .B(n23), .C(n21), .D(n20), .Y(
        quotient[7]) );
  BUFX14M U22 ( .A(n26), .Y(quotient[3]) );
  AND3X1M U23 ( .A(n4), .B(n17), .C(\u_div/CryTmp[3][5] ), .Y(n26) );
  CLKMX2X6M U24 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  AND2X2M U25 ( .A(\u_div/CryTmp[4][4] ), .B(n24), .Y(n11) );
  AND2X2M U26 ( .A(\u_div/CryTmp[2][6] ), .B(n4), .Y(n10) );
  AND2X1M U27 ( .A(\u_div/CryTmp[2][6] ), .B(n4), .Y(n27) );
  MX2X2M U28 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  AND2X12M U29 ( .A(\u_div/CryTmp[1][7] ), .B(n15), .Y(quotient[1]) );
  MX2X6M U30 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(n11), .Y(
        \u_div/PartRem[4][1] ) );
  NAND2X5M U31 ( .A(a[6]), .B(n7), .Y(n8) );
  OR2X2M U32 ( .A(a[7]), .B(n22), .Y(\u_div/CryTmp[7][1] ) );
  INVX8M U33 ( .A(b[3]), .Y(n19) );
  AND3X12M U34 ( .A(n4), .B(n18), .C(n17), .Y(n24) );
  MX2X4M U35 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(n10), .Y(
        \u_div/PartRem[2][1] ) );
  NAND2X12M U36 ( .A(n8), .B(n9), .Y(\u_div/PartRem[6][1] ) );
  AND2X12M U37 ( .A(\u_div/CryTmp[6][2] ), .B(n12), .Y(quotient[6]) );
  CLKAND2X2M U38 ( .A(\u_div/CryTmp[5][3] ), .B(n23), .Y(n14) );
  XNOR2X2M U39 ( .A(n22), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  AND2X12M U40 ( .A(n24), .B(n19), .Y(n23) );
  INVX2M U41 ( .A(quotient[6]), .Y(n7) );
  MX2X1M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  MX2X1M U43 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  MX2X2M U44 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  INVX16M U45 ( .A(b[4]), .Y(n18) );
  AND2X1M U46 ( .A(n23), .B(n20), .Y(n12) );
  OR2X1M U47 ( .A(a[0]), .B(n22), .Y(\u_div/CryTmp[0][1] ) );
  MX2X1M U48 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  MX2X1M U49 ( .A(n3), .B(\u_div/SumTmp[5][2] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][3] ) );
  MX2X1M U50 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  MX2X1M U51 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  MX2X1M U52 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(n27), 
        .Y(\u_div/PartRem[2][6] ) );
  XNOR2X1M U53 ( .A(n22), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X1M U54 ( .A(n22), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X1M U55 ( .A(n22), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X1M U56 ( .A(n22), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  XNOR2X1M U57 ( .A(n22), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  OR2X1M U58 ( .A(a[6]), .B(n22), .Y(\u_div/CryTmp[6][1] ) );
  XNOR2X1M U59 ( .A(n22), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  CLKINVX1M U60 ( .A(b[7]), .Y(n15) );
  OR2X2M U61 ( .A(a[5]), .B(n22), .Y(\u_div/CryTmp[5][1] ) );
  OR2X2M U62 ( .A(a[4]), .B(n22), .Y(\u_div/CryTmp[4][1] ) );
  OR2X2M U63 ( .A(a[3]), .B(n22), .Y(\u_div/CryTmp[3][1] ) );
  OR2X2M U64 ( .A(a[1]), .B(n22), .Y(\u_div/CryTmp[1][1] ) );
  OR2X2M U65 ( .A(a[2]), .B(n22), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U66 ( .A(b[6]), .Y(n16) );
  CLKMX2X2M U67 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U68 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U69 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U70 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U71 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(n27), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U72 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U73 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
endmodule


module ALU_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  CLKINVX1M U1 ( .A(B[0]), .Y(n9) );
  INVXLM U2 ( .A(B[1]), .Y(n8) );
  INVXLM U3 ( .A(B[4]), .Y(n5) );
  INVXLM U4 ( .A(B[5]), .Y(n4) );
  INVXLM U5 ( .A(B[2]), .Y(n7) );
  INVXLM U6 ( .A(B[3]), .Y(n6) );
  INVXLM U7 ( .A(B[7]), .Y(n2) );
  INVX2M U8 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U9 ( .A(B[6]), .Y(n3) );
  XNOR2X2M U10 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  OR2X2M U11 ( .A(A[0]), .B(n9), .Y(carry[1]) );
endmodule


module ALU_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  OAI21BX4M U2 ( .A0(n12), .A1(n13), .B0N(n14), .Y(n10) );
  AOI2BB1X2M U3 ( .A0N(n1), .A1N(n4), .B0(n3), .Y(n17) );
  NOR2X2M U4 ( .A(B[8]), .B(A[8]), .Y(n7) );
  NOR2X2M U5 ( .A(B[9]), .B(A[9]), .Y(n4) );
  NOR2X2M U6 ( .A(B[10]), .B(A[10]), .Y(n16) );
  NOR2X2M U7 ( .A(B[11]), .B(A[11]), .Y(n12) );
  CLKXOR2X2M U8 ( .A(B[13]), .B(n9), .Y(SUM[13]) );
  NAND2X2M U9 ( .A(A[7]), .B(B[7]), .Y(n6) );
  CLKXOR2X2M U10 ( .A(A[7]), .B(B[7]), .Y(SUM[7]) );
  XNOR2X1M U11 ( .A(n1), .B(n2), .Y(SUM[9]) );
  NOR2X1M U12 ( .A(n3), .B(n4), .Y(n2) );
  CLKXOR2X2M U13 ( .A(n5), .B(n6), .Y(SUM[8]) );
  NAND2BX1M U14 ( .AN(n7), .B(n8), .Y(n5) );
  OAI2BB1X1M U15 ( .A0N(n10), .A1N(A[12]), .B0(n11), .Y(n9) );
  OAI21X1M U16 ( .A0(A[12]), .A1(n10), .B0(B[12]), .Y(n11) );
  XOR3XLM U17 ( .A(B[12]), .B(A[12]), .C(n10), .Y(SUM[12]) );
  XNOR2X1M U18 ( .A(n13), .B(n15), .Y(SUM[11]) );
  NOR2X1M U19 ( .A(n14), .B(n12), .Y(n15) );
  AND2X1M U20 ( .A(B[11]), .B(A[11]), .Y(n14) );
  OA21X1M U21 ( .A0(n16), .A1(n17), .B0(n18), .Y(n13) );
  CLKXOR2X2M U22 ( .A(n19), .B(n17), .Y(SUM[10]) );
  AND2X1M U23 ( .A(B[9]), .B(A[9]), .Y(n3) );
  OA21X1M U24 ( .A0(n6), .A1(n7), .B0(n8), .Y(n1) );
  CLKNAND2X2M U25 ( .A(B[8]), .B(A[8]), .Y(n8) );
  NAND2BX1M U26 ( .AN(n16), .B(n18), .Y(n19) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n18) );
endmodule


module ALU_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32;

  ALU_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , \A1[10] , \A1[9] , 
        \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , 
        \A1[1] , \A1[0] }), .B({n10, n16, n15, n14, n13, n12, n11, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n8), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n6), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n7), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n3), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  AND2X2M U2 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX4M U10 ( .A(B[0]), .Y(n24) );
  NOR2X2M U11 ( .A(n18), .B(n32), .Y(\ab[0][6] ) );
  NOR2X2M U12 ( .A(n18), .B(n31), .Y(\ab[1][6] ) );
  NOR2X2M U13 ( .A(n20), .B(n32), .Y(\ab[0][4] ) );
  NOR2X2M U14 ( .A(n19), .B(n32), .Y(\ab[0][5] ) );
  NOR2X2M U15 ( .A(n21), .B(n32), .Y(\ab[0][3] ) );
  NOR2X2M U16 ( .A(n21), .B(n31), .Y(\ab[1][3] ) );
  NOR2X2M U17 ( .A(n20), .B(n31), .Y(\ab[1][4] ) );
  NOR2X2M U18 ( .A(n22), .B(n31), .Y(\ab[1][2] ) );
  CLKXOR2X2M U19 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  NOR2X2M U20 ( .A(n17), .B(n32), .Y(\ab[0][7] ) );
  NOR2X2M U21 ( .A(n22), .B(n32), .Y(\ab[0][2] ) );
  NOR2X2M U22 ( .A(n23), .B(n32), .Y(\ab[0][1] ) );
  NOR2X2M U23 ( .A(n19), .B(n31), .Y(\ab[1][5] ) );
  NOR2X2M U24 ( .A(n23), .B(n31), .Y(\ab[1][1] ) );
  NOR2X2M U25 ( .A(n24), .B(n31), .Y(\ab[1][0] ) );
  NOR2X2M U26 ( .A(n25), .B(n17), .Y(\ab[7][7] ) );
  CLKINVX4M U27 ( .A(A[4]), .Y(n28) );
  CLKINVX4M U28 ( .A(A[5]), .Y(n27) );
  CLKINVX4M U29 ( .A(A[6]), .Y(n26) );
  CLKINVX4M U30 ( .A(A[7]), .Y(n25) );
  CLKINVX4M U31 ( .A(B[3]), .Y(n21) );
  CLKINVX4M U32 ( .A(B[2]), .Y(n22) );
  CLKINVX4M U33 ( .A(B[4]), .Y(n20) );
  CLKINVX4M U34 ( .A(B[5]), .Y(n19) );
  CLKINVX4M U35 ( .A(B[7]), .Y(n17) );
  CLKINVX4M U36 ( .A(B[1]), .Y(n23) );
  CLKXOR2X2M U37 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U38 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U39 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  INVX4M U40 ( .A(A[1]), .Y(n31) );
  AND2X2M U41 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U42 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  INVX4M U43 ( .A(A[2]), .Y(n30) );
  AND2X2M U44 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n13) );
  CLKXOR2X2M U45 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U46 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX4M U47 ( .A(A[3]), .Y(n29) );
  AND2X2M U48 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n14) );
  AND2X2M U49 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n15) );
  CLKXOR2X2M U50 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  AND2X2M U51 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n16) );
  XOR2X1M U52 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XOR2X1M U53 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  INVX4M U54 ( .A(B[6]), .Y(n18) );
  INVX4M U55 ( .A(A[0]), .Y(n32) );
  XOR2X1M U56 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1M U57 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1M U58 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1M U59 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  CLKXOR2X2M U60 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(\A1[6] ) );
  NOR2X1M U62 ( .A(n25), .B(n18), .Y(\ab[7][6] ) );
  NOR2X1M U63 ( .A(n25), .B(n19), .Y(\ab[7][5] ) );
  NOR2X1M U64 ( .A(n25), .B(n20), .Y(\ab[7][4] ) );
  NOR2X1M U65 ( .A(n25), .B(n21), .Y(\ab[7][3] ) );
  NOR2X1M U66 ( .A(n25), .B(n22), .Y(\ab[7][2] ) );
  NOR2X1M U67 ( .A(n25), .B(n23), .Y(\ab[7][1] ) );
  NOR2X1M U68 ( .A(n25), .B(n24), .Y(\ab[7][0] ) );
  NOR2X1M U69 ( .A(n17), .B(n26), .Y(\ab[6][7] ) );
  NOR2X1M U70 ( .A(n18), .B(n26), .Y(\ab[6][6] ) );
  NOR2X1M U71 ( .A(n19), .B(n26), .Y(\ab[6][5] ) );
  NOR2X1M U72 ( .A(n20), .B(n26), .Y(\ab[6][4] ) );
  NOR2X1M U73 ( .A(n21), .B(n26), .Y(\ab[6][3] ) );
  NOR2X1M U74 ( .A(n22), .B(n26), .Y(\ab[6][2] ) );
  NOR2X1M U75 ( .A(n23), .B(n26), .Y(\ab[6][1] ) );
  NOR2X1M U76 ( .A(n24), .B(n26), .Y(\ab[6][0] ) );
  NOR2X1M U77 ( .A(n17), .B(n27), .Y(\ab[5][7] ) );
  NOR2X1M U78 ( .A(n18), .B(n27), .Y(\ab[5][6] ) );
  NOR2X1M U79 ( .A(n19), .B(n27), .Y(\ab[5][5] ) );
  NOR2X1M U80 ( .A(n20), .B(n27), .Y(\ab[5][4] ) );
  NOR2X1M U81 ( .A(n21), .B(n27), .Y(\ab[5][3] ) );
  NOR2X1M U82 ( .A(n22), .B(n27), .Y(\ab[5][2] ) );
  NOR2X1M U83 ( .A(n23), .B(n27), .Y(\ab[5][1] ) );
  NOR2X1M U84 ( .A(n24), .B(n27), .Y(\ab[5][0] ) );
  NOR2X1M U85 ( .A(n17), .B(n28), .Y(\ab[4][7] ) );
  NOR2X1M U86 ( .A(n18), .B(n28), .Y(\ab[4][6] ) );
  NOR2X1M U87 ( .A(n19), .B(n28), .Y(\ab[4][5] ) );
  NOR2X1M U88 ( .A(n20), .B(n28), .Y(\ab[4][4] ) );
  NOR2X1M U89 ( .A(n21), .B(n28), .Y(\ab[4][3] ) );
  NOR2X1M U90 ( .A(n22), .B(n28), .Y(\ab[4][2] ) );
  NOR2X1M U91 ( .A(n23), .B(n28), .Y(\ab[4][1] ) );
  NOR2X1M U92 ( .A(n24), .B(n28), .Y(\ab[4][0] ) );
  NOR2X1M U93 ( .A(n17), .B(n29), .Y(\ab[3][7] ) );
  NOR2X1M U94 ( .A(n18), .B(n29), .Y(\ab[3][6] ) );
  NOR2X1M U95 ( .A(n19), .B(n29), .Y(\ab[3][5] ) );
  NOR2X1M U96 ( .A(n20), .B(n29), .Y(\ab[3][4] ) );
  NOR2X1M U97 ( .A(n21), .B(n29), .Y(\ab[3][3] ) );
  NOR2X1M U98 ( .A(n22), .B(n29), .Y(\ab[3][2] ) );
  NOR2X1M U99 ( .A(n23), .B(n29), .Y(\ab[3][1] ) );
  NOR2X1M U100 ( .A(n24), .B(n29), .Y(\ab[3][0] ) );
  NOR2X1M U101 ( .A(n17), .B(n30), .Y(\ab[2][7] ) );
  NOR2X1M U102 ( .A(n18), .B(n30), .Y(\ab[2][6] ) );
  NOR2X1M U103 ( .A(n19), .B(n30), .Y(\ab[2][5] ) );
  NOR2X1M U104 ( .A(n20), .B(n30), .Y(\ab[2][4] ) );
  NOR2X1M U105 ( .A(n21), .B(n30), .Y(\ab[2][3] ) );
  NOR2X1M U106 ( .A(n22), .B(n30), .Y(\ab[2][2] ) );
  NOR2X1M U107 ( .A(n23), .B(n30), .Y(\ab[2][1] ) );
  NOR2X1M U108 ( .A(n24), .B(n30), .Y(\ab[2][0] ) );
  NOR2X1M U109 ( .A(n17), .B(n31), .Y(\ab[1][7] ) );
  NOR2X1M U110 ( .A(n24), .B(n32), .Y(PRODUCT[0]) );
endmodule


module ALU ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n41, n42, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164;
  wire   [15:0] ALU_OUT_Comb;

  OAI2BB1X4M U77 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  ALU_DW_div_uns_0 div_56 ( .a({A[7:6], n23, A[4], n19, n16, n13, n11}), .b(B), 
        .quotient({N132, N131, N130, N129, N128, N127, N126, N125}) );
  ALU_DW01_sub_0 sub_50 ( .A({1'b0, n28, n26, n23, A[4], n19, n16, n13, n11}), 
        .B({1'b0, B[7], n10, B[5:0]}), .CI(1'b0), .DIFF({N108, N107, N106, 
        N105, N104, N103, N102, N101, N100}) );
  ALU_DW01_add_0 add_47 ( .A({1'b0, n28, A[6], n23, A[4], n19, n16, n13, n11}), 
        .B({1'b0, B[7], n10, B[5:0]}), .CI(1'b0), .SUM({N99, N98, N97, N96, 
        N95, N94, N93, N92, N91}) );
  ALU_DW02_mult_0 mult_53 ( .A({n28, n26, n23, A[4], n19, n16, n13, n11}), .B(
        {B[7], n10, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, N122, N121, 
        N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, N110, N109}) );
  DFFRQX2M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[7]) );
  DFFRQX2M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[6]) );
  DFFRQX2M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[5]) );
  DFFRQX2M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[4]) );
  DFFRQX2M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(n114), .Q(
        ALU_OUT[3]) );
  DFFRQX2M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(n114), .Q(
        ALU_OUT[2]) );
  DFFRQX2M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(n114), .Q(
        ALU_OUT[1]) );
  DFFRQX2M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(n114), .Q(
        ALU_OUT[0]) );
  DFFRQX2M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[15]) );
  DFFRQX2M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[14]) );
  DFFRQX2M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[13]) );
  DFFRQX2M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[12]) );
  DFFRQX2M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[11]) );
  DFFRQX2M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[10]) );
  DFFRQX2M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[9]) );
  DFFRQX2M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(n113), .Q(
        ALU_OUT[8]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(n114), .Q(OUT_VALID) );
  NOR2X4M U3 ( .A(n160), .B(n9), .Y(n105) );
  BUFX4M U4 ( .A(n49), .Y(n5) );
  AOI31X2M U7 ( .A0(n81), .A1(n82), .A2(n83), .B0(n159), .Y(ALU_OUT_Comb[1])
         );
  AND3X2M U8 ( .A(n6), .B(n7), .C(n8), .Y(n82) );
  INVX2M U9 ( .A(A[4]), .Y(n21) );
  INVX2M U10 ( .A(A[7]), .Y(n27) );
  OR2X2M U11 ( .A(n107), .B(n161), .Y(n3) );
  NAND2X2M U12 ( .A(n99), .B(n105), .Y(n4) );
  INVX2M U13 ( .A(A[6]), .Y(n25) );
  INVX2M U14 ( .A(B[3]), .Y(n147) );
  INVX2M U15 ( .A(B[0]), .Y(n143) );
  OAI21X2M U16 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI222X4M U17 ( .A0(N109), .A1(n30), .B0(n11), .B1(n42), .C0(N125), .C1(n5), 
        .Y(n94) );
  XNOR2X4M U18 ( .A(n26), .B(n10), .Y(n135) );
  OAI31X2M U19 ( .A0(n128), .A1(n119), .A2(n118), .B0(n129), .Y(n121) );
  AOI211X2M U20 ( .A0(n14), .A1(n144), .B0(n125), .C0(n117), .Y(n118) );
  NOR2X2M U21 ( .A(n142), .B(B[7]), .Y(n138) );
  OAI21X2M U22 ( .A0(n138), .A1(n123), .B0(n139), .Y(N159) );
  NOR3BX2M U23 ( .AN(n105), .B(n163), .C(ALU_FUN[2]), .Y(n49) );
  INVX4M U24 ( .A(A[5]), .Y(n22) );
  NAND2XLM U25 ( .A(N126), .B(n5), .Y(n6) );
  NAND2X2M U26 ( .A(n108), .B(n157), .Y(n7) );
  NAND2X2M U27 ( .A(n14), .B(n41), .Y(n8) );
  CLKBUFX4M U28 ( .A(B[6]), .Y(n10) );
  NOR2X2M U29 ( .A(n145), .B(n17), .Y(n119) );
  NOR2X2M U30 ( .A(n143), .B(n11), .Y(n116) );
  AOI211X2M U31 ( .A0(n126), .A1(n157), .B0(n125), .C0(n124), .Y(n127) );
  NOR2X2M U32 ( .A(n147), .B(n20), .Y(n128) );
  AOI31X4M U33 ( .A0(n93), .A1(n94), .A2(n95), .B0(n159), .Y(ALU_OUT_Comb[0])
         );
  NOR2X2M U34 ( .A(n9), .B(ALU_FUN[0]), .Y(n100) );
  BUFX6M U35 ( .A(A[0]), .Y(n11) );
  INVXLM U36 ( .A(B[7]), .Y(n150) );
  OAI21X1M U37 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  INVXLM U38 ( .A(B[2]), .Y(n153) );
  INVXLM U39 ( .A(B[4]), .Y(n152) );
  INVXLM U40 ( .A(B[5]), .Y(n151) );
  CLKINVX1M U41 ( .A(B[2]), .Y(n145) );
  NAND2X1M U42 ( .A(B[7]), .B(n142), .Y(n139) );
  INVX4M U43 ( .A(n3), .Y(n109) );
  INVX4M U44 ( .A(n3), .Y(n108) );
  INVX4M U45 ( .A(n4), .Y(n41) );
  INVX4M U46 ( .A(n4), .Y(n42) );
  OAI2BB1X2M U47 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U48 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U49 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U50 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U51 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U52 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U53 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  INVX2M U54 ( .A(n100), .Y(n161) );
  CLKBUFX6M U55 ( .A(n47), .Y(n112) );
  OAI2BB1X2M U56 ( .A0N(n164), .A1N(n105), .B0(n101), .Y(n47) );
  INVX2M U57 ( .A(n107), .Y(n164) );
  BUFX4M U58 ( .A(n46), .Y(n110) );
  BUFX4M U59 ( .A(n46), .Y(n111) );
  NOR2BX8M U60 ( .AN(n30), .B(n159), .Y(n31) );
  CLKAND2X6M U61 ( .A(n106), .B(n105), .Y(n50) );
  INVX4M U62 ( .A(n91), .Y(n162) );
  CLKBUFX6M U63 ( .A(n37), .Y(n29) );
  NOR2BX2M U64 ( .AN(n106), .B(n161), .Y(n37) );
  AND4X1M U65 ( .A(N159), .B(n99), .C(n9), .D(n160), .Y(n90) );
  AOI31X2M U66 ( .A0(n51), .A1(n52), .A2(n53), .B0(n159), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U67 ( .A0(N106), .A1(n50), .B0(N97), .B1(n29), .Y(n51) );
  AOI221X2M U68 ( .A0(n162), .A1(n28), .B0(n109), .B1(n154), .C0(n54), .Y(n53)
         );
  AOI222X2M U69 ( .A0(N115), .A1(n30), .B0(n41), .B1(n26), .C0(N131), .C1(n5), 
        .Y(n52) );
  INVX4M U70 ( .A(ALU_FUN[0]), .Y(n160) );
  INVX4M U71 ( .A(ALU_FUN[1]), .Y(n163) );
  NOR2X4M U72 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  NAND2X4M U73 ( .A(EN), .B(n149), .Y(n32) );
  NAND2X2M U74 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  NAND3X2M U75 ( .A(n106), .B(ALU_FUN[0]), .C(n9), .Y(n101) );
  AND2X2M U76 ( .A(ALU_FUN[2]), .B(n163), .Y(n99) );
  AND3X2M U78 ( .A(n106), .B(n160), .C(n9), .Y(n46) );
  NAND3X4M U79 ( .A(n164), .B(n160), .C(n9), .Y(n36) );
  NAND3X2M U80 ( .A(n9), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  CLKBUFX6M U81 ( .A(n35), .Y(n30) );
  NOR3X2M U82 ( .A(n161), .B(ALU_FUN[2]), .C(n163), .Y(n35) );
  INVX2M U83 ( .A(n28), .Y(n142) );
  INVX6M U84 ( .A(EN), .Y(n159) );
  INVX4M U85 ( .A(n14), .Y(n157) );
  INVX2M U86 ( .A(n17), .Y(n156) );
  INVX2M U87 ( .A(n20), .Y(n155) );
  INVX2M U88 ( .A(n26), .Y(n154) );
  INVX6M U89 ( .A(n115), .Y(n113) );
  INVX4M U90 ( .A(n115), .Y(n114) );
  AOI22X1M U91 ( .A0(N100), .A1(n50), .B0(N91), .B1(n29), .Y(n93) );
  AOI211X2M U92 ( .A0(n109), .A1(n158), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X2M U93 ( .A0(N92), .A1(n29), .B0(N110), .B1(n30), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U94 ( .A0(n17), .A1(n162), .B0(n84), .C0(n85), .Y(n83) );
  AOI31X2M U95 ( .A0(n75), .A1(n76), .A2(n77), .B0(n159), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U96 ( .A0(N102), .A1(n50), .B0(N93), .B1(n29), .Y(n75) );
  AOI221X2M U97 ( .A0(n20), .A1(n162), .B0(n109), .B1(n156), .C0(n78), .Y(n77)
         );
  AOI222X2M U98 ( .A0(N111), .A1(n30), .B0(n17), .B1(n41), .C0(N127), .C1(n5), 
        .Y(n76) );
  INVX4M U99 ( .A(n22), .Y(n23) );
  INVX4M U100 ( .A(n12), .Y(n13) );
  INVX4M U101 ( .A(n15), .Y(n16) );
  AOI31X2M U102 ( .A0(n69), .A1(n70), .A2(n71), .B0(n159), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U103 ( .A0(N103), .A1(n50), .B0(N94), .B1(n29), .Y(n69) );
  AOI221X2M U104 ( .A0(A[4]), .A1(n162), .B0(n109), .B1(n155), .C0(n72), .Y(
        n71) );
  AOI222X2M U105 ( .A0(N112), .A1(n30), .B0(n20), .B1(n42), .C0(N128), .C1(n5), 
        .Y(n70) );
  INVX4M U106 ( .A(n18), .Y(n19) );
  AOI31X2M U107 ( .A0(n63), .A1(n64), .A2(n65), .B0(n159), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U108 ( .A0(N104), .A1(n50), .B0(N95), .B1(n29), .Y(n63) );
  AOI221X2M U109 ( .A0(n162), .A1(n24), .B0(n109), .B1(n21), .C0(n66), .Y(n65)
         );
  AOI222X2M U110 ( .A0(N113), .A1(n30), .B0(A[4]), .B1(n41), .C0(N129), .C1(n5), .Y(n64) );
  INVXLM U111 ( .A(n127), .Y(n146) );
  INVX2M U112 ( .A(n141), .Y(N158) );
  INVX2M U113 ( .A(n10), .Y(n148) );
  INVX4M U114 ( .A(n15), .Y(n17) );
  AOI31X2M U115 ( .A0(n57), .A1(n58), .A2(n59), .B0(n159), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U116 ( .A0(N105), .A1(n50), .B0(N96), .B1(n29), .Y(n57) );
  AOI221X2M U117 ( .A0(n162), .A1(n26), .B0(n109), .B1(n22), .C0(n60), .Y(n59)
         );
  AOI222X2M U118 ( .A0(N114), .A1(n30), .B0(n24), .B1(n42), .C0(N130), .C1(n5), 
        .Y(n58) );
  AOI31X2M U119 ( .A0(n38), .A1(n39), .A2(n40), .B0(n159), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U120 ( .A0(N107), .A1(n50), .B0(N98), .B1(n29), .Y(n38) );
  AOI221X2M U121 ( .A0(n109), .A1(n27), .B0(n42), .B1(n28), .C0(n43), .Y(n40)
         );
  AOI22X1M U122 ( .A0(N132), .A1(n5), .B0(N116), .B1(n30), .Y(n39) );
  INVX4M U123 ( .A(n12), .Y(n14) );
  AOI21X2M U124 ( .A0(n33), .A1(n34), .B0(n159), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U125 ( .A0(N99), .A1(n29), .B0(n149), .Y(n33) );
  AOI2BB2X2M U126 ( .B0(N117), .B1(n30), .A0N(n27), .A1N(n36), .Y(n34) );
  CLKBUFX6M U127 ( .A(ALU_FUN[3]), .Y(n9) );
  INVX4M U128 ( .A(n18), .Y(n20) );
  OAI222X1M U129 ( .A0(n55), .A1(n148), .B0(n10), .B1(n56), .C0(n36), .C1(n22), 
        .Y(n54) );
  AOI221X2M U130 ( .A0(n26), .A1(n110), .B0(n112), .B1(n154), .C0(n108), .Y(
        n56) );
  AOI221X2M U131 ( .A0(n111), .A1(n154), .B0(n26), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U132 ( .A(n92), .Y(n149) );
  AOI211X2M U133 ( .A0(N108), .A1(n50), .B0(n109), .C0(n112), .Y(n92) );
  INVX4M U134 ( .A(n25), .Y(n26) );
  INVX4M U135 ( .A(n22), .Y(n24) );
  INVX4M U136 ( .A(n27), .Y(n28) );
  INVX2M U137 ( .A(n11), .Y(n158) );
  INVX2M U138 ( .A(RST), .Y(n115) );
  INVX2M U139 ( .A(A[1]), .Y(n12) );
  INVX2M U140 ( .A(A[2]), .Y(n15) );
  INVX2M U141 ( .A(A[3]), .Y(n18) );
  INVXLM U142 ( .A(n116), .Y(n144) );
  AOI221X2M U143 ( .A0(n11), .A1(n110), .B0(n112), .B1(n158), .C0(n108), .Y(
        n102) );
  AOI31X2M U144 ( .A0(N157), .A1(n9), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U145 ( .A(n163), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  AOI221X2M U146 ( .A0(n14), .A1(n110), .B0(n112), .B1(n157), .C0(n108), .Y(
        n87) );
  AOI31X2M U147 ( .A0(N158), .A1(n9), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U148 ( .A(n160), .B(ALU_FUN[2]), .C(n163), .Y(n89) );
  OAI222X1M U149 ( .A0(n44), .A1(n150), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n154), .Y(n43) );
  AOI221X2M U150 ( .A0(n111), .A1(n28), .B0(n112), .B1(n142), .C0(n109), .Y(
        n45) );
  AOI221X2M U151 ( .A0(n111), .A1(n142), .B0(n28), .B1(n48), .C0(n41), .Y(n44)
         );
  OAI222X1M U152 ( .A0(n67), .A1(n152), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n155), .Y(n66) );
  AOI221X2M U153 ( .A0(A[4]), .A1(n110), .B0(n112), .B1(n21), .C0(n108), .Y(
        n68) );
  AOI221X2M U154 ( .A0(n111), .A1(n21), .B0(A[4]), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U155 ( .A0(n61), .A1(n151), .B0(B[5]), .B1(n62), .C0(n36), .C1(n21), .Y(n60) );
  AOI221X2M U156 ( .A0(n24), .A1(n110), .B0(n112), .B1(n22), .C0(n108), .Y(n62) );
  AOI221X2M U157 ( .A0(n111), .A1(n22), .B0(n24), .B1(n48), .C0(n41), .Y(n61)
         );
  OAI222X1M U158 ( .A0(n79), .A1(n153), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n157), .Y(n78) );
  AOI221X2M U159 ( .A0(n17), .A1(n110), .B0(n112), .B1(n156), .C0(n108), .Y(
        n80) );
  AOI221X2M U160 ( .A0(n111), .A1(n156), .B0(n17), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U161 ( .A0(n73), .A1(n147), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n156), .Y(n72) );
  AOI221X2M U162 ( .A0(n20), .A1(n110), .B0(n112), .B1(n155), .C0(n108), .Y(
        n74) );
  AOI221X2M U163 ( .A0(n111), .A1(n155), .B0(n20), .B1(n48), .C0(n41), .Y(n73)
         );
  OAI2B2X1M U164 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n158), .Y(n85) );
  AOI221X2M U165 ( .A0(n111), .A1(n157), .B0(n14), .B1(n48), .C0(n41), .Y(n86)
         );
  OAI2B2X1M U166 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n157), .Y(n97) );
  AOI221X2M U167 ( .A0(n110), .A1(n158), .B0(n11), .B1(n48), .C0(n42), .Y(n98)
         );
  NAND2BX1M U168 ( .AN(B[4]), .B(A[4]), .Y(n131) );
  NAND2BX1M U169 ( .AN(A[4]), .B(B[4]), .Y(n120) );
  CLKNAND2X2M U170 ( .A(n131), .B(n120), .Y(n133) );
  CLKNAND2X2M U171 ( .A(n17), .B(n145), .Y(n130) );
  NAND2BX1M U172 ( .AN(n119), .B(n130), .Y(n125) );
  AOI21X1M U173 ( .A0(n116), .A1(n157), .B0(B[1]), .Y(n117) );
  CLKNAND2X2M U174 ( .A(n20), .B(n147), .Y(n129) );
  NAND2BX1M U175 ( .AN(n24), .B(B[5]), .Y(n136) );
  OAI211X1M U176 ( .A0(n133), .A1(n121), .B0(n120), .C0(n136), .Y(n122) );
  NAND2BX1M U177 ( .AN(B[5]), .B(n24), .Y(n132) );
  AOI32X1M U178 ( .A0(n122), .A1(n132), .A2(n135), .B0(n10), .B1(n25), .Y(n123) );
  CLKNAND2X2M U179 ( .A(n11), .B(n143), .Y(n126) );
  OA21X1M U180 ( .A0(n126), .A1(n157), .B0(B[1]), .Y(n124) );
  AOI31X1M U181 ( .A0(n146), .A1(n130), .A2(n129), .B0(n128), .Y(n134) );
  OAI2B11X1M U182 ( .A1N(n134), .A0(n133), .B0(n132), .C0(n131), .Y(n137) );
  AOI32X1M U183 ( .A0(n137), .A1(n136), .A2(n135), .B0(n26), .B1(n148), .Y(
        n140) );
  AOI2B1X1M U184 ( .A1N(n140), .A0(n139), .B0(n138), .Y(n141) );
  NOR2X1M U185 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;
  wire   Latch_Out;

  TLATNX2M Latch_Out_reg ( .D(CLK_EN), .GN(CLK), .Q(Latch_Out) );
  CLKAND2X6M U2 ( .A(Latch_Out), .B(CLK), .Y(GATED_CLK) );
endmodule


module SYS_TOP ( RST_N, UART_CLK, REF_CLK, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input RST_N, UART_CLK, REF_CLK, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_UART_RST, SYNC_REF_RST, UART_RX_V_OUT, UART_RX_V_SYNC,
         UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_FULL,
         UART_TX_V_SYNC, UART_TX_Busy, UART_RX_CLK, RF_RdData_VLD, RF_WrEn,
         RF_RdEn, ALU_EN, ALU_OUT_VLD, CLKG_EN, ALU_CLK, n2, n3, n4, n5, n6,
         n7;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] UART_TX_SYNC;
  wire   [7:0] DIV_RATIO;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO_RX;
  wire   [7:0] RF_RdData;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;

  RST_SYNC_NUM_STAGES2_0 U0_RST_SYNC ( .RST(RST_N), .CLK(UART_CLK), .SYNC_RST(
        SYNC_UART_RST) );
  RST_SYNC_NUM_STAGES2_1 U1_RST_SYNC ( .RST(RST_N), .CLK(REF_CLK), .SYNC_RST(
        SYNC_REF_RST) );
  DATA_SYNC_NUM_STAGES2_BUS_WIDTH8 U0_ref_sync ( .CLK(REF_CLK), .RST(n3), 
        .unsync_bus(UART_RX_OUT), .bus_enable(UART_RX_V_OUT), .sync_bus(
        UART_RX_SYNC), .enable_pulse_d(UART_RX_V_SYNC) );
  Async_fifo_D_SIZE8_F_DEPTH8_P_SIZE4 U0_UART_FIFO ( .i_w_clk(REF_CLK), 
        .i_w_rstn(n3), .i_w_inc(UART_TX_VLD), .i_r_clk(UART_TX_CLK), 
        .i_r_rstn(n5), .i_r_inc(UART_TX_Busy_PULSE), .i_w_data(UART_TX_IN), 
        .o_r_data(UART_TX_SYNC), .o_full(FIFO_FULL), .o_empty(UART_TX_V_SYNC)
         );
  PULSE_GEN U0_PULSE_GEN ( .clk(UART_TX_CLK), .rst(n5), .lvl_sig(UART_TX_Busy), 
        .pulse_sig(UART_TX_Busy_PULSE) );
  ClkDiv_0 U0_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst(n5), .i_clk_en(1'b1), 
        .i_div_ratio(DIV_RATIO), .o_div_clk(UART_TX_CLK) );
  CLKDIV_MUX U0_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  ClkDiv_1 U1_ClkDiv ( .i_ref_clk(UART_CLK), .i_rst(n5), .i_clk_en(1'b1), 
        .i_div_ratio({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), .o_div_clk(
        UART_RX_CLK) );
  UART U0_UART ( .RST(n5), .TX_CLK(UART_TX_CLK), .RX_CLK(UART_RX_CLK), 
        .RX_IN_S(UART_RX_IN), .RX_OUT_P(UART_RX_OUT), .RX_OUT_V(UART_RX_V_OUT), 
        .TX_IN_P(UART_TX_SYNC), .TX_IN_V(n7), .TX_OUT_S(UART_TX_O), .TX_OUT_V(
        UART_TX_Busy), .Prescale(UART_Config[7:2]), .parity_enable(
        UART_Config[0]), .parity_type(UART_Config[1]), .parity_error(
        parity_error), .framing_error(framing_error) );
  SYS_CTRL U0_SYS_CTRL ( .CLK(REF_CLK), .RST(n3), .ALU_OUT(ALU_OUT), 
        .ALU_OUT_VLD(ALU_OUT_VLD), .FIFO_FULL(FIFO_FULL), .RF_RdData(RF_RdData), .RF_RdData_Valid(RF_RdData_VLD), .UART_RX_DATA(UART_RX_SYNC), .UART_RX_VLD(
        UART_RX_V_SYNC), .ALU_FUN(ALU_FUN), .ALU_EN(ALU_EN), .CLKG_EN(CLKG_EN), 
        .RF_Address(RF_Address), .RF_WrEn(RF_WrEn), .RF_RdEn(RF_RdEn), 
        .RF_WrData(RF_WrData), .UART_TX_DATA(UART_TX_IN), .UART_TX_VLD(
        UART_TX_VLD) );
  RegFile U0_RegFile ( .CLK(REF_CLK), .RST(n3), .WrEn(RF_WrEn), .RdEn(RF_RdEn), 
        .Address({RF_Address[3:1], n2}), .WrData(RF_WrData), .RdData(RF_RdData), .RdData_VLD(RF_RdData_VLD), .REG0(Operand_A), .REG1(Operand_B), .REG2(
        UART_Config), .REG3(DIV_RATIO) );
  ALU U0_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(ALU_FUN), 
        .CLK(ALU_CLK), .RST(n3), .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VLD) );
  CLK_GATE U0_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  INVX4M U2 ( .A(n6), .Y(n5) );
  INVX4M U3 ( .A(n4), .Y(n3) );
  BUFX2M U4 ( .A(RF_Address[0]), .Y(n2) );
  INVX2M U5 ( .A(UART_TX_V_SYNC), .Y(n7) );
  INVX2M U6 ( .A(SYNC_UART_RST), .Y(n6) );
  INVX2M U7 ( .A(SYNC_REF_RST), .Y(n4) );
endmodule

