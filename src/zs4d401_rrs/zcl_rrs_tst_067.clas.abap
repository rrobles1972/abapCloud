CLASS zcl_rrs_tst_067 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_067 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " OOP - Inheritance Implementation
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
*    DATA lr_cargo_plane TYPE REF TO lcl_plane.
*    DATA lr_passenger_plane TYPE REF TO lcl_plane.
    DATA lr_cargo_plane TYPE REF TO lcl_cargo_plane.
    DATA lr_passenger_plane TYPE REF TO lcl_passenger_plane.

    lr_cargo_plane = new lcl_cargo_plane( iv_manufacturer = 'ES_planes' iv_type = 'Water_Cargo' iv_cargo = 15 ).
    lr_passenger_plane = new lcl_passenger_plane( iv_manufacturer = 'FR_planes' iv_type = 'Jumbo343' iv_seats = 110 ).

    DATA(lt_cargo_att) = lr_cargo_plane->get_attributes( ).
    DATA(lt_passenger_att) = lr_passenger_plane->get_attributes( ).

    out->write( name = '- - - CARGO - - -'
                data = lt_cargo_att ).

    out->write( name = '- - - PASSENGER - - -'
                data = lt_passenger_att ).

  ENDMETHOD.
ENDCLASS.

