@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View on View Entity: ZRRS_EMPLOY 2nd'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZC_RRS_04_EMPLOY as select from ZR_RRS_04_EMPLOY
{
    key EmployeeId,
    FirstName,
    LastName,
    BirthDate,
    EntryDate,
    DepartmentId,
    @Semantics.amount.currencyCode: 'CurrCode'
    AnnualSalary,
    CurrencyCode as Currcode,
    ComponentToBeChanged,
    CreatedBy,
    CreatedAt,
    LocalLastChangedBy,
    LocalLastChangedAt,
    LastChangedAt,
    _Department.Description
}
