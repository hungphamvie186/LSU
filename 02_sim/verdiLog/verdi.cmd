verdiSetActWin -dock widgetDock_<Decl._Tree>
debImport "-sverilog" "-f" "../00_src/flist.f" "design_test.fsdb"
verdiSetActWin -dock widgetDock_MTB_SOURCE_TAB_1
verdiWindowResize -win $_Verdi_1 "500" "180" "900" "700"
schCreateWindow -delim "." -win $_nSchema1 -scope "design_test"
verdiSetActWin -win $_nSchema_2
wvCreateWindow
verdiSetActWin -win $_nSchema_2
schSetOptions -win $_nSchema2 -portName on
schSetOptions -win $_nSchema2 -pinName on
schSetOptions -win $_nSchema2 -instName on
schSetOptions -win $_nSchema2 -localNetName on
schSetOptions -win $_nSchema2 -completeName on
schSelect -win $_nSchema2 -inst "dut"
schPushViewIn -win $_nSchema2
