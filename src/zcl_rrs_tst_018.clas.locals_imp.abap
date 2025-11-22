*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.

    CLASS-DATA conn_counter TYPE i.

    "! fijar datos
    "! @parameter i_carrier_id | aerolínea
    "! @parameter i_connection_id | conexión
    METHODS set_attributes
      IMPORTING
        i_carrier_id    TYPE /dmo/carrier_id OPTIONAL
        i_connection_id TYPE /dmo/connection_id
      RAISING
        cx_abap_invalid_value.

    "! obtener datos
    "! @parameter e_carrier_id | aerolínea
    "! @parameter e_connection_id | conexión
    METHODS get_attributes
      EXPORTING
        e_carrier_id    TYPE /dmo/carrier_id
        e_connection_id TYPE /dmo/connection_id.

    "! Functional Method (return one object{data, ref to data, ref to obj})
    "! @parameter r_output | return data
    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.



ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD set_attributes.

    IF i_carrier_id IS INITIAL
    OR i_connection_id IS INITIAL.
        RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    carrier_id      = i_carrier_id.
    connection_id   = i_connection_id.
    conn_counter    = conn_counter + 1.

  ENDMETHOD.

  METHOD get_attributes.

    e_carrier_id    = carrier_id.
    e_connection_id = connection_id.

  ENDMETHOD.

  METHOD get_output.

    APPEND |-----------------------------| TO r_output.
    APPEND |Carrier:    { carrier_id    }| TO r_output.
    APPEND |Connection: { connection_id }| TO r_output.

  ENDMETHOD.

ENDCLASS.
