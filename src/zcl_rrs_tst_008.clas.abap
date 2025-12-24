CLASS zcl_rrs_tst_008 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_008 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
*   Declarations
**********************************************************************

    "comment/uncomment these lines for different types
    TYPES t_result TYPE p LENGTH 8 DECIMALS 2.
*    TYPES t_result TYPE p LENGTH 8 DECIMALS 0.
*    TYPES t_result TYPE i.

    DATA result TYPE t_result.

*   Calculations
**********************************************************************
    "comment/uncomment these lines for different calculations

*    result = 2 + 3.
*    result = 2 - 3.
*    result = 2 * 3.
*    result = 2 / 3.
*    result = 6 / 7.
*
*    result = sqrt( 2 ).
*    result = ipow( base = 2 exp = 3 ).
*
    result = ( 8 * 7 * 6 ) / ( 5 + 4 ).
*    result = 8 * 7 - 6 / 5 + 4.

*   Output
**********************************************************************

    out->write( result ).

  ENDMETHOD.
ENDCLASS.
