CLASS zcl_rrs_tst_063 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_063 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ITAB - Sorted and Hashed Tables
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA(flights) = NEW lcl_flights( ).
    flights->access_standard( ).
    flights->access_sorted( ).
    flights->access_hashed( ).


    out->write( |Done| ).
  ENDMETHOD.
ENDCLASS.
