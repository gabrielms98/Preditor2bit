module branch_unit(
    input branch_eq, //c
    input equal;
    input [1:0]Hp,
    input [1:0]Hpd,
    output reg flush,
    output reg [1:0]muxpc,
    output reg Wrt,
    output reg Wrp
);
    
    wire H;
    wire [3:0] P;
    wire Hd;
    wire Pd;
    wire c;
    wire b;

    assign H = Hp[1];
    assign Hd = Hpd[1];
    assign Pd = Hpd[0];
    assign c = equal;
    assign b = branch_eq;

    always @(*) begin
      if((b == 1'd0) && (H == 1'd0)) begin
        muxpc <= 2'd0;
        Wrt <= 1'd0;
        Wrp <= 1'd0;
        flush <= 1'd0;
      end else if((b==1'd0)&&(H==1'd1)&&(P==1'd0)||(P==1'd1)) begin
        muxpc<=2'd0;
        Wrt<=1'd0;
        Wrp<=1'd0;
        flush<=1'd0;
      end else if((b==1'd0)&&(H==1'd0)&&(P==1'd2)||(P==1'd3)) begin
        muxpc<=1'd1;
        Wrt<=1'd0;
        Wrp<=1'd0;
        flush<=1'd0;
      end else if((b==1'd1)&&(H==1'd0)&&(Hd==1'd0)&&(c==1'd0)) begin
        muxpc<=1'd0;
        Wrt<=1'd1;
        Wrp<=1'd1;
        flush<=1'd0;
      end else if((b==1'd1)&&(H==1'd0)&&(Hd==1'd0)&&(c==1'd1)) begin
        muxpc<=1'd3;
        Wrt<=1'd1;
        Wrp<=1'd1;
        flush<=1'd1;
      end else if((b==1'd1)&&(H==1'd0)&&(Hd==1'd1)&&(c==1'd0)&&(Pd==1'd0)||(Pd==1'd1)) begin
        muxpc<=1'd0;
        Wrt<=1'd0;
        Wrp<=1'd0;
        flush<=1'd0;
        if(Pd==1'd1)
          Pd<=1'd0;
      end else if((b==1'd1)&&(H==1'd0)&&(Hd==1'd1)&&(c==1'd1)&&(Pd==1'd2)||(Pd==1'd3)) begin
        muxpc<=1'd0;
        Wrt<=1'd0;
        Wrp<=1'd0;
        flush<=1'd0;
        if(Pd==1'd2)
          Pd<=1'd3;
      end else if((b==1'd1)&&(H==1'd0)&&(Hd==1'd1)&&(c==1'd1)&&(Pd==1'd0)||(Pd==1'd1)) begin
        muxpc<=1'd3;
        Wrt<=1'd0;
        Wrp<=1'd1;
        flush<=1'd1;
        if(Pd==1'd0)
          Pd<=1'd1;
        else Pd<=1'd2;
      end else if((b==1'd1)&&(H==1'd0)&&(Hd==1'd1)&&(c==1'd0)&&(Pd==1'd2)||(Pd==1'd3)) begin
        muxpc<=1'd2;
        Wrt<=1'd0;
        Wrp<=1'd1;
        flush<=1'd1;
        if(Pd==1'd2)
          Pd<=1'd1;
        else Pd<=1'd2;
      

    end



endmodule