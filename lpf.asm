
_main:

;lpf.c,7 :: 		void main() {
;lpf.c,9 :: 		double y0=0;
;lpf.c,10 :: 		double y1=0;
;lpf.c,12 :: 		double x0=0;
;lpf.c,13 :: 		double x1=0;
;lpf.c,15 :: 		ADC_Init();
	CALL       _ADC_Init+0
;lpf.c,19 :: 		TRISC  = 0;
	CLRF       TRISC+0
;lpf.c,20 :: 		TRISB  = 0;
	CLRF       TRISB+0
;lpf.c,22 :: 		for( i=0;i<1000;i=i+0.00005){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_i_L0+2
	CLRF       main_i_L0+3
L_main0:
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      122
	MOVWF      R4+2
	MOVLW      136
	MOVWF      R4+3
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       main_i_L0+2, 0
	MOVWF      R0+2
	MOVF       main_i_L0+3, 0
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main1
;lpf.c,23 :: 		x0 =(double) ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
;lpf.c,22 :: 		for( i=0;i<1000;i=i+0.00005){
	MOVF       main_i_L0+0, 0
	MOVWF      R0+0
	MOVF       main_i_L0+1, 0
	MOVWF      R0+1
	MOVF       main_i_L0+2, 0
	MOVWF      R0+2
	MOVF       main_i_L0+3, 0
	MOVWF      R0+3
	MOVLW      23
	MOVWF      R4+0
	MOVLW      183
	MOVWF      R4+1
	MOVLW      81
	MOVWF      R4+2
	MOVLW      112
	MOVWF      R4+3
	CALL       _Add_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      main_i_L0+0
	MOVF       R0+1, 0
	MOVWF      main_i_L0+1
	MOVF       R0+2, 0
	MOVWF      main_i_L0+2
	MOVF       R0+3, 0
	MOVWF      main_i_L0+3
;lpf.c,32 :: 		}
	GOTO       L_main0
L_main1:
;lpf.c,35 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
