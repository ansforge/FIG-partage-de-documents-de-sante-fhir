### Définition 

<object data="fonctionnel/fig_2.png" type="image/png"></object>
<br/>
Figure 2 : Processus collaboratif "Ajout d'un lot de documents"

| Service attendu | Le producteur de documents envoie au gestionnaire de partage de documents une demande d’ajout d’un lot de documents. Ces documents peuvent être de nouveaux documents et/ou des nouvelles versions de documents. |
| Pré- conditions | Le producteur de documents doit au préalable : 1. être en possession des documents à modifier, 2. être habilité |
| Post-conditions | N/A |
| Contraintes fonctionnelles | N/A |
| Scénario nominal | N/A |

Table 1 Caractéristiques du processus collaboratif


### Description et identification des flux

<object data="fonctionnel/fig_6.png" type="image/png"></object>
<br/>
Figure 6 : Processus collaboratif "Ajout d'un lot de documents"

#### Description des actions


| **Action** | **Description** |
| ------ | ------ |
| Préparer le ou les documents | Le producteur de documents rassemble les documents à ajouter et/ou à mettre à jour dans l'infrastructure de partage de documents. |
| Traiter la réponse | Le producteur de documents reçoit et traite le résultat de la demande d’ajout ou de mise à jour de documents. Il peut afficher à l’utilisateur le résultat de la demande. |
| Traiter la demande d'ajout ou de remplacement d'un document | L'infrastructure de partage de documents traite la demande d’ajout ou de mise à jour, exécute les actions nécessaires au traitement de ces demandes et retourne le résultat du traitement. |

Table 6 Tableau des actions


#### Identification des flux


| **Flux** | **Processus** | **Emetteur** | **Récepteur** | **Périmètre** |
| Flux 1 - AjoutLotDocument | Ajout d'un lot de documents | Producteur de documents |Gestionnaire de partage de documents | Oui |
| Flux 2 - ResultatAjoutLotDocument | Ajout d'un lot de documents | Gestionnaire de partage de documents | Producteur de documents | Oui |


### Flux 1 - AjoutLotDocument MODELISATION DES FLUX D'INFORMATIONS

<object data="fonctionnel/fig_10.png" type="image/png"></object>
<br/>

Figure 10 Flux 1 - AjoutLotDocument

#### Classe "Document"

Un document est la plus petite unité d'information déposée dans l’infrastructure de partage de documents. Une fois stocké dans l’infrastructure de partage de documents avec un identifiant unique, le document ne subit plus aucune modification.

| **Nom** | **Description** |
| ----- | ----- |
| contenuDocument : [1..1] ObjetBinaire | Contient le document au format binaire |

Table 16 Attributs de la classe "Document"

#### Classe "Fiche"
Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents. 

| **Nom** | **Description** |
| ----- | ----- |
| idFiche : [0..*] Identifiant | Identifiant unique d'une fiche d'un document. |
| idUnique : [0..1] Identifiant	| Identifiant unique global affecté au document par son créateur. Il est utilisable comme référence externe dans d’autres documents.|
| auteur : [1..*] Identifiant | Identifiant de la personne physique et/ou du dispositif auteur d'un document.|
| statut : [1..1] Code | Représente le statut de la fiche d'un document.<br/>Nomenclature(s) associée(s) :<br/>** TRE_R269-AvailabilityStatusProvenanceOasis<br/>** TRE_R270-AvailabilityStatus |
| classeDocument : [0..1] Code | Représente la classe du document (compte rendu, imagerie médicale, traitement, certificat, ....). <br/> Jeu de valeurs issu de la nomenclature TRE_A03-ClasseDocument |
| typeDocument : [0..1] Code | Représente le type du document.<br/> Jeu de valeurs issu des nomenclatures:<br/>** LOINC<br/>** et TRE_A05-TypeDocComplementaire |
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

#### Classe "Classeur"

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

#### Classe "LotSoumission"
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


### Flux 2 - ResultatAjoutLotDocument MODELISATION DES FLUX D’INFORMATIONS

<object data="fonctionnel/fig_11.png" type="image/png"></object>
<br/>
Figure 11 Flux 2 - ResultatAjoutLotDocument

#### Classe "LotSoumission"
Un lot de soumission regroupe les fiches et les classeurs faisant partie d’une même demande de modification du contenu du dossier. Il atteste l’existence et le statut de la demande et est décrit par un ensemble d’attributs, ses métadonnées. Une fois créé, un lot de soumission est immuable à l'exception de son statut.

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributLotSoumission : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir un lot de soumission qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient. |

Table 20 Attributs de la classe "LotSoumission"

#### Classe "Classeur"

Un assemblage de fiches regroupées par catégorie.

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributClasseur : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir un lot de soumission qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient. |

Table 21 Attributs de la classe "Classeur"

#### Classe "Fiche"

Une fiche représente le document stocké dans l’infrastructure de partage de documents. Elle contient les informations décrivant les caractéristiques principales d’un document servant au classement et à la recherche des documents. 

| **Nom** | **Description** |
| ----- | ----- |
| statutAttributFiche : [0..*] Texte | La réponse de la demande de modification du dossier patient peut contenir une fiche qui contient le statut (réussite ou échec) de chaque attribut renseigné lors de la demande de modification du dossier patient. |

Table 22 Attributs de la classe "Fiche"

