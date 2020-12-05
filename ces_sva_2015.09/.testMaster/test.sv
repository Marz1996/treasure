program automatic test(router_io.TB router);
  int run_for_n_packets;	// number of packets to test
  bit[3:0] sa;			// source address
  bit[3:0] da; 			// destination address
  reg[7:0] payload[$];		// packet data array
  reg[7:0] pkt2cmp_payload[$];	// actual packet data array

  initial begin
    $vcdpluson;
    run_for_n_packets = 21;
    reset();
    repeat(50) @(router.cb);
    repeat(run_for_n_packets) begin
      	gen();
	  fork
      	send();
      	recv();
	  join
    end
	gen();
	send_bad();
    repeat(10) @(router.cb);
  end


  task reset();
    router.reset_n <= 1'b0;
    router.cb.frame_n <= '1;
    router.cb.valid_n <= '1;
    ##2 router.cb.reset_n <= 1'b1;
    repeat(15) @(router.cb);
  endtask

  task gen();
    sa = 3;
    da = 7;
    payload.delete();
    repeat($urandom_range(2,4))
      payload.push_back($urandom);
  endtask

  task send();
    send_addrs();
    send_pad();
    send_payload();
  endtask

  task send_bad();
    send_addrs();
    send_pad();
    send_bad_payload();
  endtask

  task recv();
    get_payload();
  endtask

  task send_addrs();
    router.cb.frame_n[sa] <= 1'b0;
    for(int i=0; i<4; i++) begin
      router.cb.din[sa] <= da[i];
      @(router.cb);
    end
  endtask

  task send_pad();
    router.cb.frame_n[sa] <= 1'b0;
    router.cb.valid_n[sa] <= 1'b1;
    router.cb.din[sa] <= 1'b1;
    repeat(5) @(router.cb);
  endtask

  task send_payload();
    foreach(payload[index]) begin
      for(int i=0; i<8; i++) begin
        router.cb.din[sa] <= payload[index][i];
        router.cb.valid_n[sa] <= 1'b0;
        router.cb.frame_n[sa] <= (index == (payload.size() - 1)) && (i == 7);
        @(router.cb);
      end
    end
    router.cb.valid_n[sa] <= 1'b1;
  endtask

  task send_bad_payload();
    foreach(payload[index]) begin
      for(int i=0; i<8; i++) begin
        router.cb.din[sa] <= payload[index][i];
        router.cb.valid_n[sa] <= 1'b0;
        router.cb.frame_n[sa] <= (index == (payload.size() - 1)) && (i == 6 || i == 7);
        @(router.cb);
      end
    end
    router.cb.valid_n[sa] <= 1'b1;
  endtask

  task count_x(bit[3:0] oport, string inst);
  	static int num_x[] = new[16];
	num_x[oport]++;
	$display("[ERROR]:%t (%s) X detected in output - %0d",$realtime,inst,num_x[oport]);
  endtask

  task get_payload();
    pkt2cmp_payload.delete();
    fork: frameo_wd_timer
      @(negedge router.cb.frameo_n[da]);
      begin
        repeat(1000) @(router.cb);
        $display("\n%m\n[ERROR]%t Frame signal timed out!\n", $realtime);
        $finish;
      end
    join_any: frameo_wd_timer
    disable frameo_wd_timer;
    forever begin
      reg[7:0] datum;
      for (int i=0; i<8; ) begin
        if (!router.cb.valido_n[da]) begin
          datum[i] = router.cb.dout[da];
		  assert(!$isunknown(datum[i++])) else count_x(da, $psprintf("%m"));
		end
        if (router.cb.frameo_n[da])
          if (i == 8) begin
            pkt2cmp_payload.push_back(datum);
            return;
          end
          else begin
            $display("\n%m\n[ERROR]%t Packet payload not byte aligned!\n", $realtime);
            $finish;
          end
        @(router.cb);
      end
      pkt2cmp_payload.push_back(datum);
    end
  endtask

endprogram
