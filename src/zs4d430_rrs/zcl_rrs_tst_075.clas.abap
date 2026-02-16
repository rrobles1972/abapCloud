CLASS zcl_rrs_tst_075 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_075 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CDS - Analyze Dictionary and CDS Objects
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA var  TYPE zr_rrs_01_grocery-Product.
    DATA var2 TYPE zr_rrs_01_grocery-Price.

    SELECT FROM ZR_RRS_02_FLIGHT
    FIELDS *
    INTO TABLE @DATA(result).

    out->write( name = 'flight'
                data = result ).

  ENDMETHOD.
ENDCLASS.
