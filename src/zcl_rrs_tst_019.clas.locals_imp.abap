*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

CLASS lcl_connection DEFINITION CREATE PUBLIC.

  PUBLIC SECTION.

*    Class Attributes
**********************************************************************
    CLASS-DATA conn_counter TYPE i.

*    Class Methods
**********************************************************************
    "! Constructor de clase
    CLASS-METHODS class_constructor.

*    Instance Attributes
**********************************************************************
    DATA connection_id TYPE /dmo/connection_id READ-ONLY.

*    Instance Methods
**********************************************************************
    METHODS:
      "! Constructor de instancia
      "! @parameter i_carrier_id | Aerolínea
      "! @parameter i_connection_id | Conexión
      constructor
        IMPORTING
          i_carrier_id    TYPE /dmo/carrier_id
          i_connection_id TYPE /dmo/connection_id
        RAISING
          cx_abap_invalid_value,
      get_carrier_id RETURNING VALUE(r_result) TYPE /dmo/carrier_id,
      set_carrier_id IMPORTING i_carrier_id TYPE /dmo/carrier_id,
      get_connection_id RETURNING VALUE(r_result) TYPE /dmo/connection_id,
      set_connection_id IMPORTING i_connection_id TYPE /dmo/connection_id.

    "! Functional Method (return one object{data, ref to data, ref to obj})
    "! @parameter r_output | return data
    METHODS get_output
      RETURNING VALUE(r_output) TYPE string_table.

  PROTECTED SECTION.
  PRIVATE SECTION.
    DATA carrier_id TYPE /dmo/carrier_id.

ENDCLASS.

CLASS lcl_connection IMPLEMENTATION.

  METHOD class_constructor.

  ENDMETHOD.

  METHOD constructor.
    IF i_carrier_id IS INITIAL
    OR i_connection_id IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
    me->carrier_id = i_carrier_id.
    me->connection_id = i_connection_id.
    conn_counter = conn_counter + 1.
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

  METHOD get_output.

    APPEND |-----------------------------| TO r_output.
    APPEND |Carrier:    { carrier_id    }| TO r_output.
    APPEND |Connection: { connection_id }| TO r_output.

  ENDMETHOD.

ENDCLASS.
