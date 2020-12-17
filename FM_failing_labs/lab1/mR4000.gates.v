
module mCntrl ( Op, Clk, Reset, PCWrite, PCWriteCond, IorD, MemRead, MemWrite, 
        IRWrite, MemtoReg, PCSource, TargetWrite, ALUOp, ALUSelA, ALUSelB, 
        RegWrite, RegDst );
  input [5:0] Op;
  output [1:0] PCSource;
  output [1:0] ALUOp;
  output [1:0] ALUSelB;
  input Clk, Reset;
  output PCWrite, PCWriteCond, IorD, MemRead, MemWrite, IRWrite, MemtoReg,
         TargetWrite, ALUSelA, RegWrite, RegDst;
  wire   IorD, N78, N79, N80, N82, N83, N84, N85, N86, N87, N88, N89, N90, n3,
         n6, n7, n10, n11, n12, n13, n19, n20, n21, n27, n43, n45, n56, n61,
         n62, n63, n64, n65, n66, n67, n68, n69, n1, n2, n4, n5, n8, n9, n14,
         n15, n16, n17, n18, n22, n23, n24, n25, n26, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n44;
  wire   [10:0] state;
  assign PCSource[0] = ALUOp[0];
  assign ALUSelB[1] = IorD;

  fd1a2 IRWrite_reg ( .D(N80), .CLK(Clk), .Q(IRWrite) );
  fdm5a2 TargetWrite_reg ( .D0(n11), .D1(state[1]), .D2(n12), .S0(n13), .S1(
        Reset), .CLK(Clk), .Q(TargetWrite) );
  fd1a2 ALUSelA_reg ( .D(N89), .CLK(Clk), .Q(ALUSelA) );
  fd1a2 MemtoReg_reg ( .D(N79), .CLK(Clk), .Q(MemtoReg) );
  fd1a2 ALUSelB_reg_1_ ( .D(N83), .CLK(Clk), .Q(IorD) );
  fdm5a2 MemWrite_reg ( .D0(n11), .D1(n45), .D2(n12), .S0(n56), .S1(n21), 
        .CLK(Clk), .Q(MemWrite) );
  fd1a2 MemRead_reg ( .D(N82), .CLK(Clk), .Q(MemRead) );
  fd1a2 PCWriteCond_reg ( .D(N84), .CLK(Clk), .Q(PCWriteCond) );
  fdm5a2 RegWrite_reg ( .D0(n12), .D1(N79), .D2(n11), .S0(n43), .S1(N88), 
        .CLK(Clk), .Q(RegWrite) );
  fd1a2 PCWrite_reg ( .D(N78), .CLK(Clk), .Q(PCWrite) );
  fd1c2 state_reg_3_ ( .D(n65), .CLK(Clk), .QN(n20) );
  fd1c2 state_reg_4_ ( .D(n64), .CLK(Clk), .QN(n19) );
  fd1c2 state_reg_0_ ( .D(N80), .CLK(Clk), .QN(n13) );
  fd1c2 state_reg_5_ ( .D(n63), .CLK(Clk), .QN(n6) );
  fd1a2 ALUSelB_reg_0_ ( .D(N87), .CLK(Clk), .Q(ALUSelB[0]) );
  fd1a2 RegDst_reg ( .D(N90), .CLK(Clk), .Q(RegDst) );
  fd1c2 state_reg_8_ ( .D(n61), .CLK(Clk), .QN(n3) );
  fd1c2 state_reg_2_ ( .D(n66), .CLK(Clk), .QN(n7) );
  fd1a2 state_reg_10_ ( .D(n69), .CLK(Clk), .Q(state[10]) );
  fd1a2 PCSource_reg_1_ ( .D(N86), .CLK(Clk), .Q(PCSource[1]) );
  fd1a2 state_reg_6_ ( .D(n62), .CLK(Clk), .Q(state[6]) );
  fd1a2 state_reg_9_ ( .D(n67), .CLK(Clk), .Q(state[9]) );
  fd1a2 state_reg_7_ ( .D(n68), .CLK(Clk), .Q(state[7]) );
  fd1a2 ALUOp_reg_1_ ( .D(N88), .CLK(Clk), .Q(ALUOp[1]) );
  fd1a2 ALUOp_reg_0_ ( .D(N85), .CLK(Clk), .Q(ALUOp[0]) );
  fdm5a2 state_reg_1_ ( .D0(n12), .D1(state[0]), .D2(n11), .S0(n10), .S1(n27), 
        .CLK(Clk), .Q(state[1]) );
  and2c0 U3 ( .A(state[0]), .B(state[1]), .Y(n2) );
  and2c0 U4 ( .A(Op[4]), .B(n45), .Y(n33) );
  nand3a1 U5 ( .A(n22), .B(n19), .C(n6), .Y(n23) );
  nand2a0 U6 ( .A(n2), .B(n10), .Y(n37) );
  inv1a1 U7 ( .A(Reset), .Y(n10) );
  inv1a1 U8 ( .A(n13), .Y(state[0]) );
  and3b1 U9 ( .B(n26), .C(n25), .A(n24), .Y(n15) );
  nand2a0 U10 ( .A(n19), .B(n6), .Y(n1) );
  oa1f1 U11 ( .A(n22), .B(n1), .C(Reset), .Y(n18) );
  inv1a1 U12 ( .A(n27), .Y(n44) );
  and2c1 U13 ( .A(n33), .B(n32), .Y(n27) );
  nand2a0 U14 ( .A(state[6]), .B(n27), .Y(n39) );
  nand2a0 U15 ( .A(state[10]), .B(n3), .Y(n16) );
  nand2a0 U16 ( .A(n15), .B(n28), .Y(n34) );
  nand2a0 U17 ( .A(n22), .B(n18), .Y(N87) );
  and2c0 U18 ( .A(n31), .B(Reset), .Y(N78) );
  and2c0 U19 ( .A(n3), .B(n17), .Y(N84) );
  inv1a0 U20 ( .A(N80), .Y(n30) );
  inv1a0 U21 ( .A(n43), .Y(n36) );
  and2c0 U22 ( .A(n45), .B(n8), .Y(n43) );
  nand2a0 U23 ( .A(n41), .B(n21), .Y(N83) );
  inv1a0 U24 ( .A(n28), .Y(n41) );
  nand2c2 U25 ( .A(n40), .B(n26), .Y(n42) );
  nand2a0 U26 ( .A(n25), .B(n24), .Y(n40) );
  inv1a0 U27 ( .A(Op[1]), .Y(n24) );
  inv1a0 U28 ( .A(n56), .Y(n8) );
  and2c0 U29 ( .A(Op[4]), .B(Op[3]), .Y(n56) );
  inv1a0 U30 ( .A(n33), .Y(n35) );
  inv1a0 U31 ( .A(Op[2]), .Y(n26) );
  nand2a0 U32 ( .A(n18), .B(n5), .Y(N80) );
  and2c0 U33 ( .A(state[6]), .B(n23), .Y(n14) );
  inv1a0 U34 ( .A(n2), .Y(n9) );
  ao1d1 U35 ( .A(n27), .B(state[10]), .C(n34), .Y(n69) );
  inv1a1 U36 ( .A(N79), .Y(n21) );
  nor2a1 U37 ( .A(n7), .B(n37), .Y(N79) );
  nor3c1 U38 ( .A(state[6]), .B(n10), .C(n23), .Y(N88) );
  nor3c1 U39 ( .A(n20), .B(n7), .C(n9), .Y(n22) );
  or2b1 U40 ( .B(n20), .A(n7), .Y(n38) );
  or4e0 U41 ( .A(n31), .B(state[1]), .C(n30), .D(n40), .Y(n32) );
  or3b1 U42 ( .B(N79), .C(N90), .A(n29), .Y(N89) );
  or3b1 U43 ( .B(state[7]), .C(Reset), .A(n14), .Y(n17) );
  or4e0 U44 ( .A(Op[0]), .B(Op[1]), .C(Op[5]), .D(n26), .Y(n45) );
  nor3c1 U45 ( .A(state[1]), .B(n13), .C(Reset), .Y(n28) );
  gnd U46 ( .Y(n12) );
  vdd U47 ( .Y(n11) );
  and3d1 U48 ( .A(n8), .B(Op[0]), .C(Op[5]), .Y(n25) );
  oa1f1 U49 ( .A(state[1]), .B(n15), .C(state[0]), .Y(n31) );
  oa1a0 U50 ( .A(state[10]), .B(state[9]), .C(n3), .Y(n4) );
  ao1f1 U51 ( .A(state[7]), .B(n4), .C(n14), .Y(n5) );
  ao3h0 U52 ( .A(n7), .B(n9), .C(n36), .D(n30), .Y(N82) );
  oa1e0 U53 ( .B(state[9]), .A(n3), .C(n17), .Y(N85) );
  ao3h0 U54 ( .A(state[9]), .B(n17), .C(n16), .D(n34), .Y(N86) );
  oa2d0 U55 ( .A(state[7]), .B(state[6]), .D(n10), .C(n23), .Y(N90) );
  oa3h0 U56 ( .A(n28), .B(n35), .C(n42), .D(N85), .Y(n29) );
  ao1a0 U57 ( .A(n27), .B(state[7]), .C(N88), .Y(n68) );
  ao1a0 U58 ( .A(n27), .B(state[9]), .C(N84), .Y(n67) );
  ao4f0 U59 ( .A(n7), .B(n44), .C(n35), .D(n41), .Y(n66) );
  ao4f0 U60 ( .A(n20), .B(n44), .C(n36), .D(n21), .Y(n65) );
  ao4f0 U61 ( .A(n19), .B(n44), .C(n38), .D(n37), .Y(n64) );
  ao4f0 U62 ( .A(n6), .B(n44), .C(n43), .D(n21), .Y(n63) );
  ao3h0 U63 ( .A(Op[2]), .B(n40), .C(n41), .D(n39), .Y(n62) );
  ao4f0 U64 ( .A(n3), .B(n44), .C(n42), .D(n41), .Y(n61) );
endmodule


module mAlu ( PC, ReadData1, ReadData2, Instruction, ALUSelA, ALUSelB, ALUOp, 
        Zero, ALU_result );
  input [31:0] PC;
  input [31:0] ReadData1;
  input [31:0] ReadData2;
  input [15:0] Instruction;
  input [1:0] ALUSelB;
  input [1:0] ALUOp;
  output [31:0] ALU_result;
  input ALUSelA;
  output Zero;
  wire   C3_DATA6_0, C3_DATA6_1, C3_DATA6_2, C3_DATA6_3, C3_DATA6_4,
         C3_DATA6_5, C3_DATA6_6, C3_DATA6_7, C3_DATA6_8, C3_DATA6_9,
         C3_DATA6_10, C3_DATA6_11, C3_DATA6_12, C3_DATA6_13, C3_DATA6_14,
         C3_DATA6_15, C3_DATA6_16, C3_DATA6_17, C3_DATA6_18, C3_DATA6_19,
         C3_DATA6_20, C3_DATA6_21, C3_DATA6_22, C3_DATA6_23, C3_DATA6_24,
         C3_DATA6_25, C3_DATA6_26, C3_DATA6_27, C3_DATA6_28, C3_DATA6_29,
         C3_DATA6_30, C3_DATA6_31, DP_OP_27J1_124_8182_n101,
         DP_OP_27J1_124_8182_n100, DP_OP_27J1_124_8182_n66,
         DP_OP_27J1_124_8182_n65, DP_OP_27J1_124_8182_n64,
         DP_OP_27J1_124_8182_n63, DP_OP_27J1_124_8182_n62,
         DP_OP_27J1_124_8182_n61, DP_OP_27J1_124_8182_n60,
         DP_OP_27J1_124_8182_n59, DP_OP_27J1_124_8182_n58,
         DP_OP_27J1_124_8182_n57, DP_OP_27J1_124_8182_n56,
         DP_OP_27J1_124_8182_n55, DP_OP_27J1_124_8182_n54,
         DP_OP_27J1_124_8182_n53, DP_OP_27J1_124_8182_n52,
         DP_OP_27J1_124_8182_n51, DP_OP_27J1_124_8182_n50,
         DP_OP_27J1_124_8182_n49, DP_OP_27J1_124_8182_n48,
         DP_OP_27J1_124_8182_n47, DP_OP_27J1_124_8182_n46,
         DP_OP_27J1_124_8182_n45, DP_OP_27J1_124_8182_n44,
         DP_OP_27J1_124_8182_n43, DP_OP_27J1_124_8182_n42,
         DP_OP_27J1_124_8182_n41, DP_OP_27J1_124_8182_n40,
         DP_OP_27J1_124_8182_n39, DP_OP_27J1_124_8182_n38,
         DP_OP_27J1_124_8182_n37, DP_OP_27J1_124_8182_n36,
         DP_OP_27J1_124_8182_n31, DP_OP_27J1_124_8182_n30,
         DP_OP_27J1_124_8182_n29, DP_OP_27J1_124_8182_n28,
         DP_OP_27J1_124_8182_n27, DP_OP_27J1_124_8182_n26,
         DP_OP_27J1_124_8182_n25, DP_OP_27J1_124_8182_n24,
         DP_OP_27J1_124_8182_n23, DP_OP_27J1_124_8182_n22,
         DP_OP_27J1_124_8182_n21, DP_OP_27J1_124_8182_n20,
         DP_OP_27J1_124_8182_n19, DP_OP_27J1_124_8182_n18,
         DP_OP_27J1_124_8182_n17, DP_OP_27J1_124_8182_n16,
         DP_OP_27J1_124_8182_n15, DP_OP_27J1_124_8182_n14,
         DP_OP_27J1_124_8182_n13, DP_OP_27J1_124_8182_n12,
         DP_OP_27J1_124_8182_n11, DP_OP_27J1_124_8182_n10,
         DP_OP_27J1_124_8182_n9, DP_OP_27J1_124_8182_n8,
         DP_OP_27J1_124_8182_n7, DP_OP_27J1_124_8182_n6,
         DP_OP_27J1_124_8182_n5, DP_OP_27J1_124_8182_n4,
         DP_OP_27J1_124_8182_n3, DP_OP_27J1_124_8182_n2,
         DP_OP_27J1_124_8182_n1, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53,
         n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n128, n129,
         n130, n131, n132, n133, n134, n135, n136, n137, n138, n139, n140,
         n141, n142, n143, n144, n145, n146, n147, n148, n149, n150, n151,
         n152, n153, n154, n155, n156, n157, n158, n159, n160, n161, n162,
         n163, n164, n165, n166, n167, n168, n169, n170, n171, n172, n173,
         n174, n175, n176, n177, n178, n179, n180, n181, n182, n183, n184,
         n185, n186, n187, n188, n189, n190, n191, n192, n193, n194, n195,
         n196, n197, n198, n199, n200, n201, n202, n203, n204, n205, n206,
         n207, n208, n209, n210, n211, n212, n213, n214, n215, n216, n217,
         n218, n219, n220, n221, n222, n223, n224, n225, n226, n227, n228,
         n229, n230, n231, n232, n233, n234, n235, n236, n237, n238, n239,
         n240, n241, n242, n243, n244, n245, n246, n247;
  wire   [31:0] MuxA;
  wire   [31:1] MuxB;

  fa1b0 DP_OP_27J1_124_8182_U31 ( .CI(DP_OP_27J1_124_8182_n31), .B(MuxA[1]), 
        .A(DP_OP_27J1_124_8182_n66), .S(C3_DATA6_1), .CO(
        DP_OP_27J1_124_8182_n30) );
  fa2a0 DP_OP_27J1_124_8182_U30 ( .A(DP_OP_27J1_124_8182_n65), .B(MuxA[2]), 
        .CI(DP_OP_27J1_124_8182_n30), .CO(DP_OP_27J1_124_8182_n29), .S(
        C3_DATA6_2) );
  fa1b0 DP_OP_27J1_124_8182_U29 ( .CI(DP_OP_27J1_124_8182_n29), .B(MuxA[3]), 
        .A(DP_OP_27J1_124_8182_n64), .S(C3_DATA6_3), .CO(
        DP_OP_27J1_124_8182_n28) );
  fa2a0 DP_OP_27J1_124_8182_U28 ( .A(DP_OP_27J1_124_8182_n63), .B(MuxA[4]), 
        .CI(DP_OP_27J1_124_8182_n28), .CO(DP_OP_27J1_124_8182_n27), .S(
        C3_DATA6_4) );
  fa1b0 DP_OP_27J1_124_8182_U27 ( .CI(DP_OP_27J1_124_8182_n27), .B(MuxA[5]), 
        .A(DP_OP_27J1_124_8182_n62), .S(C3_DATA6_5), .CO(
        DP_OP_27J1_124_8182_n26) );
  fa2a0 DP_OP_27J1_124_8182_U26 ( .A(DP_OP_27J1_124_8182_n61), .B(MuxA[6]), 
        .CI(DP_OP_27J1_124_8182_n26), .CO(DP_OP_27J1_124_8182_n25), .S(
        C3_DATA6_6) );
  fa1b0 DP_OP_27J1_124_8182_U25 ( .CI(DP_OP_27J1_124_8182_n25), .B(MuxA[7]), 
        .A(DP_OP_27J1_124_8182_n60), .S(C3_DATA6_7), .CO(
        DP_OP_27J1_124_8182_n24) );
  fa2a0 DP_OP_27J1_124_8182_U24 ( .A(DP_OP_27J1_124_8182_n59), .B(MuxA[8]), 
        .CI(DP_OP_27J1_124_8182_n24), .CO(DP_OP_27J1_124_8182_n23), .S(
        C3_DATA6_8) );
  fa1b0 DP_OP_27J1_124_8182_U23 ( .CI(DP_OP_27J1_124_8182_n23), .B(MuxA[9]), 
        .A(DP_OP_27J1_124_8182_n58), .S(C3_DATA6_9), .CO(
        DP_OP_27J1_124_8182_n22) );
  fa2a0 DP_OP_27J1_124_8182_U22 ( .A(DP_OP_27J1_124_8182_n57), .B(MuxA[10]), 
        .CI(DP_OP_27J1_124_8182_n22), .CO(DP_OP_27J1_124_8182_n21), .S(
        C3_DATA6_10) );
  fa1b0 DP_OP_27J1_124_8182_U21 ( .CI(DP_OP_27J1_124_8182_n21), .B(MuxA[11]), 
        .A(DP_OP_27J1_124_8182_n56), .S(C3_DATA6_11), .CO(
        DP_OP_27J1_124_8182_n20) );
  fa2a0 DP_OP_27J1_124_8182_U20 ( .A(DP_OP_27J1_124_8182_n55), .B(MuxA[12]), 
        .CI(DP_OP_27J1_124_8182_n20), .CO(DP_OP_27J1_124_8182_n19), .S(
        C3_DATA6_12) );
  fa1b0 DP_OP_27J1_124_8182_U19 ( .CI(DP_OP_27J1_124_8182_n19), .B(MuxA[13]), 
        .A(DP_OP_27J1_124_8182_n54), .S(C3_DATA6_13), .CO(
        DP_OP_27J1_124_8182_n18) );
  fa2a0 DP_OP_27J1_124_8182_U18 ( .A(DP_OP_27J1_124_8182_n53), .B(MuxA[14]), 
        .CI(DP_OP_27J1_124_8182_n18), .CO(DP_OP_27J1_124_8182_n17), .S(
        C3_DATA6_14) );
  fa1b0 DP_OP_27J1_124_8182_U17 ( .CI(DP_OP_27J1_124_8182_n17), .B(MuxA[15]), 
        .A(DP_OP_27J1_124_8182_n52), .S(C3_DATA6_15), .CO(
        DP_OP_27J1_124_8182_n16) );
  fa2a0 DP_OP_27J1_124_8182_U16 ( .A(DP_OP_27J1_124_8182_n51), .B(MuxA[16]), 
        .CI(DP_OP_27J1_124_8182_n16), .CO(DP_OP_27J1_124_8182_n15), .S(
        C3_DATA6_16) );
  fa1b0 DP_OP_27J1_124_8182_U15 ( .CI(DP_OP_27J1_124_8182_n15), .B(MuxA[17]), 
        .A(DP_OP_27J1_124_8182_n50), .S(C3_DATA6_17), .CO(
        DP_OP_27J1_124_8182_n14) );
  fa2a0 DP_OP_27J1_124_8182_U14 ( .A(DP_OP_27J1_124_8182_n49), .B(MuxA[18]), 
        .CI(DP_OP_27J1_124_8182_n14), .CO(DP_OP_27J1_124_8182_n13), .S(
        C3_DATA6_18) );
  fa1b0 DP_OP_27J1_124_8182_U13 ( .CI(DP_OP_27J1_124_8182_n13), .B(MuxA[19]), 
        .A(DP_OP_27J1_124_8182_n48), .S(C3_DATA6_19), .CO(
        DP_OP_27J1_124_8182_n12) );
  fa2a0 DP_OP_27J1_124_8182_U12 ( .A(DP_OP_27J1_124_8182_n47), .B(MuxA[20]), 
        .CI(DP_OP_27J1_124_8182_n12), .CO(DP_OP_27J1_124_8182_n11), .S(
        C3_DATA6_20) );
  fa1b0 DP_OP_27J1_124_8182_U11 ( .CI(DP_OP_27J1_124_8182_n11), .B(MuxA[21]), 
        .A(DP_OP_27J1_124_8182_n46), .S(C3_DATA6_21), .CO(
        DP_OP_27J1_124_8182_n10) );
  fa2a0 DP_OP_27J1_124_8182_U10 ( .A(DP_OP_27J1_124_8182_n45), .B(MuxA[22]), 
        .CI(DP_OP_27J1_124_8182_n10), .CO(DP_OP_27J1_124_8182_n9), .S(
        C3_DATA6_22) );
  fa1b0 DP_OP_27J1_124_8182_U9 ( .CI(DP_OP_27J1_124_8182_n9), .B(MuxA[23]), 
        .A(DP_OP_27J1_124_8182_n44), .S(C3_DATA6_23), .CO(
        DP_OP_27J1_124_8182_n8) );
  fa2a0 DP_OP_27J1_124_8182_U8 ( .A(DP_OP_27J1_124_8182_n43), .B(MuxA[24]), 
        .CI(DP_OP_27J1_124_8182_n8), .CO(DP_OP_27J1_124_8182_n7), .S(
        C3_DATA6_24) );
  fa1b0 DP_OP_27J1_124_8182_U7 ( .CI(DP_OP_27J1_124_8182_n7), .B(MuxA[25]), 
        .A(DP_OP_27J1_124_8182_n42), .S(C3_DATA6_25), .CO(
        DP_OP_27J1_124_8182_n6) );
  fa2a0 DP_OP_27J1_124_8182_U6 ( .A(DP_OP_27J1_124_8182_n41), .B(MuxA[26]), 
        .CI(DP_OP_27J1_124_8182_n6), .CO(DP_OP_27J1_124_8182_n5), .S(
        C3_DATA6_26) );
  fa1b0 DP_OP_27J1_124_8182_U5 ( .CI(DP_OP_27J1_124_8182_n5), .B(MuxA[27]), 
        .A(DP_OP_27J1_124_8182_n40), .S(C3_DATA6_27), .CO(
        DP_OP_27J1_124_8182_n4) );
  fa2a0 DP_OP_27J1_124_8182_U4 ( .A(DP_OP_27J1_124_8182_n39), .B(MuxA[28]), 
        .CI(DP_OP_27J1_124_8182_n4), .CO(DP_OP_27J1_124_8182_n3), .S(
        C3_DATA6_28) );
  fa1b0 DP_OP_27J1_124_8182_U3 ( .CI(DP_OP_27J1_124_8182_n3), .B(MuxA[29]), 
        .A(DP_OP_27J1_124_8182_n38), .S(C3_DATA6_29), .CO(
        DP_OP_27J1_124_8182_n2) );
  fa2a0 DP_OP_27J1_124_8182_U2 ( .A(DP_OP_27J1_124_8182_n37), .B(MuxA[30]), 
        .CI(DP_OP_27J1_124_8182_n2), .CO(DP_OP_27J1_124_8182_n1), .S(
        C3_DATA6_30) );
  fa1b0 DP_OP_27J1_124_8182_U1 ( .CI(DP_OP_27J1_124_8182_n1), .B(MuxA[31]), 
        .A(DP_OP_27J1_124_8182_n36), .S(C3_DATA6_31) );
  xor2a2 DP_OP_27J1_124_8182_U65 ( .A(MuxB[1]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n66) );
  xor2a2 DP_OP_27J1_124_8182_U64 ( .A(MuxB[2]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n65) );
  xor2a2 DP_OP_27J1_124_8182_U63 ( .A(MuxB[3]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n64) );
  xor2a2 DP_OP_27J1_124_8182_U62 ( .A(MuxB[4]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n63) );
  xor2a2 DP_OP_27J1_124_8182_U61 ( .A(MuxB[5]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n62) );
  xor2a2 DP_OP_27J1_124_8182_U60 ( .A(MuxB[6]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n61) );
  xor2a2 DP_OP_27J1_124_8182_U59 ( .A(MuxB[7]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n60) );
  xor2a2 DP_OP_27J1_124_8182_U58 ( .A(MuxB[8]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n59) );
  xor2a2 DP_OP_27J1_124_8182_U57 ( .A(MuxB[9]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n58) );
  xor2a2 DP_OP_27J1_124_8182_U56 ( .A(MuxB[10]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n57) );
  xor2a2 DP_OP_27J1_124_8182_U55 ( .A(MuxB[11]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n56) );
  xor2a2 DP_OP_27J1_124_8182_U54 ( .A(MuxB[12]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n55) );
  xor2a2 DP_OP_27J1_124_8182_U53 ( .A(MuxB[13]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n54) );
  xor2a2 DP_OP_27J1_124_8182_U52 ( .A(MuxB[14]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n53) );
  xor2a2 DP_OP_27J1_124_8182_U47 ( .A(MuxB[19]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n48) );
  xor2a2 DP_OP_27J1_124_8182_U48 ( .A(MuxB[18]), .B(DP_OP_27J1_124_8182_n100), 
        .Y(DP_OP_27J1_124_8182_n49) );
  xor2a2 DP_OP_27J1_124_8182_U49 ( .A(MuxB[17]), .B(DP_OP_27J1_124_8182_n100), 
        .Y(DP_OP_27J1_124_8182_n50) );
  xor2a2 DP_OP_27J1_124_8182_U50 ( .A(MuxB[16]), .B(DP_OP_27J1_124_8182_n100), 
        .Y(DP_OP_27J1_124_8182_n51) );
  xor2a2 DP_OP_27J1_124_8182_U51 ( .A(MuxB[15]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n52) );
  xor2a2 DP_OP_27J1_124_8182_U46 ( .A(MuxB[20]), .B(DP_OP_27J1_124_8182_n100), 
        .Y(DP_OP_27J1_124_8182_n47) );
  xor2a2 DP_OP_27J1_124_8182_U45 ( .A(MuxB[21]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n46) );
  xor2a2 DP_OP_27J1_124_8182_U44 ( .A(MuxB[22]), .B(n22), .Y(
        DP_OP_27J1_124_8182_n45) );
  xor2a2 DP_OP_27J1_124_8182_U43 ( .A(MuxB[23]), .B(DP_OP_27J1_124_8182_n100), 
        .Y(DP_OP_27J1_124_8182_n44) );
  xor2a2 DP_OP_27J1_124_8182_U42 ( .A(MuxB[24]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n43) );
  xor2a2 DP_OP_27J1_124_8182_U41 ( .A(MuxB[25]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n42) );
  xor2a2 DP_OP_27J1_124_8182_U40 ( .A(MuxB[26]), .B(DP_OP_27J1_124_8182_n100), 
        .Y(DP_OP_27J1_124_8182_n41) );
  xor2a2 DP_OP_27J1_124_8182_U39 ( .A(MuxB[27]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n40) );
  xor2a2 DP_OP_27J1_124_8182_U38 ( .A(MuxB[28]), .B(DP_OP_27J1_124_8182_n100), 
        .Y(DP_OP_27J1_124_8182_n39) );
  xor2a2 DP_OP_27J1_124_8182_U37 ( .A(MuxB[29]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n38) );
  xor2a2 DP_OP_27J1_124_8182_U36 ( .A(MuxB[30]), .B(DP_OP_27J1_124_8182_n100), 
        .Y(DP_OP_27J1_124_8182_n37) );
  xor2a2 DP_OP_27J1_124_8182_U35 ( .A(MuxB[31]), .B(n21), .Y(
        DP_OP_27J1_124_8182_n36) );
  or2c0 U3 ( .A(Instruction[1]), .B(ALUOp[1]), .Y(n244) );
  inv1a1 U4 ( .A(Instruction[2]), .Y(n151) );
  inv1a1 U5 ( .A(Instruction[5]), .Y(n49) );
  inv1a1 U6 ( .A(ALUSelB[1]), .Y(n45) );
  or2c1 U7 ( .A(n50), .B(n49), .Y(n150) );
  inv1a2 U8 ( .A(n45), .Y(n44) );
  ao1f1 U9 ( .A(n241), .B(MuxA[18]), .C(n32), .Y(n176) );
  nand2b1 U10 ( .A(Instruction[1]), .B(ALUOp[1]), .Y(n243) );
  mx2d0 U11 ( .D0(n21), .D1(MuxA[0]), .S(DP_OP_27J1_124_8182_n101), .Y(
        DP_OP_27J1_124_8182_n31) );
  inv1a0 U12 ( .A(MuxA[0]), .Y(n1) );
  mx2d0 U13 ( .D0(n1), .D1(MuxA[0]), .S(DP_OP_27J1_124_8182_n101), .Y(
        C3_DATA6_0) );
  and2c0 U14 ( .A(ALU_result[8]), .B(ALU_result[7]), .Y(n2) );
  and2c0 U15 ( .A(ALU_result[6]), .B(ALU_result[9]), .Y(n3) );
  and2c0 U16 ( .A(ALU_result[28]), .B(ALU_result[29]), .Y(n4) );
  and2c0 U17 ( .A(ALU_result[2]), .B(ALU_result[30]), .Y(n5) );
  nand4a0 U18 ( .A(n2), .B(n3), .C(n4), .D(n5), .Y(n6) );
  and4e1 U19 ( .A(ALU_result[31]), .B(ALU_result[3]), .C(ALU_result[4]), .D(
        ALU_result[5]), .Y(n7) );
  and8i1 U20 ( .A(ALU_result[21]), .B(ALU_result[18]), .C(ALU_result[22]), .D(
        ALU_result[19]), .E(ALU_result[23]), .F(ALU_result[17]), .G(
        ALU_result[1]), .H(ALU_result[20]), .Y(n8) );
  and2c0 U21 ( .A(ALU_result[26]), .B(ALU_result[27]), .Y(n9) );
  and2c0 U22 ( .A(ALU_result[15]), .B(ALU_result[16]), .Y(n10) );
  nand4a0 U23 ( .A(n245), .B(n246), .C(n247), .D(n10), .Y(n11) );
  and3d1 U24 ( .A(ALU_result[24]), .B(ALU_result[25]), .C(n11), .Y(n12) );
  nand4a0 U25 ( .A(n7), .B(n8), .C(n9), .D(n12), .Y(n13) );
  and2c0 U26 ( .A(n6), .B(n13), .Y(Zero) );
  ao1f1 U27 ( .A(MuxA[0]), .B(n42), .C(n240), .Y(n14) );
  nand2a0 U28 ( .A(DP_OP_27J1_124_8182_n101), .B(n238), .Y(n15) );
  ao2i0 U29 ( .A(n41), .B(DP_OP_27J1_124_8182_n101), .C(n34), .D(n15), .Y(n16)
         );
  inv1a0 U30 ( .A(n150), .Y(n17) );
  oa7g0 U31 ( .A(n16), .B(MuxA[0]), .C(n29), .D(C3_DATA6_0), .E(n17), .F(
        MuxB[1]), .Y(n18) );
  ao1d1 U32 ( .A(DP_OP_27J1_124_8182_n101), .B(n14), .C(n18), .Y(ALU_result[0]) );
  nand2a1 U33 ( .A(ALUOp[1]), .B(Instruction[0]), .Y(n240) );
  inv1a1 U34 ( .A(n47), .Y(n24) );
  inv1a2 U35 ( .A(n150), .Y(n145) );
  buf1a2 U36 ( .A(n145), .Y(n27) );
  ao2i1 U37 ( .A(n131), .B(n20), .C(n130), .D(n129), .Y(ALU_result[15]) );
  ao2i1 U38 ( .A(n69), .B(n20), .C(n62), .D(n61), .Y(ALU_result[6]) );
  ao2i1 U39 ( .A(n150), .B(n69), .C(n68), .D(n67), .Y(ALU_result[4]) );
  nand3a1 U40 ( .A(n88), .B(n87), .C(n86), .Y(ALU_result[28]) );
  nand3a1 U41 ( .A(n106), .B(n105), .C(n104), .Y(ALU_result[22]) );
  nand3a1 U42 ( .A(n112), .B(n111), .C(n110), .Y(ALU_result[20]) );
  nand3a1 U43 ( .A(n121), .B(n120), .C(n119), .Y(ALU_result[18]) );
  nand3a1 U44 ( .A(n118), .B(n117), .C(n116), .Y(ALU_result[19]) );
  nand3a1 U45 ( .A(n138), .B(n137), .C(n136), .Y(ALU_result[13]) );
  nand3a1 U46 ( .A(n141), .B(n140), .C(n139), .Y(ALU_result[12]) );
  nand3a1 U47 ( .A(n57), .B(n56), .C(n55), .Y(ALU_result[8]) );
  nand3a1 U48 ( .A(n82), .B(n81), .C(n80), .Y(ALU_result[2]) );
  ao2i1 U49 ( .A(n75), .B(n20), .C(n74), .D(n73), .Y(ALU_result[31]) );
  nand3a1 U50 ( .A(n85), .B(n84), .C(n83), .Y(ALU_result[29]) );
  ao2i1 U51 ( .A(n79), .B(n20), .C(n78), .D(n77), .Y(ALU_result[30]) );
  ao2i1 U52 ( .A(n54), .B(n20), .C(n53), .D(n52), .Y(ALU_result[9]) );
  ao2i1 U53 ( .A(n65), .B(n150), .C(n64), .D(n63), .Y(ALU_result[5]) );
  nand3a1 U54 ( .A(n127), .B(n126), .C(n125), .Y(ALU_result[16]) );
  nand3a1 U55 ( .A(n60), .B(n59), .C(n58), .Y(ALU_result[7]) );
  nand3a1 U56 ( .A(n72), .B(n71), .C(n70), .Y(ALU_result[3]) );
  nand3a1 U57 ( .A(n97), .B(n96), .C(n95), .Y(ALU_result[25]) );
  nand3a1 U58 ( .A(n91), .B(n90), .C(n89), .Y(ALU_result[27]) );
  inv1a1 U59 ( .A(n37), .Y(n32) );
  inv1a1 U60 ( .A(n240), .Y(n37) );
  inv1a1 U61 ( .A(n38), .Y(n36) );
  inv1a1 U62 ( .A(n38), .Y(n34) );
  inv1a1 U63 ( .A(n20), .Y(n25) );
  nor2a0 U64 ( .A(ALU_result[12]), .B(ALU_result[11]), .Y(n246) );
  nand3a1 U65 ( .A(n144), .B(n143), .C(n142), .Y(ALU_result[11]) );
  nand3a1 U66 ( .A(n124), .B(n123), .C(n122), .Y(ALU_result[17]) );
  nand3a1 U67 ( .A(n115), .B(n114), .C(n113), .Y(ALU_result[1]) );
  nand3a1 U68 ( .A(n148), .B(n147), .C(n146), .Y(ALU_result[10]) );
  ao2i1 U69 ( .A(n135), .B(n20), .C(n134), .D(n133), .Y(ALU_result[14]) );
  nand3a1 U70 ( .A(n109), .B(n108), .C(n107), .Y(ALU_result[21]) );
  nand3a1 U71 ( .A(n103), .B(n102), .C(n101), .Y(ALU_result[23]) );
  nand3a1 U72 ( .A(n94), .B(n93), .C(n92), .Y(ALU_result[26]) );
  nand3a1 U73 ( .A(n100), .B(n99), .C(n98), .Y(ALU_result[24]) );
  or2a2 U74 ( .A(n244), .B(n151), .Y(n241) );
  buf1a2 U75 ( .A(n46), .Y(n19) );
  nand2a1 U76 ( .A(n44), .B(Instruction[15]), .Y(n46) );
  ao1a2 U77 ( .A(n48), .B(n50), .C(ALUOp[0]), .Y(DP_OP_27J1_124_8182_n100) );
  nor2a0 U78 ( .A(Instruction[2]), .B(n49), .Y(n48) );
  inv1a2 U79 ( .A(n20), .Y(n26) );
  or2a2 U80 ( .A(Instruction[5]), .B(n243), .Y(n20) );
  inv1a2 U81 ( .A(n38), .Y(n35) );
  and2c0 U82 ( .A(ALU_result[10]), .B(ALU_result[0]), .Y(n245) );
  and2c0 U83 ( .A(ALU_result[14]), .B(ALU_result[13]), .Y(n247) );
  nand2a0 U84 ( .A(n219), .B(MuxB[31]), .Y(n73) );
  nand2a0 U85 ( .A(n31), .B(MuxB[31]), .Y(n218) );
  inv1a0 U86 ( .A(MuxB[30]), .Y(n75) );
  nand2a0 U87 ( .A(n30), .B(MuxB[30]), .Y(n216) );
  inv1a0 U88 ( .A(MuxB[29]), .Y(n79) );
  nand2a0 U89 ( .A(n212), .B(MuxB[29]), .Y(n83) );
  nand2a0 U90 ( .A(n30), .B(MuxB[29]), .Y(n210) );
  nand2a0 U91 ( .A(n209), .B(MuxB[28]), .Y(n86) );
  nand2a0 U92 ( .A(n30), .B(MuxB[28]), .Y(n207) );
  nand2a0 U93 ( .A(n206), .B(MuxB[27]), .Y(n89) );
  nand2a0 U94 ( .A(n31), .B(MuxB[27]), .Y(n204) );
  nand2a0 U95 ( .A(n203), .B(MuxB[26]), .Y(n92) );
  nand2a0 U96 ( .A(n31), .B(MuxB[26]), .Y(n201) );
  nand2a0 U97 ( .A(n200), .B(MuxB[25]), .Y(n95) );
  nand2a0 U98 ( .A(n30), .B(MuxB[25]), .Y(n198) );
  nand2a0 U99 ( .A(n197), .B(MuxB[24]), .Y(n98) );
  nand2a0 U100 ( .A(n30), .B(MuxB[24]), .Y(n195) );
  nand2a0 U101 ( .A(n194), .B(MuxB[23]), .Y(n101) );
  nand2a0 U102 ( .A(n31), .B(MuxB[23]), .Y(n192) );
  nand2a0 U103 ( .A(n191), .B(MuxB[22]), .Y(n104) );
  nand2a0 U104 ( .A(n31), .B(MuxB[22]), .Y(n189) );
  nand2a0 U105 ( .A(n188), .B(MuxB[21]), .Y(n107) );
  nand2a0 U106 ( .A(n30), .B(MuxB[21]), .Y(n186) );
  nand2a0 U107 ( .A(n185), .B(MuxB[20]), .Y(n110) );
  nand2a0 U108 ( .A(n30), .B(MuxB[20]), .Y(n183) );
  nand2a0 U109 ( .A(n176), .B(MuxB[18]), .Y(n119) );
  nand2a0 U110 ( .A(n31), .B(MuxB[18]), .Y(n174) );
  nand2a0 U111 ( .A(n173), .B(MuxB[17]), .Y(n122) );
  nand2a0 U112 ( .A(n31), .B(MuxB[17]), .Y(n171) );
  nand2a0 U113 ( .A(n170), .B(MuxB[16]), .Y(n125) );
  nand2a0 U114 ( .A(n238), .B(MuxB[16]), .Y(n168) );
  nand2a0 U115 ( .A(n31), .B(MuxB[15]), .Y(n166) );
  inv1a0 U116 ( .A(MuxB[14]), .Y(n131) );
  nand2a0 U117 ( .A(n179), .B(MuxB[19]), .Y(n116) );
  nand2a0 U118 ( .A(n30), .B(MuxB[19]), .Y(n177) );
  nand2a0 U119 ( .A(n30), .B(MuxB[14]), .Y(n164) );
  inv1a0 U120 ( .A(MuxB[13]), .Y(n135) );
  nand2a0 U121 ( .A(n163), .B(MuxB[13]), .Y(n136) );
  nand2a0 U122 ( .A(n31), .B(MuxB[13]), .Y(n161) );
  nand2a0 U123 ( .A(n160), .B(MuxB[12]), .Y(n139) );
  nand2a0 U124 ( .A(n30), .B(MuxB[12]), .Y(n158) );
  nand2a0 U125 ( .A(n157), .B(MuxB[11]), .Y(n142) );
  nand2a0 U126 ( .A(n31), .B(MuxB[11]), .Y(n155) );
  nand2a0 U127 ( .A(n154), .B(MuxB[10]), .Y(n146) );
  nand2a0 U128 ( .A(n30), .B(MuxA[10]), .Y(n152) );
  nand2a0 U129 ( .A(n30), .B(MuxB[9]), .Y(n239) );
  inv1a0 U130 ( .A(MuxB[8]), .Y(n54) );
  nand2a0 U131 ( .A(n237), .B(MuxB[8]), .Y(n55) );
  nand2a0 U132 ( .A(n31), .B(MuxB[8]), .Y(n235) );
  nand2a0 U133 ( .A(n234), .B(MuxB[7]), .Y(n58) );
  nand2a0 U134 ( .A(n31), .B(MuxB[7]), .Y(n232) );
  nand2a0 U135 ( .A(n30), .B(MuxB[6]), .Y(n229) );
  nand2a0 U136 ( .A(n31), .B(MuxB[5]), .Y(n226) );
  inv1a0 U137 ( .A(MuxB[6]), .Y(n65) );
  nand2a0 U138 ( .A(n31), .B(MuxB[4]), .Y(n224) );
  nand2a0 U139 ( .A(n23), .B(ReadData2[5]), .Y(n69) );
  nand2a0 U140 ( .A(n223), .B(MuxB[3]), .Y(n70) );
  nand2a0 U141 ( .A(n31), .B(MuxB[3]), .Y(n221) );
  nand2a0 U142 ( .A(n215), .B(MuxB[2]), .Y(n80) );
  inv1a2 U143 ( .A(n24), .Y(n23) );
  nand2a0 U144 ( .A(n30), .B(MuxB[2]), .Y(n213) );
  nand2a0 U145 ( .A(n182), .B(MuxB[1]), .Y(n113) );
  nand2a0 U146 ( .A(n238), .B(MuxB[1]), .Y(n180) );
  buf1a4 U147 ( .A(ALUSelA), .Y(n43) );
  and2c0 U148 ( .A(n151), .B(n243), .Y(n238) );
  nor2a2 U149 ( .A(n44), .B(ALUSelB[0]), .Y(n47) );
  or3b1 U150 ( .B(n48), .C(ALUOp[0]), .A(ALUOp[1]), .Y(n149) );
  ao1d1 U151 ( .A(n23), .B(ReadData2[31]), .C(n46), .Y(MuxB[31]) );
  ao1d1 U152 ( .A(n23), .B(ReadData2[30]), .C(n46), .Y(MuxB[30]) );
  ao1d1 U153 ( .A(n23), .B(ReadData2[29]), .C(n46), .Y(MuxB[29]) );
  ao1d1 U154 ( .A(n23), .B(ReadData2[28]), .C(n46), .Y(MuxB[28]) );
  ao1d1 U155 ( .A(n23), .B(ReadData2[27]), .C(n46), .Y(MuxB[27]) );
  ao1d1 U156 ( .A(n23), .B(ReadData2[26]), .C(n46), .Y(MuxB[26]) );
  ao1d1 U157 ( .A(n23), .B(ReadData2[25]), .C(n46), .Y(MuxB[25]) );
  ao1d1 U158 ( .A(n23), .B(ReadData2[24]), .C(n46), .Y(MuxB[24]) );
  ao1d1 U159 ( .A(n23), .B(ReadData2[23]), .C(n19), .Y(MuxB[23]) );
  ao1d1 U160 ( .A(n47), .B(ReadData2[22]), .C(n19), .Y(MuxB[22]) );
  ao1d1 U161 ( .A(n47), .B(ReadData2[21]), .C(n19), .Y(MuxB[21]) );
  ao1d1 U162 ( .A(n47), .B(ReadData2[20]), .C(n19), .Y(MuxB[20]) );
  ao1d1 U163 ( .A(n47), .B(ReadData2[16]), .C(n19), .Y(MuxB[16]) );
  ao1d1 U164 ( .A(n47), .B(ReadData2[17]), .C(n19), .Y(MuxB[17]) );
  ao1d1 U165 ( .A(n47), .B(ReadData2[18]), .C(n19), .Y(MuxB[18]) );
  ao1d1 U166 ( .A(n47), .B(ReadData2[19]), .C(n19), .Y(MuxB[19]) );
  ao1d1 U167 ( .A(n47), .B(ReadData2[15]), .C(n19), .Y(MuxB[15]) );
  inv1a1 U168 ( .A(n240), .Y(n38) );
  oa4f0 U169 ( .A(n220), .B(MuxA[31]), .C(C3_DATA6_31), .D(n28), .Y(n74) );
  mx2a2 U170 ( .D0(PC[31]), .D1(ReadData1[31]), .S(ALUSelA), .Y(MuxA[31]) );
  oa4f0 U171 ( .A(n27), .B(MuxB[31]), .C(MuxB[30]), .D(n76), .Y(n77) );
  ao1c0 U172 ( .A(n40), .B(MuxA[30]), .C(n37), .Y(n76) );
  oa4f0 U173 ( .A(n217), .B(MuxA[30]), .C(C3_DATA6_30), .D(n28), .Y(n78) );
  mx2a2 U174 ( .D0(PC[30]), .D1(ReadData1[30]), .S(n43), .Y(MuxA[30]) );
  oa4f0 U175 ( .A(n27), .B(MuxB[30]), .C(n26), .D(MuxB[28]), .Y(n84) );
  oa4f0 U176 ( .A(n211), .B(MuxA[29]), .C(C3_DATA6_29), .D(n28), .Y(n85) );
  mx2a2 U177 ( .D0(PC[29]), .D1(ReadData1[29]), .S(ALUSelA), .Y(MuxA[29]) );
  oa4f0 U178 ( .A(n145), .B(MuxB[29]), .C(n26), .D(MuxB[27]), .Y(n87) );
  oa4f0 U179 ( .A(n208), .B(MuxA[28]), .C(C3_DATA6_28), .D(n28), .Y(n88) );
  mx2a2 U180 ( .D0(PC[28]), .D1(ReadData1[28]), .S(ALUSelA), .Y(MuxA[28]) );
  oa4f0 U181 ( .A(n145), .B(MuxB[28]), .C(n26), .D(MuxB[26]), .Y(n90) );
  oa4f0 U182 ( .A(n205), .B(MuxA[27]), .C(C3_DATA6_27), .D(n29), .Y(n91) );
  mx2a2 U183 ( .D0(PC[27]), .D1(ReadData1[27]), .S(n43), .Y(MuxA[27]) );
  oa4f0 U184 ( .A(n145), .B(MuxB[27]), .C(n25), .D(MuxB[25]), .Y(n93) );
  oa4f0 U185 ( .A(n202), .B(MuxA[26]), .C(C3_DATA6_26), .D(n28), .Y(n94) );
  mx2a2 U186 ( .D0(PC[26]), .D1(ReadData1[26]), .S(n43), .Y(MuxA[26]) );
  oa4f0 U187 ( .A(n145), .B(MuxB[26]), .C(n26), .D(MuxB[24]), .Y(n96) );
  oa4f0 U188 ( .A(n199), .B(MuxA[25]), .C(C3_DATA6_25), .D(n29), .Y(n97) );
  mx2a2 U189 ( .D0(PC[25]), .D1(ReadData1[25]), .S(ALUSelA), .Y(MuxA[25]) );
  oa4f0 U190 ( .A(n27), .B(MuxB[25]), .C(n25), .D(MuxB[23]), .Y(n99) );
  oa4f0 U191 ( .A(n196), .B(MuxA[24]), .C(C3_DATA6_24), .D(n28), .Y(n100) );
  mx2a2 U192 ( .D0(PC[24]), .D1(ReadData1[24]), .S(ALUSelA), .Y(MuxA[24]) );
  oa4f0 U193 ( .A(n145), .B(MuxB[24]), .C(n25), .D(MuxB[22]), .Y(n102) );
  oa4f0 U194 ( .A(n193), .B(MuxA[23]), .C(C3_DATA6_23), .D(n28), .Y(n103) );
  mx2a2 U195 ( .D0(PC[23]), .D1(ReadData1[23]), .S(n43), .Y(MuxA[23]) );
  oa4f0 U196 ( .A(n27), .B(MuxB[23]), .C(n25), .D(MuxB[21]), .Y(n105) );
  oa4f0 U197 ( .A(n190), .B(MuxA[22]), .C(C3_DATA6_22), .D(n29), .Y(n106) );
  mx2a2 U198 ( .D0(PC[22]), .D1(ReadData1[22]), .S(ALUSelA), .Y(MuxA[22]) );
  oa4f0 U199 ( .A(n145), .B(MuxB[22]), .C(n25), .D(MuxB[20]), .Y(n108) );
  oa4f0 U200 ( .A(n187), .B(MuxA[21]), .C(C3_DATA6_21), .D(n149), .Y(n109) );
  mx2a2 U201 ( .D0(PC[21]), .D1(ReadData1[21]), .S(ALUSelA), .Y(MuxA[21]) );
  oa4f0 U202 ( .A(n27), .B(MuxB[21]), .C(n25), .D(MuxB[19]), .Y(n111) );
  oa4f0 U203 ( .A(n184), .B(MuxA[20]), .C(C3_DATA6_20), .D(n149), .Y(n112) );
  mx2a2 U204 ( .D0(PC[20]), .D1(ReadData1[20]), .S(ALUSelA), .Y(MuxA[20]) );
  oa4f0 U205 ( .A(n145), .B(MuxB[19]), .C(n26), .D(MuxB[17]), .Y(n120) );
  oa4f0 U206 ( .A(n175), .B(MuxA[18]), .C(C3_DATA6_18), .D(n149), .Y(n121) );
  oa4f0 U207 ( .A(n27), .B(MuxB[18]), .C(n25), .D(MuxB[16]), .Y(n123) );
  oa4f0 U208 ( .A(n172), .B(MuxA[17]), .C(C3_DATA6_17), .D(n29), .Y(n124) );
  oa4f0 U209 ( .A(n145), .B(MuxB[17]), .C(n26), .D(MuxB[15]), .Y(n126) );
  oa4f0 U210 ( .A(n169), .B(MuxA[16]), .C(C3_DATA6_16), .D(n28), .Y(n127) );
  oa4f0 U211 ( .A(n27), .B(MuxB[16]), .C(MuxB[15]), .D(n128), .Y(n129) );
  ao1c0 U212 ( .A(n39), .B(MuxA[15]), .C(n37), .Y(n128) );
  oa4f0 U213 ( .A(n167), .B(MuxA[15]), .C(C3_DATA6_15), .D(n29), .Y(n130) );
  oa4f0 U214 ( .A(n145), .B(MuxB[20]), .C(n25), .D(MuxB[18]), .Y(n117) );
  oa4f0 U215 ( .A(n178), .B(MuxA[19]), .C(C3_DATA6_19), .D(n149), .Y(n118) );
  mx2a2 U216 ( .D0(PC[15]), .D1(ReadData1[15]), .S(n43), .Y(MuxA[15]) );
  mx2a2 U217 ( .D0(PC[16]), .D1(ReadData1[16]), .S(n43), .Y(MuxA[16]) );
  mx2a2 U218 ( .D0(PC[17]), .D1(ReadData1[17]), .S(ALUSelA), .Y(MuxA[17]) );
  mx2a2 U219 ( .D0(PC[18]), .D1(ReadData1[18]), .S(ALUSelA), .Y(MuxA[18]) );
  mx2a2 U220 ( .D0(PC[19]), .D1(ReadData1[19]), .S(ALUSelA), .Y(MuxA[19]) );
  oa4f0 U221 ( .A(n27), .B(MuxB[15]), .C(MuxB[14]), .D(n132), .Y(n133) );
  ao1c0 U222 ( .A(n39), .B(MuxA[14]), .C(n37), .Y(n132) );
  oa4f0 U223 ( .A(n165), .B(MuxA[14]), .C(C3_DATA6_14), .D(n149), .Y(n134) );
  mx2a2 U224 ( .D0(PC[14]), .D1(ReadData1[14]), .S(n43), .Y(MuxA[14]) );
  oa4f0 U225 ( .A(n27), .B(MuxB[14]), .C(n26), .D(MuxB[12]), .Y(n137) );
  ao4a2 U226 ( .A(n44), .B(Instruction[14]), .C(n47), .D(ReadData2[14]), .Y(
        MuxB[14]) );
  oa4f0 U227 ( .A(n162), .B(MuxA[13]), .C(C3_DATA6_13), .D(n29), .Y(n138) );
  mx2a2 U228 ( .D0(PC[13]), .D1(ReadData1[13]), .S(n43), .Y(MuxA[13]) );
  oa4f0 U229 ( .A(n27), .B(MuxB[13]), .C(n26), .D(MuxB[11]), .Y(n140) );
  ao4a2 U230 ( .A(n44), .B(Instruction[13]), .C(n47), .D(ReadData2[13]), .Y(
        MuxB[13]) );
  oa4f0 U231 ( .A(n159), .B(MuxA[12]), .C(C3_DATA6_12), .D(n149), .Y(n141) );
  mx2a2 U232 ( .D0(PC[12]), .D1(ReadData1[12]), .S(n43), .Y(MuxA[12]) );
  oa4f0 U233 ( .A(n27), .B(MuxB[12]), .C(n26), .D(MuxB[10]), .Y(n143) );
  ao4a2 U234 ( .A(n44), .B(Instruction[12]), .C(n47), .D(ReadData2[12]), .Y(
        MuxB[12]) );
  oa4f0 U235 ( .A(n156), .B(MuxA[11]), .C(C3_DATA6_11), .D(n29), .Y(n144) );
  mx2a2 U236 ( .D0(PC[11]), .D1(ReadData1[11]), .S(n43), .Y(MuxA[11]) );
  oa4f0 U237 ( .A(n27), .B(MuxB[11]), .C(n26), .D(MuxB[9]), .Y(n147) );
  ao4a2 U238 ( .A(n44), .B(Instruction[11]), .C(n47), .D(ReadData2[11]), .Y(
        MuxB[11]) );
  oa4f0 U239 ( .A(n153), .B(MuxA[10]), .C(C3_DATA6_10), .D(n149), .Y(n148) );
  mx2a2 U240 ( .D0(PC[10]), .D1(ReadData1[10]), .S(ALUSelA), .Y(MuxA[10]) );
  oa4f0 U241 ( .A(n145), .B(MuxB[10]), .C(MuxB[9]), .D(n51), .Y(n52) );
  ao1c0 U242 ( .A(n241), .B(MuxA[9]), .C(n38), .Y(n51) );
  ao4a2 U243 ( .A(n44), .B(Instruction[10]), .C(n23), .D(ReadData2[10]), .Y(
        MuxB[10]) );
  oa4f0 U244 ( .A(n242), .B(MuxA[9]), .C(C3_DATA6_9), .D(n29), .Y(n53) );
  mx2a2 U245 ( .D0(PC[9]), .D1(ReadData1[9]), .S(n43), .Y(MuxA[9]) );
  oa4f0 U246 ( .A(n27), .B(MuxB[9]), .C(n26), .D(MuxB[7]), .Y(n56) );
  ao4a2 U247 ( .A(n44), .B(Instruction[9]), .C(n23), .D(ReadData2[9]), .Y(
        MuxB[9]) );
  oa4f0 U248 ( .A(n236), .B(MuxA[8]), .C(C3_DATA6_8), .D(n29), .Y(n57) );
  mx2a2 U249 ( .D0(PC[8]), .D1(ReadData1[8]), .S(n43), .Y(MuxA[8]) );
  oa4f0 U250 ( .A(n145), .B(MuxB[8]), .C(n26), .D(MuxB[6]), .Y(n59) );
  ao4a2 U251 ( .A(n44), .B(Instruction[8]), .C(n23), .D(ReadData2[8]), .Y(
        MuxB[8]) );
  oa4f0 U252 ( .A(n233), .B(MuxA[7]), .C(C3_DATA6_7), .D(n29), .Y(n60) );
  mx2a2 U253 ( .D0(PC[7]), .D1(ReadData1[7]), .S(n43), .Y(MuxA[7]) );
  oa4f0 U254 ( .A(n27), .B(MuxB[7]), .C(n231), .D(MuxB[6]), .Y(n61) );
  ao4a2 U255 ( .A(n44), .B(Instruction[7]), .C(n23), .D(ReadData2[7]), .Y(
        MuxB[7]) );
  oa4f0 U256 ( .A(n230), .B(MuxA[6]), .C(C3_DATA6_6), .D(n29), .Y(n62) );
  mx2a2 U257 ( .D0(PC[6]), .D1(ReadData1[6]), .S(n43), .Y(MuxA[6]) );
  oa4f0 U258 ( .A(n26), .B(MuxB[4]), .C(n227), .D(MuxB[5]), .Y(n63) );
  oa4f0 U259 ( .A(C3_DATA6_5), .B(n29), .C(n228), .D(MuxA[5]), .Y(n64) );
  mx2a2 U260 ( .D0(PC[5]), .D1(ReadData1[5]), .S(n43), .Y(MuxA[5]) );
  ao4a2 U261 ( .A(n44), .B(Instruction[6]), .C(n23), .D(ReadData2[6]), .Y(
        MuxB[6]) );
  oa4f0 U262 ( .A(n26), .B(MuxB[3]), .C(MuxB[4]), .D(n66), .Y(n67) );
  ao1c0 U263 ( .A(n241), .B(MuxA[4]), .C(n37), .Y(n66) );
  oa4f0 U264 ( .A(n225), .B(MuxA[4]), .C(C3_DATA6_4), .D(n28), .Y(n68) );
  mx2a2 U265 ( .D0(PC[4]), .D1(ReadData1[4]), .S(n43), .Y(MuxA[4]) );
  oa4f0 U266 ( .A(n145), .B(MuxB[4]), .C(n26), .D(MuxB[2]), .Y(n71) );
  ao4a2 U267 ( .A(n44), .B(Instruction[4]), .C(n23), .D(ReadData2[4]), .Y(
        MuxB[4]) );
  oa4f0 U268 ( .A(n222), .B(MuxA[3]), .C(C3_DATA6_3), .D(n28), .Y(n72) );
  mx2a2 U269 ( .D0(PC[3]), .D1(ReadData1[3]), .S(n43), .Y(MuxA[3]) );
  oa4f0 U270 ( .A(n27), .B(MuxB[3]), .C(n26), .D(MuxB[1]), .Y(n81) );
  ao4a2 U271 ( .A(n44), .B(Instruction[3]), .C(n23), .D(ReadData2[3]), .Y(
        MuxB[3]) );
  oa4f0 U272 ( .A(n214), .B(MuxA[2]), .C(C3_DATA6_2), .D(n28), .Y(n82) );
  mx2a2 U273 ( .D0(PC[2]), .D1(ReadData1[2]), .S(n43), .Y(MuxA[2]) );
  oa4f0 U274 ( .A(n145), .B(MuxB[2]), .C(n26), .D(DP_OP_27J1_124_8182_n101), 
        .Y(n114) );
  ao4a2 U275 ( .A(n44), .B(Instruction[2]), .C(n47), .D(ReadData2[2]), .Y(
        MuxB[2]) );
  oa4f0 U276 ( .A(n181), .B(MuxA[1]), .C(C3_DATA6_1), .D(n28), .Y(n115) );
  mx2a2 U277 ( .D0(PC[1]), .D1(ReadData1[1]), .S(n43), .Y(MuxA[1]) );
  mx2a2 U278 ( .D0(PC[0]), .D1(ReadData1[0]), .S(n43), .Y(MuxA[0]) );
  oa4a2 U279 ( .A(Instruction[0]), .B(n45), .C(ReadData2[0]), .D(n24), .Y(
        DP_OP_27J1_124_8182_n101) );
  inv1a1 U280 ( .A(n244), .Y(n50) );
  ao4a2 U281 ( .A(Instruction[1]), .B(n44), .C(n47), .D(ReadData2[1]), .Y(
        MuxB[1]) );
  inv1a1 U282 ( .A(n37), .Y(n33) );
  buf1a2 U283 ( .A(n238), .Y(n30) );
  buf1a2 U284 ( .A(n30), .Y(n31) );
  buf1a2 U285 ( .A(n241), .Y(n42) );
  buf1a2 U286 ( .A(n241), .Y(n41) );
  buf1a2 U287 ( .A(n241), .Y(n40) );
  buf1a2 U288 ( .A(n241), .Y(n39) );
  buf1a2 U289 ( .A(n149), .Y(n29) );
  buf1a2 U290 ( .A(n149), .Y(n28) );
  buf1a2 U291 ( .A(DP_OP_27J1_124_8182_n100), .Y(n21) );
  buf1a2 U292 ( .A(DP_OP_27J1_124_8182_n100), .Y(n22) );
  ao1d1 U293 ( .A(Instruction[5]), .B(n44), .C(n69), .Y(MuxB[5]) );
  ao2i0 U294 ( .A(n41), .B(MuxA[10]), .C(n36), .D(n152), .Y(n154) );
  ao1f1 U295 ( .A(n42), .B(MuxB[10]), .C(n36), .Y(n153) );
  ao1f1 U296 ( .A(n40), .B(MuxA[11]), .C(n36), .Y(n157) );
  ao2i0 U297 ( .A(n40), .B(MuxB[11]), .C(n35), .D(n155), .Y(n156) );
  ao1f1 U298 ( .A(n41), .B(MuxA[12]), .C(n240), .Y(n160) );
  ao2i0 U299 ( .A(n40), .B(MuxB[12]), .C(n34), .D(n158), .Y(n159) );
  ao1f1 U300 ( .A(n41), .B(MuxA[13]), .C(n32), .Y(n163) );
  ao2i0 U301 ( .A(n39), .B(MuxB[13]), .C(n34), .D(n161), .Y(n162) );
  ao2i0 U302 ( .A(n40), .B(MuxB[14]), .C(n35), .D(n164), .Y(n165) );
  ao2i0 U303 ( .A(n39), .B(MuxB[15]), .C(n34), .D(n166), .Y(n167) );
  ao1f1 U304 ( .A(n40), .B(MuxA[16]), .C(n36), .Y(n170) );
  ao2i0 U305 ( .A(n39), .B(MuxB[16]), .C(n35), .D(n168), .Y(n169) );
  ao1f1 U306 ( .A(n40), .B(MuxA[17]), .C(n240), .Y(n173) );
  ao2i0 U307 ( .A(n41), .B(MuxB[17]), .C(n35), .D(n171), .Y(n172) );
  ao2i0 U308 ( .A(n40), .B(MuxB[18]), .C(n35), .D(n174), .Y(n175) );
  ao1f1 U309 ( .A(n241), .B(MuxA[19]), .C(n33), .Y(n179) );
  ao2i0 U310 ( .A(n42), .B(MuxB[19]), .C(n35), .D(n177), .Y(n178) );
  ao1f1 U311 ( .A(n41), .B(MuxA[1]), .C(n33), .Y(n182) );
  ao2i0 U312 ( .A(n42), .B(MuxB[1]), .C(n35), .D(n180), .Y(n181) );
  ao1f1 U313 ( .A(n39), .B(MuxA[20]), .C(n33), .Y(n185) );
  ao2i0 U314 ( .A(n241), .B(MuxB[20]), .C(n35), .D(n183), .Y(n184) );
  ao1f1 U315 ( .A(n41), .B(MuxA[21]), .C(n33), .Y(n188) );
  ao2i0 U316 ( .A(n39), .B(MuxB[21]), .C(n36), .D(n186), .Y(n187) );
  ao1f1 U317 ( .A(n42), .B(MuxA[22]), .C(n33), .Y(n191) );
  ao2i0 U318 ( .A(n39), .B(MuxB[22]), .C(n35), .D(n189), .Y(n190) );
  ao1f1 U319 ( .A(n42), .B(MuxA[23]), .C(n33), .Y(n194) );
  ao2i0 U320 ( .A(n39), .B(MuxB[23]), .C(n35), .D(n192), .Y(n193) );
  ao1f1 U321 ( .A(n241), .B(MuxA[24]), .C(n33), .Y(n197) );
  ao2i0 U322 ( .A(n40), .B(MuxB[24]), .C(n36), .D(n195), .Y(n196) );
  ao1f1 U323 ( .A(n39), .B(MuxA[25]), .C(n240), .Y(n200) );
  ao2i0 U324 ( .A(n39), .B(MuxB[25]), .C(n35), .D(n198), .Y(n199) );
  ao1f1 U325 ( .A(n241), .B(MuxA[26]), .C(n240), .Y(n203) );
  ao2i0 U326 ( .A(n40), .B(MuxB[26]), .C(n35), .D(n201), .Y(n202) );
  ao1f1 U327 ( .A(n241), .B(MuxA[27]), .C(n33), .Y(n206) );
  ao2i0 U328 ( .A(n41), .B(MuxB[27]), .C(n35), .D(n204), .Y(n205) );
  ao1f1 U329 ( .A(n241), .B(MuxA[28]), .C(n34), .Y(n209) );
  ao2i0 U330 ( .A(n42), .B(MuxB[28]), .C(n35), .D(n207), .Y(n208) );
  ao1f1 U331 ( .A(n41), .B(MuxA[29]), .C(n240), .Y(n212) );
  ao2i0 U332 ( .A(n40), .B(MuxB[29]), .C(n35), .D(n210), .Y(n211) );
  ao1f1 U333 ( .A(n40), .B(MuxA[2]), .C(n36), .Y(n215) );
  ao2i0 U334 ( .A(n41), .B(MuxB[2]), .C(n35), .D(n213), .Y(n214) );
  ao2i0 U335 ( .A(n41), .B(MuxB[30]), .C(n34), .D(n216), .Y(n217) );
  ao2i0 U336 ( .A(n41), .B(MuxB[31]), .C(n35), .D(n218), .Y(n220) );
  ao1f1 U337 ( .A(n39), .B(MuxA[31]), .C(n32), .Y(n219) );
  ao1f1 U338 ( .A(n42), .B(MuxA[3]), .C(n32), .Y(n223) );
  ao2i0 U339 ( .A(n41), .B(MuxB[3]), .C(n34), .D(n221), .Y(n222) );
  ao2i0 U340 ( .A(n42), .B(MuxB[4]), .C(n36), .D(n224), .Y(n225) );
  ao2i0 U341 ( .A(n40), .B(MuxB[5]), .C(n36), .D(n226), .Y(n228) );
  ao1f1 U342 ( .A(n41), .B(MuxA[5]), .C(n32), .Y(n227) );
  ao1f1 U343 ( .A(n40), .B(MuxA[6]), .C(n32), .Y(n231) );
  ao2i0 U344 ( .A(n42), .B(MuxB[6]), .C(n36), .D(n229), .Y(n230) );
  ao1f1 U345 ( .A(n39), .B(MuxA[7]), .C(n32), .Y(n234) );
  ao2i0 U346 ( .A(n42), .B(MuxB[7]), .C(n34), .D(n232), .Y(n233) );
  ao1f1 U347 ( .A(n42), .B(MuxA[8]), .C(n32), .Y(n237) );
  ao2i0 U348 ( .A(n42), .B(MuxB[8]), .C(n34), .D(n235), .Y(n236) );
  ao2i0 U349 ( .A(MuxB[9]), .B(n42), .C(n34), .D(n239), .Y(n242) );
endmodule


module mRegister ( Clk, Reset, Read1RegSel, Read2RegSel, WriteRegSel, 
        WriteRegData, WriteReg, Reg1Data, Reg2Data );
  input [1:0] Read1RegSel;
  input [1:0] Read2RegSel;
  input [1:0] WriteRegSel;
  input [31:0] WriteRegData;
  output [31:0] Reg1Data;
  output [31:0] Reg2Data;
  input Clk, Reset, WriteReg;
  wire   n64, n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n165, n167, n168, n169, n170, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n65, n66, n67,
         n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80, n81,
         n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95,
         n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n113, n114, n115, n116, n117, n118,
         n119, n120, n121, n122, n123, n124, n125, n126, n127, n161, n162,
         n163, n164, n166, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212;
  wire   [31:0] register0;
  wire   [31:0] register1;
  wire   [31:0] register2;

  fdem1a2 register2_reg_0_ ( .D0(n128), .D1(n23), .S(WriteRegData[0]), .E(n14), 
        .CLK(Clk), .Q(register2[0]) );
  fdem1a2 register1_reg_31_ ( .D0(n128), .D1(n23), .S(WriteRegData[31]), .E(
        n17), .CLK(Clk), .Q(register1[31]) );
  fdem1a2 register1_reg_30_ ( .D0(n128), .D1(n27), .S(WriteRegData[30]), .E(
        n17), .CLK(Clk), .Q(register1[30]) );
  fdem1a2 register1_reg_29_ ( .D0(n128), .D1(n29), .S(WriteRegData[29]), .E(
        n17), .CLK(Clk), .Q(register1[29]) );
  fdem1a2 register1_reg_28_ ( .D0(n128), .D1(n22), .S(WriteRegData[28]), .E(
        n17), .CLK(Clk), .Q(register1[28]) );
  fdem1a2 register1_reg_27_ ( .D0(n128), .D1(n22), .S(WriteRegData[27]), .E(
        n16), .CLK(Clk), .Q(register1[27]) );
  fdem1a2 register1_reg_26_ ( .D0(n128), .D1(n22), .S(WriteRegData[26]), .E(
        n16), .CLK(Clk), .Q(register1[26]) );
  fdem1a2 register1_reg_25_ ( .D0(n128), .D1(n22), .S(WriteRegData[25]), .E(
        n16), .CLK(Clk), .Q(register1[25]) );
  fdem1a2 register1_reg_24_ ( .D0(n128), .D1(n22), .S(WriteRegData[24]), .E(
        n16), .CLK(Clk), .Q(register1[24]) );
  fdem1a2 register1_reg_23_ ( .D0(n128), .D1(n24), .S(WriteRegData[23]), .E(
        n16), .CLK(Clk), .Q(register1[23]) );
  fdem1a2 register1_reg_22_ ( .D0(n128), .D1(n24), .S(WriteRegData[22]), .E(
        n16), .CLK(Clk), .Q(register1[22]) );
  fdem1a2 register1_reg_21_ ( .D0(n128), .D1(n21), .S(WriteRegData[21]), .E(
        n16), .CLK(Clk), .Q(register1[21]) );
  fdem1a2 register1_reg_20_ ( .D0(n128), .D1(n28), .S(WriteRegData[20]), .E(
        n16), .CLK(Clk), .Q(register1[20]) );
  fdem1a2 register1_reg_19_ ( .D0(n128), .D1(n25), .S(WriteRegData[19]), .E(
        n16), .CLK(Clk), .Q(register1[19]) );
  fdem1a2 register1_reg_18_ ( .D0(n128), .D1(n21), .S(WriteRegData[18]), .E(
        n16), .CLK(Clk), .Q(register1[18]) );
  fdem1a2 register1_reg_17_ ( .D0(n128), .D1(n26), .S(WriteRegData[17]), .E(
        n17), .CLK(Clk), .Q(register1[17]) );
  fdem1a2 register1_reg_16_ ( .D0(n128), .D1(n29), .S(WriteRegData[16]), .E(
        n16), .CLK(Clk), .Q(register1[16]) );
  fdem1a2 register1_reg_15_ ( .D0(n128), .D1(n28), .S(WriteRegData[15]), .E(
        n17), .CLK(Clk), .Q(register1[15]) );
  fdem1a2 register1_reg_14_ ( .D0(n128), .D1(n24), .S(WriteRegData[14]), .E(
        n16), .CLK(Clk), .Q(register1[14]) );
  fdem1a2 register1_reg_13_ ( .D0(n128), .D1(n24), .S(WriteRegData[13]), .E(
        n169), .CLK(Clk), .Q(register1[13]) );
  fdem1a2 register1_reg_12_ ( .D0(n128), .D1(n24), .S(WriteRegData[12]), .E(
        n17), .CLK(Clk), .Q(register1[12]) );
  fdem1a2 register1_reg_11_ ( .D0(n128), .D1(n24), .S(WriteRegData[11]), .E(
        n17), .CLK(Clk), .Q(register1[11]) );
  fdem1a2 register1_reg_10_ ( .D0(n128), .D1(n24), .S(WriteRegData[10]), .E(
        n16), .CLK(Clk), .Q(register1[10]) );
  fdem1a2 register1_reg_9_ ( .D0(n128), .D1(n28), .S(WriteRegData[9]), .E(n16), 
        .CLK(Clk), .Q(register1[9]) );
  fdem1a2 register1_reg_8_ ( .D0(n128), .D1(n29), .S(WriteRegData[8]), .E(n16), 
        .CLK(Clk), .Q(register1[8]) );
  fdem1a2 register1_reg_7_ ( .D0(n128), .D1(n27), .S(WriteRegData[7]), .E(n16), 
        .CLK(Clk), .Q(register1[7]) );
  fdem1a2 register1_reg_6_ ( .D0(n128), .D1(n21), .S(WriteRegData[6]), .E(n169), .CLK(Clk), .Q(register1[6]) );
  fdem1a2 register1_reg_5_ ( .D0(n128), .D1(n28), .S(WriteRegData[5]), .E(n17), 
        .CLK(Clk), .Q(register1[5]) );
  fdem1a2 register1_reg_4_ ( .D0(n128), .D1(n29), .S(WriteRegData[4]), .E(n16), 
        .CLK(Clk), .Q(register1[4]) );
  fdem1a2 register1_reg_3_ ( .D0(n128), .D1(n27), .S(WriteRegData[3]), .E(n17), 
        .CLK(Clk), .Q(register1[3]) );
  fdem1a2 register1_reg_2_ ( .D0(n128), .D1(n25), .S(WriteRegData[2]), .E(n16), 
        .CLK(Clk), .Q(register1[2]) );
  fdem1a2 register1_reg_1_ ( .D0(n128), .D1(n21), .S(WriteRegData[1]), .E(n17), 
        .CLK(Clk), .Q(register1[1]) );
  fdem1a2 register2_reg_31_ ( .D0(n128), .D1(n26), .S(WriteRegData[31]), .E(
        n15), .CLK(Clk), .Q(register2[31]) );
  fdem1a2 register2_reg_30_ ( .D0(n128), .D1(n21), .S(WriteRegData[30]), .E(
        n15), .CLK(Clk), .Q(register2[30]) );
  fdem1a2 register2_reg_29_ ( .D0(n128), .D1(n21), .S(WriteRegData[29]), .E(
        n15), .CLK(Clk), .Q(register2[29]) );
  fdem1a2 register2_reg_28_ ( .D0(n128), .D1(n21), .S(WriteRegData[28]), .E(
        n15), .CLK(Clk), .Q(register2[28]) );
  fdem1a2 register2_reg_27_ ( .D0(n128), .D1(n25), .S(WriteRegData[27]), .E(
        n14), .CLK(Clk), .Q(register2[27]) );
  fdem1a2 register2_reg_26_ ( .D0(n128), .D1(n20), .S(WriteRegData[26]), .E(
        n14), .CLK(Clk), .Q(register2[26]) );
  fdem1a2 register2_reg_25_ ( .D0(n128), .D1(n20), .S(WriteRegData[25]), .E(
        n14), .CLK(Clk), .Q(register2[25]) );
  fdem1a2 register2_reg_24_ ( .D0(n128), .D1(n20), .S(WriteRegData[24]), .E(
        n14), .CLK(Clk), .Q(register2[24]) );
  fdem1a2 register2_reg_23_ ( .D0(n128), .D1(n20), .S(WriteRegData[23]), .E(
        n14), .CLK(Clk), .Q(register2[23]) );
  fdem1a2 register2_reg_22_ ( .D0(n128), .D1(n20), .S(WriteRegData[22]), .E(
        n14), .CLK(Clk), .Q(register2[22]) );
  fdem1a2 register2_reg_21_ ( .D0(n128), .D1(n20), .S(WriteRegData[21]), .E(
        n14), .CLK(Clk), .Q(register2[21]) );
  fdem1a2 register2_reg_20_ ( .D0(n128), .D1(n20), .S(WriteRegData[20]), .E(
        n14), .CLK(Clk), .Q(register2[20]) );
  fdem1a2 register2_reg_19_ ( .D0(n128), .D1(n19), .S(WriteRegData[19]), .E(
        n14), .CLK(Clk), .Q(register2[19]) );
  fdem1a2 register2_reg_18_ ( .D0(n128), .D1(n19), .S(WriteRegData[18]), .E(
        n14), .CLK(Clk), .Q(register2[18]) );
  fdem1a2 register2_reg_17_ ( .D0(n128), .D1(n19), .S(WriteRegData[17]), .E(
        n15), .CLK(Clk), .Q(register2[17]) );
  fdem1a2 register2_reg_16_ ( .D0(n128), .D1(n19), .S(WriteRegData[16]), .E(
        n14), .CLK(Clk), .Q(register2[16]) );
  fdem1a2 register2_reg_15_ ( .D0(n128), .D1(n19), .S(WriteRegData[15]), .E(
        n15), .CLK(Clk), .Q(register2[15]) );
  fdem1a2 register2_reg_14_ ( .D0(n128), .D1(n19), .S(WriteRegData[14]), .E(
        n14), .CLK(Clk), .Q(register2[14]) );
  fdem1a2 register2_reg_13_ ( .D0(n128), .D1(n19), .S(WriteRegData[13]), .E(
        n170), .CLK(Clk), .Q(register2[13]) );
  fdem1a2 register2_reg_12_ ( .D0(n128), .D1(n23), .S(WriteRegData[12]), .E(
        n15), .CLK(Clk), .Q(register2[12]) );
  fdem1a2 register2_reg_11_ ( .D0(n128), .D1(n23), .S(WriteRegData[11]), .E(
        n15), .CLK(Clk), .Q(register2[11]) );
  fdem1a2 register2_reg_10_ ( .D0(n128), .D1(n25), .S(WriteRegData[10]), .E(
        n14), .CLK(Clk), .Q(register2[10]) );
  fdem1a2 register2_reg_9_ ( .D0(n128), .D1(n28), .S(WriteRegData[9]), .E(n14), 
        .CLK(Clk), .Q(register2[9]) );
  fdem1a2 register2_reg_8_ ( .D0(n128), .D1(n28), .S(WriteRegData[8]), .E(n14), 
        .CLK(Clk), .Q(register2[8]) );
  fdem1a2 register2_reg_7_ ( .D0(n128), .D1(n26), .S(WriteRegData[7]), .E(n14), 
        .CLK(Clk), .Q(register2[7]) );
  fdem1a2 register2_reg_6_ ( .D0(n128), .D1(n29), .S(WriteRegData[6]), .E(n170), .CLK(Clk), .Q(register2[6]) );
  fdem1a2 register2_reg_5_ ( .D0(n128), .D1(n22), .S(WriteRegData[5]), .E(n15), 
        .CLK(Clk), .Q(register2[5]) );
  fdem1a2 register2_reg_4_ ( .D0(n128), .D1(n22), .S(WriteRegData[4]), .E(n14), 
        .CLK(Clk), .Q(register2[4]) );
  fdem1a2 register2_reg_3_ ( .D0(n128), .D1(n23), .S(WriteRegData[3]), .E(n15), 
        .CLK(Clk), .Q(register2[3]) );
  fdem1a2 register2_reg_2_ ( .D0(n128), .D1(n23), .S(WriteRegData[2]), .E(n14), 
        .CLK(Clk), .Q(register2[2]) );
  fdem1a2 register2_reg_1_ ( .D0(n128), .D1(n23), .S(WriteRegData[1]), .E(n15), 
        .CLK(Clk), .Q(register2[1]) );
  fdem1a2 register0_reg_31_ ( .D0(n128), .D1(n27), .S(WriteRegData[31]), .E(
        n34), .CLK(Clk), .Q(register0[31]) );
  fdem1a2 register0_reg_30_ ( .D0(n128), .D1(n25), .S(WriteRegData[30]), .E(
        n34), .CLK(Clk), .Q(register0[30]) );
  fdem1a2 register0_reg_29_ ( .D0(n128), .D1(n26), .S(WriteRegData[29]), .E(
        n34), .CLK(Clk), .Q(register0[29]) );
  fdem1a2 register0_reg_28_ ( .D0(n128), .D1(n27), .S(WriteRegData[28]), .E(
        n34), .CLK(Clk), .Q(register0[28]) );
  fdem1a2 register0_reg_27_ ( .D0(n128), .D1(n29), .S(WriteRegData[27]), .E(
        n33), .CLK(Clk), .Q(register0[27]) );
  fdem1a2 register0_reg_26_ ( .D0(n128), .D1(n25), .S(WriteRegData[26]), .E(
        n33), .CLK(Clk), .Q(register0[26]) );
  fdem1a2 register0_reg_25_ ( .D0(n128), .D1(n28), .S(WriteRegData[25]), .E(
        n33), .CLK(Clk), .Q(register0[25]) );
  fdem1a2 register0_reg_24_ ( .D0(n128), .D1(n25), .S(WriteRegData[24]), .E(
        n33), .CLK(Clk), .Q(register0[24]) );
  fdem1a2 register0_reg_23_ ( .D0(n128), .D1(n25), .S(WriteRegData[23]), .E(
        n33), .CLK(Clk), .Q(register0[23]) );
  fdem1a2 register0_reg_22_ ( .D0(n128), .D1(n27), .S(WriteRegData[22]), .E(
        n33), .CLK(Clk), .Q(register0[22]) );
  fdem1a2 register0_reg_21_ ( .D0(n128), .D1(n28), .S(WriteRegData[21]), .E(
        n33), .CLK(Clk), .Q(register0[21]) );
  fdem1a2 register0_reg_20_ ( .D0(n128), .D1(n29), .S(WriteRegData[20]), .E(
        n33), .CLK(Clk), .Q(register0[20]) );
  fdem1a2 register0_reg_19_ ( .D0(n128), .D1(n26), .S(WriteRegData[19]), .E(
        n33), .CLK(Clk), .Q(register0[19]) );
  fdem1a2 register0_reg_18_ ( .D0(n128), .D1(n29), .S(WriteRegData[18]), .E(
        n33), .CLK(Clk), .Q(register0[18]) );
  fdem1a2 register0_reg_17_ ( .D0(n128), .D1(n21), .S(WriteRegData[17]), .E(
        n34), .CLK(Clk), .Q(register0[17]) );
  fdem1a2 register0_reg_16_ ( .D0(n128), .D1(n21), .S(WriteRegData[16]), .E(
        n33), .CLK(Clk), .Q(register0[16]) );
  fdem1a2 register0_reg_15_ ( .D0(n128), .D1(n28), .S(WriteRegData[15]), .E(
        n34), .CLK(Clk), .Q(register0[15]) );
  fdem1a2 register0_reg_14_ ( .D0(n128), .D1(n25), .S(WriteRegData[14]), .E(
        n33), .CLK(Clk), .Q(register0[14]) );
  fdem1a2 register0_reg_13_ ( .D0(n128), .D1(n21), .S(WriteRegData[13]), .E(
        n165), .CLK(Clk), .Q(register0[13]) );
  fdem1a2 register0_reg_12_ ( .D0(n128), .D1(n26), .S(WriteRegData[12]), .E(
        n34), .CLK(Clk), .Q(register0[12]) );
  fdem1a2 register0_reg_11_ ( .D0(n128), .D1(n27), .S(WriteRegData[11]), .E(
        n34), .CLK(Clk), .Q(register0[11]) );
  fdem1a2 register0_reg_10_ ( .D0(n128), .D1(n21), .S(WriteRegData[10]), .E(
        n33), .CLK(Clk), .Q(register0[10]) );
  fdem1a2 register0_reg_9_ ( .D0(n128), .D1(n29), .S(WriteRegData[9]), .E(n33), 
        .CLK(Clk), .Q(register0[9]) );
  fdem1a2 register0_reg_8_ ( .D0(n128), .D1(n28), .S(WriteRegData[8]), .E(n33), 
        .CLK(Clk), .Q(register0[8]) );
  fdem1a2 register0_reg_7_ ( .D0(n128), .D1(n27), .S(WriteRegData[7]), .E(n33), 
        .CLK(Clk), .Q(register0[7]) );
  fdem1a2 register0_reg_6_ ( .D0(n128), .D1(n28), .S(WriteRegData[6]), .E(n165), .CLK(Clk), .Q(register0[6]) );
  fdem1a2 register0_reg_5_ ( .D0(n128), .D1(n29), .S(WriteRegData[5]), .E(n34), 
        .CLK(Clk), .Q(register0[5]) );
  fdem1a2 register0_reg_4_ ( .D0(n128), .D1(n29), .S(WriteRegData[4]), .E(n33), 
        .CLK(Clk), .Q(register0[4]) );
  fdem1a2 register0_reg_3_ ( .D0(n128), .D1(n27), .S(WriteRegData[3]), .E(n34), 
        .CLK(Clk), .Q(register0[3]) );
  fdem1a2 register0_reg_2_ ( .D0(n128), .D1(n27), .S(WriteRegData[2]), .E(n33), 
        .CLK(Clk), .Q(register0[2]) );
  fdem1a2 register0_reg_1_ ( .D0(n128), .D1(n27), .S(WriteRegData[1]), .E(n34), 
        .CLK(Clk), .Q(register0[1]) );
  fdem1a2 register1_reg_0_ ( .D0(n128), .D1(n26), .S(WriteRegData[0]), .E(n16), 
        .CLK(Clk), .Q(register1[0]) );
  fdem1a2 register0_reg_0_ ( .D0(n128), .D1(n26), .S(WriteRegData[0]), .E(n33), 
        .CLK(Clk), .Q(register0[0]) );
  fdem1a2 register3_reg_31_ ( .D0(n64), .D1(n18), .S(WriteRegData[31]), .E(n32), .CLK(Clk), .Q(n129) );
  fdem1a2 register3_reg_30_ ( .D0(n64), .D1(n30), .S(WriteRegData[30]), .E(n32), .CLK(Clk), .Q(n130) );
  fdem1a2 register3_reg_29_ ( .D0(n64), .D1(n18), .S(WriteRegData[29]), .E(n32), .CLK(Clk), .Q(n131) );
  fdem1a2 register3_reg_28_ ( .D0(n64), .D1(n18), .S(WriteRegData[28]), .E(n32), .CLK(Clk), .Q(n132) );
  fdem1a2 register3_reg_27_ ( .D0(n64), .D1(n18), .S(WriteRegData[27]), .E(n31), .CLK(Clk), .Q(n133) );
  fdem1a2 register3_reg_26_ ( .D0(n64), .D1(n18), .S(WriteRegData[26]), .E(n31), .CLK(Clk), .Q(n134) );
  fdem1a2 register3_reg_25_ ( .D0(n64), .D1(n30), .S(WriteRegData[25]), .E(n31), .CLK(Clk), .Q(n135) );
  fdem1a2 register3_reg_24_ ( .D0(n64), .D1(n18), .S(WriteRegData[24]), .E(n31), .CLK(Clk), .Q(n136) );
  fdem1a2 register3_reg_23_ ( .D0(n64), .D1(n18), .S(WriteRegData[23]), .E(n31), .CLK(Clk), .Q(n137) );
  fdem1a2 register3_reg_22_ ( .D0(n64), .D1(n30), .S(WriteRegData[22]), .E(n31), .CLK(Clk), .Q(n138) );
  fdem1a2 register3_reg_21_ ( .D0(n64), .D1(n30), .S(WriteRegData[21]), .E(n31), .CLK(Clk), .Q(n139) );
  fdem1a2 register3_reg_20_ ( .D0(n64), .D1(n18), .S(WriteRegData[20]), .E(n31), .CLK(Clk), .Q(n140) );
  fdem1a2 register3_reg_19_ ( .D0(n64), .D1(n18), .S(WriteRegData[19]), .E(n31), .CLK(Clk), .Q(n141) );
  fdem1a2 register3_reg_18_ ( .D0(n64), .D1(n30), .S(WriteRegData[18]), .E(n31), .CLK(Clk), .Q(n142) );
  fdem1a2 register3_reg_17_ ( .D0(n64), .D1(n30), .S(WriteRegData[17]), .E(n32), .CLK(Clk), .Q(n143) );
  fdem1a2 register3_reg_16_ ( .D0(n64), .D1(n18), .S(WriteRegData[16]), .E(n31), .CLK(Clk), .Q(n144) );
  fdem1a2 register3_reg_15_ ( .D0(n64), .D1(n30), .S(WriteRegData[15]), .E(n32), .CLK(Clk), .Q(n145) );
  fdem1a2 register3_reg_14_ ( .D0(n64), .D1(n30), .S(WriteRegData[14]), .E(n31), .CLK(Clk), .Q(n146) );
  fdem1a2 register3_reg_13_ ( .D0(n64), .D1(n168), .S(WriteRegData[13]), .E(
        n167), .CLK(Clk), .Q(n147) );
  fdem1a2 register3_reg_12_ ( .D0(n64), .D1(n30), .S(WriteRegData[12]), .E(n32), .CLK(Clk), .Q(n148) );
  fdem1a2 register3_reg_11_ ( .D0(n64), .D1(n168), .S(WriteRegData[11]), .E(
        n32), .CLK(Clk), .Q(n149) );
  fdem1a2 register3_reg_10_ ( .D0(n64), .D1(n18), .S(WriteRegData[10]), .E(n31), .CLK(Clk), .Q(n150) );
  fdem1a2 register3_reg_9_ ( .D0(n64), .D1(n18), .S(WriteRegData[9]), .E(n31), 
        .CLK(Clk), .Q(n151) );
  fdem1a2 register3_reg_8_ ( .D0(n64), .D1(n168), .S(WriteRegData[8]), .E(n31), 
        .CLK(Clk), .Q(n152) );
  fdem1a2 register3_reg_7_ ( .D0(n64), .D1(n168), .S(WriteRegData[7]), .E(n31), 
        .CLK(Clk), .Q(n153) );
  fdem1a2 register3_reg_6_ ( .D0(n64), .D1(n168), .S(WriteRegData[6]), .E(n167), .CLK(Clk), .Q(n154) );
  fdem1a2 register3_reg_5_ ( .D0(n64), .D1(n18), .S(WriteRegData[5]), .E(n32), 
        .CLK(Clk), .Q(n155) );
  fdem1a2 register3_reg_4_ ( .D0(n64), .D1(n18), .S(WriteRegData[4]), .E(n31), 
        .CLK(Clk), .Q(n156) );
  fdem1a2 register3_reg_3_ ( .D0(n64), .D1(n168), .S(WriteRegData[3]), .E(n32), 
        .CLK(Clk), .Q(n157) );
  fdem1a2 register3_reg_2_ ( .D0(n64), .D1(n18), .S(WriteRegData[2]), .E(n31), 
        .CLK(Clk), .Q(n158) );
  fdem1a2 register3_reg_1_ ( .D0(n64), .D1(n168), .S(WriteRegData[1]), .E(n32), 
        .CLK(Clk), .Q(n159) );
  fdem1a2 register3_reg_0_ ( .D0(n64), .D1(n18), .S(WriteRegData[0]), .E(n31), 
        .CLK(Clk), .Q(n160) );
  inv1a1 U3 ( .A(Reset), .Y(n212) );
  buf1a2 U4 ( .A(n209), .Y(n13) );
  inv1a1 U5 ( .A(n30), .Y(n19) );
  inv1a1 U6 ( .A(n30), .Y(n20) );
  inv1a2 U7 ( .A(n168), .Y(n25) );
  inv1a2 U8 ( .A(n30), .Y(n26) );
  inv1a2 U9 ( .A(n30), .Y(n29) );
  inv1a2 U10 ( .A(n30), .Y(n21) );
  inv1a2 U11 ( .A(n30), .Y(n27) );
  inv1a2 U12 ( .A(n168), .Y(n28) );
  buf1a2 U13 ( .A(n205), .Y(n10) );
  nor2a0 U14 ( .A(Read2RegSel[0]), .B(Read2RegSel[1]), .Y(n205) );
  buf1a4 U15 ( .A(n170), .Y(n14) );
  ao3h0 U16 ( .A(WriteRegSel[0]), .B(n30), .C(n211), .D(n212), .Y(n170) );
  buf1a4 U17 ( .A(n169), .Y(n16) );
  ao3h0 U18 ( .A(WriteRegSel[1]), .B(n168), .C(n210), .D(n212), .Y(n169) );
  buf1a4 U19 ( .A(n165), .Y(n33) );
  ao3h0 U20 ( .A(WriteRegSel[1]), .B(WriteRegSel[0]), .C(n30), .D(n212), .Y(
        n165) );
  buf1a4 U21 ( .A(n167), .Y(n31) );
  ao3h0 U22 ( .A(n168), .B(n211), .C(n210), .D(n212), .Y(n167) );
  inv1a0 U23 ( .A(WriteRegSel[0]), .Y(n210) );
  inv1a0 U24 ( .A(WriteRegSel[1]), .Y(n211) );
  buf1a4 U25 ( .A(n18), .Y(n30) );
  or2c2 U26 ( .A(WriteReg), .B(n212), .Y(n168) );
  nand2a0 U27 ( .A(n100), .B(register2[31]), .Y(n84) );
  nand2a0 U28 ( .A(n6), .B(register2[30]), .Y(n82) );
  nand2a0 U29 ( .A(n6), .B(register2[29]), .Y(n78) );
  nand2a0 U30 ( .A(n6), .B(register2[28]), .Y(n76) );
  nand2a0 U31 ( .A(n5), .B(register2[27]), .Y(n74) );
  nand2a0 U32 ( .A(n6), .B(register2[26]), .Y(n72) );
  nand2a0 U33 ( .A(n100), .B(register2[25]), .Y(n70) );
  nand2a0 U34 ( .A(n100), .B(register2[24]), .Y(n68) );
  nand2a0 U35 ( .A(n5), .B(register2[23]), .Y(n66) );
  nand2a0 U36 ( .A(n6), .B(register2[22]), .Y(n63) );
  nand2a0 U37 ( .A(n100), .B(register2[21]), .Y(n61) );
  nand2a0 U38 ( .A(n5), .B(register2[20]), .Y(n59) );
  nand2a0 U39 ( .A(n5), .B(register2[15]), .Y(n47) );
  nand2a0 U40 ( .A(n5), .B(register2[16]), .Y(n49) );
  nand2a0 U41 ( .A(n5), .B(register2[17]), .Y(n51) );
  nand2a0 U42 ( .A(n5), .B(register2[18]), .Y(n53) );
  nand2a0 U43 ( .A(n5), .B(register2[19]), .Y(n55) );
  nand2a0 U44 ( .A(n5), .B(register2[14]), .Y(n45) );
  nand2a0 U45 ( .A(n5), .B(register2[13]), .Y(n43) );
  nand2a0 U46 ( .A(n100), .B(register2[12]), .Y(n41) );
  nand2a0 U47 ( .A(n100), .B(register2[11]), .Y(n39) );
  nand2a0 U48 ( .A(n6), .B(register2[10]), .Y(n37) );
  nand2a0 U49 ( .A(n100), .B(register2[9]), .Y(n101) );
  nand2a0 U50 ( .A(n5), .B(register2[8]), .Y(n96) );
  nand2a0 U51 ( .A(n100), .B(register2[7]), .Y(n94) );
  nand2a0 U52 ( .A(n6), .B(register2[6]), .Y(n92) );
  nand2a0 U53 ( .A(n6), .B(register2[5]), .Y(n90) );
  nand2a0 U54 ( .A(n100), .B(register2[4]), .Y(n88) );
  nand2a0 U55 ( .A(n6), .B(register2[3]), .Y(n86) );
  nand2a0 U56 ( .A(n6), .B(register2[2]), .Y(n80) );
  nand2a0 U57 ( .A(n5), .B(register2[1]), .Y(n57) );
  nand2a0 U58 ( .A(register2[0]), .B(n6), .Y(n35) );
  and2c0 U59 ( .A(Read1RegSel[0]), .B(Read1RegSel[1]), .Y(n99) );
  nand2a0 U60 ( .A(Read1RegSel[0]), .B(Read1RegSel[1]), .Y(n103) );
  nand2a0 U61 ( .A(register2[31]), .B(n12), .Y(n190) );
  nand2a0 U62 ( .A(register2[30]), .B(n12), .Y(n188) );
  nand2a0 U63 ( .A(register2[28]), .B(n12), .Y(n182) );
  nand2a0 U64 ( .A(register2[26]), .B(n12), .Y(n178) );
  nand2a0 U65 ( .A(register2[24]), .B(n12), .Y(n174) );
  nand2a0 U66 ( .A(register2[23]), .B(n206), .Y(n172) );
  nand2a0 U67 ( .A(register2[22]), .B(n206), .Y(n166) );
  nand2a0 U68 ( .A(register2[20]), .B(n206), .Y(n161) );
  nand2a0 U69 ( .A(register2[18]), .B(n12), .Y(n122) );
  nand2a0 U70 ( .A(register2[15]), .B(n12), .Y(n116) );
  nand2a0 U71 ( .A(register2[13]), .B(n12), .Y(n112) );
  nand2a0 U72 ( .A(register2[11]), .B(n12), .Y(n108) );
  nand2a0 U73 ( .A(register2[10]), .B(n12), .Y(n106) );
  nand2a0 U74 ( .A(register2[9]), .B(n206), .Y(n207) );
  nand2a0 U75 ( .A(register2[8]), .B(n12), .Y(n202) );
  nand2a0 U76 ( .A(register2[7]), .B(n206), .Y(n200) );
  nand2a0 U77 ( .A(register2[6]), .B(n12), .Y(n198) );
  nand2a0 U78 ( .A(register2[5]), .B(n12), .Y(n196) );
  nand2a0 U79 ( .A(register2[4]), .B(n12), .Y(n194) );
  nand2a0 U80 ( .A(register2[3]), .B(n12), .Y(n192) );
  nand2a0 U81 ( .A(register2[2]), .B(n12), .Y(n186) );
  nand2a0 U82 ( .A(register2[1]), .B(n12), .Y(n126) );
  nor2b2 U83 ( .A(Read2RegSel[1]), .B(Read2RegSel[0]), .Y(n206) );
  nor2b2 U84 ( .A(Read2RegSel[0]), .B(Read2RegSel[1]), .Y(n204) );
  or2c2 U85 ( .A(Read2RegSel[0]), .B(Read2RegSel[1]), .Y(n209) );
  nand2a0 U86 ( .A(register2[29]), .B(n206), .Y(n184) );
  nand2a0 U87 ( .A(register2[27]), .B(n206), .Y(n180) );
  nand2a0 U88 ( .A(register2[25]), .B(n206), .Y(n176) );
  nand2a0 U89 ( .A(register2[21]), .B(n206), .Y(n163) );
  nand2a0 U90 ( .A(register2[19]), .B(n206), .Y(n124) );
  nand2a0 U91 ( .A(register2[17]), .B(n206), .Y(n120) );
  nand2a0 U92 ( .A(register2[16]), .B(n206), .Y(n118) );
  nand2a0 U93 ( .A(register2[14]), .B(n206), .Y(n114) );
  nand2a0 U94 ( .A(register2[12]), .B(n206), .Y(n110) );
  nand2a0 U95 ( .A(register2[0]), .B(n206), .Y(n104) );
  buf1a2 U96 ( .A(n16), .Y(n17) );
  buf1a2 U97 ( .A(n14), .Y(n15) );
  buf1a2 U98 ( .A(n33), .Y(n34) );
  buf1a2 U99 ( .A(n31), .Y(n32) );
  inv1a1 U100 ( .A(n18), .Y(n24) );
  inv1a1 U101 ( .A(n18), .Y(n22) );
  inv1a1 U102 ( .A(n18), .Y(n23) );
  buf1a2 U103 ( .A(n206), .Y(n12) );
  nor2b1 U104 ( .A(Read1RegSel[1]), .B(Read1RegSel[0]), .Y(n100) );
  nor2b1 U105 ( .A(Read1RegSel[0]), .B(Read1RegSel[1]), .Y(n98) );
  buf1a2 U106 ( .A(n98), .Y(n1) );
  buf1a2 U107 ( .A(n99), .Y(n4) );
  buf1a2 U108 ( .A(n103), .Y(n8) );
  buf1a2 U109 ( .A(n10), .Y(n11) );
  buf1a2 U110 ( .A(n103), .Y(n7) );
  buf1a2 U111 ( .A(n99), .Y(n3) );
  buf1a2 U112 ( .A(n204), .Y(n9) );
  buf1a2 U113 ( .A(n1), .Y(n2) );
  buf1a2 U114 ( .A(n100), .Y(n6) );
  buf1a2 U115 ( .A(n100), .Y(n5) );
  gnd U116 ( .Y(n128) );
  vdd U117 ( .Y(n64) );
  buf1a4 U118 ( .A(n168), .Y(n18) );
  oa4f0 U119 ( .A(register0[0]), .B(n99), .C(register1[0]), .D(n2), .Y(n36) );
  ao2i0 U120 ( .A(n160), .B(n7), .C(n36), .D(n35), .Y(Reg1Data[0]) );
  oa4f0 U121 ( .A(n3), .B(register0[10]), .C(n2), .D(register1[10]), .Y(n38)
         );
  ao2i0 U122 ( .A(n150), .B(n7), .C(n38), .D(n37), .Y(Reg1Data[10]) );
  oa4f0 U123 ( .A(n4), .B(register0[11]), .C(n2), .D(register1[11]), .Y(n40)
         );
  ao2i0 U124 ( .A(n149), .B(n8), .C(n40), .D(n39), .Y(Reg1Data[11]) );
  oa4f0 U125 ( .A(n4), .B(register0[12]), .C(n2), .D(register1[12]), .Y(n42)
         );
  ao2i0 U126 ( .A(n148), .B(n8), .C(n42), .D(n41), .Y(Reg1Data[12]) );
  oa4f0 U127 ( .A(n4), .B(register0[13]), .C(n1), .D(register1[13]), .Y(n44)
         );
  ao2i0 U128 ( .A(n147), .B(n7), .C(n44), .D(n43), .Y(Reg1Data[13]) );
  oa4f0 U129 ( .A(n3), .B(register0[14]), .C(n1), .D(register1[14]), .Y(n46)
         );
  ao2i0 U130 ( .A(n146), .B(n7), .C(n46), .D(n45), .Y(Reg1Data[14]) );
  oa4f0 U131 ( .A(n4), .B(register0[15]), .C(n1), .D(register1[15]), .Y(n48)
         );
  ao2i0 U132 ( .A(n145), .B(n7), .C(n48), .D(n47), .Y(Reg1Data[15]) );
  oa4f0 U133 ( .A(n3), .B(register0[16]), .C(n1), .D(register1[16]), .Y(n50)
         );
  ao2i0 U134 ( .A(n144), .B(n7), .C(n50), .D(n49), .Y(Reg1Data[16]) );
  oa4f0 U135 ( .A(n4), .B(register0[17]), .C(n1), .D(register1[17]), .Y(n52)
         );
  ao2i0 U136 ( .A(n143), .B(n8), .C(n52), .D(n51), .Y(Reg1Data[17]) );
  oa4f0 U137 ( .A(n3), .B(register0[18]), .C(n98), .D(register1[18]), .Y(n54)
         );
  ao2i0 U138 ( .A(n142), .B(n8), .C(n54), .D(n53), .Y(Reg1Data[18]) );
  oa4f0 U139 ( .A(n4), .B(register0[19]), .C(n98), .D(register1[19]), .Y(n56)
         );
  ao2i0 U140 ( .A(n141), .B(n7), .C(n56), .D(n55), .Y(Reg1Data[19]) );
  oa4f0 U141 ( .A(n4), .B(register0[1]), .C(n2), .D(register1[1]), .Y(n58) );
  ao2i0 U142 ( .A(n159), .B(n8), .C(n58), .D(n57), .Y(Reg1Data[1]) );
  oa4f0 U143 ( .A(n4), .B(register0[20]), .C(n98), .D(register1[20]), .Y(n60)
         );
  ao2i0 U144 ( .A(n140), .B(n7), .C(n60), .D(n59), .Y(Reg1Data[20]) );
  oa4f0 U145 ( .A(n3), .B(register0[21]), .C(n2), .D(register1[21]), .Y(n62)
         );
  ao2i0 U146 ( .A(n139), .B(n8), .C(n62), .D(n61), .Y(Reg1Data[21]) );
  oa4f0 U147 ( .A(n3), .B(register0[22]), .C(n1), .D(register1[22]), .Y(n65)
         );
  ao2i0 U148 ( .A(n138), .B(n7), .C(n65), .D(n63), .Y(Reg1Data[22]) );
  oa4f0 U149 ( .A(n3), .B(register0[23]), .C(n98), .D(register1[23]), .Y(n67)
         );
  ao2i0 U150 ( .A(n137), .B(n8), .C(n67), .D(n66), .Y(Reg1Data[23]) );
  oa4f0 U151 ( .A(n4), .B(register0[24]), .C(n2), .D(register1[24]), .Y(n69)
         );
  ao2i0 U152 ( .A(n136), .B(n7), .C(n69), .D(n68), .Y(Reg1Data[24]) );
  oa4f0 U153 ( .A(n4), .B(register0[25]), .C(n2), .D(register1[25]), .Y(n71)
         );
  ao2i0 U154 ( .A(n135), .B(n7), .C(n71), .D(n70), .Y(Reg1Data[25]) );
  oa4f0 U155 ( .A(n4), .B(register0[26]), .C(n98), .D(register1[26]), .Y(n73)
         );
  ao2i0 U156 ( .A(n134), .B(n8), .C(n73), .D(n72), .Y(Reg1Data[26]) );
  oa4f0 U157 ( .A(n4), .B(register0[27]), .C(n2), .D(register1[27]), .Y(n75)
         );
  ao2i0 U158 ( .A(n133), .B(n103), .C(n75), .D(n74), .Y(Reg1Data[27]) );
  oa4f0 U159 ( .A(n3), .B(register0[28]), .C(n1), .D(register1[28]), .Y(n77)
         );
  ao2i0 U160 ( .A(n132), .B(n8), .C(n77), .D(n76), .Y(Reg1Data[28]) );
  oa4f0 U161 ( .A(n3), .B(register0[29]), .C(n1), .D(register1[29]), .Y(n79)
         );
  ao2i0 U162 ( .A(n131), .B(n8), .C(n79), .D(n78), .Y(Reg1Data[29]) );
  oa4f0 U163 ( .A(n4), .B(register0[2]), .C(n1), .D(register1[2]), .Y(n81) );
  ao2i0 U164 ( .A(n158), .B(n8), .C(n81), .D(n80), .Y(Reg1Data[2]) );
  oa4f0 U165 ( .A(n3), .B(register0[30]), .C(n98), .D(register1[30]), .Y(n83)
         );
  ao2i0 U166 ( .A(n130), .B(n8), .C(n83), .D(n82), .Y(Reg1Data[30]) );
  oa4f0 U167 ( .A(n3), .B(register0[31]), .C(n98), .D(register1[31]), .Y(n85)
         );
  ao2i0 U168 ( .A(n129), .B(n7), .C(n85), .D(n84), .Y(Reg1Data[31]) );
  oa4f0 U169 ( .A(n3), .B(register0[3]), .C(n1), .D(register1[3]), .Y(n87) );
  ao2i0 U170 ( .A(n157), .B(n8), .C(n87), .D(n86), .Y(Reg1Data[3]) );
  oa4f0 U171 ( .A(n3), .B(register0[4]), .C(n98), .D(register1[4]), .Y(n89) );
  ao2i0 U172 ( .A(n156), .B(n7), .C(n89), .D(n88), .Y(Reg1Data[4]) );
  oa4f0 U173 ( .A(n3), .B(register0[5]), .C(n1), .D(register1[5]), .Y(n91) );
  ao2i0 U174 ( .A(n155), .B(n103), .C(n91), .D(n90), .Y(Reg1Data[5]) );
  oa4f0 U175 ( .A(n4), .B(register0[6]), .C(n1), .D(register1[6]), .Y(n93) );
  ao2i0 U176 ( .A(n154), .B(n7), .C(n93), .D(n92), .Y(Reg1Data[6]) );
  oa4f0 U177 ( .A(n4), .B(register0[7]), .C(n98), .D(register1[7]), .Y(n95) );
  ao2i0 U178 ( .A(n153), .B(n8), .C(n95), .D(n94), .Y(Reg1Data[7]) );
  oa4f0 U179 ( .A(n3), .B(register0[8]), .C(n1), .D(register1[8]), .Y(n97) );
  ao2i0 U180 ( .A(n152), .B(n7), .C(n97), .D(n96), .Y(Reg1Data[8]) );
  oa4f0 U181 ( .A(n99), .B(register0[9]), .C(n98), .D(register1[9]), .Y(n102)
         );
  ao2i0 U182 ( .A(n151), .B(n8), .C(n102), .D(n101), .Y(Reg1Data[9]) );
  oa4f0 U183 ( .A(register0[0]), .B(n10), .C(register1[0]), .D(n204), .Y(n105)
         );
  ao2i0 U184 ( .A(n160), .B(n209), .C(n105), .D(n104), .Y(Reg2Data[0]) );
  oa4f0 U185 ( .A(register0[10]), .B(n10), .C(register1[10]), .D(n204), .Y(
        n107) );
  ao2i0 U186 ( .A(n150), .B(n209), .C(n107), .D(n106), .Y(Reg2Data[10]) );
  oa4f0 U187 ( .A(register0[11]), .B(n10), .C(register1[11]), .D(n204), .Y(
        n109) );
  ao2i0 U188 ( .A(n149), .B(n13), .C(n109), .D(n108), .Y(Reg2Data[11]) );
  oa4f0 U189 ( .A(register0[12]), .B(n10), .C(register1[12]), .D(n9), .Y(n111)
         );
  ao2i0 U190 ( .A(n148), .B(n13), .C(n111), .D(n110), .Y(Reg2Data[12]) );
  oa4f0 U191 ( .A(register0[13]), .B(n11), .C(register1[13]), .D(n9), .Y(n113)
         );
  ao2i0 U192 ( .A(n147), .B(n13), .C(n113), .D(n112), .Y(Reg2Data[13]) );
  oa4f0 U193 ( .A(register0[14]), .B(n10), .C(register1[14]), .D(n9), .Y(n115)
         );
  ao2i0 U194 ( .A(n146), .B(n209), .C(n115), .D(n114), .Y(Reg2Data[14]) );
  oa4f0 U195 ( .A(register0[15]), .B(n205), .C(register1[15]), .D(n9), .Y(n117) );
  ao2i0 U196 ( .A(n145), .B(n13), .C(n117), .D(n116), .Y(Reg2Data[15]) );
  oa4f0 U197 ( .A(register0[16]), .B(n205), .C(register1[16]), .D(n9), .Y(n119) );
  ao2i0 U198 ( .A(n144), .B(n209), .C(n119), .D(n118), .Y(Reg2Data[16]) );
  oa4f0 U199 ( .A(register0[17]), .B(n10), .C(register1[17]), .D(n9), .Y(n121)
         );
  ao2i0 U200 ( .A(n143), .B(n13), .C(n121), .D(n120), .Y(Reg2Data[17]) );
  oa4f0 U201 ( .A(register0[18]), .B(n11), .C(register1[18]), .D(n9), .Y(n123)
         );
  ao2i0 U202 ( .A(n142), .B(n13), .C(n123), .D(n122), .Y(Reg2Data[18]) );
  oa4f0 U203 ( .A(register0[19]), .B(n11), .C(register1[19]), .D(n9), .Y(n125)
         );
  ao2i0 U204 ( .A(n141), .B(n209), .C(n125), .D(n124), .Y(Reg2Data[19]) );
  oa4f0 U205 ( .A(register0[1]), .B(n10), .C(register1[1]), .D(n9), .Y(n127)
         );
  ao2i0 U206 ( .A(n159), .B(n13), .C(n127), .D(n126), .Y(Reg2Data[1]) );
  oa4f0 U207 ( .A(register0[20]), .B(n10), .C(register1[20]), .D(n204), .Y(
        n162) );
  ao2i0 U208 ( .A(n140), .B(n209), .C(n162), .D(n161), .Y(Reg2Data[20]) );
  oa4f0 U209 ( .A(register0[21]), .B(n11), .C(register1[21]), .D(n204), .Y(
        n164) );
  ao2i0 U210 ( .A(n139), .B(n13), .C(n164), .D(n163), .Y(Reg2Data[21]) );
  oa4f0 U211 ( .A(register0[22]), .B(n205), .C(register1[22]), .D(n9), .Y(n171) );
  ao2i0 U212 ( .A(n138), .B(n209), .C(n171), .D(n166), .Y(Reg2Data[22]) );
  oa4f0 U213 ( .A(register0[23]), .B(n10), .C(register1[23]), .D(n9), .Y(n173)
         );
  ao2i0 U214 ( .A(n137), .B(n13), .C(n173), .D(n172), .Y(Reg2Data[23]) );
  oa4f0 U215 ( .A(register0[24]), .B(n10), .C(register1[24]), .D(n204), .Y(
        n175) );
  ao2i0 U216 ( .A(n136), .B(n209), .C(n175), .D(n174), .Y(Reg2Data[24]) );
  oa4f0 U217 ( .A(register0[25]), .B(n10), .C(register1[25]), .D(n204), .Y(
        n177) );
  ao2i0 U218 ( .A(n135), .B(n209), .C(n177), .D(n176), .Y(Reg2Data[25]) );
  oa4f0 U219 ( .A(register0[26]), .B(n11), .C(register1[26]), .D(n9), .Y(n179)
         );
  ao2i0 U220 ( .A(n134), .B(n13), .C(n179), .D(n178), .Y(Reg2Data[26]) );
  oa4f0 U221 ( .A(register0[27]), .B(n11), .C(register1[27]), .D(n204), .Y(
        n181) );
  ao2i0 U222 ( .A(n133), .B(n209), .C(n181), .D(n180), .Y(Reg2Data[27]) );
  oa4f0 U223 ( .A(register0[28]), .B(n10), .C(register1[28]), .D(n9), .Y(n183)
         );
  ao2i0 U224 ( .A(n132), .B(n13), .C(n183), .D(n182), .Y(Reg2Data[28]) );
  oa4f0 U225 ( .A(register0[29]), .B(n11), .C(register1[29]), .D(n204), .Y(
        n185) );
  ao2i0 U226 ( .A(n131), .B(n13), .C(n185), .D(n184), .Y(Reg2Data[29]) );
  oa4f0 U227 ( .A(register0[2]), .B(n10), .C(register1[2]), .D(n9), .Y(n187)
         );
  ao2i0 U228 ( .A(n158), .B(n13), .C(n187), .D(n186), .Y(Reg2Data[2]) );
  oa4f0 U229 ( .A(register0[30]), .B(n11), .C(register1[30]), .D(n204), .Y(
        n189) );
  ao2i0 U230 ( .A(n130), .B(n13), .C(n189), .D(n188), .Y(Reg2Data[30]) );
  oa4f0 U231 ( .A(register0[31]), .B(n11), .C(register1[31]), .D(n204), .Y(
        n191) );
  ao2i0 U232 ( .A(n129), .B(n209), .C(n191), .D(n190), .Y(Reg2Data[31]) );
  oa4f0 U233 ( .A(register0[3]), .B(n11), .C(register1[3]), .D(n9), .Y(n193)
         );
  ao2i0 U234 ( .A(n157), .B(n13), .C(n193), .D(n192), .Y(Reg2Data[3]) );
  oa4f0 U235 ( .A(register0[4]), .B(n11), .C(register1[4]), .D(n204), .Y(n195)
         );
  ao2i0 U236 ( .A(n156), .B(n209), .C(n195), .D(n194), .Y(Reg2Data[4]) );
  oa4f0 U237 ( .A(register0[5]), .B(n11), .C(register1[5]), .D(n204), .Y(n197)
         );
  ao2i0 U238 ( .A(n155), .B(n209), .C(n197), .D(n196), .Y(Reg2Data[5]) );
  oa4f0 U239 ( .A(register0[6]), .B(n11), .C(register1[6]), .D(n204), .Y(n199)
         );
  ao2i0 U240 ( .A(n154), .B(n209), .C(n199), .D(n198), .Y(Reg2Data[6]) );
  oa4f0 U241 ( .A(register0[7]), .B(n11), .C(register1[7]), .D(n9), .Y(n201)
         );
  ao2i0 U242 ( .A(n153), .B(n13), .C(n201), .D(n200), .Y(Reg2Data[7]) );
  oa4f0 U243 ( .A(register0[8]), .B(n10), .C(register1[8]), .D(n9), .Y(n203)
         );
  ao2i0 U244 ( .A(n152), .B(n209), .C(n203), .D(n202), .Y(Reg2Data[8]) );
  oa4f0 U245 ( .A(register0[9]), .B(n11), .C(register1[9]), .D(n204), .Y(n208)
         );
  ao2i0 U246 ( .A(n151), .B(n13), .C(n208), .D(n207), .Y(Reg2Data[9]) );
endmodule


module mR4000 ( Clk, Reset, MemData, ReadAdd, WriteAdd, WriteData, MemWrite, 
        MemRead );
  input [31:0] MemData;
  output [31:0] ReadAdd;
  output [31:0] WriteAdd;
  output [31:0] WriteData;
  input Clk, Reset;
  output MemWrite, MemRead;
  wire   Instruction_31, Instruction_30, Instruction_29, Instruction_28,
         Instruction_27, Instruction_26, Instruction_25, Instruction_24,
         Instruction_23, Instruction_20, Instruction_19, Instruction_18,
         RegDst, MemToReg, IRWrite, PCWriteCond, Zero, PCWrite, TargetWrite,
         IorD, ALUSelA, RegWrite, n1, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n178, n179, n180;
  wire   [1:0] Read1RegSel;
  wire   [15:0] Instruction;
  wire   [1:0] Read2RegSel;
  wire   [1:0] WriteRegSel;
  wire   [31:0] WriteRegData;
  wire   [1:0] PCSource;
  wire   [31:0] PC;
  wire   [31:0] TargetReg;
  wire   [1:0] ALUOp;
  wire   [1:0] ALUSelB;
  wire   [31:0] ReadData1;

  mCntrl cntrl ( .Op({Instruction_31, Instruction_30, Instruction_29, 
        Instruction_28, Instruction_27, Instruction_26}), .Clk(Clk), .Reset(
        Reset), .PCWrite(PCWrite), .PCWriteCond(PCWriteCond), .IorD(IorD), 
        .MemRead(MemRead), .MemWrite(MemWrite), .IRWrite(IRWrite), .MemtoReg(
        MemToReg), .PCSource(PCSource), .TargetWrite(TargetWrite), .ALUOp(
        ALUOp), .ALUSelA(ALUSelA), .ALUSelB(ALUSelB), .RegWrite(RegWrite), 
        .RegDst(RegDst) );
  mAlu alu ( .PC(PC), .ReadData1(ReadData1), .ReadData2(WriteData), 
        .Instruction(Instruction), .ALUSelA(ALUSelA), .ALUSelB(ALUSelB), 
        .ALUOp(ALUOp), .Zero(Zero), .ALU_result(WriteAdd) );
  mRegister register ( .Clk(Clk), .Reset(Reset), .Read1RegSel(Read1RegSel), 
        .Read2RegSel(Read2RegSel), .WriteRegSel(WriteRegSel), .WriteRegData(
        WriteRegData), .WriteReg(RegWrite), .Reg1Data(ReadData1), .Reg2Data(
        WriteData) );
  fde1a2 Instruction_reg_29_ ( .D(MemData[29]), .E(n115), .CLK(Clk), .Q(
        Instruction_29) );
  fde1a2 Instruction_reg_25_ ( .D(MemData[25]), .E(n114), .CLK(Clk), .Q(
        Instruction_25) );
  fde1a2 Instruction_reg_24_ ( .D(MemData[24]), .E(n114), .CLK(Clk), .Q(
        Instruction_24) );
  fde1a2 Instruction_reg_23_ ( .D(MemData[23]), .E(n114), .CLK(Clk), .Q(
        Instruction_23) );
  fde1a2 Instruction_reg_20_ ( .D(MemData[20]), .E(n114), .CLK(Clk), .Q(
        Instruction_20) );
  fde1a2 Instruction_reg_19_ ( .D(MemData[19]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction_19) );
  fde1a2 Instruction_reg_18_ ( .D(MemData[18]), .E(n115), .CLK(Clk), .Q(
        Instruction_18) );
  fde1a2 TargetReg_reg_30_ ( .D(WriteAdd[30]), .E(n113), .CLK(Clk), .Q(
        TargetReg[30]) );
  fde1a2 TargetReg_reg_0_ ( .D(WriteAdd[0]), .E(n113), .CLK(Clk), .Q(
        TargetReg[0]) );
  fde1a2 TargetReg_reg_1_ ( .D(WriteAdd[1]), .E(n113), .CLK(Clk), .Q(
        TargetReg[1]) );
  fde1a2 TargetReg_reg_2_ ( .D(WriteAdd[2]), .E(n113), .CLK(Clk), .Q(
        TargetReg[2]) );
  fde1a2 TargetReg_reg_3_ ( .D(WriteAdd[3]), .E(n113), .CLK(Clk), .Q(
        TargetReg[3]) );
  fde1a2 TargetReg_reg_4_ ( .D(WriteAdd[4]), .E(n112), .CLK(Clk), .Q(
        TargetReg[4]) );
  fde1a2 TargetReg_reg_5_ ( .D(WriteAdd[5]), .E(n112), .CLK(Clk), .Q(
        TargetReg[5]) );
  fde1a2 TargetReg_reg_6_ ( .D(WriteAdd[6]), .E(n112), .CLK(Clk), .Q(
        TargetReg[6]) );
  fde1a2 TargetReg_reg_7_ ( .D(WriteAdd[7]), .E(n112), .CLK(Clk), .Q(
        TargetReg[7]) );
  fde1a2 TargetReg_reg_8_ ( .D(WriteAdd[8]), .E(n112), .CLK(Clk), .Q(
        TargetReg[8]) );
  fde1a2 TargetReg_reg_9_ ( .D(WriteAdd[9]), .E(n112), .CLK(Clk), .Q(
        TargetReg[9]) );
  fde1a2 TargetReg_reg_10_ ( .D(WriteAdd[10]), .E(n112), .CLK(Clk), .Q(
        TargetReg[10]) );
  fde1a2 TargetReg_reg_11_ ( .D(WriteAdd[11]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[11]) );
  fde1a2 TargetReg_reg_12_ ( .D(WriteAdd[12]), .E(n113), .CLK(Clk), .Q(
        TargetReg[12]) );
  fde1a2 TargetReg_reg_13_ ( .D(WriteAdd[13]), .E(n112), .CLK(Clk), .Q(
        TargetReg[13]) );
  fde1a2 TargetReg_reg_14_ ( .D(WriteAdd[14]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[14]) );
  fde1a2 TargetReg_reg_15_ ( .D(WriteAdd[15]), .E(n113), .CLK(Clk), .Q(
        TargetReg[15]) );
  fde1a2 TargetReg_reg_16_ ( .D(WriteAdd[16]), .E(n112), .CLK(Clk), .Q(
        TargetReg[16]) );
  fde1a2 TargetReg_reg_17_ ( .D(WriteAdd[17]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[17]) );
  fde1a2 TargetReg_reg_18_ ( .D(WriteAdd[18]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[18]) );
  fde1a2 TargetReg_reg_19_ ( .D(WriteAdd[19]), .E(n113), .CLK(Clk), .Q(
        TargetReg[19]) );
  fde1a2 TargetReg_reg_20_ ( .D(WriteAdd[20]), .E(n112), .CLK(Clk), .Q(
        TargetReg[20]) );
  fde1a2 TargetReg_reg_21_ ( .D(WriteAdd[21]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[21]) );
  fde1a2 TargetReg_reg_22_ ( .D(WriteAdd[22]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[22]) );
  fde1a2 TargetReg_reg_23_ ( .D(WriteAdd[23]), .E(n113), .CLK(Clk), .Q(
        TargetReg[23]) );
  fde1a2 TargetReg_reg_24_ ( .D(WriteAdd[24]), .E(n112), .CLK(Clk), .Q(
        TargetReg[24]) );
  fde1a2 TargetReg_reg_25_ ( .D(WriteAdd[25]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[25]) );
  fde1a2 TargetReg_reg_26_ ( .D(WriteAdd[26]), .E(n113), .CLK(Clk), .Q(
        TargetReg[26]) );
  fde1a2 TargetReg_reg_27_ ( .D(WriteAdd[27]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[27]) );
  fde1a2 TargetReg_reg_28_ ( .D(WriteAdd[28]), .E(n113), .CLK(Clk), .Q(
        TargetReg[28]) );
  fde1a2 TargetReg_reg_29_ ( .D(WriteAdd[29]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[29]) );
  fde1a2 TargetReg_reg_31_ ( .D(WriteAdd[31]), .E(TargetWrite), .CLK(Clk), .Q(
        TargetReg[31]) );
  fde1a2 Instruction_reg_14_ ( .D(MemData[14]), .E(n114), .CLK(Clk), .Q(
        Instruction[14]) );
  fde1a2 Instruction_reg_13_ ( .D(MemData[13]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction[13]) );
  fde1a2 Instruction_reg_10_ ( .D(MemData[10]), .E(n114), .CLK(Clk), .Q(
        Instruction[10]) );
  fde1a2 Instruction_reg_9_ ( .D(MemData[9]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction[9]) );
  fde1a2 Instruction_reg_8_ ( .D(MemData[8]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction[8]) );
  fde1a2 Instruction_reg_7_ ( .D(MemData[7]), .E(n115), .CLK(Clk), .Q(
        Instruction[7]) );
  fde1a2 Instruction_reg_6_ ( .D(MemData[6]), .E(n114), .CLK(Clk), .Q(
        Instruction[6]) );
  fde1a2 Instruction_reg_4_ ( .D(MemData[4]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction[4]) );
  fde1a2 Instruction_reg_3_ ( .D(MemData[3]), .E(n115), .CLK(Clk), .Q(
        Instruction[3]) );
  fde1a2 Instruction_reg_28_ ( .D(MemData[28]), .E(n115), .CLK(Clk), .Q(
        Instruction_28) );
  fde1a2 Instruction_reg_30_ ( .D(MemData[30]), .E(n115), .CLK(Clk), .Q(
        Instruction_30) );
  fde1a2 Instruction_reg_27_ ( .D(MemData[27]), .E(n115), .CLK(Clk), .Q(
        Instruction_27) );
  fde1a2 Instruction_reg_15_ ( .D(MemData[15]), .E(n115), .CLK(Clk), .Q(
        Instruction[15]) );
  fde1a2 Instruction_reg_26_ ( .D(MemData[26]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction_26) );
  fde1a2 Instruction_reg_31_ ( .D(MemData[31]), .E(n114), .CLK(Clk), .Q(
        Instruction_31) );
  fde1a2 Instruction_reg_0_ ( .D(MemData[0]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction[0]) );
  fde1a2 Instruction_reg_12_ ( .D(MemData[12]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction[12]) );
  fde1a2 Instruction_reg_11_ ( .D(MemData[11]), .E(n115), .CLK(Clk), .Q(
        Instruction[11]) );
  fd2a2 PC_reg_0_ ( .D(n99), .CLK(Clk), .CLR(n110), .Q(PC[0]) );
  fd2a2 PC_reg_26_ ( .D(n73), .CLK(Clk), .CLR(n110), .Q(PC[26]) );
  fd2a2 PC_reg_25_ ( .D(n74), .CLK(Clk), .CLR(n110), .Q(PC[25]) );
  fd2a2 PC_reg_24_ ( .D(n75), .CLK(Clk), .CLR(n109), .Q(PC[24]) );
  fd2a2 PC_reg_23_ ( .D(n76), .CLK(Clk), .CLR(n109), .Q(PC[23]) );
  fd2a2 PC_reg_22_ ( .D(n77), .CLK(Clk), .CLR(n109), .Q(PC[22]) );
  fd2a2 PC_reg_21_ ( .D(n78), .CLK(Clk), .CLR(n109), .Q(PC[21]) );
  fd2a2 PC_reg_20_ ( .D(n79), .CLK(Clk), .CLR(n109), .Q(PC[20]) );
  fd2a2 PC_reg_19_ ( .D(n80), .CLK(Clk), .CLR(n109), .Q(PC[19]) );
  fd2a2 PC_reg_18_ ( .D(n81), .CLK(Clk), .CLR(n109), .Q(PC[18]) );
  fd2a2 PC_reg_17_ ( .D(n82), .CLK(Clk), .CLR(n1), .Q(PC[17]) );
  fd2a2 PC_reg_16_ ( .D(n83), .CLK(Clk), .CLR(n1), .Q(PC[16]) );
  fd2a2 PC_reg_15_ ( .D(n84), .CLK(Clk), .CLR(n109), .Q(PC[15]) );
  fd2a2 PC_reg_14_ ( .D(n85), .CLK(Clk), .CLR(n1), .Q(PC[14]) );
  fd2a2 PC_reg_13_ ( .D(n86), .CLK(Clk), .CLR(n109), .Q(PC[13]) );
  fd2a2 PC_reg_12_ ( .D(n87), .CLK(Clk), .CLR(n110), .Q(PC[12]) );
  fd2a2 PC_reg_11_ ( .D(n88), .CLK(Clk), .CLR(n1), .Q(PC[11]) );
  fd2a2 PC_reg_10_ ( .D(n89), .CLK(Clk), .CLR(n110), .Q(PC[10]) );
  fd2a2 PC_reg_9_ ( .D(n90), .CLK(Clk), .CLR(n110), .Q(PC[9]) );
  fd2a2 PC_reg_8_ ( .D(n91), .CLK(Clk), .CLR(n109), .Q(PC[8]) );
  fd2a2 PC_reg_7_ ( .D(n92), .CLK(Clk), .CLR(n110), .Q(PC[7]) );
  fd2a2 PC_reg_6_ ( .D(n93), .CLK(Clk), .CLR(n110), .Q(PC[6]) );
  fd2a2 PC_reg_5_ ( .D(n94), .CLK(Clk), .CLR(n109), .Q(PC[5]) );
  fd2a2 PC_reg_4_ ( .D(n95), .CLK(Clk), .CLR(n110), .Q(PC[4]) );
  fd2a2 PC_reg_3_ ( .D(n96), .CLK(Clk), .CLR(n1), .Q(PC[3]) );
  fd2a2 PC_reg_2_ ( .D(n97), .CLK(Clk), .CLR(n1), .Q(PC[2]) );
  fd2a2 PC_reg_1_ ( .D(n98), .CLK(Clk), .CLR(n1), .Q(PC[1]) );
  fd2a2 PC_reg_27_ ( .D(n72), .CLK(Clk), .CLR(n1), .Q(PC[27]) );
  fde1a2 Instruction_reg_5_ ( .D(MemData[5]), .E(n115), .CLK(Clk), .Q(
        Instruction[5]) );
  fd2a2 PC_reg_30_ ( .D(n69), .CLK(Clk), .CLR(n110), .Q(PC[30]) );
  fd2a2 PC_reg_28_ ( .D(n71), .CLK(Clk), .CLR(n110), .Q(PC[28]) );
  fd2a2 PC_reg_29_ ( .D(n70), .CLK(Clk), .CLR(n1), .Q(PC[29]) );
  fd2a2 PC_reg_31_ ( .D(n100), .CLK(Clk), .CLR(n1), .Q(PC[31]) );
  fde1a2 Instruction_reg_1_ ( .D(MemData[1]), .E(n115), .CLK(Clk), .Q(
        Instruction[1]) );
  fde1a2 Instruction_reg_22_ ( .D(MemData[22]), .E(n114), .CLK(Clk), .Q(
        Read1RegSel[1]) );
  fde1a2 Instruction_reg_21_ ( .D(MemData[21]), .E(n114), .CLK(Clk), .Q(
        Read1RegSel[0]) );
  fde1a2 Instruction_reg_2_ ( .D(MemData[2]), .E(IRWrite), .CLK(Clk), .Q(
        Instruction[2]) );
  fde1a2 Instruction_reg_17_ ( .D(MemData[17]), .E(n114), .CLK(Clk), .Q(
        Read2RegSel[1]) );
  fde1a2 Instruction_reg_16_ ( .D(MemData[16]), .E(IRWrite), .CLK(Clk), .Q(
        Read2RegSel[0]) );
  mx2a2 U168 ( .D0(Read2RegSel[0]), .D1(Instruction[11]), .S(RegDst), .Y(
        WriteRegSel[0]) );
  mx2a2 U169 ( .D0(Read2RegSel[1]), .D1(Instruction[12]), .S(RegDst), .Y(
        WriteRegSel[1]) );
  ao1a0 U170 ( .A(Zero), .B(PCWriteCond), .C(PCWrite), .Y(n101) );
  ao1d1 U171 ( .A(PCSource[0]), .B(PCSource[1]), .C(n101), .Y(n180) );
  inv1a2 U172 ( .A(Reset), .Y(n1) );
  buf1a2 U173 ( .A(n1), .Y(n110) );
  buf1a2 U174 ( .A(n178), .Y(n103) );
  buf1a2 U175 ( .A(n178), .Y(n104) );
  nor2b1 U176 ( .A(PCSource[0]), .B(n180), .Y(n179) );
  buf1a2 U177 ( .A(n180), .Y(n108) );
  buf1a4 U178 ( .A(MemToReg), .Y(n116) );
  nand2a0 U179 ( .A(n118), .B(n117), .Y(n99) );
  nand2a0 U180 ( .A(n170), .B(n169), .Y(n73) );
  nand2a0 U181 ( .A(n168), .B(n167), .Y(n74) );
  nand2a0 U182 ( .A(n166), .B(n165), .Y(n75) );
  nand2a0 U183 ( .A(n164), .B(n163), .Y(n76) );
  nand2a0 U184 ( .A(n162), .B(n161), .Y(n77) );
  nand2a0 U185 ( .A(n160), .B(n159), .Y(n78) );
  nand2a0 U186 ( .A(n158), .B(n157), .Y(n79) );
  nand2a0 U187 ( .A(n156), .B(n155), .Y(n80) );
  nand2a0 U188 ( .A(n154), .B(n153), .Y(n81) );
  nand2a0 U189 ( .A(n152), .B(n151), .Y(n82) );
  nand2a0 U190 ( .A(n150), .B(n149), .Y(n83) );
  nand2a0 U191 ( .A(n148), .B(n147), .Y(n84) );
  nand2a0 U192 ( .A(n146), .B(n145), .Y(n85) );
  nand2a0 U193 ( .A(n144), .B(n143), .Y(n86) );
  nand2a0 U194 ( .A(n142), .B(n141), .Y(n87) );
  nand2a0 U195 ( .A(n140), .B(n139), .Y(n88) );
  nand2a0 U196 ( .A(n138), .B(n137), .Y(n89) );
  nand2a0 U197 ( .A(n136), .B(n135), .Y(n90) );
  nand2a0 U198 ( .A(n134), .B(n133), .Y(n91) );
  nand2a0 U199 ( .A(n132), .B(n131), .Y(n92) );
  nand2a0 U200 ( .A(n174), .B(n173), .Y(n71) );
  nand2a0 U201 ( .A(n130), .B(n129), .Y(n93) );
  nand2a0 U202 ( .A(n128), .B(n127), .Y(n94) );
  nand2a0 U203 ( .A(n126), .B(n125), .Y(n95) );
  nand2a0 U204 ( .A(n177), .B(n176), .Y(n70) );
  nand2a0 U205 ( .A(n124), .B(n123), .Y(n96) );
  nand2a0 U206 ( .A(n122), .B(n121), .Y(n97) );
  nand2a0 U207 ( .A(n120), .B(n119), .Y(n98) );
  nand2a0 U208 ( .A(n172), .B(n171), .Y(n72) );
  nor2b2 U209 ( .A(PCSource[1]), .B(n108), .Y(n175) );
  mx2a2 U210 ( .D0(PC[31]), .D1(WriteAdd[31]), .S(ALUSelB[1]), .Y(ReadAdd[31])
         );
  mx2a2 U211 ( .D0(PC[29]), .D1(WriteAdd[29]), .S(ALUSelB[1]), .Y(ReadAdd[29])
         );
  mx2a2 U212 ( .D0(PC[30]), .D1(WriteAdd[30]), .S(n111), .Y(ReadAdd[30]) );
  mx2a2 U213 ( .D0(PC[27]), .D1(WriteAdd[27]), .S(n111), .Y(ReadAdd[27]) );
  mx2a2 U214 ( .D0(PC[28]), .D1(WriteAdd[28]), .S(n111), .Y(ReadAdd[28]) );
  mx2a2 U215 ( .D0(PC[25]), .D1(WriteAdd[25]), .S(ALUSelB[1]), .Y(ReadAdd[25])
         );
  mx2a2 U216 ( .D0(PC[24]), .D1(WriteAdd[24]), .S(ALUSelB[1]), .Y(ReadAdd[24])
         );
  mx2a2 U217 ( .D0(PC[23]), .D1(WriteAdd[23]), .S(n111), .Y(ReadAdd[23]) );
  mx2a2 U218 ( .D0(PC[22]), .D1(WriteAdd[22]), .S(ALUSelB[1]), .Y(ReadAdd[22])
         );
  mx2a2 U219 ( .D0(PC[21]), .D1(WriteAdd[21]), .S(ALUSelB[1]), .Y(ReadAdd[21])
         );
  mx2a2 U220 ( .D0(PC[26]), .D1(WriteAdd[26]), .S(ALUSelB[1]), .Y(ReadAdd[26])
         );
  mx2a2 U221 ( .D0(PC[19]), .D1(WriteAdd[19]), .S(ALUSelB[1]), .Y(ReadAdd[19])
         );
  mx2a2 U222 ( .D0(PC[18]), .D1(WriteAdd[18]), .S(ALUSelB[1]), .Y(ReadAdd[18])
         );
  mx2a2 U223 ( .D0(PC[17]), .D1(WriteAdd[17]), .S(n111), .Y(ReadAdd[17]) );
  mx2a2 U224 ( .D0(PC[16]), .D1(WriteAdd[16]), .S(n111), .Y(ReadAdd[16]) );
  mx2a2 U225 ( .D0(PC[15]), .D1(WriteAdd[15]), .S(n111), .Y(ReadAdd[15]) );
  mx2a2 U226 ( .D0(PC[14]), .D1(WriteAdd[14]), .S(n111), .Y(ReadAdd[14]) );
  mx2a2 U227 ( .D0(PC[13]), .D1(WriteAdd[13]), .S(n111), .Y(ReadAdd[13]) );
  mx2a2 U228 ( .D0(PC[12]), .D1(WriteAdd[12]), .S(n111), .Y(ReadAdd[12]) );
  mx2a2 U229 ( .D0(PC[11]), .D1(WriteAdd[11]), .S(n111), .Y(ReadAdd[11]) );
  mx2a2 U230 ( .D0(PC[10]), .D1(WriteAdd[10]), .S(n111), .Y(ReadAdd[10]) );
  mx2a2 U231 ( .D0(PC[9]), .D1(WriteAdd[9]), .S(n111), .Y(ReadAdd[9]) );
  mx2a2 U232 ( .D0(PC[8]), .D1(WriteAdd[8]), .S(n111), .Y(ReadAdd[8]) );
  mx2a2 U233 ( .D0(PC[7]), .D1(WriteAdd[7]), .S(n111), .Y(ReadAdd[7]) );
  mx2a2 U234 ( .D0(PC[6]), .D1(WriteAdd[6]), .S(n111), .Y(ReadAdd[6]) );
  mx2a2 U235 ( .D0(PC[5]), .D1(WriteAdd[5]), .S(n111), .Y(ReadAdd[5]) );
  mx2a2 U236 ( .D0(PC[4]), .D1(WriteAdd[4]), .S(n111), .Y(ReadAdd[4]) );
  mx2a2 U237 ( .D0(PC[3]), .D1(WriteAdd[3]), .S(n111), .Y(ReadAdd[3]) );
  mx2a2 U238 ( .D0(PC[2]), .D1(WriteAdd[2]), .S(n111), .Y(ReadAdd[2]) );
  mx2a2 U239 ( .D0(PC[1]), .D1(WriteAdd[1]), .S(n111), .Y(ReadAdd[1]) );
  buf1a4 U240 ( .A(IorD), .Y(n111) );
  mx2a2 U241 ( .D0(PC[0]), .D1(WriteAdd[0]), .S(n111), .Y(ReadAdd[0]) );
  mx2a2 U242 ( .D0(PC[20]), .D1(WriteAdd[20]), .S(ALUSelB[1]), .Y(ReadAdd[20])
         );
  mx2a2 U243 ( .D0(WriteAdd[0]), .D1(MemData[0]), .S(n116), .Y(WriteRegData[0]) );
  mx2a2 U244 ( .D0(WriteAdd[9]), .D1(MemData[9]), .S(n116), .Y(WriteRegData[9]) );
  mx2a2 U245 ( .D0(WriteAdd[6]), .D1(MemData[6]), .S(n116), .Y(WriteRegData[6]) );
  mx2a2 U246 ( .D0(WriteAdd[5]), .D1(MemData[5]), .S(MemToReg), .Y(
        WriteRegData[5]) );
  mx2a2 U247 ( .D0(WriteAdd[4]), .D1(MemData[4]), .S(n116), .Y(WriteRegData[4]) );
  mx2a2 U248 ( .D0(WriteAdd[14]), .D1(MemData[14]), .S(n116), .Y(
        WriteRegData[14]) );
  mx2a2 U249 ( .D0(WriteAdd[31]), .D1(MemData[31]), .S(MemToReg), .Y(
        WriteRegData[31]) );
  mx2a2 U250 ( .D0(WriteAdd[15]), .D1(MemData[15]), .S(MemToReg), .Y(
        WriteRegData[15]) );
  mx2a2 U251 ( .D0(WriteAdd[30]), .D1(MemData[30]), .S(n116), .Y(
        WriteRegData[30]) );
  buf1a2 U252 ( .A(n180), .Y(n107) );
  buf1a2 U253 ( .A(n110), .Y(n109) );
  buf1a2 U254 ( .A(n179), .Y(n105) );
  buf1a2 U255 ( .A(n175), .Y(n102) );
  buf1a2 U256 ( .A(n179), .Y(n106) );
  ao7a2 U257 ( .A(n180), .B(PC[31]), .C(n104), .D(WriteAdd[31]), .E(n179), .F(
        TargetReg[31]), .Y(n100) );
  ao7a2 U258 ( .A(n108), .B(PC[30]), .C(n106), .D(TargetReg[30]), .E(
        WriteAdd[30]), .F(n103), .Y(n69) );
  buf1a2 U259 ( .A(TargetWrite), .Y(n113) );
  buf1a2 U260 ( .A(TargetWrite), .Y(n112) );
  buf1a2 U261 ( .A(IRWrite), .Y(n115) );
  buf1a2 U262 ( .A(IRWrite), .Y(n114) );
  mx2a2 U263 ( .D0(WriteAdd[10]), .D1(MemData[10]), .S(MemToReg), .Y(
        WriteRegData[10]) );
  mx2a2 U264 ( .D0(WriteAdd[11]), .D1(MemData[11]), .S(n116), .Y(
        WriteRegData[11]) );
  mx2a2 U265 ( .D0(WriteAdd[12]), .D1(MemData[12]), .S(n116), .Y(
        WriteRegData[12]) );
  mx2a2 U266 ( .D0(WriteAdd[13]), .D1(MemData[13]), .S(n116), .Y(
        WriteRegData[13]) );
  mx2a2 U267 ( .D0(WriteAdd[16]), .D1(MemData[16]), .S(MemToReg), .Y(
        WriteRegData[16]) );
  mx2a2 U268 ( .D0(WriteAdd[17]), .D1(MemData[17]), .S(MemToReg), .Y(
        WriteRegData[17]) );
  mx2a2 U269 ( .D0(WriteAdd[18]), .D1(MemData[18]), .S(n116), .Y(
        WriteRegData[18]) );
  mx2a2 U270 ( .D0(WriteAdd[19]), .D1(MemData[19]), .S(MemToReg), .Y(
        WriteRegData[19]) );
  mx2a2 U271 ( .D0(WriteAdd[1]), .D1(MemData[1]), .S(MemToReg), .Y(
        WriteRegData[1]) );
  mx2a2 U272 ( .D0(WriteAdd[20]), .D1(MemData[20]), .S(n116), .Y(
        WriteRegData[20]) );
  mx2a2 U273 ( .D0(WriteAdd[21]), .D1(MemData[21]), .S(n116), .Y(
        WriteRegData[21]) );
  mx2a2 U274 ( .D0(WriteAdd[22]), .D1(MemData[22]), .S(MemToReg), .Y(
        WriteRegData[22]) );
  mx2a2 U275 ( .D0(WriteAdd[23]), .D1(MemData[23]), .S(MemToReg), .Y(
        WriteRegData[23]) );
  mx2a2 U276 ( .D0(WriteAdd[24]), .D1(MemData[24]), .S(n116), .Y(
        WriteRegData[24]) );
  mx2a2 U277 ( .D0(WriteAdd[25]), .D1(MemData[25]), .S(n116), .Y(
        WriteRegData[25]) );
  mx2a2 U278 ( .D0(WriteAdd[26]), .D1(MemData[26]), .S(MemToReg), .Y(
        WriteRegData[26]) );
  mx2a2 U279 ( .D0(WriteAdd[27]), .D1(MemData[27]), .S(n116), .Y(
        WriteRegData[27]) );
  mx2a2 U280 ( .D0(WriteAdd[28]), .D1(MemData[28]), .S(n116), .Y(
        WriteRegData[28]) );
  mx2a2 U281 ( .D0(WriteAdd[29]), .D1(MemData[29]), .S(MemToReg), .Y(
        WriteRegData[29]) );
  mx2a2 U282 ( .D0(WriteAdd[2]), .D1(MemData[2]), .S(n116), .Y(WriteRegData[2]) );
  mx2a2 U283 ( .D0(WriteAdd[3]), .D1(MemData[3]), .S(n116), .Y(WriteRegData[3]) );
  mx2a2 U284 ( .D0(WriteAdd[7]), .D1(MemData[7]), .S(n116), .Y(WriteRegData[7]) );
  mx2a2 U285 ( .D0(WriteAdd[8]), .D1(MemData[8]), .S(n116), .Y(WriteRegData[8]) );
  and3d1 U286 ( .A(PCSource[1]), .B(PCSource[0]), .C(n108), .Y(n178) );
  oa4f0 U287 ( .A(TargetReg[0]), .B(n106), .C(PC[0]), .D(n108), .Y(n118) );
  oa4f0 U288 ( .A(n104), .B(WriteAdd[0]), .C(n102), .D(Instruction[0]), .Y(
        n117) );
  oa4f0 U289 ( .A(TargetReg[1]), .B(n179), .C(PC[1]), .D(n108), .Y(n120) );
  oa4f0 U290 ( .A(n178), .B(WriteAdd[1]), .C(n175), .D(Instruction[1]), .Y(
        n119) );
  oa4f0 U291 ( .A(TargetReg[2]), .B(n106), .C(PC[2]), .D(n108), .Y(n122) );
  oa4f0 U292 ( .A(n178), .B(WriteAdd[2]), .C(n102), .D(Instruction[2]), .Y(
        n121) );
  oa4f0 U293 ( .A(TargetReg[3]), .B(n105), .C(PC[3]), .D(n108), .Y(n124) );
  oa4f0 U294 ( .A(n104), .B(WriteAdd[3]), .C(n102), .D(Instruction[3]), .Y(
        n123) );
  oa4f0 U295 ( .A(TargetReg[4]), .B(n105), .C(PC[4]), .D(n107), .Y(n126) );
  oa4f0 U296 ( .A(n104), .B(WriteAdd[4]), .C(n175), .D(Instruction[4]), .Y(
        n125) );
  oa4f0 U297 ( .A(TargetReg[5]), .B(n105), .C(PC[5]), .D(n107), .Y(n128) );
  oa4f0 U298 ( .A(n104), .B(WriteAdd[5]), .C(n102), .D(Instruction[5]), .Y(
        n127) );
  oa4f0 U299 ( .A(TargetReg[6]), .B(n105), .C(PC[6]), .D(n107), .Y(n130) );
  oa4f0 U300 ( .A(n104), .B(WriteAdd[6]), .C(n102), .D(Instruction[6]), .Y(
        n129) );
  oa4f0 U301 ( .A(TargetReg[7]), .B(n105), .C(PC[7]), .D(n107), .Y(n132) );
  oa4f0 U302 ( .A(n103), .B(WriteAdd[7]), .C(n102), .D(Instruction[7]), .Y(
        n131) );
  oa4f0 U303 ( .A(TargetReg[8]), .B(n105), .C(PC[8]), .D(n107), .Y(n134) );
  oa4f0 U304 ( .A(n103), .B(WriteAdd[8]), .C(n102), .D(Instruction[8]), .Y(
        n133) );
  oa4f0 U305 ( .A(TargetReg[9]), .B(n105), .C(PC[9]), .D(n107), .Y(n136) );
  oa4f0 U306 ( .A(n103), .B(WriteAdd[9]), .C(n102), .D(Instruction[9]), .Y(
        n135) );
  oa4f0 U307 ( .A(TargetReg[10]), .B(n105), .C(PC[10]), .D(n107), .Y(n138) );
  oa4f0 U308 ( .A(n103), .B(WriteAdd[10]), .C(n102), .D(Instruction[10]), .Y(
        n137) );
  oa4f0 U309 ( .A(TargetReg[11]), .B(n106), .C(PC[11]), .D(n107), .Y(n140) );
  oa4f0 U310 ( .A(n103), .B(WriteAdd[11]), .C(n102), .D(Instruction[11]), .Y(
        n139) );
  oa4f0 U311 ( .A(TargetReg[12]), .B(n179), .C(PC[12]), .D(n108), .Y(n142) );
  oa4f0 U312 ( .A(n103), .B(WriteAdd[12]), .C(n175), .D(Instruction[12]), .Y(
        n141) );
  oa4f0 U313 ( .A(TargetReg[13]), .B(n105), .C(PC[13]), .D(n107), .Y(n144) );
  oa4f0 U314 ( .A(n178), .B(WriteAdd[13]), .C(n175), .D(Instruction[13]), .Y(
        n143) );
  oa4f0 U315 ( .A(TargetReg[14]), .B(n106), .C(PC[14]), .D(n180), .Y(n146) );
  oa4f0 U316 ( .A(n178), .B(WriteAdd[14]), .C(n175), .D(Instruction[14]), .Y(
        n145) );
  oa4f0 U317 ( .A(TargetReg[15]), .B(n179), .C(PC[15]), .D(n107), .Y(n148) );
  oa4f0 U318 ( .A(n103), .B(WriteAdd[15]), .C(n102), .D(Instruction[15]), .Y(
        n147) );
  oa4f0 U319 ( .A(TargetReg[16]), .B(n105), .C(PC[16]), .D(n108), .Y(n150) );
  oa4f0 U320 ( .A(n178), .B(WriteAdd[16]), .C(n102), .D(Read2RegSel[0]), .Y(
        n149) );
  oa4f0 U321 ( .A(TargetReg[17]), .B(n106), .C(PC[17]), .D(n107), .Y(n152) );
  oa4f0 U322 ( .A(n104), .B(WriteAdd[17]), .C(n175), .D(Read2RegSel[1]), .Y(
        n151) );
  oa4f0 U323 ( .A(TargetReg[18]), .B(n179), .C(PC[18]), .D(n108), .Y(n154) );
  oa4f0 U324 ( .A(n178), .B(WriteAdd[18]), .C(n175), .D(Instruction_18), .Y(
        n153) );
  oa4f0 U325 ( .A(TargetReg[19]), .B(n179), .C(PC[19]), .D(n180), .Y(n156) );
  oa4f0 U326 ( .A(n103), .B(WriteAdd[19]), .C(n175), .D(Instruction_19), .Y(
        n155) );
  oa4f0 U327 ( .A(TargetReg[20]), .B(n105), .C(PC[20]), .D(n180), .Y(n158) );
  oa4f0 U328 ( .A(n178), .B(WriteAdd[20]), .C(n175), .D(Instruction_20), .Y(
        n157) );
  oa4f0 U329 ( .A(TargetReg[21]), .B(n106), .C(PC[21]), .D(n107), .Y(n160) );
  oa4f0 U330 ( .A(n104), .B(WriteAdd[21]), .C(n175), .D(Read1RegSel[0]), .Y(
        n159) );
  oa4f0 U331 ( .A(TargetReg[22]), .B(n179), .C(PC[22]), .D(n180), .Y(n162) );
  oa4f0 U332 ( .A(n103), .B(WriteAdd[22]), .C(n175), .D(Read1RegSel[1]), .Y(
        n161) );
  oa4f0 U333 ( .A(TargetReg[23]), .B(n179), .C(PC[23]), .D(n108), .Y(n164) );
  oa4f0 U334 ( .A(n103), .B(WriteAdd[23]), .C(n102), .D(Instruction_23), .Y(
        n163) );
  oa4f0 U335 ( .A(TargetReg[24]), .B(n106), .C(PC[24]), .D(n180), .Y(n166) );
  oa4f0 U336 ( .A(n103), .B(WriteAdd[24]), .C(n175), .D(Instruction_24), .Y(
        n165) );
  oa4f0 U337 ( .A(TargetReg[25]), .B(n179), .C(PC[25]), .D(n107), .Y(n168) );
  oa4f0 U338 ( .A(n103), .B(WriteAdd[25]), .C(n175), .D(Instruction_25), .Y(
        n167) );
  oa4f0 U339 ( .A(TargetReg[26]), .B(n106), .C(PC[26]), .D(n180), .Y(n170) );
  oa4f0 U340 ( .A(n103), .B(WriteAdd[26]), .C(n102), .D(PC[28]), .Y(n169) );
  oa4f0 U341 ( .A(TargetReg[27]), .B(n106), .C(PC[27]), .D(n108), .Y(n172) );
  oa4f0 U342 ( .A(n178), .B(WriteAdd[27]), .C(n175), .D(PC[29]), .Y(n171) );
  oa4f0 U343 ( .A(TargetReg[28]), .B(n106), .C(PC[28]), .D(n180), .Y(n174) );
  oa4f0 U344 ( .A(n178), .B(WriteAdd[28]), .C(n102), .D(PC[30]), .Y(n173) );
  oa4f0 U345 ( .A(TargetReg[29]), .B(n106), .C(PC[29]), .D(n108), .Y(n177) );
  oa4f0 U346 ( .A(PC[31]), .B(n102), .C(n104), .D(WriteAdd[29]), .Y(n176) );
endmodule

