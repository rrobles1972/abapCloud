CLASS zcl_rrs_tst_015 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_RRS_TST_015 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*    Declarations
**********************************************************************

    CONSTANTS max_count TYPE i VALUE 20.
    DATA numbers TYPE TABLE OF i.

*    Example: Calculate the Fibonacci numbers
**********************************************************************

    DO max_count TIMES.
        case sy-index.
          when 1.
            APPEND 0 TO numbers.
          when 2.
            APPEND 1 TO numbers.
          when others.
            APPEND numbers[ sy-index - 2 ] + numbers[ sy-index - 1 ] TO numbers.
        endcase.
    ENDDO.

*    Example: Output of Internal Table
**********************************************************************

    DATA output TYPE string_table.

    DATA(counter) = 0.
    LOOP AT numbers INTO DATA(number).
        counter = counter + 1.
        APPEND |{ counter WIDTH = 4 }: { number WIDTH = 10 ALIGN = RIGHT }| TO output.
    ENDLOOP.

    out->write(
          data = output
          name = |The first { max_count } Fibonacci Numbers|
        ).


  ENDMETHOD.
ENDCLASS.
