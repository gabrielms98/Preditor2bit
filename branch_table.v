module branch_table(
  input wire clk,
  input wire[31:0] pc4,
  input wire wrt,
  input wire wrp,
  input wire [31:0] BdestIN,
  output wire[31:0] Bdest,
  input wire Pin,
  output wire P,
  output wire H,
  input wire [31:0] PC4d
);

reg wire P;
reg wire [31:0] Bdest;
parameter BM_DATA = "dm_data.txt";
reg[25:0] tag [0:15];
reg pred[0:15];
reg [31:0] dest[0:15];

initial begin
  $readmemh(BM_DATA, tag, 0, 15);
  end
  always @(posedge clk) begin
    if(wrt) begin
      tag[pc4d[5:2]] <= pc4d[31:6];
      dest[pc4d[5:2]] <= BdestIN;
    end
    if(wrp) begin
      pred[pc4d[5:2]] <= Pin;
    end
  end
  assign Bdest = dest[pc4[5:2]][31:0];
  assign H = (tag[pc4[5:2]] == pc4[31:6]);
  assign P = pred[pc4[5:2]];
endmodule