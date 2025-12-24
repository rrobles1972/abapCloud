CLASS zcl_rrs_tst_021 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_021 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connection TYPE REF TO lcl_connection.
    DATA connections TYPE TABLE OF REF TO lcl_connection.

    DATA carrier_id TYPE /dmo/carrier_id.
    DATA connection_id TYPE /dmo/connection_id.
    DATA airport_from_id TYPE /dmo/airport_from_id.
    DATA airport_to_id TYPE /dmo/airport_to_id.

    TRY.
        carrier_id = 'AA'.
        connection_id = '0017'.

        connection = NEW #( i_carrier_id = carrier_id i_connection_id = connection_id ).
        APPEND connection TO connections.

        carrier_id = 'SQ'.
        connection_id = '0002'.

        connection = NEW #( i_carrier_id = carrier_id i_connection_id = connection_id ).
        APPEND connection TO connections.

        carrier_id = 'XX'.
        connection_id = '1234'.

        connection = NEW #( i_carrier_id = carrier_id i_connection_id = connection_id ).
        APPEND connection TO connections.


      CATCH cx_abap_invalid_value.
        out->write( |Valores introducidos son incorrectos. |
                 && |carrier_id = { carrier_id } & connection_id = { connection_id }|
                  ).
    ENDTRY.

*    Output
**********************************************************************

    out->write( |----------------------------------| ).
    out->write( | FINAL OUTPUT     Num. { lcl_connection=>conn_counter } | ).
    out->write( |----------------------------------| ).

    LOOP AT connections INTO connection.
      out->write( connection->get_output( ) ).
    ENDLOOP.

    IF ( lcl_connection=>conn_counter > 0 ).
      out->write( |----------------------------------| ).
      out->write( |Last connection was: { connection->get_connection_id( ) }| ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
