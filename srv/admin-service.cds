using {com.jsancho.sap.capm.cv as my} from '../db/schema';

service AdminService @(requires : 'admin') {
    entity Persons as projection on my.Persons;
    entity Emails  as projection on my.Emails;
}