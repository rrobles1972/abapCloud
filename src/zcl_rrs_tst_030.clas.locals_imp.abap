*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-DATA conn_counter TYPE i READ-ONLY.
    CLASS-METHODS class_constructor.

    METHODS:
      "! Constructor de instancia
      "! @parameter i_carrier_id | Aerolínea
      "! @parameter i_connection_id | Conexión
      "! @raising cx_abap_invalid_value | Excepción (valores obligatorios)
      constructor
        IMPORTING
          i_carrier_id      TYPE /dmo/carrier_id
          i_connection_id   TYPE /dmo/connection_id
        RAISING
          cx_abap_invalid_value,
      get_carrier_id RETURNING VALUE(r_result) TYPE /dmo/carrier_id,
      set_carrier_id IMPORTING i_carrier_id TYPE /dmo/carrier_id,
      get_connection_id RETURNING VALUE(r_result) TYPE /dmo/connection_id,
      set_connection_id IMPORTING i_connection_id TYPE /dmo/connection_id,
      get_airport_from_id RETURNING VALUE(r_result) TYPE /dmo/airport_from_id,
      set_airport_from_id IMPORTING i_airport_from_id TYPE /dmo/airport_from_id,
      get_airport_to_id RETURNING VALUE(r_result) TYPE /dmo/airport_to_id,
      set_airport_to_id IMPORTING i_airport_to_id TYPE /dmo/airport_to_id.

    "! Functional Method (return one object{data, ref to data, ref to obj})
    "! @parameter r_output | return data
    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.

  PROTECTED SECTION.

  PRIVATE SECTION.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.

    DATA carrier_name TYPE /dmo/carrier_name.

    TYPES: BEGIN OF st_details,
            DepartureAirport   TYPE /dmo/airport_from_id,
            DestinationAirport TYPE /dmo/airport_to_id,
            AirlineName        TYPE /dmo/carrier_name,   "FIELDS .. as <Alias>
           END OF st_details.

    DATA details TYPE st_details.

    TYPES: BEGIN OF st_airport,
            AirportID TYPE /dmo/airport_id,
            Name      TYPE /dmo/airport_name,
           END OF st_airport.

    TYPES tt_airports TYPE STANDARD TABLE OF st_airport
                           WITH NON-UNIQUE DEFAULT KEY.

    CLASS-DATA airports TYPE tt_airports.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

    " Obtención de datos, sólo primera vez, tabla interna estática
    SELECT
      FROM /dmo/i_airport
    FIELDS AirportID, Name
      INTO TABLE @airports.

  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL
    OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

*    SELECT SINGLE
*      FROM /dmo/connection
*      FIELDS
*        carrier_id,
*        connection_id,
*        airport_from_id,
*        airport_to_id
*       WHERE carrier_id = @i_carrier_id
*         AND connection_id = @i_connection_id
*       INTO ( @carrier_id, @connection_id, @airport_from_id, @airport_to_id ).

    me->carrier_id    = i_carrier_id.
    me->connection_id = i_connection_id.

*    SELECT SINGLE
*      FROM /dmo/i_connection
*    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name
*     WHERE AirlineID = @carrier_id
*       AND ConnectionID = @connection_id
*      INTO ( @airport_from_id, @airport_to_id, @carrier_name ).

    SELECT SINGLE
      FROM /dmo/i_connection
    FIELDS DepartureAirport, DestinationAirport, \_Airline-Name as AirlineName
     WHERE AirlineID = @i_carrier_id
       AND ConnectionID = @i_connection_id
      INTO CORRESPONDING FIELDS OF @details.

    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    me->conn_counter = me->conn_counter + 1.

  ENDMETHOD.

  METHOD get_carrier_id.
    r_result = me->carrier_id.
  ENDMETHOD.

  METHOD set_carrier_id.
    me->carrier_id = i_carrier_id.
  ENDMETHOD.

  METHOD get_connection_id.
    r_result = me->connection_id.
  ENDMETHOD.

  METHOD set_connection_id.
    me->connection_id = i_connection_id.
  ENDMETHOD.

  METHOD get_airport_from_id.
    r_result = me->airport_from_id.
  ENDMETHOD.

  METHOD set_airport_from_id.
    me->airport_from_id = i_airport_from_id.
  ENDMETHOD.

  METHOD get_airport_to_id.
    r_result = me->airport_to_id.
  ENDMETHOD.

  METHOD set_airport_to_id.
    me->airport_to_id = i_airport_to_id.
  ENDMETHOD.

  METHOD get_output.

    APPEND |---------------------------------| TO r_output.
    APPEND |Carrier:      { carrier_id    }|   TO r_output.
    APPEND |Connection:   { connection_id }|   TO r_output.
*    APPEND |Airport from: { airport_from_id }| TO r_output.
*    APPEND |Airport to:   { airport_to_id }|   TO r_output.
*    APPEND |Carrier:      { carrier_id } - { carrier_name }| TO r_output.
*    APPEND |Departure:    { details-departureairport }| TO r_output.
*    APPEND |Destination:  { details-destinationairport }|   TO r_output.
*    APPEND |Carrier:      { carrier_id } - { details-airlinename }| TO r_output.

    APPEND |-------------------------------------| TO r_output.
    APPEND | First > Inline Declaration Workarea | TO r_output.
    APPEND |-------------------------------------| TO r_output.
    DATA(departure)   = airports[ airportID = details-departureairport ].
    DATA(destination) = airports[ airportID = details-destinationairport ].
    APPEND |Departure:    { details-departureairport } - { departure-name }| TO r_output.
    APPEND |Destination:  { details-destinationairport } - { destination-name }| TO r_output.
    APPEND |-------------------------------------| TO r_output.
    APPEND | Second > Without Workarea           | TO r_output.
    APPEND |-------------------------------------| TO r_output.
    APPEND |_Departure:    { details-departureairport } - { airports[ airportID = details-departureairport ]-name }| TO r_output.
    APPEND |_Destination:  { details-destinationairport } - { airports[ airportID = details-destinationairport ]-name }| TO r_output.

  ENDMETHOD.

ENDCLASS.
