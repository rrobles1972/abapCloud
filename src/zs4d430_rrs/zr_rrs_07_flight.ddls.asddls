@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZRSS_02_FLIGHT with IP'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_RRS_07_FLIGHT with parameters
ip_testvalue : abap.char( 1 )
as select from zrrs_02_flight
{
    key uuid as Uuid,

    // --- CASE Distinction
    case $parameters.ip_testvalue
      when 'X' then 'Good'
      when '-' then 'Not good'
      else          'Undefined'
    end as testvaluefinal,

    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,

    // --- Annotations ---    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,

    plane_type_id as PlaneTypeId,
    seats_max as SeatsMax,
    seats_occupied as SeatsOccupied,
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    local_changed_at as LocalChangedAt
}
