CLASS zcl_rrs_tst_046 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_046 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " ABAP SQL - Literals
    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    CONSTANTS c_number TYPE i VALUE 1234.

    SELECT FROM /dmo/carrier
         FIELDS 'Hello'    AS Character,    " Type c
                 1         AS Integer1,     " Type i
                -1         AS Integer2,     " Type i

                @c_number  AS constant      " Type i  (same as constant)

          INTO TABLE @DATA(result).

    out->write(
      EXPORTING
        data   = result
        name   = 'RESULT'
    ).

  ENDMETHOD.
ENDCLASS.
