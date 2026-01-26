CLASS zcl_rrs_tst_076 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_076 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*     Example 1 : Inline Declaration
**********************************************************************

    DELETE FROM zrrs_employ. "You will erase all the data.

    SELECT
      FROM zrrs_employ
    FIELDS *
      INTO TABLE @DATA(lt_employ). "You will create the data object just-in-time.

*   Obtener timestamp actual
    DATA(lv_timestamp) = cl_abap_tstmp=>utclong2tstmp( utclong_current( ) ).

*     Example 2 : Workarea
**********************************************************************
    DATA lw_employ LIKE LINE OF lt_employ.

    "Classic way.
    lw_employ-employee_id = 1.
    lw_employ-first_name  = 'Alejandro'.
    lw_employ-last_name   = 'Magno'.
    lw_employ-birth_date  = '19700101'.
    lw_employ-entry_date  = '19950604'.
    lw_employ-annual_salary = 100000.
    lw_employ-currency_code = 'EUR'.
    lw_employ-created_by  = sy-uname.
    lw_employ-created_at  = lv_timestamp.
    lw_employ-local_last_changed_by = sy-uname.
    lw_employ-local_last_changed_at = lv_timestamp.

    APPEND lw_employ TO lt_employ.

*     Example 3 : VALUE #( )
**********************************************************************

    "Modern way, less code.
    lw_employ = VALUE #(
    employee_id    = 2
    first_name     = 'Hipatia'
    last_name      = 'De Alejandría'
    birth_date     = '19820421'
    entry_date     = '20020301'
    annual_salary  = 120000
    currency_code  = 'EUR'
    created_by  = sy-uname
    created_at  = lv_timestamp
    local_last_changed_by = sy-uname
    local_last_changed_at = lv_timestamp
    ).

    APPEND lw_employ TO lt_employ.

    out->write( data = lt_employ
                name = `Ejemplo de tabla interna cargada desde ABAP:` ).

*     Insert registers in Database Table
**********************************************************************

    INSERT zrrs_employ FROM TABLE @lt_employ.  "Classic way, ABAP SQL.

*     Read New DATA from Database Table
**********************************************************************

    SELECT
      FROM zrrs_employ
    FIELDS *
      INTO TABLE @lt_employ.

    out->write( data = lt_employ
                name = `Ejemplo de tabla interna cargado desde base de datos:` ).

  ENDMETHOD.
ENDCLASS.
