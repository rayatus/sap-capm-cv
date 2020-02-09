namespace com.jsancho.sap.capm.cv;

//> cuid - ads key field named ID type UUID
//> managed - ads fields such as CreatedBy, CreatedOn, ModifiedBy, ModifiedOn...

using {
    Country,
    managed,
    cuid
} from '@sap/cds/common';

type Url : String(200);

type Gender : String enum {
    male;
    female;
}

type LanguageLevel : String enum {
    Basic;
    Medium;
    Advanced;
    Native;
}

type EducationType : String enum {
    Degree;
    Certification;
    Training;
}

type Period {
    begin : Date;
    end   : Date;
}

entity Persons : managed, cuid {
    fullName    : String(200);
    birthDate   : Date;
    nationality : Country;
    residence   : Country;
    phone       : String(80);
    gender      : Gender;
    resumees    : Composition of many Resumees
                      on resumees.person = $self;
}

entity Resumees : managed, cuid {
    title             : String(80);
    person            : Association to Persons;
    introduction      : String(1000);
    summaryExperience : String(1000);
    summaryKeySkills  : String(1000);
    eMails            : Composition of many Emails
                            on eMails.resumee = $self;
    companies         : Composition of many Companies
                            on companies.resumee = $self;
    languages         : Composition of many Languages
                            on languages.resumee = $self;
    webPages          : Composition of many WebPages
                            on webPages.resumee = $self;
    education         : Composition of many Education
                            on education.resumee = $self;
}

entity Emails : managed, cuid {
    resumee : Association to Resumees;
    eMail   : String(200);
}

entity Languages : managed, cuid {
    resumee     : Association to Resumees;
    language    : localized String(50);
    spokenLevel : LanguageLevel;
    writtenLevel : LanguageLevel;
}

entity Companies : managed, cuid {
    resumee   : Association to Resumees;
    period    : Period;
    name      : String(200);
    jobTitle  : String(100);
    project   : String(1000);
    functions : String(1000);
}

entity Education : managed, cuid {
    resumee : Association to Resumees;
    period  : Period;
    name    : String(100);
    type    : EducationType;
}

entity WebPages : managed, cuid {
    resumee : Association to Resumees;
    name    : String(50);
    url     : Url;
}