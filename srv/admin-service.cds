using {com.jsancho.sap.capm.cv as my} from '../db/schema';

service AdminService @(requires : 'admin') {
    entity Persons   as projection on my.Persons;
    entity Resumees  as projection on my.Resumees;
    entity Emails    as projection on my.Emails;
    entity Languages as projection on my.Languages;
    entity Companies as projection on my.Companies;
    entity Education as projection on my.Education;
    entity WebPages  as projection on my.WebPages;
}