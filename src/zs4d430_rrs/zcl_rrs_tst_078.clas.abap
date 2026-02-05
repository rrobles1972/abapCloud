CLASS zcl_rrs_tst_078 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_078 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " CDS - Dictionary Structures
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    DATA person TYPE zrrs_s_person_nested.
    person-address-country_code = 'US'.

    out->write( name = 'person_nested'
                data = person ).

    DATA person2 TYPE zrrs_s_person_include.
    person2-country_code = 'US'.
    person2-address-country_code = 'US'.
    person2-local_last_changed_by = 'RRS'.

    out->write( name = 'person_include'
                data = person ).

    DATA addresses TYPE tt_addresses.
    addresses = VALUE #(
    ( street = 'Dietmar-Hopp-Allee 16'
      postal_code = '69190'
      city = 'Walldorf'
      country_code = 'DE'
      status = abap_true  )
    ( street = '3999 West Chester Pike'
      postal_code = '19073'
      city = 'Newtown Square, PA'
      country_code = 'US'
      status = abap_false )
    ).

    out->write( name = 'addresses'
                data = addresses ).

*    DATA person3 TYPE st_person_deep.
    DATA person3 TYPE zrrs_s_person_deep.
    person3-first_name = 'RRS first'.
    person3-last_name  = 'RRS second'.
    person3-addresses  = addresses.

    out->write( name = 'person_deep'
                data = person3 ).

  ENDMETHOD.
ENDCLASS.
