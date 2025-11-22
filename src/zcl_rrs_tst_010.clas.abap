CLASS zcl_rrs_tst_010 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_010 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    Variable Declaration
**********************************************************************
    DATA number1 TYPE i.
    DATA number2 TYPE i.

    number1 = -8.
    number2 = 3.

*    Data Processing
**********************************************************************
    DATA(result) = number1 / number2.  "with inline declaration

    DATA(output) = |{ number1 } / { number2 } = { result }|.

    out->write( output ).

    DATA result2 TYPE p LENGTH 8 DECIMALS 2.  "with explicit declaration

    result2 = number1 / number2.

    output = |{ number1 } / { number2 } = { result2 }|.

    out->write( '----------------' ).
    out->write( output ).

  ENDMETHOD.
ENDCLASS.
