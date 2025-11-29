*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_data DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.

    CLASS-METHODS get_carrier
      IMPORTING
        i_carrier_id      TYPE /dmo/carrier_id
      RETURNING
        VALUE(rw_carrier) TYPE /dmo/carrier
      RAISING
        cx_abap_invalid_value.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS lcl_data IMPLEMENTATION.

  METHOD get_carrier.

    IF i_carrier_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    SELECT SINGLE
      FROM /dmo/carrier
    FIELDS *
     WHERE carrier_id = @i_carrier_id
      INTO @DATA(carrier).

    IF sy-subrc = 0.
*    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    MOVE-CORRESPONDING carrier TO rw_carrier.

  ENDMETHOD.

ENDCLASS.
