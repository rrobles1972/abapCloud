CLASS zcl_rrs_tst_041 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_041 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    "  Create and Use Text Symbols
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    out->write( 'Hello World!'(001) ).
    out->write( text-hau ).

  ENDMETHOD.
ENDCLASS.
