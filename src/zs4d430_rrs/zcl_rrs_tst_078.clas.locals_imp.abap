*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations

* Timestamp
TYPES:
  BEGIN OF st_timestamp,
    created_by            TYPE abp_creation_user,
    created_at            TYPE abp_creation_tstmpl,
    local_last_changed_by TYPE abp_locinst_lastchange_user,
    local_last_changed_at TYPE abp_locinst_lastchange_tstmpl,
    last_changed_at       TYPE abp_lastchange_tstmpl,
  END OF st_timestamp.

* Address
TYPES:
  BEGIN OF st_address,
    street       TYPE /dmo/street,
    postal_code  TYPE /dmo/postal_code,
    city         TYPE /dmo/city,
    country_code TYPE land1,
    status       TYPE c LENGTH 1,
  END OF st_address,
  tt_addresses TYPE STANDARD TABLE OF st_address WITH NON-UNIQUE KEY country_code postal_code.

TYPES:
  BEGIN OF st_person_nested,
    first_name TYPE /dmo/first_name,
    last_name  TYPE /dmo/last_name,

    address    TYPE st_address,

  END OF st_person_nested.

TYPES:
  BEGIN OF st_person_include,
    first_name TYPE /dmo/first_name,
    last_name  TYPE /dmo/last_name.

    INCLUDE TYPE st_address AS address.

    INCLUDE TYPE st_timestamp.

TYPES:
END OF st_person_include.

TYPES:
  BEGIN OF st_person_deep,
    first_name TYPE /dmo/first_name,
    last_name  TYPE /dmo/last_name,
    addresses  TYPE tt_addresses,
  END OF st_person_deep.
