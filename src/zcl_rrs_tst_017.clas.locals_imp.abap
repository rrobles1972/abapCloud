*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

class lcl_connection definition create public.

  public section.

    DATA carrier_id TYPE /DMO/CARRIER_ID.
    DATA connection_id TYPE /DMO/CONNECTION_ID.

    CLASS-DATA conn_counter TYPE i.

endclass.

class lcl_connection implementation.

endclass.
