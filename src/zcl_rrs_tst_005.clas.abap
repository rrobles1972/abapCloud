CLASS zcl_rrs_tst_005 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_005 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
  CONSTANTS: c_number0 TYPE i VALUE 3.

  out->write( |---------------------------------| ).
  out->write( |Example 1: DO...ENDDO with TIMES| ).
  out->write( |---------------------------------| ).

    DO c_number0 TIMES.
        out->write( |Hello World - { sy-index } times.| ).
    ENDDO.

  ENDMETHOD.
ENDCLASS.
