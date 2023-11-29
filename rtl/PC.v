module PC(
    input clk,
    input rst_n,
    input en,
    input [31:0] npc, 
    
    output reg [31:0] pc
);

    reg rst_n_p;

    // rst_n_p control
    always @(posedge clk) begin
        rst_n_p <= rst_n;
    end

    // rst_n_p control
    always @(posedge clk or negedge rst_n) begin
        if(!rst_n)          pc <= 32'b0;
        else if(!rst_n_p)   pc <= 32'b0;
        else if(en)         pc <= npc;
        else                pc <= pc;
    end

endmodule
