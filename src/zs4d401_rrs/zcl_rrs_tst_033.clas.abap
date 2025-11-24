CLASS zcl_rrs_tst_033 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_033 IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Unused variables
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    DATA carrier_list    TYPE TABLE OF /dmo/carrier.
*    DATA connection_list TYPE TABLE OF /dmo/connection.

    " ATC finding suppressed using Pseudo Comment (Outside the sentence)
    DATA carrier_list    TYPE TABLE OF /dmo/carrier.    "#EC NEEDED

    " ATC finding suppressed using Pragma (Inside the sentence)
    DATA connection_list TYPE TABLE OF /dmo/connection  ##needed.

    SELECT FROM /dmo/connection
    FIELDS *
      INTO TABLE @DATA(connections).

    " ATC finding suppressed using Pseudo Comment (Outside the sentence)
    connection_list = connection_list.                  "#EC NEEDED

*    out->write( connection_list ).
    out->write( connections ).

  ENDMETHOD.
ENDCLASS.
