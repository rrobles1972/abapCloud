CLASS zcl_rrs_tst_031 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_031 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    Declarations
**********************************************************************

    DATA groceries_upd TYPE TABLE FOR UPDATE zi_rrs_01_grocery.

    groceries_upd = VALUE #(  ( ID = '3AF520A46BA51FD0A9A31D1B05E98B61' Price = '6.00' ) ).

    MODIFY ENTITIES OF zi_rrs_01_grocery
           ENTITY Grocery
           UPDATE FIELDS ( price )
             WITH groceries_upd.

    COMMIT ENTITIES.

    out->write( `Method execution finished` ).

  ENDMETHOD.
ENDCLASS.
