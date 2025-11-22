CLASS zcl_rrs_tst_018 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_018 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    CONSTANTS c_carrier_id TYPE /dmo/carrier_id   VALUE 'LH'.
    CONSTANTS c_connection_id TYPE /dmo/connection_id VALUE '0400'.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

*    Create Instance
**********************************************************************

    connection = NEW #( ).

*    Call Method and Handle Exception - First instance
**********************************************************************

    out->write( |i_carrier_id    = { c_carrier_id }' | ).
    out->write( |i_connection_id = { c_connection_id }' | ).

    TRY.
        connection->set_attributes(
          i_carrier_id    = c_carrier_id
          i_connection_id = c_connection_id
        ).
        APPEND connection TO connections.
        out->write( `Method call successful` ).
      CATCH cx_abap_invalid_value.
        out->write( `Method call failed` ).
    ENDTRY.

*    Calling Functional Method
**********************************************************************

    " in a value assignment (with inline declaration for result)
    DATA(result) = connection->get_output( ).

    " in logical expression
    IF connection->get_output( ) IS NOT INITIAL.

      " as operand in a statement
      LOOP AT connection->get_output( ) INTO DATA(line).

      ENDLOOP.

      " to supply input parameter of another method
      out->write( data   = connection->get_output( )
                  name   = ` ` ).

    ENDIF.

*    Second instance
**********************************************************************

    connection = NEW #( ).

    TRY.
        connection->set_attributes(
          i_carrier_id    = 'SQ'
          i_connection_id = '0001'
        ).
        APPEND connection TO connections.
        out->write( `Method call successful` ).
      CATCH cx_abap_invalid_value.

        out->write( `Method call failed` ).
    ENDTRY.

*    Third instance
**********************************************************************

    connection = NEW #( ).

    TRY.
        connection->set_attributes(
          i_carrier_id    = 'AA'
          i_connection_id = '0017'
        ).
        APPEND connection TO connections.
        out->write( `Method call successful` ).
      CATCH cx_abap_invalid_value.

        out->write( `Method call failed` ).
    ENDTRY.

*    Output
**********************************************************************

    out->write( |----------------------------------| ).
    out->write( | FINAL OUTPUT                     | ).
    out->write( |----------------------------------| ).

    LOOP AT connections INTO connection.
        out->write( connection->get_output( ) ).
    ENDLOOP.

  ENDMETHOD.
ENDCLASS.
