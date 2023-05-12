// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (win64) Build 3671981 Fri Oct 14 05:00:03 MDT 2022
// Date        : Tue May  2 08:42:49 2023
// Host        : Johnny-Desktop running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               {C:/Users/johnn/Documents/.ActuallyDocuments/cpe487/CPE487_Project/IR Transmitter Code
//               WIP/Transmission.sim/sim_1/synth/timing/xsim/top_time_synth.v}
// Design      : top
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

module PS2Receiver
   (flag,
    D,
    PS2_CLK_IBUF,
    CLK50MHZ,
    PS2_DATA_IBUF,
    CLK,
    s);
  output flag;
  output [3:0]D;
  input PS2_CLK_IBUF;
  input CLK50MHZ;
  input PS2_DATA_IBUF;
  input CLK;
  input [2:0]s;

  wire CLK;
  wire CLK50MHZ;
  wire [3:0]D;
  wire O0;
  wire PS2_CLK_IBUF;
  wire PS2_DATA_IBUF;
  wire cnt;
  wire \cnt[0]_i_1_n_0 ;
  wire \cnt[1]_i_1_n_0 ;
  wire \cnt[3]_i_1_n_0 ;
  wire [3:0]cnt_reg;
  wire [3:0]data4;
  wire [3:0]data5;
  wire [3:0]data6;
  wire [3:0]data7;
  wire [7:0]datacur;
  wire \datacur[0]_i_1_n_0 ;
  wire \datacur[1]_i_1_n_0 ;
  wire \datacur[2]_i_1_n_0 ;
  wire \datacur[3]_i_1_n_0 ;
  wire \datacur[4]_i_1_n_0 ;
  wire \datacur[5]_i_1_n_0 ;
  wire \datacur[6]_i_1_n_0 ;
  wire \datacur[7]_i_1_n_0 ;
  wire debounce_inst_n_1;
  wire \digit[0]_i_2_n_0 ;
  wire \digit[0]_i_3_n_0 ;
  wire \digit[1]_i_2_n_0 ;
  wire \digit[1]_i_3_n_0 ;
  wire \digit[2]_i_2_n_0 ;
  wire \digit[2]_i_3_n_0 ;
  wire \digit[3]_i_2_n_0 ;
  wire \digit[3]_i_3_n_0 ;
  wire flag;
  wire flag_i_1_n_0;
  wire [15:0]keycode;
  wire \keycode[31]_i_1_n_0 ;
  wire \keycode[31]_i_2_n_0 ;
  wire \keycode[31]_i_3_n_0 ;
  wire [3:2]plusOp__0;
  wire [2:0]s;

  LUT4 #(
    .INIT(16'h575F)) 
    \/i_ 
       (.I0(cnt_reg[3]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[0]),
        .O(cnt));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt[0]_i_1 
       (.I0(cnt_reg[0]),
        .O(\cnt[0]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair4" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt[1]_i_1 
       (.I0(cnt_reg[0]),
        .I1(cnt_reg[1]),
        .O(\cnt[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt[2]_i_1 
       (.I0(cnt_reg[0]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[2]),
        .O(plusOp__0[2]));
  LUT4 #(
    .INIT(16'h0400)) 
    \cnt[3]_i_1 
       (.I0(cnt_reg[0]),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[3]),
        .O(\cnt[3]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt[3]_i_2 
       (.I0(cnt_reg[1]),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[3]),
        .O(plusOp__0[3]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cnt_reg[0] 
       (.C(O0),
        .CE(cnt),
        .D(\cnt[0]_i_1_n_0 ),
        .Q(cnt_reg[0]),
        .R(\cnt[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cnt_reg[1] 
       (.C(O0),
        .CE(cnt),
        .D(\cnt[1]_i_1_n_0 ),
        .Q(cnt_reg[1]),
        .R(\cnt[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cnt_reg[2] 
       (.C(O0),
        .CE(cnt),
        .D(plusOp__0[2]),
        .Q(cnt_reg[2]),
        .R(\cnt[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cnt_reg[3] 
       (.C(O0),
        .CE(cnt),
        .D(plusOp__0[3]),
        .Q(cnt_reg[3]),
        .R(\cnt[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEF00000020)) 
    \datacur[0]_i_1 
       (.I0(debounce_inst_n_1),
        .I1(cnt_reg[2]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[1]),
        .I4(cnt_reg[3]),
        .I5(datacur[0]),
        .O(\datacur[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFEF00000020)) 
    \datacur[1]_i_1 
       (.I0(debounce_inst_n_1),
        .I1(cnt_reg[2]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[0]),
        .I4(cnt_reg[3]),
        .I5(datacur[1]),
        .O(\datacur[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFEFFF00002000)) 
    \datacur[2]_i_1 
       (.I0(debounce_inst_n_1),
        .I1(cnt_reg[2]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[0]),
        .I4(cnt_reg[3]),
        .I5(datacur[2]),
        .O(\datacur[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFEFF00000200)) 
    \datacur[3]_i_1 
       (.I0(debounce_inst_n_1),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[3]),
        .I5(datacur[3]),
        .O(\datacur[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBFF00000800)) 
    \datacur[4]_i_1 
       (.I0(debounce_inst_n_1),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[3]),
        .I5(datacur[4]),
        .O(\datacur[4]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFBFF00000800)) 
    \datacur[5]_i_1 
       (.I0(debounce_inst_n_1),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[3]),
        .I5(datacur[5]),
        .O(\datacur[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFBFFF00008000)) 
    \datacur[6]_i_1 
       (.I0(debounce_inst_n_1),
        .I1(cnt_reg[1]),
        .I2(cnt_reg[0]),
        .I3(cnt_reg[2]),
        .I4(cnt_reg[3]),
        .I5(datacur[6]),
        .O(\datacur[6]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFB00000008)) 
    \datacur[7]_i_1 
       (.I0(debounce_inst_n_1),
        .I1(cnt_reg[3]),
        .I2(cnt_reg[2]),
        .I3(cnt_reg[1]),
        .I4(cnt_reg[0]),
        .I5(datacur[7]),
        .O(\datacur[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[0] 
       (.C(O0),
        .CE(1'b1),
        .D(\datacur[0]_i_1_n_0 ),
        .Q(datacur[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[1] 
       (.C(O0),
        .CE(1'b1),
        .D(\datacur[1]_i_1_n_0 ),
        .Q(datacur[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[2] 
       (.C(O0),
        .CE(1'b1),
        .D(\datacur[2]_i_1_n_0 ),
        .Q(datacur[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[3] 
       (.C(O0),
        .CE(1'b1),
        .D(\datacur[3]_i_1_n_0 ),
        .Q(datacur[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[4] 
       (.C(O0),
        .CE(1'b1),
        .D(\datacur[4]_i_1_n_0 ),
        .Q(datacur[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[5] 
       (.C(O0),
        .CE(1'b1),
        .D(\datacur[5]_i_1_n_0 ),
        .Q(datacur[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[6] 
       (.C(O0),
        .CE(1'b1),
        .D(\datacur[6]_i_1_n_0 ),
        .Q(datacur[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \datacur_reg[7] 
       (.C(O0),
        .CE(1'b1),
        .D(\datacur[7]_i_1_n_0 ),
        .Q(datacur[7]),
        .R(1'b0));
  debouncer debounce_inst
       (.CLK50MHZ(CLK50MHZ),
        .O0(O0),
        .O1_reg_0(debounce_inst_n_1),
        .PS2_CLK_IBUF(PS2_CLK_IBUF),
        .PS2_DATA_IBUF(PS2_DATA_IBUF));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \digit[0]_i_2 
       (.I0(keycode[12]),
        .I1(keycode[8]),
        .I2(s[1]),
        .I3(keycode[4]),
        .I4(s[0]),
        .I5(keycode[0]),
        .O(\digit[0]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \digit[0]_i_3 
       (.I0(data7[0]),
        .I1(data6[0]),
        .I2(s[1]),
        .I3(data5[0]),
        .I4(s[0]),
        .I5(data4[0]),
        .O(\digit[0]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \digit[1]_i_2 
       (.I0(keycode[13]),
        .I1(keycode[9]),
        .I2(s[1]),
        .I3(keycode[5]),
        .I4(s[0]),
        .I5(keycode[1]),
        .O(\digit[1]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \digit[1]_i_3 
       (.I0(data7[1]),
        .I1(data6[1]),
        .I2(s[1]),
        .I3(data5[1]),
        .I4(s[0]),
        .I5(data4[1]),
        .O(\digit[1]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \digit[2]_i_2 
       (.I0(keycode[14]),
        .I1(keycode[10]),
        .I2(s[1]),
        .I3(keycode[6]),
        .I4(s[0]),
        .I5(keycode[2]),
        .O(\digit[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \digit[2]_i_3 
       (.I0(data7[2]),
        .I1(data6[2]),
        .I2(s[1]),
        .I3(data5[2]),
        .I4(s[0]),
        .I5(data4[2]),
        .O(\digit[2]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \digit[3]_i_2 
       (.I0(keycode[15]),
        .I1(keycode[11]),
        .I2(s[1]),
        .I3(keycode[7]),
        .I4(s[0]),
        .I5(keycode[3]),
        .O(\digit[3]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \digit[3]_i_3 
       (.I0(data7[3]),
        .I1(data6[3]),
        .I2(s[1]),
        .I3(data5[3]),
        .I4(s[0]),
        .I5(data4[3]),
        .O(\digit[3]_i_3_n_0 ));
  MUXF7 \digit_reg[0]_i_1 
       (.I0(\digit[0]_i_2_n_0 ),
        .I1(\digit[0]_i_3_n_0 ),
        .O(D[0]),
        .S(s[2]));
  MUXF7 \digit_reg[1]_i_1 
       (.I0(\digit[1]_i_2_n_0 ),
        .I1(\digit[1]_i_3_n_0 ),
        .O(D[1]),
        .S(s[2]));
  MUXF7 \digit_reg[2]_i_1 
       (.I0(\digit[2]_i_2_n_0 ),
        .I1(\digit[2]_i_3_n_0 ),
        .O(D[2]),
        .S(s[2]));
  MUXF7 \digit_reg[3]_i_1 
       (.I0(\digit[3]_i_2_n_0 ),
        .I1(\digit[3]_i_3_n_0 ),
        .O(D[3]),
        .S(s[2]));
  LUT5 #(
    .INIT(32'hEFFF0400)) 
    flag_i_1
       (.I0(cnt_reg[2]),
        .I1(cnt_reg[0]),
        .I2(cnt_reg[1]),
        .I3(cnt_reg[3]),
        .I4(flag),
        .O(flag_i_1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    flag_reg
       (.C(O0),
        .CE(1'b1),
        .D(flag_i_1_n_0),
        .Q(flag),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFF6FF6)) 
    \keycode[31]_i_1 
       (.I0(datacur[7]),
        .I1(keycode[7]),
        .I2(datacur[6]),
        .I3(keycode[6]),
        .I4(\keycode[31]_i_2_n_0 ),
        .I5(\keycode[31]_i_3_n_0 ),
        .O(\keycode[31]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \keycode[31]_i_2 
       (.I0(keycode[3]),
        .I1(datacur[3]),
        .I2(datacur[5]),
        .I3(keycode[5]),
        .I4(datacur[4]),
        .I5(keycode[4]),
        .O(\keycode[31]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h6FF6FFFFFFFF6FF6)) 
    \keycode[31]_i_3 
       (.I0(keycode[0]),
        .I1(datacur[0]),
        .I2(datacur[2]),
        .I3(keycode[2]),
        .I4(datacur[1]),
        .I5(keycode[1]),
        .O(\keycode[31]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[0] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(datacur[0]),
        .Q(keycode[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[10] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[2]),
        .Q(keycode[10]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[11] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[3]),
        .Q(keycode[11]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[12] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[4]),
        .Q(keycode[12]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[13] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[5]),
        .Q(keycode[13]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[14] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[6]),
        .Q(keycode[14]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[15] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[7]),
        .Q(keycode[15]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[16] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[8]),
        .Q(data4[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[17] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[9]),
        .Q(data4[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[18] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[10]),
        .Q(data4[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[19] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[11]),
        .Q(data4[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[1] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(datacur[1]),
        .Q(keycode[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[20] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[12]),
        .Q(data5[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[21] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[13]),
        .Q(data5[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[22] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[14]),
        .Q(data5[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[23] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[15]),
        .Q(data5[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[24] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(data4[0]),
        .Q(data6[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[25] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(data4[1]),
        .Q(data6[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[26] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(data4[2]),
        .Q(data6[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[27] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(data4[3]),
        .Q(data6[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[28] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(data5[0]),
        .Q(data7[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[29] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(data5[1]),
        .Q(data7[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[2] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(datacur[2]),
        .Q(keycode[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[30] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(data5[2]),
        .Q(data7[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[31] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(data5[3]),
        .Q(data7[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[3] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(datacur[3]),
        .Q(keycode[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[4] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(datacur[4]),
        .Q(keycode[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[5] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(datacur[5]),
        .Q(keycode[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[6] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(datacur[6]),
        .Q(keycode[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[7] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(datacur[7]),
        .Q(keycode[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[8] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[0]),
        .Q(keycode[8]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \keycode_reg[9] 
       (.C(CLK),
        .CE(\keycode[31]_i_1_n_0 ),
        .D(keycode[1]),
        .Q(keycode[9]),
        .R(1'b0));
endmodule

module debouncer
   (O0,
    O1_reg_0,
    PS2_CLK_IBUF,
    CLK50MHZ,
    PS2_DATA_IBUF);
  output O0;
  output O1_reg_0;
  input PS2_CLK_IBUF;
  input CLK50MHZ;
  input PS2_DATA_IBUF;

  wire CLK50MHZ;
  wire Iv0;
  wire Iv1;
  wire Iv1_i_1_n_0;
  wire O0;
  wire O0_i_1_n_0;
  wire O0_i_2_n_0;
  wire O1_i_1_n_0;
  wire O1_i_2_n_0;
  wire O1_reg_0;
  wire PS2_CLK_IBUF;
  wire PS2_DATA_IBUF;
  wire clear;
  wire \cnt0[0]_i_1_n_0 ;
  wire \cnt0[1]_i_1_n_0 ;
  wire \cnt0[2]_i_1_n_0 ;
  wire \cnt0[3]_i_1_n_0 ;
  wire \cnt0[4]_i_1_n_0 ;
  wire [4:0]cnt0_reg;
  wire \cnt1[4]_i_1_n_0 ;
  wire [4:0]cnt1_reg;
  wire [4:0]plusOp;

  LUT2 #(
    .INIT(4'h6)) 
    Iv0_i_1
       (.I0(PS2_CLK_IBUF),
        .I1(Iv0),
        .O(clear));
  FDRE #(
    .INIT(1'b0)) 
    Iv0_reg
       (.C(CLK50MHZ),
        .CE(clear),
        .D(PS2_CLK_IBUF),
        .Q(Iv0),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    Iv1_i_1
       (.I0(PS2_DATA_IBUF),
        .I1(Iv1),
        .O(Iv1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Iv1_reg
       (.C(CLK50MHZ),
        .CE(Iv1_i_1_n_0),
        .D(PS2_DATA_IBUF),
        .Q(Iv1),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0040000000000000)) 
    O0_i_1
       (.I0(cnt0_reg[2]),
        .I1(cnt0_reg[0]),
        .I2(cnt0_reg[1]),
        .I3(cnt0_reg[3]),
        .I4(cnt0_reg[4]),
        .I5(O0_i_2_n_0),
        .O(O0_i_1_n_0));
  LUT2 #(
    .INIT(4'h9)) 
    O0_i_2
       (.I0(Iv0),
        .I1(PS2_CLK_IBUF),
        .O(O0_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    O0_reg
       (.C(CLK50MHZ),
        .CE(O0_i_1_n_0),
        .D(PS2_CLK_IBUF),
        .Q(O0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00004004)) 
    O1_i_1
       (.I0(cnt1_reg[3]),
        .I1(cnt1_reg[4]),
        .I2(Iv1),
        .I3(PS2_DATA_IBUF),
        .I4(O1_i_2_n_0),
        .O(O1_i_1_n_0));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'hF7)) 
    O1_i_2
       (.I0(cnt1_reg[1]),
        .I1(cnt1_reg[0]),
        .I2(cnt1_reg[2]),
        .O(O1_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    O1_reg
       (.C(CLK50MHZ),
        .CE(O1_i_1_n_0),
        .D(PS2_DATA_IBUF),
        .Q(O1_reg_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h4444444444C44444)) 
    \cnt0[0]_i_1 
       (.I0(cnt0_reg[0]),
        .I1(O0_i_2_n_0),
        .I2(cnt0_reg[4]),
        .I3(cnt0_reg[3]),
        .I4(cnt0_reg[1]),
        .I5(cnt0_reg[2]),
        .O(\cnt0[0]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h1000FF00FF000000)) 
    \cnt0[1]_i_1 
       (.I0(cnt0_reg[2]),
        .I1(cnt0_reg[3]),
        .I2(cnt0_reg[4]),
        .I3(O0_i_2_n_0),
        .I4(cnt0_reg[1]),
        .I5(cnt0_reg[0]),
        .O(\cnt0[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h0D00F000F000F000)) 
    \cnt0[2]_i_1 
       (.I0(cnt0_reg[4]),
        .I1(cnt0_reg[3]),
        .I2(cnt0_reg[2]),
        .I3(O0_i_2_n_0),
        .I4(cnt0_reg[1]),
        .I5(cnt0_reg[0]),
        .O(\cnt0[2]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7F00007F80000080)) 
    \cnt0[3]_i_1 
       (.I0(cnt0_reg[1]),
        .I1(cnt0_reg[0]),
        .I2(cnt0_reg[2]),
        .I3(PS2_CLK_IBUF),
        .I4(Iv0),
        .I5(cnt0_reg[3]),
        .O(\cnt0[3]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'h7FFF000080000000)) 
    \cnt0[4]_i_1 
       (.I0(cnt0_reg[3]),
        .I1(cnt0_reg[1]),
        .I2(cnt0_reg[0]),
        .I3(cnt0_reg[2]),
        .I4(O0_i_2_n_0),
        .I5(cnt0_reg[4]),
        .O(\cnt0[4]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cnt0_reg[0] 
       (.C(CLK50MHZ),
        .CE(1'b1),
        .D(\cnt0[0]_i_1_n_0 ),
        .Q(cnt0_reg[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt0_reg[1] 
       (.C(CLK50MHZ),
        .CE(1'b1),
        .D(\cnt0[1]_i_1_n_0 ),
        .Q(cnt0_reg[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt0_reg[2] 
       (.C(CLK50MHZ),
        .CE(1'b1),
        .D(\cnt0[2]_i_1_n_0 ),
        .Q(cnt0_reg[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt0_reg[3] 
       (.C(CLK50MHZ),
        .CE(1'b1),
        .D(\cnt0[3]_i_1_n_0 ),
        .Q(cnt0_reg[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt0_reg[4] 
       (.C(CLK50MHZ),
        .CE(1'b1),
        .D(\cnt0[4]_i_1_n_0 ),
        .Q(cnt0_reg[4]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt1[0]_i_1 
       (.I0(cnt1_reg[0]),
        .O(plusOp[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt1[1]_i_1 
       (.I0(cnt1_reg[0]),
        .I1(cnt1_reg[1]),
        .O(plusOp[1]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h6A)) 
    \cnt1[2]_i_1 
       (.I0(cnt1_reg[2]),
        .I1(cnt1_reg[0]),
        .I2(cnt1_reg[1]),
        .O(plusOp[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt1[3]_i_1 
       (.I0(cnt1_reg[2]),
        .I1(cnt1_reg[0]),
        .I2(cnt1_reg[1]),
        .I3(cnt1_reg[3]),
        .O(plusOp[3]));
  LUT5 #(
    .INIT(32'hFFFFBFFF)) 
    \cnt1[4]_i_1 
       (.I0(cnt1_reg[2]),
        .I1(cnt1_reg[0]),
        .I2(cnt1_reg[1]),
        .I3(cnt1_reg[4]),
        .I4(cnt1_reg[3]),
        .O(\cnt1[4]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h6CCCCCCC)) 
    \cnt1[4]_i_2 
       (.I0(cnt1_reg[3]),
        .I1(cnt1_reg[4]),
        .I2(cnt1_reg[1]),
        .I3(cnt1_reg[0]),
        .I4(cnt1_reg[2]),
        .O(plusOp[4]));
  FDRE #(
    .INIT(1'b0)) 
    \cnt1_reg[0] 
       (.C(CLK50MHZ),
        .CE(\cnt1[4]_i_1_n_0 ),
        .D(plusOp[0]),
        .Q(cnt1_reg[0]),
        .R(Iv1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt1_reg[1] 
       (.C(CLK50MHZ),
        .CE(\cnt1[4]_i_1_n_0 ),
        .D(plusOp[1]),
        .Q(cnt1_reg[1]),
        .R(Iv1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt1_reg[2] 
       (.C(CLK50MHZ),
        .CE(\cnt1[4]_i_1_n_0 ),
        .D(plusOp[2]),
        .Q(cnt1_reg[2]),
        .R(Iv1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt1_reg[3] 
       (.C(CLK50MHZ),
        .CE(\cnt1[4]_i_1_n_0 ),
        .D(plusOp[3]),
        .Q(cnt1_reg[3]),
        .R(Iv1_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \cnt1_reg[4] 
       (.C(CLK50MHZ),
        .CE(\cnt1[4]_i_1_n_0 ),
        .D(plusOp[4]),
        .Q(cnt1_reg[4]),
        .R(Iv1_i_1_n_0));
endmodule

module seg7decimal
   (s,
    AN_OBUF,
    Q,
    CLK,
    D);
  output [2:0]s;
  output [7:0]AN_OBUF;
  output [6:0]Q;
  input CLK;
  input [3:0]D;

  wire [7:0]AN_OBUF;
  wire CLK;
  wire [3:0]D;
  wire [6:0]Q;
  wire \clkdiv[0]_i_2_n_0 ;
  wire \clkdiv_reg[0]_i_1_n_0 ;
  wire \clkdiv_reg[0]_i_1_n_1 ;
  wire \clkdiv_reg[0]_i_1_n_2 ;
  wire \clkdiv_reg[0]_i_1_n_3 ;
  wire \clkdiv_reg[0]_i_1_n_4 ;
  wire \clkdiv_reg[0]_i_1_n_5 ;
  wire \clkdiv_reg[0]_i_1_n_6 ;
  wire \clkdiv_reg[0]_i_1_n_7 ;
  wire \clkdiv_reg[12]_i_1_n_0 ;
  wire \clkdiv_reg[12]_i_1_n_1 ;
  wire \clkdiv_reg[12]_i_1_n_2 ;
  wire \clkdiv_reg[12]_i_1_n_3 ;
  wire \clkdiv_reg[12]_i_1_n_4 ;
  wire \clkdiv_reg[12]_i_1_n_5 ;
  wire \clkdiv_reg[12]_i_1_n_6 ;
  wire \clkdiv_reg[12]_i_1_n_7 ;
  wire \clkdiv_reg[16]_i_1_n_1 ;
  wire \clkdiv_reg[16]_i_1_n_2 ;
  wire \clkdiv_reg[16]_i_1_n_3 ;
  wire \clkdiv_reg[16]_i_1_n_4 ;
  wire \clkdiv_reg[16]_i_1_n_5 ;
  wire \clkdiv_reg[16]_i_1_n_6 ;
  wire \clkdiv_reg[16]_i_1_n_7 ;
  wire \clkdiv_reg[4]_i_1_n_0 ;
  wire \clkdiv_reg[4]_i_1_n_1 ;
  wire \clkdiv_reg[4]_i_1_n_2 ;
  wire \clkdiv_reg[4]_i_1_n_3 ;
  wire \clkdiv_reg[4]_i_1_n_4 ;
  wire \clkdiv_reg[4]_i_1_n_5 ;
  wire \clkdiv_reg[4]_i_1_n_6 ;
  wire \clkdiv_reg[4]_i_1_n_7 ;
  wire \clkdiv_reg[8]_i_1_n_0 ;
  wire \clkdiv_reg[8]_i_1_n_1 ;
  wire \clkdiv_reg[8]_i_1_n_2 ;
  wire \clkdiv_reg[8]_i_1_n_3 ;
  wire \clkdiv_reg[8]_i_1_n_4 ;
  wire \clkdiv_reg[8]_i_1_n_5 ;
  wire \clkdiv_reg[8]_i_1_n_6 ;
  wire \clkdiv_reg[8]_i_1_n_7 ;
  wire \clkdiv_reg_n_0_[0] ;
  wire \clkdiv_reg_n_0_[10] ;
  wire \clkdiv_reg_n_0_[11] ;
  wire \clkdiv_reg_n_0_[12] ;
  wire \clkdiv_reg_n_0_[13] ;
  wire \clkdiv_reg_n_0_[14] ;
  wire \clkdiv_reg_n_0_[15] ;
  wire \clkdiv_reg_n_0_[16] ;
  wire \clkdiv_reg_n_0_[1] ;
  wire \clkdiv_reg_n_0_[2] ;
  wire \clkdiv_reg_n_0_[3] ;
  wire \clkdiv_reg_n_0_[4] ;
  wire \clkdiv_reg_n_0_[5] ;
  wire \clkdiv_reg_n_0_[6] ;
  wire \clkdiv_reg_n_0_[7] ;
  wire \clkdiv_reg_n_0_[8] ;
  wire \clkdiv_reg_n_0_[9] ;
  wire [3:0]digit;
  wire [2:0]s;
  wire [6:0]seg;
  wire [3:3]\NLW_clkdiv_reg[16]_i_1_CO_UNCONNECTED ;

  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hFE)) 
    \AN_OBUF[0]_inst_i_1 
       (.I0(s[2]),
        .I1(s[0]),
        .I2(s[1]),
        .O(AN_OBUF[0]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \AN_OBUF[1]_inst_i_1 
       (.I0(s[2]),
        .I1(s[0]),
        .I2(s[1]),
        .O(AN_OBUF[1]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hFB)) 
    \AN_OBUF[2]_inst_i_1 
       (.I0(s[2]),
        .I1(s[1]),
        .I2(s[0]),
        .O(AN_OBUF[2]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'hBF)) 
    \AN_OBUF[3]_inst_i_1 
       (.I0(s[2]),
        .I1(s[0]),
        .I2(s[1]),
        .O(AN_OBUF[3]));
  (* SOFT_HLUTNM = "soft_lutpair10" *) 
  LUT3 #(
    .INIT(8'hEF)) 
    \AN_OBUF[4]_inst_i_1 
       (.I0(s[0]),
        .I1(s[1]),
        .I2(s[2]),
        .O(AN_OBUF[4]));
  (* SOFT_HLUTNM = "soft_lutpair11" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \AN_OBUF[5]_inst_i_1 
       (.I0(s[0]),
        .I1(s[1]),
        .I2(s[2]),
        .O(AN_OBUF[5]));
  (* SOFT_HLUTNM = "soft_lutpair9" *) 
  LUT3 #(
    .INIT(8'hDF)) 
    \AN_OBUF[6]_inst_i_1 
       (.I0(s[1]),
        .I1(s[0]),
        .I2(s[2]),
        .O(AN_OBUF[6]));
  (* SOFT_HLUTNM = "soft_lutpair8" *) 
  LUT3 #(
    .INIT(8'h7F)) 
    \AN_OBUF[7]_inst_i_1 
       (.I0(s[0]),
        .I1(s[1]),
        .I2(s[2]),
        .O(AN_OBUF[7]));
  LUT1 #(
    .INIT(2'h1)) 
    \clkdiv[0]_i_2 
       (.I0(\clkdiv_reg_n_0_[0] ),
        .O(\clkdiv[0]_i_2_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[0]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[0] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clkdiv_reg[0]_i_1 
       (.CI(1'b0),
        .CO({\clkdiv_reg[0]_i_1_n_0 ,\clkdiv_reg[0]_i_1_n_1 ,\clkdiv_reg[0]_i_1_n_2 ,\clkdiv_reg[0]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b1}),
        .O({\clkdiv_reg[0]_i_1_n_4 ,\clkdiv_reg[0]_i_1_n_5 ,\clkdiv_reg[0]_i_1_n_6 ,\clkdiv_reg[0]_i_1_n_7 }),
        .S({\clkdiv_reg_n_0_[3] ,\clkdiv_reg_n_0_[2] ,\clkdiv_reg_n_0_[1] ,\clkdiv[0]_i_2_n_0 }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[10] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[8]_i_1_n_5 ),
        .Q(\clkdiv_reg_n_0_[10] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[11] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[8]_i_1_n_4 ),
        .Q(\clkdiv_reg_n_0_[11] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[12] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[12]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[12] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clkdiv_reg[12]_i_1 
       (.CI(\clkdiv_reg[8]_i_1_n_0 ),
        .CO({\clkdiv_reg[12]_i_1_n_0 ,\clkdiv_reg[12]_i_1_n_1 ,\clkdiv_reg[12]_i_1_n_2 ,\clkdiv_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clkdiv_reg[12]_i_1_n_4 ,\clkdiv_reg[12]_i_1_n_5 ,\clkdiv_reg[12]_i_1_n_6 ,\clkdiv_reg[12]_i_1_n_7 }),
        .S({\clkdiv_reg_n_0_[15] ,\clkdiv_reg_n_0_[14] ,\clkdiv_reg_n_0_[13] ,\clkdiv_reg_n_0_[12] }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[13] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[12]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[13] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[14] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[12]_i_1_n_5 ),
        .Q(\clkdiv_reg_n_0_[14] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[15] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[12]_i_1_n_4 ),
        .Q(\clkdiv_reg_n_0_[15] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[16] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[16]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[16] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clkdiv_reg[16]_i_1 
       (.CI(\clkdiv_reg[12]_i_1_n_0 ),
        .CO({\NLW_clkdiv_reg[16]_i_1_CO_UNCONNECTED [3],\clkdiv_reg[16]_i_1_n_1 ,\clkdiv_reg[16]_i_1_n_2 ,\clkdiv_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clkdiv_reg[16]_i_1_n_4 ,\clkdiv_reg[16]_i_1_n_5 ,\clkdiv_reg[16]_i_1_n_6 ,\clkdiv_reg[16]_i_1_n_7 }),
        .S({s,\clkdiv_reg_n_0_[16] }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[17] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[16]_i_1_n_6 ),
        .Q(s[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[18] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[16]_i_1_n_5 ),
        .Q(s[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[19] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[16]_i_1_n_4 ),
        .Q(s[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[0]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[0]_i_1_n_5 ),
        .Q(\clkdiv_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[0]_i_1_n_4 ),
        .Q(\clkdiv_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[4]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[4] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clkdiv_reg[4]_i_1 
       (.CI(\clkdiv_reg[0]_i_1_n_0 ),
        .CO({\clkdiv_reg[4]_i_1_n_0 ,\clkdiv_reg[4]_i_1_n_1 ,\clkdiv_reg[4]_i_1_n_2 ,\clkdiv_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clkdiv_reg[4]_i_1_n_4 ,\clkdiv_reg[4]_i_1_n_5 ,\clkdiv_reg[4]_i_1_n_6 ,\clkdiv_reg[4]_i_1_n_7 }),
        .S({\clkdiv_reg_n_0_[7] ,\clkdiv_reg_n_0_[6] ,\clkdiv_reg_n_0_[5] ,\clkdiv_reg_n_0_[4] }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[4]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[4]_i_1_n_5 ),
        .Q(\clkdiv_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[7] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[4]_i_1_n_4 ),
        .Q(\clkdiv_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[8] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[8]_i_1_n_7 ),
        .Q(\clkdiv_reg_n_0_[8] ),
        .R(1'b0));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \clkdiv_reg[8]_i_1 
       (.CI(\clkdiv_reg[4]_i_1_n_0 ),
        .CO({\clkdiv_reg[8]_i_1_n_0 ,\clkdiv_reg[8]_i_1_n_1 ,\clkdiv_reg[8]_i_1_n_2 ,\clkdiv_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\clkdiv_reg[8]_i_1_n_4 ,\clkdiv_reg[8]_i_1_n_5 ,\clkdiv_reg[8]_i_1_n_6 ,\clkdiv_reg[8]_i_1_n_7 }),
        .S({\clkdiv_reg_n_0_[11] ,\clkdiv_reg_n_0_[10] ,\clkdiv_reg_n_0_[9] ,\clkdiv_reg_n_0_[8] }));
  FDRE #(
    .INIT(1'b0)) 
    \clkdiv_reg[9] 
       (.C(CLK),
        .CE(1'b1),
        .D(\clkdiv_reg[8]_i_1_n_6 ),
        .Q(\clkdiv_reg_n_0_[9] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[0]),
        .Q(digit[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[1]),
        .Q(digit[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[2]),
        .Q(digit[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \digit_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(D[3]),
        .Q(digit[3]),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'h2094)) 
    \seg[0]_i_1 
       (.I0(digit[3]),
        .I1(digit[2]),
        .I2(digit[0]),
        .I3(digit[1]),
        .O(seg[0]));
  (* SOFT_HLUTNM = "soft_lutpair5" *) 
  LUT4 #(
    .INIT(16'hA4C8)) 
    \seg[1]_i_1 
       (.I0(digit[3]),
        .I1(digit[2]),
        .I2(digit[1]),
        .I3(digit[0]),
        .O(seg[1]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hA210)) 
    \seg[2]_i_1 
       (.I0(digit[3]),
        .I1(digit[0]),
        .I2(digit[1]),
        .I3(digit[2]),
        .O(seg[2]));
  (* SOFT_HLUTNM = "soft_lutpair6" *) 
  LUT4 #(
    .INIT(16'hC214)) 
    \seg[3]_i_1 
       (.I0(digit[3]),
        .I1(digit[2]),
        .I2(digit[0]),
        .I3(digit[1]),
        .O(seg[3]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h5710)) 
    \seg[4]_i_1 
       (.I0(digit[3]),
        .I1(digit[1]),
        .I2(digit[2]),
        .I3(digit[0]),
        .O(seg[4]));
  (* SOFT_HLUTNM = "soft_lutpair7" *) 
  LUT4 #(
    .INIT(16'h5190)) 
    \seg[5]_i_1 
       (.I0(digit[3]),
        .I1(digit[2]),
        .I2(digit[0]),
        .I3(digit[1]),
        .O(seg[5]));
  LUT4 #(
    .INIT(16'h4025)) 
    \seg[6]_i_1 
       (.I0(digit[3]),
        .I1(digit[0]),
        .I2(digit[2]),
        .I3(digit[1]),
        .O(seg[6]));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg[0] 
       (.C(CLK),
        .CE(1'b1),
        .D(seg[0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg[1] 
       (.C(CLK),
        .CE(1'b1),
        .D(seg[1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg[2] 
       (.C(CLK),
        .CE(1'b1),
        .D(seg[2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg[3] 
       (.C(CLK),
        .CE(1'b1),
        .D(seg[3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg[4] 
       (.C(CLK),
        .CE(1'b1),
        .D(seg[4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg[5] 
       (.C(CLK),
        .CE(1'b1),
        .D(seg[5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \seg_reg[6] 
       (.C(CLK),
        .CE(1'b1),
        .D(seg[6]),
        .Q(Q[6]),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module top
   (CLK100MHZ,
    PS2_CLK,
    PS2_DATA,
    IR_CONTROL,
    SEG,
    AN,
    DP,
    UART_TXD);
  input CLK100MHZ;
  input PS2_CLK;
  input PS2_DATA;
  output IR_CONTROL;
  output [6:0]SEG;
  output [7:0]AN;
  output DP;
  output UART_TXD;

  wire [7:0]AN;
  wire [7:0]AN_OBUF;
  wire CLK100MHZ;
  wire CLK100MHZ_IBUF;
  wire CLK100MHZ_IBUF_BUFG;
  wire CLK50MHZ;
  wire CLK50MHZ_i_1_n_0;
  wire DP;
  wire IR_CONTROL;
  wire PS2_CLK;
  wire PS2_CLK_IBUF;
  wire PS2_DATA;
  wire PS2_DATA_IBUF;
  wire [6:0]SEG;
  wire [6:0]SEG_OBUF;
  wire UART_TXD;
  wire [3:0]digit;
  wire flag;
  wire flag_BUFG;
  wire [2:0]s;

initial begin
 $sdf_annotate("top_time_synth.sdf",,,,"tool_control");
end
  OBUF \AN_OBUF[0]_inst 
       (.I(AN_OBUF[0]),
        .O(AN[0]));
  OBUF \AN_OBUF[1]_inst 
       (.I(AN_OBUF[1]),
        .O(AN[1]));
  OBUF \AN_OBUF[2]_inst 
       (.I(AN_OBUF[2]),
        .O(AN[2]));
  OBUF \AN_OBUF[3]_inst 
       (.I(AN_OBUF[3]),
        .O(AN[3]));
  OBUF \AN_OBUF[4]_inst 
       (.I(AN_OBUF[4]),
        .O(AN[4]));
  OBUF \AN_OBUF[5]_inst 
       (.I(AN_OBUF[5]),
        .O(AN[5]));
  OBUF \AN_OBUF[6]_inst 
       (.I(AN_OBUF[6]),
        .O(AN[6]));
  OBUF \AN_OBUF[7]_inst 
       (.I(AN_OBUF[7]),
        .O(AN[7]));
  BUFG CLK100MHZ_IBUF_BUFG_inst
       (.I(CLK100MHZ_IBUF),
        .O(CLK100MHZ_IBUF_BUFG));
  IBUF #(
    .CCIO_EN("TRUE")) 
    CLK100MHZ_IBUF_inst
       (.I(CLK100MHZ),
        .O(CLK100MHZ_IBUF));
  LUT1 #(
    .INIT(2'h1)) 
    CLK50MHZ_i_1
       (.I0(CLK50MHZ),
        .O(CLK50MHZ_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    CLK50MHZ_reg
       (.C(CLK100MHZ_IBUF_BUFG),
        .CE(1'b1),
        .D(CLK50MHZ_i_1_n_0),
        .Q(CLK50MHZ),
        .R(1'b0));
  OBUF DP_OBUF_inst
       (.I(1'b1),
        .O(DP));
  OBUF IR_CONTROL_OBUF_inst
       (.I(1'b0),
        .O(IR_CONTROL));
  IBUF #(
    .CCIO_EN("TRUE")) 
    PS2_CLK_IBUF_inst
       (.I(PS2_CLK),
        .O(PS2_CLK_IBUF));
  IBUF #(
    .CCIO_EN("TRUE")) 
    PS2_DATA_IBUF_inst
       (.I(PS2_DATA),
        .O(PS2_DATA_IBUF));
  OBUF \SEG_OBUF[0]_inst 
       (.I(SEG_OBUF[0]),
        .O(SEG[0]));
  OBUF \SEG_OBUF[1]_inst 
       (.I(SEG_OBUF[1]),
        .O(SEG[1]));
  OBUF \SEG_OBUF[2]_inst 
       (.I(SEG_OBUF[2]),
        .O(SEG[2]));
  OBUF \SEG_OBUF[3]_inst 
       (.I(SEG_OBUF[3]),
        .O(SEG[3]));
  OBUF \SEG_OBUF[4]_inst 
       (.I(SEG_OBUF[4]),
        .O(SEG[4]));
  OBUF \SEG_OBUF[5]_inst 
       (.I(SEG_OBUF[5]),
        .O(SEG[5]));
  OBUF \SEG_OBUF[6]_inst 
       (.I(SEG_OBUF[6]),
        .O(SEG[6]));
  OBUFT UART_TXD_OBUF_inst
       (.I(1'b0),
        .O(UART_TXD),
        .T(1'b1));
  BUFG flag_BUFG_inst
       (.I(flag),
        .O(flag_BUFG));
  PS2Receiver keyboard
       (.CLK(flag_BUFG),
        .CLK50MHZ(CLK50MHZ),
        .D(digit),
        .PS2_CLK_IBUF(PS2_CLK_IBUF),
        .PS2_DATA_IBUF(PS2_DATA_IBUF),
        .flag(flag),
        .s(s));
  seg7decimal sevenSeg
       (.AN_OBUF(AN_OBUF),
        .CLK(CLK100MHZ_IBUF_BUFG),
        .D(digit),
        .Q(SEG_OBUF),
        .s(s));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
