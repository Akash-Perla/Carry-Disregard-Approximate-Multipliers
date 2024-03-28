//`include "allblocks.v"

module cd6 (
    input [7:0]A,
    input [3:0]B,
    output [11:0] R 
);

    wire [64:0]s,c;   //for sum and carry bits
    wire [7:0]pp;    //for partial product calculation

    //row0 --- calculation of partial product block

    PP PP01(pp[0],A[0],B[0]);
    PP PP02(pp[1],A[1],B[0]);
    PP PP03(pp[2],A[2],B[0]);
    PP PP04(pp[3],A[3],B[0]);
    PP PP05(pp[4],A[4],B[0]);
    PP PP06(pp[5],A[5],B[0]);
    PP PP07(pp[6],A[6],B[0]);
    PP PP08(pp[7],A[7],B[0]);

    //row1
    pi1 pi111(s[0],A[0],B[1],pp[1]); // sout,a,b,sin
    pi1 pi112(s[1],A[1],B[1],pp[2]);
    pi1 pi113(s[2],A[2],B[1],pp[3]);
    pi1 pi114(s[3],A[3],B[1],pp[4]);
    pi1 pi115(s[4],A[4],B[1],pp[5]);

    pi2 pi216(s[5],c[1],A[6],B[1],pp[7]);
    FA FA18(s[6],c[2],(A[7]&B[1]),1'b0,c[1]);
    //pi1 pi117(s[6],A[6],B[1],pp[7]);
    //pi1 pi118(s[7],A[7],B[1],1'b0);

    //row2
    pi1 pi121(s[8],A[0],B[2],s[1]);//
    pi1 pi122(s[9],A[1],B[2],s[2]);
    pi1 pi123(s[10],A[2],B[2],s[3]);
    pi1 pi124(s[11],A[3],B[2],s[4]);

    pi3 pi3125(s[12],c[0],A[5],A[4],B[1],B[2],pp[6]);
    FA FA26(s[13],c[13],(A[5]&B[2]),s[5],c[0]);
    FA FA27(s[14],c[14],(A[6]&B[2]),s[6],c[13]);
    FA FA28(s[15],c[15],(A[7]&B[2]),c[2],c[14]);
    //pi1 pi125(s[12],A[4],B[2],s[5]);
    //pi1 pi126(s[13],A[5],B[2],s[6]);
    //pi1 pi127(s[14],A[6],B[2],s[7]);
    //pi1 pi128(s[15],A[7],B[2],1'b0);

    //row3
    pi1 pi131(s[16],A[0],B[3],s[9]);//
    pi1 pi132(s[17],A[1],B[3],s[10]);
    pi1 pi133(s[18],A[2],B[3],s[11]);

    pi2 pi226(s[19],c[19],A[3],B[3],s[12]);
    FA FA35(s[20],c[20],(A[4]&B[3]),s[13],c[19]);
    FA FA36(s[21],c[21],(A[5]&B[3]),s[14],c[20]);
    FA FA37(s[22],c[22],(A[6]&B[3]),s[15],c[21]);
    FA FA38(s[23],c[23],(A[7]&B[3]),c[15],c[22]);
    
    // pi134(s[19],A[3],B[3],s[12]);
    //pi1 pi135(s[20],A[4],B[3],s[13]);
    //pi1 pi136(s[21],A[5],B[3],s[14]);
    //pi1 pi137(s[22],A[6],B[3],s[15]);
    //pi1 pi138(s[23],A[7],B[3],1'b0);

    assign R[0] = pp[0];
    assign R[1] = s[0];
    assign R[2] = s[8];
    assign R[3] = s[16];
    assign R[4] = s[17];
    assign R[5] = s[18];
    assign R[6] = s[19];
    assign R[7] = s[20];
    assign R[8] = s[21];
    assign R[9] = s[22];
    assign R[10] = s[23];
    assign R[11] = c[23];


endmodule