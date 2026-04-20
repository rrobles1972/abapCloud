@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZRRS_02_FLIGHT wSQLogic'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_RRS_06_FLIGHT as select from zrrs_02_flight
{
    key uuid as Uuid,
    carrier_id as CarrierId,
    connection_id as ConnectionId,
    flight_date as FlightDate,
    // --- Literals ---
    'Flight_constant' as Character1,        // Literal Type CHAR
    '1111'            as Character2,            // Type NUMC
    1                 as Integer1,              // Type INT1
    -1                as Integer2,              // Type INT1
    256               as Integer3,              // Type INT2
    32768             as Integer4,              // Type INT4
    1.5               as Float1,                // Type FLTP
    // --- Type conversion ---
    '19891109'                             as numc8,

    cast( '19891109' as abap.char(8) )     as char8,

    cast( '19891109' as abap.int4 )        as int4,
    cast( '19891109' as abap.dec( 10,2 ) ) as dec10_2,
    cast( '19891109' as abap.fltp )        as fltp,
    
    cast( '20260101' as abap.dats )        as dats,
    
    // --- Type conversion : DE/DOM ---
    cast( '19891109' as zrrs_de_seats_vip ) as fldate,
    cast( '19891109' as /dmo/travel_id preserving type ) as travelid,

    // --- Annotations ---    
    @Semantics.amount.currencyCode: 'CurrencyCode'
    price as Price,
    currency_code as CurrencyCode,

    // --- Conversion Functions in ABAP CDS ---
//    currency_conversion( amount => price,
//                         source_currency => currency_code,
//                         target_currency => cast( 'EUR' as abap.cuky ),
//                         exchange_rate_date => $session.system_date
//                       ) as price_EUR_CDS,
        
    plane_type_id as PlaneTypeId,
    
    // --- CASE Distinction
    case plane_type_id
      when 'A320-200' then 'fat'
      when 'A340-600' then 'very fat'
      else                 'thin'
    end as plane_type,
    
    // --- SQL logic ---
    seats_max as SeatsMax,
    seats_occupied as SeatsOccupied,
    seats_max - seats_occupied as seats_free,
    
    // --- Arithmetics expressions in ABAP CDS ---
    seats_max - seats_occupied       as seats_available,
    (   cast( seats_occupied as abap.fltp )
      * 100.0
    ) / cast( seats_max as abap.fltp ) as percentage_fltp2,
    
    local_created_by as LocalCreatedBy,
    local_created_at as LocalCreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    local_changed_at as LocalChangedAt
}
