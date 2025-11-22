CLASS LHC_ZR_RRS_02_FLIGHT DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZrRrs02Flight
        RESULT result,
      validatePrice FOR VALIDATE ON SAVE
            IMPORTING keys FOR ZrRrs02Flight~validatePrice.
ENDCLASS.

CLASS LHC_ZR_RRS_02_FLIGHT IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
  ENDMETHOD.
  METHOD validatePrice.

    READ ENTITIES OF zr_rrs_02_flight IN LOCAL MODE
        ENTITY ZrRrs02Flight
        FIELDS ( Price )
        WITH CORRESPONDING #( keys )
        RESULT DATA(flights).

    LOOP AT flights INTO DATA(flight).
        IF ( flight-Price > '500.0' ).
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " Creamos el mensaje
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
            DATA(message) = me->new_message(
              id = 'ZM_RRS_RAP'
              number = '001'
              severity = ms-error
             ).
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " Asignamos el mensaje al registro
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
            DATA reported_record LIKE LINE OF reported-zrrrs02flight.
            reported_record-%tky = flight-%tky.
            reported_record-%msg = message.
            reported_record-%element-price = if_abap_behv=>mk-on.
            APPEND reported_record TO reported-zrrrs02flight.
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
            " Marcamos el registro como erróneo
            """"""""""""""""""""""""""""""""""""""""""""""""""""""""""
            DATA failed_record LIKE LINE OF failed-zrrrs02flight.
            failed_record-%tky = flight-%tky.
            APPEND failed_record TO failed-zrrrs02flight.

        ENDIF.
    ENDLOOP.

  ENDMETHOD.

ENDCLASS.
