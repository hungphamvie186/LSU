verdiSetActWin -dock widgetDock_<Decl._Tree>
debImport "-sverilog" "-f" "../00_src/flist.f" "design_test.fsdb"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "500" "180" "900" "700"
wvCreateWindow
schCreateWindow -delim "." -win $_nSchema1 -scope "design_test"
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -inst "dut"
schPushViewIn -win $_nSchema3
verdiSetActWin -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 0)}
wvOpenFile -win $_nWave2 \
           {/earth/mars/mars04/workspace/School_Pj/milestone2/LSU/02_sim/design_test.fsdb}
verdiSetActWin -win $_nSchema_3
schSetOptions -win $_nSchema3 -portName on
schSetOptions -win $_nSchema3 -pinName on
schSetOptions -win $_nSchema3 -instName on
schSetOptions -win $_nSchema3 -localNetName on
schSetOptions -win $_nSchema3 -completeName on
schZoomIn -win $_nSchema3 -pos 37022 4506
schZoomIn -win $_nSchema3 -pos 37022 4506
schZoomIn -win $_nSchema3 -pos 37022 4505
schZoomIn -win $_nSchema3 -pos 39090 5639
schZoomIn -win $_nSchema3 -pos 39065 5638
schZoomIn -win $_nSchema3 -pos 39046 5619
schZoomOut -win $_nSchema3 -pos 38355 6548
schZoomOut -win $_nSchema3 -pos 38355 6548
schZoomOut -win $_nSchema3 -pos 38354 6547
schZoomOut -win $_nSchema3 -pos 38353 6547
schZoomOut -win $_nSchema3 -pos 38353 6547
schSelect -win $_nSchema3 -inst "ip"
schPushViewIn -win $_nSchema3
schZoomIn -win $_nSchema3 -pos 19581 9515
schZoomIn -win $_nSchema3 -pos 19580 9515
schZoomIn -win $_nSchema3 -pos 19579 9515
schSelect -win $_nSchema3 -inst "swiches_buf"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 48.153184 -snap {("G2" 0)}
wvSetCursor -win $_nWave2 13.299851 -snap {("G2" 0)}
wvSelectGroup -win $_nWave2 {G2}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSelectSignal -win $_nWave2 {( "G1" 3 )} 
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSelectGroup -win $_nWave2 {G1}
wvSelectSignal -win $_nWave2 {( "G1" 2 )} 
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 1)}
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetPosition -win $_nWave2 {("G1" 3)}
wvSetPosition -win $_nWave2 {("G1" 4)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetCursor -win $_nWave2 30.337570 -snap {("G1" 2)}
wvSelectSignal -win $_nWave2 {( "G1" 1 )} 
wvSetPosition -win $_nWave2 {("G1" 2)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 2)}
wvSetCursor -win $_nWave2 15.559957 -snap {("G2" 0)}
debReload
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
schZoomOut -win $_nSchema3 -pos 11032 7338
schZoomOut -win $_nSchema3 -pos 11032 7339
schZoomOut -win $_nSchema3 -pos 11031 7338
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -port "input_buffer_out\[31:0\]"
schSelect -win $_nSchema3 -port "input_buffer_out\[31:0\]"
schSelect -win $_nSchema3 -port "input_buffer_out\[31:0\]"
schPopViewUp -win $_nSchema3
schZoomIn -win $_nSchema3 -pos 34251 20848
schZoomIn -win $_nSchema3 -pos 34251 20847
schZoomIn -win $_nSchema3 -pos 34251 20847
schZoomIn -win $_nSchema3 -pos 31768 19102
schZoomIn -win $_nSchema3 -pos 31768 19101
schSelect -win $_nSchema3 -inst "mux_out_data"
schPushViewIn -win $_nSchema3
schSelect -win $_nSchema3 -signal "sel\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 4)}
wvSetPosition -win $_nWave2 {("G1" 5)}
wvMoveSelected -win $_nWave2
wvSetPosition -win $_nWave2 {("G1" 5)}
wvSetCursor -win $_nWave2 60.969436 -snap {("G2" 0)}
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
schSelect -win $_nSchema3 -port "o_ld_data\[31:0\]"
verdiSetActWin -win $_nSchema_3
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvSetCursor -win $_nWave2 35.328084 -snap {("G2" 0)}
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -port "addr\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "addr\[6\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
schSelect -win $_nSchema3 -signal "addr\[3\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
schDeselectAll -win $_nSchema3
verdiSetActWin -win $_nSchema_3
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
verdiSetActWin -win $_nWave2
debReload
wvSetCursor -win $_nWave2 72.284191
wvSetCursor -win $_nWave2 72.284191
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvSelectSignal -win $_nWave2 {( "G1" 9 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 8)}
wvSelectSignal -win $_nWave2 {( "G1" 8 )} 
wvCut -win $_nWave2
wvSetPosition -win $_nWave2 {("G2" 0)}
wvSetPosition -win $_nWave2 {("G1" 7)}
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "sel\[1:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -port "o_ld_data\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "ip\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvSetCursor -win $_nWave2 28.327588 -snap {("G1" 4)}
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -port "ip\[31:0\]"
schPopViewUp -win $_nSchema3
schZoomIn -win $_nSchema3 -pos 25663 20609
schZoomIn -win $_nSchema3 -pos 25664 20609
schZoomIn -win $_nSchema3 -pos 25664 20609
schZoomIn -win $_nSchema3 -pos 25530 20542
schZoomIn -win $_nSchema3 -pos 25530 20541
schSelect -win $_nSchema3 -signal "input_buffer_out\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
schSelect -win $_nSchema3 -inst "ip"
schPushViewIn -win $_nSchema3
schZoomIn -win $_nSchema3 -pos 21742 9369
schZoomIn -win $_nSchema3 -pos 21665 9408
schZoomIn -win $_nSchema3 -pos 19101 3537
schZoomIn -win $_nSchema3 -pos 19057 3559
schZoomIn -win $_nSchema3 -pos 19041 3574
schSelect -win $_nSchema3 -signal "addr"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nSchema_3
schDeselectAll -win $_nSchema3
schSelect -win $_nSchema3 -signal "bottons_buf_out\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
wvScrollDown -win $_nWave2 0
wvScrollDown -win $_nWave2 0
verdiSetActWin -win $_nWave2
verdiSetActWin -win $_nSchema_3
schSelect -win $_nSchema3 -signal "swiches_buf_out\[31:0\]"
schAddSelectedToWave -win $_nSchema3 -clipboard
wvDrop -win $_nWave2
wvScrollDown -win $_nWave2 1
verdiSetActWin -win $_nWave2
schZoomOut -win $_nSchema3 -pos 16841 4375
schZoomOut -win $_nSchema3 -pos 16825 4374
schZoomOut -win $_nSchema3 -pos 16824 4374
schZoomOut -win $_nSchema3 -pos 16777 4423
verdiSetActWin -win $_nSchema_3
schZoomOut -win $_nSchema3 -pos 15727 6282
schZoomOut -win $_nSchema3 -pos 15727 6281
schZoomIn -win $_nSchema3 -pos 14649 9280
schZoomIn -win $_nSchema3 -pos 14648 9280
schZoomIn -win $_nSchema3 -pos 14648 9280
schSelect -win $_nSchema3 -port "addr"
schSelect -win $_nSchema3 -port "addr"
schPopViewUp -win $_nSchema3
wvZoomOut -win $_nWave2
verdiSetActWin -win $_nWave2
wvScrollDown -win $_nWave2 0
debReload
wvDisplayGridCount -win $_nWave2 -off
wvCloseGetStreamsDialog -win $_nWave2
wvAttrOrderConfigDlg -win $_nWave2 -close
wvCloseDetailsViewDlg -win $_nWave2
wvGetSignalClose -win $_nWave2
wvReloadFile -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvZoomOut -win $_nWave2
wvScrollUp -win $_nWave2 1
wvScrollUp -win $_nWave2 1
wvScrollDown -win $_nWave2 0
srcViewImportLogFile
verdiSetActWin -win $_nText_4
debReload
verdiDockWidgetSetCurTab -dock windowDock_nSchema_3
verdiSetActWin -win $_nSchema_3
verdiDockWidgetMaximize -dock windowDock_nSchema_3
schZoomOut -win $_nSchema3 -pos 16812 21715
schZoomOut -win $_nSchema3 -pos 16697 21520
schZoomOut -win $_nSchema3 -pos 16695 21519
schZoomOut -win $_nSchema3 -pos 37238 17989
schZoomOut -win $_nSchema3 -pos 37237 17989
schZoomOut -win $_nSchema3 -pos 37236 17988
schZoomOut -win $_nSchema3 -pos 37236 17988
schZoomIn -win $_nSchema3 -pos 37237 17987
debReload
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiSetActWin -win $_nSchema_3
schZoomOut -win $_nSchema3 -pos 52417 22630
srcCloseWindow -win $_nTrace4
debExit
