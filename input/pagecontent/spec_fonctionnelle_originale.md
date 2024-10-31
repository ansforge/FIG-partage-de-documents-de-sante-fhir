### CADRE JURIDIQUE ET ORIENTATIONS ORGANISATIONNELLES

Ce document présente une étude métier pour la mise en œuvre du volet « Partage de documents de santé ». Les processus décrits dans ce volet permettent de regrouper l'ensemble des documents de santé d'un patient disposant d’un dossier partagé, d'en permettre la modification, la dépublication, la recherche et la consultation.

L’étude menée concerne la modélisation des flux qui existent entre les composants d’un système d’information ou entre des systèmes d’informations qui participent à la mise en œuvre du partage de documents de santé. Elle englobe les actions de modification du contenu du dossier patient, ainsi que de recherche et de consultation des documents selon divers critères de recherche qui sont présentés dans ce document.

A noter que les contraintes de sécurité concernant les flux échangés ne sont pas traitées dans ce document. En effet, les aspects relatifs à la sécurité sont du ressort du système d’information les implémentant et des volets transport du CI-SIS.

#### Exemple de cas d'usage

Un médecin généraliste envoie son patient faire une radiographie.

Le patient passe l’examen radiologique. Le radiologue modifie le dossier médical du patient, il y ajoute le compte rendu de l’examen via son système d’information de radiologie.

Le patient retourne voir son médecin traitant. Le médecin recherche le compte rendu de l’examen et le consulte via son logiciel de professionnel de santé (LPS). 

### ORGANISATION DU CONTEXTE METIER

<object data="fonctionnel/fig_1.png" type="image/png"></object>
<br/>
Figure 1 Organisation du contexte métier de l'étude "Dossier Patient"

Le périmètre de l'étude englobe les processus en couleur sur le diagramme de paquetage.

### DEFINITION DES PROCESSUS COLLABORATIFS


#### Cas d'utilisations

##### Processus collaboratif "ajout d'un lot de documents"

<object data="fonctionnel/fig_2.png" type="image/png"></object>
<br/>
Figure 2 : Processus collaboratif "Ajout d'un lot de documents"

Service attendu | Le producteur de documents envoie au gestionnaire de partage de documents une demande d’ajout d’un lot de documents. Ces documents peuvent être de nouveaux documents et/ou des nouvelles versions de documents. |
Pré- conditions | Le producteur de documents doit au préalable : 1. être en possession des documents à modifier, 2. être habilité |
Post-conditions | N/A |
Contraintes fonctionnelles | N/A |
Scénario nominal | N/A |
Table 1 Caractéristiques du processus collaboratif

##### Processus collaboratif "Mise à jour des métadonnées d'une fiche"

<object data="fonctionnel/fig_3.png" type="image/png"></object>
<br/>
Figure 3 : Processus collaboratif "Mise à jour des métadonnées d'une fiche"

| Service attendu | Le producteur de documents envoie au gestionnaire de partage de documents les modifications des métadonnées du document : niveau de confidentialité, options de visibilité et statut. Il peut envoyer une de ces métadonnées, plusieurs ou toutes. |
| Pré-conditions | Le producteur de documents doit au préalable : 1. être en possession des métadonnées à modifier, 2. être habilité |
| Post-conditions | N/A |
| Contraintes fonctionnelles | N/A |
| Scénario nominal | N/A |
Table 2 Caractéristiques du processus collaboratif

##### Processus collaboratif "Recherche de documents"

<object data="fonctionnel/fig_4.png" type="image/png"></object>
<br/>
Figure 4 : Processus collaboratif "Recherche de documents"

| Service attendu | Le consommateur de documents transmet une recherche de documents à l’aide de critères de recherches, notamment les caractéristiques principales du document (données qui permettent de classer les documents). L’infrastructure de partage de documents retourne les références des documents répondant aux critères. |
| Pré-conditions | Le consommateur de documents doit : 1. être en possession des paramètres de recherche de documents, 2. être habilité |
| Post-conditions | N/A |
| Contraintes fonctionnelles | N/A |
| Scénario nominal | N/A |
Table 3 Caractéristiques du processus collaboratif

##### Processus collaboratif "Consultation de documents"

<object data="fonctionnel/fig_5.png" type="image/png"></object>
<br/>
Figure 5 : Processus collaboratif "Consultation de documents"

| Service attendu | Le consommateur de documents consulte des documents stockés dans l’infrastructure de partage de documents à partir des références qu’il a obtenues. |
| Pré-conditions | Le consommateur de documents doit : 1. avoir au préalable récupéré les références du ou des document(s) qu’il souhaite consulter 2. être habilité |
| Post-conditions | N/A |
| Contraintes fonctionnelles | N/A |
| Scénario nominal | N/A |

Table 4 Caractéristiques du processus collaboratif

#### Liste des acteurs pour l'ensemble des processus

| **Acteur** | **Description** |
| ------ | ------ |
| Consommateur de documents | Il s’agit d’un système d’information ou d’un composant de système d’information qui recherche des documents selon certains critères, et qui peut consulter les documents qui l’intéressent.<br />Exemples de systèmes :<br /> -Logiciel de Professionnel de Santé (LPS)<br /> -Logiciel Patient (LPA) |
| Gestionnaire de partage de documents | Il s’agit d’un système d’information ou d’un composant d'un système d’information qui stocke, classe et archive les documents d’un dossier patient.<br /> Exemple de système : <br /> -Infrastructure du DMP |
| Producteur de documents | Il s’agit d’un système d’information ou d’un composant de système d’information qui envoie au gestionnaire de partage de documents une demande d’ajout de nouveaux documents et/ou des nouvelles versions de documents. Ce système fournit également les modifications des métadonnées du document. <br /> Exemples de systèmes :<br /> - Logiciel de Professionnel de Santé (LPS)<br /> - Logiciel Patient (LPA) |


Table 5 Table des acteurs

### DESCRIPTION DES PROCESSUS COLLABORATIFS ET IDENTIFICATION DES FLUX

#### Ajout d'un lot de documents

<object data="fonctionnel/fig_6.png" type="image/png"></object>
<br/>
Figure 6 : Processus collaboratif "Ajout d'un lot de documents"

##### Description des actions


| **Action** | **Description** |
| ------ | ------ |
| Préparer le ou les documents | Le producteur de documents rassemble les documents à ajouter et/ou à mettre à jour dans l'infrastructure de partage de documents. |
| Traiter la réponse | Le producteur de documents reçoit et traite le résultat de la demande d’ajout ou de mise à jour de documents. Il peut afficher à l’utilisateur le résultat de la demande. |
| Traiter la demande d'ajout ou de remplacement d'un document | L'infrastructure de partage de documents traite la demande d’ajout ou de mise à jour, exécute les actions nécessaires au traitement de ces demandes et retourne le résultat du traitement. |

Table 6 Tableau des actions


##### Identification des flux

| **Flux** | **Processus** | **Emetteur** | **Récepteur** | **Périmètre** |
| Flux 1 - AjoutLotDocument | Ajout d'un lot de documents | Producteur de documents |Gestionnaire de partage de documents | Oui |
| Flux 2 - ResultatAjoutLotDocument | Ajout d'un lot de documents | Gestionnaire de partage de documents | Producteur de documents | Oui |

#### Mise à jour métadonnées fiche


<object data="fonctionnel/fig_7.png" type="image/png"></object>
<br/>
Figure 7 : Processus collaboratif "Mise à jour des métadonnées d'une fiche"


##### Description des actions

| **Action** | **Description** |
| ------ | ------ |
| Mise à jour des métadonnées de la fiche |Le producteur de document soumet les métadonnées à mettre à jour au gestionnaire. |
| Consulter la réponse | Le producteur de documents prend connaissance de la réponse du gestionnaire suite à la demande de mise à jour. |
| Réceptionner la demande | Le gestionnaire reçoit la demande de mise à jour des métadonnées. <br/>Exécuter la demande si possible	Le gestionnaire met à jour, si possible, la ou les métadonnées de la fiche avec les éléments envoyés par le producteur. |

Table 8 Tableau des actions

##### Identification des flux


| **Flux** | **Processus** | **Emetteur** | **Récepteur** | **Périmètre** |
| Flux 3 - MiseAJourMetadonneeFiche | Mise à jour des métadonnées d'une fiche | Producteur de documents | Gestionnaire de partage de documents | Oui |
| Flux 4 – ResultatMAJMetadonneeFiche | Mise à jour des métadonnées d'une fiche | Gestionnaire de partage de documents | Producteur de documents | Oui |


#### Recherche de documents
<object data="fonctionnel/fig_8.png" type="image/png"></object>
<br/>

Figure 8 : Processus collaboratif "Recherche de documents"

##### Description des actions

| **Action** | **Description** |
| ------ | ------ |
| Transmettre la recherche de documents | Le consommateur de documents transmet à l'infrastructure de partage de documents une liste de critères de recherche, basés sur les informations-clés supportées par l'infrastructure de documents |
| Traiter la réponse | Le consommateur de documents reçoit et traite la réponse à la recherche de documents. Le résultat de la recherche est affiché à l'utilisateur. |
| Traiter la recherche de documents | L'infrastructure de documents retourne au consommateur de documents la réponse à la recherche de documents. |

Table 10 Tableau des actions

##### Identification des flux


| **Flux** | **Processus** | **Emetteur** | **Récepteur** | **Périmètre** |
| Flux 5 - RechercheDocument | Recherche de documents | Consommateur de documents | Gestionnaire de partage de documents | Oui |
| Flux 6 - ResultatRechercheDocument | Recherche de documents | Gestionnaire de partage de documents | Consommateur de documents | Oui


#### Consultation de documents

<object data="fonctionnel/fig_9.png" type="image/png"></object>
<br/>

Figure 9 : Processus collaboratif "Mise à jour du cercle de soins"

##### Description des actions

| **Action** | **Description** |
| ------ | ------ |
| Transmettre la demande de consultation de documents | Le consommateur de documents envoie à l'infrastructure de partage de documents une demande pour consulter un ou plusieurs documents. |
| Traiter la réponse | Le consommateur de documents reçoit et traite la réponse à la demande de consultation de documents et affiche le résultat à l'utilisateur. |
| Traiter la demande de consultation | L'infrastructure de partage de documents traite la demande de consultation du ou des documents et retourne le résultat de la demande au consommateur de documents. |

Table 12 Tableau des actions


##### Identification des flux


| **Flux** | **Processus** | **Emetteur** | **Récepteur** | **Périmètre** |
| Flux 7 - DemandeConsultationDocument | Consultation de documents | Consommateur de documents | Gestionnaire de partage de documents | Oui |
| Flux 8 - ResultatDemandeConsultationDocument | Consultation de documents | Gestionnaire de partage de documents | Consommateur de documents | Oui |


#### Synthèse des flux


| **Flux** | **Processus** | **Emetteur** | **Récepteur** | **Périmètre** |
| Flux 1 - AjoutLotDocument | Ajout d'un lot de documents | Producteur de documents | Gestionnaire de partage de documents | Oui |
| Flux 2 - ResultatAjoutLotDocument | Ajout d'un lot de documents | Gestionnaire de partage de documents | Producteur de documents | Oui | 
| Flux 3 - Mise AJourMetadonneeFiche | Mise à jour des métadonnées d'une fiche | Producteur de documents | Gestionnaire de partage de documents | Oui |
| Flux 4 – ResultatMAJMetadonneeFiche	Mise à jour des métadonnées d'une fiche | Gestionnaire de partage de documents | Producteur de documents | Oui |
| Flux 5 - RechercheDocument | Recherche de documents | Consommateur de documents | Gestionnaire de partage de documents | Oui |
| Flux 6 - ResultatRechercheDocument | Recherche de documents | Gestionnaire de partage de documents | Consommateur de documents | Oui | 
| Flux 7 - DemandeConsultationDocument | Consultation de documents | Consommateur de documents | Gestionnaire de partage de documents | Oui |
| Flux 8 - ResultatDemandeConsultationDocument | Consultation de documents | Gestionnaire de partage de documents | Consommateur de documents | Oui |

### IDENTIFICATION DES CONCEPTS VEHICULES DANS LES FLUX D’INFORMATIONS ET CORRESPONDANCE AVEC LES CLASSES ET ATTRIBUTS DU MOS


#### Concepts métier - Factorisation par concept

| **Nom** | **Description** | **Flux** |
| Document | Un document est la plus petite unité d'information déposée dans l’infrastructure de partage de documents. Une fois stocké dans l’infrastructure de partage de documents avec un identifiant unique, le document ne subit plus aucune modification. | Flux 1 - AjoutLotDocument <br />Flux 7 - ResultatDemandeConsultationDocument | 
| Fiche | Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents. | Flux 1 - AjoutLotDocument <br /> Flux 3 - MiseAJourMetadoneeFiche <br /> Flux 2 - ResultatAjoutLotDocument <br /> Flux 5 - ResultatRechercheDocument | 
| Classeur | Un assemblage de fiches regroupées par catégorie. | Flux 1 - AjoutLotDocument <br /> Flux 2 - ResultatAjoutLotDocument | 
| LotSoumission | Un lot de soumission regroupe les fiches et les classeurs faisant partie d’une même demande de modification du contenu du dossier. Il atteste l’existence et le statut de la demande et est décrit par un ensemble d’attributs, ses métadonnées. Une fois créé, un lot de soumission est immuable à l'exception de son statut. | Flux 1 - AjoutLotDocument <br /> Flux 2 - ResultatAjoutLotDocument <br /> Flux 5 - ResultatRechercheDocument |

#### Mise en équivalence MOS
Il n’y pas de concepts équivalent dans le MOS au moment de l’étude.

### MODELISATION DES FLUX D'INFORMATIONS
Les types de données complexes sont décrits dans les classes communes du MOS de l'ANS

#### Flux 1 - AjoutLotDocument

<object data="fonctionnel/fig_10.png" type="image/png"></object>
<br/>

Figure 10 Flux 1 - AjoutLotDocument

##### Classe "Document"

Un document est la plus petite unité d'information déposée dans l’infrastructure de partage de documents. Une fois stocké dans l’infrastructure de partage de documents avec un identifiant unique, le document ne subit plus aucune modification.

| **Nom** | **Description** |
| ----- | ----- |
| contenuDocument : [1..1] ObjetBinaire | Contient le document au format binaire |

Table 16 Attributs de la classe "Document"

##### Classe "Fiche"
Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents. 

| **Nom** | **Description** |
| ----- | ----- |
| idFiche : [0..*] Identifiant | Identifiant unique d'une fiche d'un document. |
| idUnique : [0..1] Identifiant	| Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.|
| auteur : [1..*] Identifiant | Identifiant de la personne physique et/ou du dispositif auteur d'un document.|
| statut : [1..1] Code | Représente le statut de la fiche d'un document.<br/>Nomenclature(s) associée(s) :<br/>** TRE_R269-AvailabilityStatusProvenanceOasis<br/>** TRE_R270-AvailabilityStatus |
| classeDocument : [0..1] Code | Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, ....). <br/> Jeu de valeurs issu de la nomenclature TRE_A03-ClasseDocument |
| typeDocument : [0..1] Code | Représente le type du document.<br/> Jeu de valeurs issu des nomenclatures:<br/>** LOINC <br/>** et TRE_A05-TypeDocComplementaire |
| authentificateur : [1..1] Identifiant	| Cet attribut représente l’acteur validant le document et prenant la responsabilité du contenu médical de celui-ci. Il peut s’agir de l’auteur du document si celui-ci est une personne et s’il endosse la responsabilité du contenu médical de ses documents. Si l’auteur est un dispositif, cet attribut doit représenter la personne responsable de l’action effectuée par le dispositif. Pour les documents d’expression personnelle du patient, cet attribut fait référence au patient. |
| dateCreationDocument : [1..1] DateHeure | Représente la date et l'heure de la création du document. |
| niveauConfidentialite : [0..*] Code | Contient les informations définissant le niveau de confidentialité d'un document.<br/>Nomenclatures utilisées :<br/>** TRE_A08-Confidentiality-HL7<br/>** TRE_A07-StatusVisibiliteDocument<br/>** JDV_J08-XdsConfidentialityCode-CISIS|
| cadreExercice : [0..1] Code | Cadre d’exercice de l’acte qui a engendré la création du document. <br/>Nomenclature utilisée : TRE_A01-CadreExercice|
| idPatient : [0..1] Identifiant | Représente l'identifiant du patient. |
| secteurActivite : [0..1] Code | Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit.<br/>Nomenclature utilisée : TRE_R02-SecteurActivite|
| dateDebutActe : [0..1] DateHeure | Représente la période de début de l’acte de référence.|
| dateFinActe : [0..1] DateHeure | Date de fin de l’acte de référence, si connue.|
| idFicheAssociation : [0..*] Identifiant | Représente l'identifiant d'une association entre deux fiches.|
| association : [0..*] Code| Représente le type d'association entre deux fiches. Se référer aux spécifications techniques pour plus de détails sur la ou les nomenclatures utilisées.|
| commentaire : [0..1] Texte | Commentaire associé au document.|
| titreDocument : [0..1] Texte | Titre du document |
| langueDocument : [1..*] Code | Langue dans laquelle le document est rédigé, pour tous les documents produits par les systèmes initiateurs français, le codes est "fr-FR'.|
| formatDocument : [0..1] Code | Format technique détaillé du document.<br/>Nomenclatures utilisées :<br/>TRE_A06-FormatCodeComplementaire<br/>TRE_A09-DICOMuidRegistry<br/>TRE_A10-NomenclatureURN<br/>TRE_A11-IheFormatCode<br/>ASS_X11-CorresModeleCDA-XdsFormatCode-CISIS<br/>ASS_A12-CorresMediaTypeCDANonStructure-XdsFormatCode-CISIS|
| actePathologie : [0..1] Code | Actes et pathologies en rapport avec le document.<br/>Nomenclatures utilisées :<br/>** CCAM pour les actes médicaux (OID=""1.2.250.1.213.2.5"");<br/>** CIM-10 pour les diagnostics de pathologie (OID=""2.16.840.1.113883.6.3"");<br/>** TRE_A00-ProducteurDocNonPS pour les documents d'expression personnelle du patient."|
| version : [0..1] Numerique | Numéro de version de la fiche d’un document. La valeur de la métadonnée version est égale à 1 pour la première version de la fiche.|

Table 17 Attributs de la classe "Fiche"

##### Classe "Classeur"

Un assemblage de fiches regroupées par catégorie.

| **Nom** | **Description** |
| ----- | ----- |
| idUnique : [0..*] Identifiant | Identifiant unique du classeur.|
| listeFiches : [0..*] Identifiant | Liste des fiches composant le classeur.|
| statut : [1..1] Code | Pertinence de la version d’un classeur.|
| idPatient : [0..1] Identifiant | Informations relatives à la gestion des classes et des données.|
| typeActivite : [0..1] Code | Représente les codes spécifiant le type d’activité de l’événement clinique ayant abouti au regroupement de la fiche d’un document dans ce classeur.<br/>Se référer aux spécifications techniques pour plus de détails sur la ou les nomenclatures utilisées. |
| derniereMiseAJour : [0..1] DateHeure | Correspond à la date et l’heure de la dernière mise à jour du classeur. |
| titreClasseur : [1..1] Texte | Titre du classeur.|

Table 18 Attributs de la classe "Classeur"

##### Classe "LotSoumission"
Un lot de soumission regroupe les fiches et les classeurs faisant partie d’une même demande de modification du contenu du dossier. Il atteste l’existence et le statut de la demande et est décrit par un ensemble d’attributs, ses métadonnées. Une fois créé, un lot de soumission est immuable à l'exception de son statut.

| **Nom** | **Description** |
| ----- | ----- |
| idLotSoumission : [0..*] Identifiant | Identifiant unique du lot de soumission. Cet attribut est destiné à des fins de gestion interne alors que idUnique est utilisé à des fins de références externes. |
| idUnique : [0..1] Identifiant | Identifiant unique global affecté à ce lot de soumission par son créateur. Cet attribut est utilisé à des fins de références externes alors que idLotSoumission est destiné à des fins de gestion interne.|
| idPatient : [0..1] Identifiant | Représente l'identifiant du patient.|
| idSource : [0..1] Identifiant | Représente l’identifiant unique global du système émetteur du lot de soumission.|
| auteur : [1..1] Identifiant | Représente les personnes physiques ou morales et/ou les dispositifs auteurs d’un lot de soumission.|
| dateSoumission : [1..1] DateHeure | Représente la date et heure de soumission.|
| typeActivite : [1..1] Code | Représente le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission.<br/>Jeu de valeurs issu des nomenclatures:<br/>** TRE_R209-TypeActivite<br/>** TRE_R02-SecteurActivite
| statut : [1..1] Code | Représente le statut du lot de soumission.<br/> Nomenclatures utilisées :<br/> TRE_R269-AvailabilityStatusProvenanceOasis<br/> TRE_R270-AvailabilityStatus |
| commentaire : [0..1] Texte | Contient le commentaire associé au lot de soumission.|
| titre : [0..1] Texte | Titre du lot de soumission|

Table 19 Attributs de la classe "LotSoumission"


#### Flux 2 - ResultatAjoutLotDocument

<object data="fonctionnel/fig_11.png" type="image/png"></object>
<br/>
Figure 11 Flux 2 - ResultatAjoutLotDocument

##### Classe "LotSoumission"
Un lot de soumission regroupe les fiches et les classeurs faisant partie d’une même demande de modification du contenu du dossier. Il atteste l’existence et le statut de la demande et est décrit par un ensemble d’attributs, ses métadonnées. Une fois créé, un lot de soumission est immuable à l'exception de son statut.

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributLotSoumission : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir un lot de soumission qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient. |

Table 20 Attributs de la classe "LotSoumission"

##### Classe "Classeur"

Un assemblage de fiches regroupées par catégorie.

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributClasseur : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir un lot de soumission qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient. |

Table 21 Attributs de la classe "Classeur"

##### Classe "Fiche"

Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents. 

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributFiche : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir une fiche qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient. |

Table 22 Attributs de la classe "Fiche"


#### Flux 3 - MiseAJourMetadonneeFiche

<object data="fonctionnel/fig_12.png" type="image/png"></object>
<br/>
Figure 12 Flux 3 - MiseAJourMetadonneeFiche


##### Classe "Fiche"
Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents. 

| **Nom** | **Description** |
| ----- | ----- |
| idUnique : [0..1] Identifiant	Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.|
| statut : [1..1] Code | Représente le statut de la fiche d'un document.<br/>Nomenclature(s) associée(s) :<br/>** TRE_R269-AvailabilityStatusProvenanceOasis<br/>** TRE_R270-AvailabilityStatus |
| niveauConfidentialite : [0..*] Code | Contient les informations définissant le niveau de confidentialité d'un document.<br/>Nomenclatures utilisées :<br/>** TRE_A08-Confidentiality-HL7<br/>** TRE_A07-StatusVisibiliteDocument<br/>** JDV_J08-XdsConfidentialityCode-CISIS|

Table 23 Attributs de la classe "Fiche"

#### Flux 4 - ResultatMAJMetadonneeFiche

<object data="fonctionnel/fig_13.png" type="image/png"></object>
<br/>
Figure 13 Flux 4 - ResultatMAJMetadonneeFiche

##### Classe "Fiche"
Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents. 

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributFiche : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir une fiche qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient.|

Table 24 Attributs de la classe "Fiche"

 
#### Flux de recherche : Flux 5 – RechercheDocument

Les caractéristiques principales des documents renseignées dans les lots de soumission ou dans les fiches servent à la recherche de documents. Celle-ci se fait donc de deux manières : via la recherche de fiches ou via la recherche de lots de soumission. 
Le document dont les caractéristiques principales correspondent aux critères de recherche peut être consulté dans un second temps en utilisant le flux 05 de demande de consultation de document. 

##### Recherche de lots de soumission

| **Nom** | **Description** |
| ----- | ----- |
| dateSoumission | Représente la date et heure de soumission.|
| typeActivite | Représente le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission.<br/>Jeu de valeurs issu des nomenclatures:<br/>**TRE_R209-TypeActivite <br/> **TRE_R02-SecteurActivite |
| idUnique | Identifiant unique global affecté à ce lot de soumission par son créateur. Cet attribut est utilisé à des fins de références externes alors que idLotSoumission est destiné à des fins de gestion interne. |
| idPatient | Représente l'identifiant du patient. |
| statut | Représente le statut du lot de soumission.<br/> Nomenclatures utilisées :<br/> TRE_R269-AvailabilityStatusProvenanceOasis<br/> TRE_R270-AvailabilityStatus |
| idLotSoumission | Identifiant unique du lot de soumission. Cet attribut est destiné à des fins de gestion interne alors que idUnique est utilisé à des fins de références externes.|
| idSource | Représente l’identifiant unique global du système émetteur du lot de soumission. |
| titre | Titre du lot de soumission |
| auteur | Représente les personnes physiques ou morales et/ou les dispositifs auteurs d’un lot de soumission. |
| nomAuteurPersonnePhysique | Nom de la personne physique auteur du lot.|
| prenomAuteurPersonnePhysique | Prénom de la personne physique auteur du lot.|

##### Recherche de fiches

| **Nom** | **Description** |
| ----- | ----- |
|typeDocument | Représente le type du document.<br/>Jeu de valeurs issu des nomenclatures:<br/> ** LOINC <br/> ** et TRE_A05-TypeDocComplementaire |
| idPatient | Représente l'identifiant du patient. |
| secteurActivite | Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit.<br/> Nomenclature utilisée : TRE_R02-SecteurActivite |
| dateDebutActe | Représente la période de début de l’acte de référence. |
| cadreExercice |Cadre d’exercice de l’acte qui a engendré la création du document.<br/>Nomenclature utilisée : TRE_A01-CadreExercice|
| idFiche | Identifiant unique d'une fiche d'un document.|
| dateCreationDocument | Représente la date et l'heure de la création du document.|
| niveauConfidentialite | Contient les informations définissant le niveau de confidentialité d'un document.<br/>Nomenclatures utilisées :<br/>** TRE_A08-Confidentiality-HL7<br/>** TRE_A07-StatusVisibiliteDocument<br/>** JDV_J08-XdsConfidentialityCode-CISIS|
| idUnique | Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.|
| statut | Représente le statut de la fiche d'un document.<br/>Nomenclature(s) associée(s) :<br/>** TRE_R269-AvailabilityStatusProvenanceOasis<br/>** TRE_R270-AvailabilityStatus
| dateFinActe | Date de fin de l’acte de référence, si connue. |
| formatDocument | Format technique détaillé du document.<br/>Nomenclatures utilisées :<br/> ** TRE_A06-FormatCodeComplementaire<br/> ** TRE_A09-DICOMuidRegistry<br/> ** TRE_A10-NomenclatureURN<br/> ** TRE_A11-IheFormatCode<br/> ** ASS_X11-CorresModeleCDA-XdsFormatCode-CISIS<br/> ** ASS_A12-CorresMediaTypeCDANonStructure-XdsFormatCode-CISIS|
| classeDocument| Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, ....).<br/>Jeu de valeurs issu de la nomenclature TRE_A03-ClasseDocument|
| auteur | Identifiant de la personne physique et/ou du dispositif auteur d'un document.|
| nomAuteurPersonnePhysique | Nom de la personne physique auteur du document.|
| prenomAuteurPersonnePhysique | Prénom de la personne physique auteur du document.|
| idFicheAssociation | Représente l'identifiant d'une association entre deux fiches.|
| actePathologie | Actes et pathologies en rapport avec le document.<br/>Nomenclatures utilisées :<br/>** CCAM pour les actes médicaux (OID=""1.2.250.1.213.2.5"");<br/>** CIM-10 pour les diagnostics de pathologie (OID=""2.16.840.1.113883.6.3"");<br/>** TRE_A00-ProducteurDocNonPS pour les documents d'expression personnelle du patient."|

Table 25 Flux de recherche


#### Flux 6 – ResultatRechercheDocument

La recherche retourne soit un ensemble de lots de soumission soit un ensemble de fiches répondant aux critères envoyés par le consommateur de documents de santé.

<object data="fonctionnel/fig_14.png" type="image/png"></object>
<br/>

Figure 14 Flux 6 - ResultatRechercheDocument

##### Classe "LotSoumission"
Un lot de soumission regroupe les fiches et les classeurs faisant partie d’une même demande de modification du contenu du dossier. Il atteste l’existence et le statut de la demande et est décrit par un ensemble d’attributs, ses métadonnées. Une fois créé, un lot de soumission est immuable à l'exception de son statut.

| **Nom** | **Description** |
| ----- | ----- |
| idLotSoumission : [0..*] Identifiant | Identifiant unique du lot de soumission. Cet attribut est destiné à des fins de gestion interne alors que idUnique est utilisé à des fins de références externes.|
| idUnique : [0..1] Identifiant | Identifiant unique global affecté à ce lot de soumission par son créateur. Cet attribut est utilisé à des fins de références externes alors que idLotSoumission est destiné à des fins de gestion interne.|
| idPatient : [0..1] Identifiant | Représente l'identifiant du patient.|
| idSource : [0..1] Identifiant | Représente l’identifiant unique global du système émetteur du lot de soumission.|
| auteur : [1..1] Identifiant | Représente les personnes physiques ou morales et/ou les dispositifs auteurs d’un lot de soumission. |
| dateSoumission : [1..1] DateHeure | Représente la date et heure de soumission. |
| typeActivite : [1..1] Code | Représente le type d’activité associé à l’événement clinique ayant abouti à la constitution du lot de soumission.<br/>Jeu de valeurs issu des nomenclatures:<br/> ** TRE_R209-TypeActivite<br/> ** TRE_R02-SecteurActivite |
| statut : [1..1] Code | Représente le statut du lot de soumission. <br/>Nomenclatures utilisées :<br/>**TRE_R269-AvailabilityStatusProvenanceOasis<br/>**TRE_R270-AvailabilityStatus |
| commentaire : [0..1] Texte | Contient le commentaire associé au lot de soumission.|
| statutAttributLotSoumission : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir un lot de soumission qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient. |
| titre : [0..1] Texte | Titre du lot de soumission |

Table 26 Attributs de la classe "LotSoumission"

##### Classe "Fiche"
Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents. 

| **Nom** | **Description** |
| ----- | ----- |
| idFiche : [0..*] Identifiant |Identifiant unique d'une fiche d'un document.|
| idUnique : [0..1] Identifiant | Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.|
| auteur : [1..*] Identifiant | Identifiant de la personne physique et/ou du dispositif auteur d'un document.|
| statut : [1..1] Code | Représente le statut de la fiche d'un document.<br/> Nomenclature(s) associée(s) :<br/>** TRE_R269-AvailabilityStatusProvenanceOasis<br/>** TRE_R270-AvailabilityStatus |
| classeDocument : [0..1] Code | Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, ....).<br/> Jeu de valeurs issu de la nomenclature TRE_A03-ClasseDocument|
| typeDocument : [0..1] Code | Représente le type du document.<br/> Jeu de valeurs issu des nomenclatures:<br/>** LOINC <br/>** et TRE_A05-TypeDocComplementaire |
| authentificateur : [1..1] Identifiant | Cet attribut représente l’acteur validant le document et prenant la responsabilité du contenu médical de celui-ci. Il peut s’agir de l’auteur du document si celui-ci est une personne et s’il endosse la responsabilité du contenu médical de ses documents. Si l’auteur est un dispositif, cet attribut doit représenter la personne responsable de l’action effectuée par le dispositif. Pour les documents d’expression personnelle du patient, cet attribut fait référence au patient.|
| dateCreationDocument : [1..1] DateHeure | Représente la date et l'heure de la création du document.
| niveauConfidentialite : [0..*] Code | Contient les informations définissant le niveau de confidentialité d'un document.<br/>Nomenclatures utilisées :<br/>** TRE_A08-Confidentiality-HL7<br/>** TRE_A07-StatusVisibiliteDocument<br/>** JDV_J08-XdsConfidentialityCode-CISIS|
| cadreExercice : [0..1] Code | Cadre d’exercice de l’acte qui a engendré la création du document. <br/>Nomenclature utilisée : TRE_A01-CadreExercice|
| idPatient : [0..1] Identifiant | Représente l'identifiant du patient.|
| secteurActivite : [0..1] Code | Secteur d'activité lié à la prise en charge de la personne, en lien avec le document produit.<br/>Nomenclature utilisée : TRE_R02-SecteurActivite|
| dateDebutActe : [0..1] DateHeure | Représente la période de début de l’acte de référence.|
| dateFinActe : [0..1] DateHeure | Date de fin de l’acte de référence, si connue.|
| idFicheAssociation : [0..*] Identifiant | Représente l'identifiant d'une association entre deux fiches.|
| association : [0..*] Code | Représente le type d'association entre deux fiches. <br/> Se référer aux spécifications techniques pour plus de détails sur la ou les nomenclatures utilisées.|
| commentaire : [0..1] Texte | Commentaire associé au document.|
| titreDocument : [0..1] Texte | Titre du document |
| langueDocument : [1..*] Code | Langue dans laquelle le document est rédigé, pour tous les documents produits par les systèmes initiateurs français, le codes est "fr-FR'.|
| formatDocument : [0..1] Code | Format technique détaillé du document.<br/>Nomenclatures utilisées :<br/>TRE_A06-FormatCodeComplementaire<br/>TRE_A09-DICOMuidRegistry<br/>TRE_A10-NomenclatureURN<br/>TRE_A11-IheFormatCode<br/>ASS_X11-CorresModeleCDA-XdsFormatCode-CISIS<br/>ASS_A12-CorresMediaTypeCDANonStructure-XdsFormatCode-CISIS|
| actePathologie : [0..1] Code | Actes et pathologies en rapport avec le document.<br/>Nomenclatures utilisées :<br/>** CCAM pour les actes médicaux (OID=""1.2.250.1.213.2.5"");<br/>** CIM-10 pour les diagnostics de pathologie (OID=""2.16.840.1.113883.6.3"");<br/>** TRE_A00-ProducteurDocNonPS pour les documents d'expression personnelle du patient."|
| version : [0..1] Numerique | Numéro de version de la fiche d’un document. La valeur de la métadonnée version est égale à 1 pour la première version de la fiche.|
| statutAttributFiche : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir une fiche qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient.|

Table 27 Attributs de la classe "Fiche"


#### Flux de recherche : Flux 7 – DemandeConsultationDocument
La demande de consultation de document se fait via l’envoi de l’identifiant unique du document, récupéré dans le résultat de recherche de documents, à la plateforme de partage de documents de santé

| **Nom** | **Description** |
| ----- | ----- |
| Fiche/idUnique | Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.|

Table 28 Flux de recherche
 
#### Flux 8 - ResultatDemandeConsultationDocument
 
<object data="fonctionnel/fig_15.png" type="image/png"></object>
<br/>
Figure 15 Flux 8 - ResultatDemandeConsultationDocument

##### Classe "Document"
Un document est la plus petite unité d'information déposée dans l’infrastructure de partage de documents. Une fois stocké dans l’infrastructure de partage de documents avec un identifiant unique, le document ne subit plus aucune modification.

| **Nom** | **Description** |
| ----- | ----- |
| contenuDocument : [1..1] ObjetBinaire | Contient le document au format binaire |

Table 29 Attributs de la classe "Document"
 
