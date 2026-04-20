CLASS zcl_rrs_tst_080 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_080 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ABAP Code SQL with SQL Logic
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    SELECT FROM zrrs_02_flight
        FIELDS
          carrier_id,
          seats_max - seats_occupied AS seats_free "SQL Logic
        INTO TABLE @DATA(lt_flight).

    out->write( data = lt_flight
            name = `Ejemplo de tabla interna cargada desde BBDD Hana:` ).

  ENDMETHOD.
ENDCLASS.
