CLASS zcl_rrs_tst_029 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_029 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    Declarations
**********************************************************************

    TYPES: BEGIN OF st_airport,
            airportid   TYPE /dmo/airport_id,
            name        TYPE /dmo/airport_name,
           END OF st_airport.

    TYPES tt_airports TYPE STANDARD TABLE OF st_airport
                           WITH NON-UNIQUE KEY airportid.

    DATA airports TYPE tt_airports.

*    Example 1: Structured Variables IN SELECT SINGLE ... INTO ...
**********************************************************************

    DATA airport_full TYPE /dmo/i_airport.

    SELECT SINGLE
      FROM /dmo/i_airport
    FIELDS AirportID, Name, City, CountryCode
     WHERE City = 'Zurich'
      INTO @airport_full.

    out->write( `--------------------------` ).
    out->write( `Example 1: SELECT SINGLE ... INTO ...` ).
    out->write( data = airport_full
                name = `One of the airports in Zurich (Structure):` ).

*    Example 2: Internal Tables in SELECT ... INTO TABLE ...
**********************************************************************

    DATA airports_full TYPE STANDARD TABLE OF /dmo/i_airport
                            WITH NON-UNIQUE KEY AirportID.

    SELECT
      FROM /dmo/i_airport
    FIELDS airportid, Name, City, CountryCode
     WHERE City = 'London'
      INTO TABLE @airports_full.

    out->write( `------------------------` ).
    out->write( `Example 2: SELECT ... INTO TABLE ...` ).
    out->write( data = airports_full
                name = `All airports in London (Internal Table):` ).

*    Example 3: FIELDS * and INTO CORRESPONDING FIELDS OF TABLE
**********************************************************************

    SELECT
      FROM /dmo/i_airport
    FIELDS *
     WHERE City = 'London'
      INTO CORRESPONDING FIELDS OF TABLE @airports.

    out->write( `------------------------` ).
    out->write( `Example 3: FIELDS * INTO CORRESPONDING FIELDS OF TABLE` ).
    out->write( data = airports
                name = `Internal Table AIRPORTS:` ).

*    Example 4: ORDER BY and FIELDS DISTINCT
**********************************************************************

    SELECT
      FROM /dmo/i_airport
    FIELDS DISTINCT CountryCode
     ORDER BY CountryCode
      INTO TABLE @DATA(countryCodes).

    out->write( `-----------------------` ).
    out->write( `Example 4: ORDER BY and FIELDS DISTINCT` ).
    out->write( data = countryCodes
                name = `Internal Table COUNTRYCODES:` ).

*    Example 5: UNION ( ALL )
**********************************************************************

    SELECT
      FROM /dmo/i_carrier
    FIELDS 'Airline' AS type,
           AirlineID AS Id,
           Name
     WHERE CurrencyCode = 'GBP'

    UNION ALL

    SELECT
      FROM /dmo/i_airport
    FIELDS 'Airport' AS type,
           AirportID AS Id,
           Name
     WHERE City = 'London'

     ORDER BY type, Id
      INTO TABLE @DATA(names).

    out->write( `-----------------------------` ).
    out->write( `Example 5: UNION ALL of Airlines and Airports` ).
    out->write( data = names
                name = `ID and Name of Airlines and Airports` ).

  ENDMETHOD.
ENDCLASS.
