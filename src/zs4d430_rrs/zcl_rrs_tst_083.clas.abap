CLASS zcl_rrs_tst_083 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_083 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ABAP Code that reads from CDS view using SQL Logic CASE
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    SELECT FROM zr_rrs_06_flight
      FIELDS
        carrierid,
        seats_free,

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " CASE Distinctions in ABAP SQL
        case ConnectionId
          when '0322' then 'Pepito'
          when '0400' then 'Menganito'
          else 'unknown'
        end as connId,

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        "CASE Distinction in CDS View
        plane_type,

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Arithmetics expressions in ABAP SQL
        (   CAST( SeatsOccupied AS FLTP )
          * CAST(  100 AS FLTP )
        ) / CAST( SeatsMax AS FLTP ) as percentage_fltp,

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Arithmetics expressions in ABAP CDS
        percentage_fltp2,

        Price,
        CurrencyCode,
        dats
        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Conversion Functions in ABAP SQL
*        currency_conversion( amount = Price,
*                             source_currency = CurrencyCode,
*                             target_currency = 'EUR',
*                             exchange_rate_date = dats
*                           ) as price_EUR_ABAP,

        """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " Conversion Functions in ABAP CDS
*        price_EUR_CDS

        """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
        " NEXT - Define Input Parameter Declaration

        INTO TABLE @DATA(lt_flight).

    out->write( data = lt_flight
            name = `Ejemplo de tabla interna cargada desde CDS View:` ).

  ENDMETHOD.
ENDCLASS.
