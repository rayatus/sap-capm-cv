namespace com.jsancho.sap.capm.cv;

//> cuid - ads key field named ID type UUID
//> managed - ads fields such as CreatedBy, CreatedOn, ModifiedBy, ModifiedOn...

using {
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
    fullName                : String(200);
    birthDate               : Date;
    nationality             : localized String(80);
    residence               : localized String(100);
    phone                   : String(80);
    gender                  : Gender;
    eMails                  : Composition of many Emails
                                  on eMails.person = $self;
    professionalExperiences : Association to many ProfessionalExperiences
                                  on professionalExperiences.person = $self;
    languages               : Association to many Languages
                                  on languages.person = $self;
    webPages                : Association to many WebPages
                                  on webPages.person = $self;
}

entity Emails : managed, cuid {
    eMail  : String(200);
    person : Association to Persons;
}

entity Languages : managed, cuid {
    person      : Association to Persons;
    language    : localized String(50);
    spokenLevel : LanguageLevel;
    writenLevel : LanguageLevel;
}

entity ProfessionalExperiences : managed, cuid {
    person    : Association to Persons;
    period    : Period;
    company   : String(200);
    jobTitle  : String(100);
    project   : String(1000);
    functions : String(1000);
}

entity Education : managed, cuid {
    person : Association to Persons;
    period : Period;
    name   : String(100);
    type   : EducationType;
}

entity WebPages : managed, cuid {
    person : Association to Persons;
    name   : String(50);
    url    : Url;
}