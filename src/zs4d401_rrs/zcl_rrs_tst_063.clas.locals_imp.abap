*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_demo DEFINITION.

  PUBLIC SECTION.
    METHODS use_work_area.
    METHODS use_field_symbol.
  PROTECTED SECTION.
    TYPES t_flights TYPE STANDARD TABLE OF /dmo/flight WITH NON-UNIQUE KEY carrier_id connection_id flight_date.


    METHODS loop_field_symbol CHANGING c_flights TYPE t_Flights.
    METHODS loop_Work_area CHANGING c_flights TYPE t_flights.
  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_demo IMPLEMENTATION.

  METHOD loop_field_symbol.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    LOOP AT c_flights ASSIGNING FIELD-SYMBOL(<fs>).
      <fs>-seats_occupied += 1.
    ENDLOOP.
  ENDMETHOD.

  METHOD loop_work_area.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  ENDMETHOD.

  METHOD use_field_symbol.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA flights TYPE t_flights.
    SELECT FROM /dmo/flight FIELDS * INTO TABLE @flights.
    loop_field_symbol( CHANGING c_flights = flights ).
  ENDMETHOD.

  METHOD use_work_area.
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA flights TYPE t_flights.
    SELECT FROM /dmo/flight FIELDS * INTO TABLE @flights.
    loop_work_area( CHANGING c_flights = flights ).
  ENDMETHOD.

ENDCLASS.
