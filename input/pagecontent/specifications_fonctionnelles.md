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



#### Liste des acteurs pour l'ensemble des processus

| **Acteur** | **Description** |
| ------ | ------ |
| Consommateur de documents | Il s’agit d’un système d’information ou d’un composant de système d’information qui recherche des documents selon certains critères, et qui peut consulter les documents qui l’intéressent.<br />Exemples de systèmes :<br /> -Logiciel de Professionnel de Santé (LPS)<br /> -Logiciel Patient (LPA) |
| Gestionnaire de partage de documents | Il s’agit d’un système d’information ou d’un composant d'un système d’information qui stocke, classe et archive les documents d’un dossier patient.<br /> Exemple de système : <br /> -Infrastructure du DMP |
| Producteur de documents | Il s’agit d’un système d’information ou d’un composant de système d’information qui envoie au gestionnaire de partage de documents une demande d’ajout de nouveaux documents et/ou des nouvelles versions de documents. Ce système fournit également les modifications des métadonnées du document. <br /> Exemples de systèmes :<br /> - Logiciel de Professionnel de Santé (LPS)<br /> - Logiciel Patient (LPA) |


Table 5 Table des acteurs

### DESCRIPTION DES PROCESSUS COLLABORATIFS ET IDENTIFICATION DES FLUX



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



 



