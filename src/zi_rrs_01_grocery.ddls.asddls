@Metadata.ignorePropagatedAnnotations: true
@EndUserText.label: 'Groceries'
@Search.searchable: true
@AccessControl.authorizationCheck: #NOT_REQUIRED

@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZI_RRS_01_GROCERY
  provider contract transactional_interface
   as projection on ZR_RRS_01_GROCERY as Groceries
{
    @ObjectModel.text.element: ['Product']
    key ID,
    @Search.defaultSearchElement: true
    Product,
    Category,
    Brand,
  @Semantics.amount.currencyCode: 'Currency'    
    Price,
    Currency,
    Quantity,
    Purchasedate,
    Expirationdate,
    Expired,
    Rating,
    Note,
    Createdby,
    Createdat,
    Lastchangedby,
    Lastchangedat,
    Locallastchanged
}
