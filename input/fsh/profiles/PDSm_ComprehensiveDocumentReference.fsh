Profile: PDSm_ComprehensiveDocumentReference
Parent: IHE.MHD.Comprehensive.DocumentReference
Id: pdsm-comprehensive-document-reference
Title: "PDSm Comprehensive DocumentReference"
Description: "Profil spécifique dérivé du profil IHE MHD v4.0.1 \"ComprehensiveDocumentReference\" créé pour le volet \"Partage de documents de santé en mobilité\"."

* meta.versionId MS
* meta.versionId ^short = "Numéro de version de la fiche d’un document attribué par le système cible. La valeur de la métadonnée version est égale à 1 pour la première version de la fiche. Cet élément est requis lorsque le flux envoyé correspond à une mise à jour des données d’une fiche."

* masterIdentifier MS
* masterIdentifier ^short = "Représente l’identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents."

* contained MS
* contained 1.. // author is mandatory
* contained ^short = "Ressource contenue. Dans le cadre de ce profil, il est obligatoire qu'il y ait au moins une ressource contenue : la•les ressource•s référencée•s dans les attributs author et authenticator"

* extension ^slicing.discriminator.type = #value
* extension ^slicing.discriminator.path = "url"
* extension ^slicing.rules = #open

* extension contains PDSm_IsArchived named isArchived 0..1
* extension[isArchived] MS
* extension[isArchived] ^short = "Extension définie pour distinguer les fiches archivées des actives."

* identifier MS

* status MS

* type MS
* type from $JDV-J07-XdsTypeCode-CISIS (preferred)
* type ^short = "Représente le type du document."
* type obeys constr-bind-type

* category MS
* category from $JDV-J06-XdsClassCode-CISIS (preferred)
* category ^short = "Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat,...)."
* category obeys constr-bind-category

* subject only Reference(FRCorePatientProfile)
* subject MS
* subject ^short = "Référence vers le patient concerné par le document. Cette même ressource est référencée depuis context.sourcePatientInfo."

* date MS
* date ^short = "Représente la date de création de la ressource DocumentReference dans FHIR"

* author MS // Author contained dans le profil MHD
* author ^short = "Personnes physiques ou morales et/ou les dispositifs auteurs d'un document."
* author 1..
* author only Reference(AsPractitionerRoleProfile or Device or FRCorePatientProfile)

* authenticator MS // Authenticator contained dans le profil MHD
* authenticator 1..
* authenticator ^short = "Cet attribut représente l’acteur validant le document et prenant la responsabilité du contenu médical de celui-ci. Il peut s’agir de l’auteur du document si celui-ci est une personne et s’il endosse la responsabilité du contenu médical de ses documents. Si l’auteur est un dispositif, cet attribut doit représenter la personne responsable de l’action effectuée par le dispositif. Pour les documents d’expression personnelle du patient, cet attribut fait référence au patient." 
* authenticator only Reference(AsPractitionerRoleProfile or AsOrganizationProfile)

* relatesTo MS
* relatesTo ^definition = "Cardinalité contrainte à [1..1] lorsque le flux envoyé correspond au remplacement d’un document."
* relatesTo ^short = "Relation avec d'autres fiches"
* relatesTo obeys constr-cdr-rempl
* relatesTo obeys constr-bind-relatesTo

* relatesTo.code ^short = "Représente le type d'association entre deux fiches."
* relatesTo.target ^short = "Représente l'identifiant d'une association entre deux fiches."
* relatesTo.target obeys constr-bind-relatesToTarget

* description MS
* description ^short = "Commentaire associé au document."

* securityLabel obeys constr-bind-securityLabel
* securityLabel ^short = "Contient les informations définissant le niveau de confidentialité d'un document."

// ###########
// # CONTENT #
// ###########
* content MS
* content ^short = "Document référencé."
* content.attachment.language ^short = "Pour tous les documents produits par les systèmes initiateurs français, le code est \"fr-FR'."
* content.attachment.size 1.. 
* content.attachment.size ^short = "Représente la taille du document."
* content.attachment.hash 1..
* content.attachment.hash ^short = "Représente le résultat de hachage du document (SHA 1)."
* content.attachment.title 1..
* content.attachment.url ^short = "Représente la référence vers une ressource Binary où se trouvent les données du document référencé"
* content.attachment.url obeys constr-bind-attachmenturl

* content.attachment.creation ^short = "Représente la date et l’heure de création du document"

* content.format from $JDV-J10-XdsFormatCode-CISIS (preferred)
* content.format obeys constr-bind-format
* content.format ^short = "Format technique détaillé du document."

// ###########
// # CONTEXT #
// ###########
* context MS
* context.event obeys constr-bind-context-event
* context.event ^short = "Représente les actes et les pathologies en rapport avec le document."

* context.period 1..
* context.period.start 1..

* context.facilityType from $JDV-J02-XdsHealthcareFacilityTypeCode-CISIS (preferred)
* context.facilityType obeys constr-bind-ProducteurDoc
* context.facilityType ^short = "Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit."

* context.practiceSetting from $JDV-J04-XdsPracticeSettingCode-CISIS (preferred)
* context.practiceSetting obeys constr-bind-ProducteurDoc
* context.practiceSetting ^short = "Cadre d’exercice de l’acte qui a engendré la création du document."

* context.sourcePatientInfo only Reference(FRCorePatientProfile) 
* context.sourcePatientInfo ^short = "Référence vers la ressource Patient titulaire du dossier."

* context.related MS

* context.related ^slicing.discriminator.type = #pattern
* context.related ^slicing.discriminator.path = "type"
* context.related ^slicing.rules = #open
* context.related ^slicing.description = "Slice based on the type.coding.system pattern"

* context.related contains referenceIdList 0..*
* context.related[referenceIdList] ^short = "Données d’un « identifiant de référence » (referenceIdList)"
* context.related[referenceIdList].identifier MS

// Le name du slot dans la metadata ne doit pas être indiquée

* context.related[referenceIdList].identifier.system MS
* context.related[referenceIdList].identifier.system 0..1
* context.related[referenceIdList].identifier.system ^short = "[CXi.4.2] Assigning Authority (ce champs n'est pas présent systématiquement, il ne l'est dans le cas de studyInstanceUID notamment)."

* context.related[referenceIdList].identifier.value MS
* context.related[referenceIdList].identifier.value 1..1
* context.related[referenceIdList].identifier.value ^short = "[CXi.1] Accession number"

* context.related[referenceIdList].identifier.type.coding.system = "urn:ietf:rfc:3986"
* context.related[referenceIdList].identifier.type.coding.code MS
* context.related[referenceIdList].identifier.type.coding.code ^short = "[CXi.5] Identifier Type Code : urn:ihe:iti:xds:2016:studyInstanceUID | urn:ihe:iti:xds:2013:order | urn:ihe:iti:xds:2013:accession"


Invariant:   constr-cdr-rempl
Description: "Elément requis lorsque le flux envoyé correspond au remplacement d'un document"
// Expression: "f:relatesTo"
Severity:    #error


Invariant:   constr-bind-type
Description: """Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :
\r\n TRE_A05-TypeDocComplementaireCISIS, OID : 1.2.250.1.213.1.1.4.12
\r\n LOINC, OID : 2.16.840.1.113883.6.1
\r\n TRE_A12-NomenclatureASTM, OID : ASTM
\r\nLes valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J66-TypeCode-DMP).\r\nEn l’absence de spécifications complémentaires, le jeu de valeurs JDV_J07-XdsTypeCode-CISIS peut être utilisé."""
// Expression:       "f:type"
Severity:    #error

Invariant:   constr-bind-category
Description: """Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :
-	TRE_A03-ClasseDocument-CISIS, OID : 1.2.250.1.213.1.1.4.1
-	TRE_A10-NomenclatureURN, OID : URN
Les valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J57-ClassCode-DMP).
En l’absence de spécifications complémentaires, le jeu de valeurs JDV_J06-XdsClassCode-CISIS peut être utilisé."""
// Expression:       "f:category"
Severity:    #error

Invariant:  constr-bind-relatesTo
Description: "Cardinalité contrainte à [1..1] lorsque le flux envoyé correspond au remplacement d’un document."
// Expression:       "f:relatesTo"
Severity:    #error

Invariant:  constr-bind-relatesToTarget
Description: "Référence contrainte au profil PDSm_ComprehensiveDocumentReference"
// Expression:       "f:relatesTo/f:target"
Severity:    #error


Invariant: constr-bind-securityLabel
Description: "Les codes pour cet élément doivent provenir du ValueSet spécifié par le standard. Lorsqu’aucun code ne correspond au concept recherché, un code provenant de la terminologie de référence TRE_A07-StatusVisibiliteDocument, OID : 1.2.250.1.213.1.1.4.13 peut être utilisé."
// Expression:       "f:securityLabel"
Severity:    #error

Invariant: constr-bind-attachmenturl
Description: "Dans le cas de l’ajout de document, l’url fait référence à la ressource Binary (« Binary/[id] »).
Dans le cas de la recherche, il s’agit de l’URL permettant d’accéder au document"
// Expression:       "f:content/f:attachment/f:url"
Severity:    #error

Invariant: constr-bind-format
Description: "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :
- TRE_A06-FormatCodeComplementaire, OID : 1.2.250.1.213.1.1.4.2.282
- TRE_A11-IheFormatCode, OID : 1.3.6.1.4.1.19376.1.2.3
- TRE_A09-DICOMuidRegistry, OID : 1.2.840.10008.2.6.1
- TRE_A10-NomenclatureURN, OID : URN
Les valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J60-FormatCode-DMP).
En l’absence de spécifications complémentaires, le jeu de valeurs JDV_J10-XdsFormatCode-CISIS peut être utilisé."
// Expression:       "f:content/f:format"
Severity:    #error

Invariant: constr-bind-context-event
Description: "Nomenclatures utilisées : 1) CCAM pour les actes médicaux (OID=\"1.2.250.1.213.2.5\"); 2) CIM-10 pour les diagnostics de pathologie (OID=\"2.16.840.1.113883.6.3\"), 3) TRE_A00-ProducteurDocNonPS pour les documents d'expression personnelle du patient, 4) autre"
// Expression:       "f:context/f:event"
Severity:    #error

Invariant: constr-bind-ProducteurDoc
Description: "Les valeurs possibles pour cet élément doivent provenir d’une des terminologies de référence suivantes :
-	TRE_A00-ProducteurDocNonPS, OID : 1.2.250.1.213.1.1.4.6 (lorsque l’auteur du document est un patient ou un équipement sous sa responsabilité)
-	TRE_R02-SecteurActivite, OID : 1.2.250.1.71.4.2.4 (lorsque l’auteur du document est un professionnel ou un équipement sous sa responsabilité)
Les valeurs possibles peuvent être restreintes en fonction du jeu de valeurs correspondant mis à disposition par le projet (exemple : JDV_J61-HealthcareFacilityTypeCode-DMP).
En l’absence de spécifications complémentaires, le jeu de valeurs JDV_J02-XdsHealthcareFacilityTypeCode-CISIS peut être utilisé."
// Expression:       "f:context/f:facilityType or f:context/f:practiceSetting"
Severity:    #error


Mapping:  ConceptMetierToPDSm_ComprehensiveDocumentReference
Source:   PDSm_ComprehensiveDocumentReference
Id:       specmetier-to-PDSmComprehensiveDocumentReference
Title:    "Spécification métier vers le profil PDSm_ComprehensiveDocumentReference"
* -> "Fiche"
* author -> "auteur : [1..*] Identifiant"
* status -> "statut : [1..1] Code"
* extension[isArchived] -> "statut : [1..1] Code"
* category -> "classeDocument : [0..1] Code"
* type -> "typeDocument : [0..1] Code"
* identifier -> "idFiche : [0..*] Identifiant"
* masterIdentifier -> "idUnique : [0..1] Identifiant"
* authenticator -> "authentificateur : [1..1] Identifiant"
* content.attachment.creation -> "dateCreationDocument : [1..1] DateHeure"
* securityLabel -> "niveauConfidentialite : [0..*] code"
* context.practiceSetting -> "cadreExercice : [0..1] Code"
* subject -> "idPatient : [0..1] Identifiant"
* context.facilityType -> "secteurActivite : [0..1] Code"
* context.period.start -> "dateDebutActe : [0..1] DateHeure"
* context.period.end -> "dateFinActe : [0..1] DateHeure"
* relatesTo.target -> "idFicheAssociation : [0..*] Identifiant"
* relatesTo.code -> "association : [0..*] Code"
* description -> "commentaire : [0..1] Texte"
* content.attachment.title -> "titreDocument : [0..1] Texte"
* content.attachment.language -> "langueDocument : [1..*] Code"
* content.format -> "formatDocument : [0..1] Code"
* context.event -> "actePathologie : [0..1] Code"
* meta.versionId -> "version : [0..1] Numerique"
* content.attachment.url -> "Document : [0..1]"


