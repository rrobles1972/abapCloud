@AbapCatalog.dataMaintenance: #RESTRICTED
@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZRRS_EMPLOY 2nd version'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_RRS_04_EMPLOY
  as select from zrrs_employ
{
  key employee_id             as EmployeeId,
      first_name              as FirstName,
      last_name               as LastName,
      birth_date              as BirthDate,
      entry_date              as EntryDate,
      department_id           as DepartmentId,
      @Semantics.amount.currencyCode: 'CurrencyCode'
      annual_salary           as AnnualSalary,
      currency_code           as CurrencyCode,
      component_to_be_changed as ComponentToBeChanged,
      created_by              as CreatedBy,
      created_at              as CreatedAt,
      local_last_changed_by   as LocalLastChangedBy,
      local_last_changed_at   as LocalLastChangedAt,
      last_changed_at         as LastChangedAt
}
