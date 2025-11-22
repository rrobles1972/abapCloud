CLASS zcl_rrs_tst_032 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_032 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*     Example 1 : Inline Declaration
**********************************************************************

    DELETE FROM zrrs_02_flight. "You will erase all the data.

    SELECT
      FROM zrrs_02_flight
    FIELDS *
      INTO TABLE @DATA(lt_flights). "You will create the data object just-in-time.

*     Example 2 : Workarea
**********************************************************************
    DATA lw_flight LIKE LINE OF lt_flights.
    lw_flight-uuid = 1.
    lw_flight-carrier_id     = 'AA'.
    lw_flight-connection_id  = '0322'.
    lw_flight-flight_date    = '20251001'.
    lw_flight-price          = '215.00'.
    lw_flight-currency_code  = 'USD'.
    lw_flight-plane_type_id  = 'A320-200'.
    lw_flight-seats_max      = '160.00'.
    lw_flight-seats_occupied = '152.00'.

    APPEND lw_flight TO lt_flights. "Classic way.

*     Example 3 : VALUE #( )
**********************************************************************

    lw_flight = VALUE #(
    uuid = 2
    carrier_id     = 'LH'
    connection_id  = '0400'
    flight_date    = '20251003'
    price          = '239.00'
    currency_code  = 'EUR'
    plane_type_id  = 'A340-600'
    seats_max      = '320.00'
    seats_occupied = '277.00'
    ).                           "Modern way, less code.

    APPEND lw_flight TO lt_flights.

    out->write( data = lt_flights
                name = `Ejemplo de tabla interna cargada desde ABAP:` ).

*     Insert registers in Database Table
**********************************************************************

    INSERT zrrs_02_flight FROM TABLE @lt_flights.  "Classic way, ABAP SQL.

*     Read New DATA from Database Table
**********************************************************************

    SELECT
      FROM zrrs_02_flight
    FIELDS *
      INTO TABLE @lt_flights.

    out->write( data = lt_flights
                name = `Ejemplo de tabla interna cargado desde base de datos:` ).

  ENDMETHOD.
ENDCLASS.
