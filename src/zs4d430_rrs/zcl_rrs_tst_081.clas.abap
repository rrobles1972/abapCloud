CLASS zcl_rrs_tst_081 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_081 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ABAP Code that reads from CDS view using SQL Logic
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    SELECT FROM zr_rrs_06_flight
      FIELDS
        carrierid,
        seats_free
        INTO TABLE @DATA(lt_flight).

    out->write( data = lt_flight
            name = `Ejemplo de tabla interna cargada desde CDS View:` ).

  ENDMETHOD.
ENDCLASS.
