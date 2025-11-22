CLASS zcl_rrs_tst_012 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_012 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    Declarations
**********************************************************************

    DATA result TYPE i.
    DATA numbers TYPE TABLE OF i.

*    Preparation
**********************************************************************

    APPEND 123 TO numbers.

*    Example 1: Conversion Error ( no Number )
**********************************************************************

    CONSTANTS c_text TYPE string VALUE 'ABC'.
*    CONSTANTS c_text TYPE string VALUE '123'.

    out->write( `-----------------------------` ).
    out->write( `Example 1: Conversion Error` ).
    out->write( `-----------------------------` ).

    try.
        result = c_text.
        out->write( |Converted content is { result }| ).
      catch cx_sy_conversion_no_number.
        out->write( |Error: { c_text } is not a number!| ).
    endtry.

*    Example 2: Division by Zero
**********************************************************************

    CONSTANTS c_number TYPE i VALUE 0.
*    CONSTANTS c_number TYPE i VALUE 7.

    out->write( `-----------------------------` ).
    out->write( `Example 2: Division by Zero` ).
    out->write( `-----------------------------` ).

    try.
        result = 100 / c_number.
        out->write( |100 divided by { c_number } equals { result }| ).
      catch cx_sy_zerodivide.
        out->write( `Error: Division by zero is not defined!` ).
    endtry.

*    Example 3: Itab Error (Line Not Found)
**********************************************************************

    CONSTANTS c_index TYPE i VALUE 2.
*    CONSTANTS c_index TYPE i VALUE 1.

    out->write( `-----------------------------` ).
    out->write( `Example 3: Line Not Found` ).
    out->write( `-----------------------------` ).

    try.
        result = numbers[ c_index ].
        out->write( |Content of row { c_index } equals { result }| ).
      catch cx_sy_itab_line_not_found.
        out->write( `Error: Itab has less than { c_index } rows!` ).
    endtry.

*    Example 4: Combination of Different Exceptions
**********************************************************************

*    CONSTANTS c_char TYPE c LENGTH 1 VALUE 'X'.
*    CONSTANTS c_char TYPE c LENGTH 1 VALUE '0'.
    CONSTANTS c_char TYPE c LENGTH 1 VALUE '1'.
*    CONSTANTS c_char TYPE c LENGTH 1 VALUE '2'.

    out->write( `-----------------------------` ).
    out->write( `Example 4: Combination` ).
    out->write( `-----------------------------` ).

    try.
        result = numbers[ 2 / c_char ].
        out->write( |Result: { result }| ).
      catch cx_sy_conversion_no_number.
        out->write( |Error: { c_text } is not a number!| ).
      catch cx_sy_zerodivide.
        out->write( `Error: Division by zero is not defined!` ).
      catch cx_sy_itab_line_not_found.
        out->write( `Error: Itab has less than { c_index } rows!` ).
    endtry.

  ENDMETHOD.
ENDCLASS.
