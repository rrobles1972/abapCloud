CLASS zcl_rrs_tst_085 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_085 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " USE of Aggregation in ABAP SQL
    SELECT FROM zr_rrs_07_flight( ip_testvalue = 'X' )
      FIELDS
        CarrierId,
        MAX( Price ) AS maximum_price
      GROUP BY CarrierId
      INTO TABLE @DATA(lt_flight).

    out->write( data = lt_flight
            name = `Ejemplo de tabla interna 1a cargada desde CDS View:` ).

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " USE of Aggregation in CDS View with Input Parameters

    SELECT FROM zr_rrs_08_flight( ip_testvalue = 'X' )
      FIELDS
        CarrierId,
        MaxSeats
      INTO TABLE @DATA(lt_flight2).

    out->write( data = lt_flight2
            name = `Ejemplo de tabla interna 2a cargada desde CDS View:` ).


  ENDMETHOD.
ENDCLASS.
