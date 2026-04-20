CLASS zcl_rrs_tst_084 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_084 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ABAP Code that reads from CDS view using Input Parameters
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    SELECT FROM zr_rrs_07_flight( ip_testvalue = 'X' )
      FIELDS
        carrierid,

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " USE of Input Parameter in CDS view
        testvaluefinal,

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " CASE Distinctions in ABAP SQL
        case ConnectionId
          when '0322' then 'Pepito'
          when '0400' then 'Menganito'
          else 'unknown'
        end as connId,

         """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Arithmetics expressions in ABAP SQL
        (   CAST( SeatsOccupied AS FLTP )
          * CAST(  100 AS FLTP )
        ) / CAST( SeatsMax AS FLTP ) as percentage_fltp,

        Price,
        CurrencyCode

        INTO TABLE @DATA(lt_flight).

    out->write( data = lt_flight
            name = `Ejemplo de tabla interna cargada desde CDS View:` ).

  ENDMETHOD.
ENDCLASS.
