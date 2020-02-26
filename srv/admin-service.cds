using com.jsancho.sap.capm.cv as db from '../db/schema';

@(requires:'admin')
service AdminService {
    entity Persons   as projection on db.Persons;
    entity Resumees  as projection on db.Resumees;
    entity Emails    as projection on db.Emails;
    entity Languages as projection on db.Languages;
    entity Companies as projection on db.Companies;
    entity Education as projection on db.Education;
    entity WebPages  as projection on db.WebPages;
}