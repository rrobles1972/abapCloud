@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZRRS_EMPLOY 1st version'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZR_RRS_03_EMPLOY
  as select from zrrs_employ
{
  key employee_id as               EmployeeId,
      first_name  as               FirstName,
      last_name   as               LastName,
      birth_date  as               BirthDate, // comment
// complete row is a comment
      entry_date  /* comment */ as EntryDate
}
