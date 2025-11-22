CLASS zcl_rrs_tst_001 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_001 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA: lv_num     TYPE i,
          lv_expired TYPE abap_boolean,
          lv_var1    TYPE i VALUE 6,
          lv_var2    TYPE i VALUE 2,
          lv_var3    TYPE i,
          lv_var4    TYPE i,
          lv_var5    TYPE i,
          lv_TOTAL   TYPE i.

    lv_num = 1.

    lv_var4 = lv_var2.
    lv_var5 = lv_var2 + lv_var3.
    lv_total = lv_var2 + lv_var3.

    out->write( 'Hello World number:' && lv_num ).
    out->write( |var1: { lv_var1 }| ). "Hello from Dallas )
    out->write( |var2: { lv_var2 }| ). "6
    out->write( |var3: { lv_var3 }| ). "2
    out->write( |var4: { lv_var4 }| ). "6
    out->write( |var5: { lv_var5 }| ). "8
    out->write( |total: {  ( 2 * lv_var2 + 3 * lv_var3 ) / 5 }| ).
    out->write( |new total: { ( 2 * lv_var2 + 3 * lv_var3 ) DIV 5 }| ).
    out->write( |remind total: { ( 2 * lv_var2 + 3 * lv_var3 ) MOD 5 }| ).

    " 4
    " 2 * 6 + 3 * 2 / 5
    " 12 + 6 / 5
    " 18 / 5
    " 3.6 = 4

    out->write( |----------------------------------| ).

    DATA: lv_amount1   TYPE i,
          lv_amount2   TYPE i,
          lv_curr_code TYPE string VALUE 'EUR'.

    lv_amount1 = 3.
    lv_amount2 = 6.
    lv_curr_code = 'EUR'.

    out->write( |Hello World!| ).                                 "Hello World!
    out->write( |{ lv_amount1 + lv_amount2 }| ).                  "9
    out->write( |{ lv_amount1 + lv_amount2 } EUR| ).              "9 EUR
    out->write( |{ lv_amount1 + lv_amount2 } { lv_curr_code }| ). "9 EUR

    out->write( |----------------------------------| ).

    DATA: lv_full_name  TYPE string VALUE 'Stan Wilson',
          lv_first_name TYPE string,
          lv_last_name  TYPE string.

    SPLIT lv_full_name AT ' ' INTO lv_first_name lv_last_name.

    out->write( |user { lv_first_name }| ).      "user Stan

    out->write( |----------------------------------| ).

    DATA: lv_join_string TYPE string.

    lv_join_string = 'Pegar textos:' && | | && lv_first_name && | | && lv_last_name.

    out->write(  |Prueba --> { lv_join_string }| ).

    out->write( |----------------------------------| ).

  ENDMETHOD.
ENDCLASS.
