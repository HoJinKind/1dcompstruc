/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    input modeInput,
    input startInput,
    input addInput,
    input subInput,
    input multInput,
    input divInput,
    input increaseInput,
    output reg outputModeOne,
    output reg outputModeTwo,
    output reg outputButtonLight,
    output reg [6:0] io_seg1,
    output reg [3:0] io_sel1,
    output reg [6:0] io_seg2,
    output reg [3:0] io_sel2,
    output reg [6:0] io_seg4,
    output reg [0:0] io_sel4
  );
  
  
  
  reg rst;
  
  reg [15:0] a;
  
  reg [5:0] alufn;
  
  reg [29:0] M_test_counter_d, M_test_counter_q = 1'h0;
  
  wire [16-1:0] M_alu_result;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  reg [6-1:0] M_alu_alufn;
  alu_1 alu (
    .a(M_alu_a),
    .b(M_alu_b),
    .alufn(M_alu_alufn),
    .result(M_alu_result)
  );
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_2 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [1-1:0] M_btn_mode_input_out;
  reg [1-1:0] M_btn_mode_input_in;
  button_conditioner_3 btn_mode_input (
    .clk(clk),
    .in(M_btn_mode_input_in),
    .out(M_btn_mode_input_out)
  );
  wire [1-1:0] M_edge_mode_input_out;
  reg [1-1:0] M_edge_mode_input_in;
  edge_detector_4 edge_mode_input (
    .clk(clk),
    .in(M_edge_mode_input_in),
    .out(M_edge_mode_input_out)
  );
  wire [1-1:0] M_btn_start_input_out;
  reg [1-1:0] M_btn_start_input_in;
  button_conditioner_3 btn_start_input (
    .clk(clk),
    .in(M_btn_start_input_in),
    .out(M_btn_start_input_out)
  );
  wire [1-1:0] M_edge_start_input_out;
  reg [1-1:0] M_edge_start_input_in;
  edge_detector_4 edge_start_input (
    .clk(clk),
    .in(M_edge_start_input_in),
    .out(M_edge_start_input_out)
  );
  wire [1-1:0] M_btn_increase_input_out;
  reg [1-1:0] M_btn_increase_input_in;
  button_conditioner_3 btn_increase_input (
    .clk(clk),
    .in(M_btn_increase_input_in),
    .out(M_btn_increase_input_out)
  );
  wire [1-1:0] M_edge_increase_input_out;
  reg [1-1:0] M_edge_increase_input_in;
  edge_detector_4 edge_increase_input (
    .clk(clk),
    .in(M_edge_increase_input_in),
    .out(M_edge_increase_input_out)
  );
  wire [1-1:0] M_btn_add_input_out;
  reg [1-1:0] M_btn_add_input_in;
  button_conditioner_3 btn_add_input (
    .clk(clk),
    .in(M_btn_add_input_in),
    .out(M_btn_add_input_out)
  );
  wire [1-1:0] M_edge_add_input_out;
  reg [1-1:0] M_edge_add_input_in;
  edge_detector_4 edge_add_input (
    .clk(clk),
    .in(M_edge_add_input_in),
    .out(M_edge_add_input_out)
  );
  localparam IDLE_state = 3'd0;
  localparam STARTROUNDA_state = 3'd1;
  localparam STARTROUNDB_state = 3'd2;
  localparam WAITARITHMETIC_state = 3'd3;
  localparam COMPARECOUNTER_state = 3'd4;
  localparam COMPAREHIGHSCORE_state = 3'd5;
  
  reg [2:0] M_state_d, M_state_q = IDLE_state;
  wire [7-1:0] M_seg_segs;
  wire [4-1:0] M_seg_sel;
  reg [16-1:0] M_seg_values;
  multi_seven_seg_11 seg (
    .clk(clk),
    .rst(rst),
    .values(M_seg_values),
    .segs(M_seg_segs),
    .sel(M_seg_sel)
  );
  wire [7-1:0] M_seg2_segs;
  wire [4-1:0] M_seg2_sel;
  reg [16-1:0] M_seg2_values;
  multi_seven_seg_11 seg2 (
    .clk(clk),
    .rst(rst),
    .values(M_seg2_values),
    .segs(M_seg2_segs),
    .sel(M_seg2_sel)
  );
  wire [7-1:0] M_seg4_segs;
  wire [4-1:0] M_seg4_sel;
  reg [16-1:0] M_seg4_values;
  multi_seven_seg_11 seg4 (
    .clk(clk),
    .rst(rst),
    .values(M_seg4_values),
    .segs(M_seg4_segs),
    .sel(M_seg4_sel)
  );
  reg [15:0] M_currentscore_d, M_currentscore_q = 1'h0;
  reg [3:0] M_counter_d, M_counter_q = 1'h0;
  reg [15:0] M_highscore_d, M_highscore_q = 1'h0;
  reg [15:0] M_b_d, M_b_q = 1'h0;
  reg M_buttonGameMode_d, M_buttonGameMode_q = 1'h0;
  
  localparam DELAYTIME = 5'h1d;
  
  wire [16-1:0] M_convertHS_digits;
  reg [14-1:0] M_convertHS_value;
  bin_to_dec_14 convertHS (
    .value(M_convertHS_value),
    .digits(M_convertHS_digits)
  );
  
  wire [16-1:0] M_convertCS_digits;
  reg [14-1:0] M_convertCS_value;
  bin_to_dec_14 convertCS (
    .value(M_convertCS_value),
    .digits(M_convertCS_digits)
  );
  
  always @* begin
    M_state_d = M_state_q;
    M_b_d = M_b_q;
    M_buttonGameMode_d = M_buttonGameMode_q;
    M_test_counter_d = M_test_counter_q;
    M_currentscore_d = M_currentscore_q;
    M_counter_d = M_counter_q;
    M_highscore_d = M_highscore_q;
    
    M_btn_mode_input_in = modeInput;
    M_edge_mode_input_in = M_btn_mode_input_out;
    M_btn_start_input_in = startInput;
    M_edge_start_input_in = M_btn_start_input_out;
    M_btn_increase_input_in = increaseInput;
    M_edge_increase_input_in = M_btn_increase_input_out;
    M_btn_add_input_in = addInput;
    M_edge_add_input_in = M_btn_add_input_out;
    M_convertHS_value = M_highscore_q;
    M_convertCS_value = M_currentscore_q;
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    outputModeOne = ~M_buttonGameMode_q;
    outputModeTwo = M_buttonGameMode_q;
    outputButtonLight = 1'h0;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    M_alu_a = 16'h0000;
    M_alu_b = 16'h0000;
    M_alu_alufn = 6'h00;
    
    case (M_state_q)
      IDLE_state: begin
        outputButtonLight = 1'h1;
        led[0+0-:1] = 1'h1;
        M_counter_d = 1'h0;
        M_b_d = 16'h000b;
        M_convertCS_value = 16'haaaa;
        
        case (M_edge_mode_input_out)
          1'h1: begin
            M_buttonGameMode_d = ~M_buttonGameMode_q;
          end
        endcase
        
        case (M_edge_start_input_out)
          1'h1: begin
            M_currentscore_d = 16'h0000;
            if (M_buttonGameMode_q == 1'h0) begin
              M_state_d = STARTROUNDA_state;
              M_b_d = 16'h0001;
            end else begin
              M_b_d = 16'h0001;
              M_state_d = STARTROUNDB_state;
            end
          end
        endcase
      end
      STARTROUNDA_state: begin
        led[1+0-:1] = 1'h1;
        if (M_test_counter_q[26+0-:1] == 1'h1) begin
          outputButtonLight = 1'h1;
        end
        if (M_edge_start_input_out) begin
          M_state_d = WAITARITHMETIC_state;
        end
      end
      STARTROUNDB_state: begin
        led[2+0-:1] = 1'h1;
        if (M_test_counter_q[26+0-:1] == 1'h1) begin
          outputButtonLight = 1'h1;
        end
        if (M_edge_start_input_out) begin
          M_state_d = WAITARITHMETIC_state;
        end
        if (M_edge_increase_input_out) begin
          if (M_b_q < 3'h5) begin
            M_b_d = M_b_q + 1'h1;
          end else begin
            M_b_d = 1'h1;
          end
        end
      end
      WAITARITHMETIC_state: begin
        led[3+0-:1] = 1'h1;
        if (M_edge_add_input_out) begin
          M_alu_a = M_currentscore_q;
          M_alu_b = M_b_q;
          M_alu_alufn = 6'h00;
          M_currentscore_d = M_alu_result;
          M_state_d = COMPAREHIGHSCORE_state;
          M_counter_d = M_counter_q + 1'h1;
        end
        if (subInput) begin
          M_alu_a = M_currentscore_q;
          M_alu_b = M_b_q;
          M_alu_alufn = 6'h01;
          M_currentscore_d = M_alu_result;
          M_state_d = COMPAREHIGHSCORE_state;
          M_counter_d = M_counter_q + 1'h1;
        end
        if (multInput == 1'h1) begin
          M_alu_a = M_currentscore_q;
          M_alu_b = M_b_q;
          M_alu_alufn = 6'h02;
          M_currentscore_d = M_alu_result;
          M_state_d = COMPAREHIGHSCORE_state;
          M_counter_d = M_counter_q + 1'h1;
        end
        if (divInput == 1'h1) begin
          M_alu_a = M_currentscore_q;
          M_alu_b = M_b_q;
          M_alu_alufn = 6'h03;
          M_currentscore_d = M_alu_result;
          M_state_d = COMPAREHIGHSCORE_state;
          M_counter_d = M_counter_q + 1'h1;
        end
      end
      COMPAREHIGHSCORE_state: begin
        led[4+0-:1] = 1'h1;
        M_alu_a = M_currentscore_q;
        M_alu_b = M_highscore_q;
        M_alu_alufn = 6'h35;
        if (M_alu_result[0+0-:1] == 1'h0) begin
          M_highscore_d = M_currentscore_q;
        end
        M_state_d = COMPARECOUNTER_state;
      end
      COMPARECOUNTER_state: begin
        led[5+0-:1] = 1'h1;
        M_alu_a = M_counter_q;
        M_alu_b = 3'h5;
        M_alu_alufn = 6'h33;
        if (M_alu_result[0+0-:1] == 1'h1) begin
          M_state_d = IDLE_state;
        end else begin
          if (M_buttonGameMode_q == 1'h1) begin
            M_state_d = STARTROUNDB_state;
          end else begin
            M_state_d = STARTROUNDA_state;
            M_b_d = M_b_q + 1'h1;
          end
        end
      end
    endcase
    io_seg1 = 8'hff;
    io_sel1 = 4'hf;
    io_seg1 = ~M_seg_segs;
    io_sel1 = ~M_seg_sel;
    io_seg2 = 8'hff;
    io_sel2 = 4'hf;
    io_seg2 = ~M_seg2_segs;
    io_sel2 = ~M_seg2_sel;
    io_seg4 = 8'hff;
    io_sel4 = 4'hf;
    io_seg4 = ~M_seg4_segs;
    io_sel4 = ~M_seg4_sel;
    M_seg_values = M_convertHS_digits;
    M_seg2_values = M_convertCS_digits;
    M_seg4_values = {M_b_q[0+3-:4], M_b_q[0+3-:4], M_b_q[0+3-:4], M_b_q[0+3-:4]};
    M_test_counter_d = M_test_counter_q + 1'h1;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_currentscore_q <= 1'h0;
      M_counter_q <= 1'h0;
      M_highscore_q <= 1'h0;
      M_b_q <= 1'h0;
      M_buttonGameMode_q <= 1'h0;
      M_state_q <= 1'h0;
    end else begin
      M_currentscore_q <= M_currentscore_d;
      M_counter_q <= M_counter_d;
      M_highscore_q <= M_highscore_d;
      M_b_q <= M_b_d;
      M_buttonGameMode_q <= M_buttonGameMode_d;
      M_state_q <= M_state_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_test_counter_q <= 1'h0;
    end else begin
      M_test_counter_q <= M_test_counter_d;
    end
  end
  
endmodule
