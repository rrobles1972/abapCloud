CLASS zcl_rrs_tst_004 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_004 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    CONSTANTS: c_number0 TYPE i VALUE 0.

    out->write( |---------------------------------| ).
    out->write( |Example 2: CASE...WHEN...ENDCASE| ).
    out->write( |---------------------------------| ).

    CASE c_number0.

    WHEN 0.
        out->write( |The value of c_number0 equels zero| ).
    WHEN OTHERS.
        out->write( |The value of c_number0 equels some numer than zero| ).
    ENDCASE.
  ENDMETHOD.
ENDCLASS.
