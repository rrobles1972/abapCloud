CLASS zcl_rrs_tst_007 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_007 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*---------------------------------------
*   Data Objects with Built-in Types
*---------------------------------------
    out->write( '--------------------------------------------' ).
    out->write( 'Data Objects with Built-in Types' ).

    " comment/uncomment the following declarations and check the output
*    DATA variable TYPE string.
*    DATA variable TYPE i.
*    DATA variable TYPE d.
*    DATA variable TYPE c LENGTH 10.
*    DATA variable TYPE n LENGTH 10.
    DATA variable TYPE p LENGTH 8 DECIMALS 2.

*   Output
*---------------------------------------

    out->write( 'Result with Initial Value' ).
    out->write( variable ).
    out->write( '--------' ).

    variable = '19891109'.

    out->write( 'Result with Value 19891109' ).
    out->write( variable ).
    out->write( '--------' ).

*---------------------------------------
*   Ex. 1 - Local Types
*---------------------------------------
    out->write( '--------------------------------------------' ).
    out->write( 'Ex. 1 - Local Types' ).

*   Comment/Uncomment the following lines to change the type of my_var
    TYPES my_type TYPE p LENGTH 3 DECIMALS 2.
*    TYPES my_type TYPE i.
*    TYPES my_type TYPE string.
*    TYPES my_type TYPE n length 10.

*   Variables based on local type
    DATA my_variable TYPE my_type.

    my_variable = '198.12'.

    out->write( `my_variable(TYPE MY_TYPE)` ).
    out->write( my_variable ).

*---------------------------------------
*   Ex. 2 - Global Types
*---------------------------------------
    out->write( '--------------------------------------------' ).
    out->write( 'Ex. 2 - Global Types' ).

*   Variables based o global types
    "Place cursor on variable and press F2 or F3
    DATA airport TYPE /dmo/airport_id VALUE 'FRA'.

    out->write( `airport(TYPE /DMO/AIRPORT_ID)` ).
    out->write( airport ).

*---------------------------------------
*   Ex. 3 - Constants
*---------------------------------------
    out->write( '--------------------------------------------' ).
    out->write( 'Ex. 3 - Constants' ).

    CONSTANTS c_text TYPE string VALUE `Hello World`.
    CONSTANTS c_number TYPE i VALUE 12345.

    "Uncomment this line to see syntax error (VALUE is mandatory)
*   CONSTANTS c_text2 TYPE string.

    out->write( `c_text(TYPE STRING)` ).
    out->write( c_text ).
    out->write( '---------' ).

    out->write( `c_number(TYPE i)` ).
    out->write( c_number ).
    out->write( `---------` ).

*---------------------------------------
*   Ex. 4 - Literals
*---------------------------------------
    out->write( '--------------------------------------------' ).
    out->write( 'Ex. 4 - Literals' ).

    out->write( '12345     ' ).  "Text Literal   (TYPE C)
    out->write( `12345     ` ).  "String Literal (TYPE STRING)
    out->write( 12345 ).         "Number Literal (TYPE I)

    "Uncomment this line to see syntax error (no number literal with digits)
*   out->write( 12345.67 ).

*---------------------------------------
*   Implicit Type Conversions
*---------------------------------------
    out->write( '--------------------------------------------' ).
    out->write( 'Implicit Type Conversions' ).

    DATA my_int     TYPE i.
    DATA my_pack    TYPE p LENGTH 8 DECIMALS 2.
    DATA my_char10  TYPE c LENGTH 10 VALUE 'abcdefghij'.
    DATA my_char4   TYPE c LENGTH 4.
    DATA my_string  TYPE string.

    my_int     = '1234'.     " C -> I
    my_pack    = '-273.15'.  " C -> P
*    my_int     = my_char10.  " C -> I      Potential runtime error
    my_char4   = my_char10.  " C -> C      Potential information loss
    my_string  = 'Hello  '.  " C -> STRING Ignores trailing blanks

    out->write( my_int ).
    out->write( my_pack ).
    out->write( my_char10 ).
    out->write( my_char4 ).
    out->write( my_string ).

*---------------------------------------
*   Resetting Variables
*---------------------------------------
    out->write( '--------------------------------------------' ).
    out->write( 'Ressetting Variables' ).

    DATA my_var1 TYPE i.
    DATA my_var2 TYPE i VALUE 1234.
    DATA my_var3 TYPE string.

    my_var1 = my_var2.
    my_var3 = `Hello World`.

    out->write( my_var1 ).
    out->write( my_var2 ).
    out->write( my_var3 ).
    out->write( '---------' ).

    CLEAR my_var1.   " value  is reset to 0.
    CLEAR my_var2.   " value  is reset to 0!
    CLEAR my_var3.   " string is now empty again

    out->write( my_var1 ).
    out->write( my_var2 ).
    out->write( my_var3 ).

*---------------------------------------
*   Inline Declarations
*---------------------------------------
    out->write( '--------------------------------------------' ).
    out->write( 'Inline Declarations' ).

    " Explicit Declaration with DATA Statement
    DATA my_var11 TYPE string.
    DATA my_var12 TYPE i.
    DATA my_var13 TYPE i.
    DATA my_var14 TYPE i.

    my_var11 = `Hello World`.
    my_var12 = 17.
    my_var13 = my_var12.
    my_var14 = my_var12 + my_var13.

    " Inline Declaration with DATA( )
    DATA(my_var21) = `Hello World`.
    DATA(my_var22) = 17.
    DATA(my_var23) = my_var22.
    DATA(my_var24) = my_var22 + my_var23.

    out->write( |my_var11 { my_var11 }| ).
    out->write( 'my_var21' && | | && my_var21 ).

  ENDMETHOD.
ENDCLASS.
