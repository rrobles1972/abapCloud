@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZR_RRS_07_FLIGHT CDS View'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_RRS_08_FLIGHT 
with parameters
ip_testvalue : abap.char( 1 )
as select from ZR_RRS_07_FLIGHT( ip_testvalue : $parameters.ip_testvalue )
{
    CarrierId,
    max( SeatsMax ) as MaxSeats
}

group by CarrierId
