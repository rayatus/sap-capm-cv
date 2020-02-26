namespace com.jsancho.sap.capm.cv;

using {
    Country,
    managed,
    cuid
} from '@sap/cds/common';

type Url : String(200)@(title : 'Url');

type Gender : String enum {
    male = 'M'  @(title : 'Male');
    female = 'F'@(title : 'Female');
}

type LanguageLevel : String enum {
    Basic = '1'   @(title : 'Basic');
    Medium = '2'  @(title : 'Medium');
    Advanced = '3'@(title : 'Advanced');
    Native = '4'  @(title : 'Native');
}

type EducationType : String enum {
    Degree = 'D'       @(title : 'Degree');
    Certification = 'C'@(title : 'Certification');
    Training = 'T'     @(title : 'Training');
}

type Period {
    begin : Date @(title : 'From');
    end   : Date @(title : 'To');
}

entity Persons : managed, cuid {
    fullName    : String(200)@(title : 'Name');
    birthDate   : Date       @(title : 'Birth date');
    nationality : Country    @(title : 'Nationality');
    residence   : Country    @(title : 'Residence');
    phone       : String(80) @(title : 'Phone');
    gender      : Gender     @(title : 'Gender');
    resumees    : Composition of many Resumees
                      on resumees.person = $self
                             @(title : 'Resumees');
}

entity Resumees : managed, cuid {
    title             : String(80)             @(title : 'Title');
    person            : Association to Persons @(title : 'Person');
    introduction      : String(1000)           @(title : 'Introduction');
    summaryExperience : String(1000)           @(title : 'Experience - Summary');
    summaryKeySkills  : String(1000)           @(title : 'KeySkills - Summary');
    eMails            : Composition of many Emails
                            on eMails.resumee = $self
                                               @(title : 'eMails');
    companies         : Composition of many Companies
                            on companies.resumee = $self
                                               @(title : 'Companies');
    languages         : Composition of many Languages
                            on languages.resumee = $self
                                               @(title : 'Languages');
    webPages          : Composition of many WebPages
                            on webPages.resumee = $self
                                               @(title : 'WebPages');
    education         : Composition of many Education
                            on education.resumee = $self
                                               @(title : 'Education');
}

entity Emails : managed, cuid {
    resumee : Association to Resumees @(title : 'Resummee');
    eMail   : String(200)             @(title : 'eMail');
}

entity Languages : managed, cuid {
    resumee      : Association to Resumees @(title : 'Resumee');
    language     : localized String(50)    @(title : 'Language');
    spokenLevel  : LanguageLevel           @(title : 'Spoken level');
    writtenLevel : LanguageLevel           @(title : 'Written level');
}

entity Companies : managed, cuid {
    resumee   : Association to Resumees @(title : 'Resumee');
    period    : Period                  @(title : 'Period');
    name      : String(200)             @(title : 'Name');
    jobTitle  : String(100)             @(title : 'Job title');
    project   : String(1000)            @(title : 'Project');
    functions : String(1000)            @(title : 'Functions');
}

entity Education : managed, cuid {
    resumee : Association to Resumees @(title : 'Resumee');
    period  : Period                  @(title : 'Period');
    name    : String(100)             @(title : 'Name');
    type    : EducationType           @(title : 'Type');
}

entity WebPages : managed, cuid {
    resumee : Association to Resumees @(title : 'Resumee');
    name    : String(50)              @(title : 'Name');
    url     : Url;
}