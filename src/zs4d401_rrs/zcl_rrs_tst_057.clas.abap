CLASS zcl_rrs_tst_057 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_rrs_tst_057 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ABAP SQL - GROUP BY
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    SELECT FROM /dmo/connection
     FIELDS
            carrier_id,

            MAX( distance ) AS max,
            MIN( distance ) AS min,
            SUM( distance ) AS sum,
            COUNT( * ) AS count

     GROUP BY carrier_id
     INTO TABLE @DATA(result).
    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).

  ENDMETHOD.
ENDCLASS.
