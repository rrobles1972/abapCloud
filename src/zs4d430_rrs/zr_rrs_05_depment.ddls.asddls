@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZRRS_DEPMENT 1s version'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_RRS_05_DEPMENT as select from zrrs_depment
{
    key id as Id,
    description as Description,
    component_to_be_changed as ComponentToBeChanged,
    created_by as CreatedBy,
    created_at as CreatedAt,
    local_last_changed_by as LocalLastChangedBy,
    local_last_changed_at as LocalLastChangedAt,
    last_changed_at as LastChangedAt
}
