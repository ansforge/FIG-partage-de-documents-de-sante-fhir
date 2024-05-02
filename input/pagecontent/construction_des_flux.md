La construction des flux reprend le profil MHD. Ces flux représentent des interactions avec le gestionaire de documents, dont la construction est détaillée dans des pages dédiées à chaque objectif :

### Ajout d'un lot de documents
<div align="center">
<object data="PDSm-flux1_2.jpg" type="image/jpg"></object>
</div>
<br/>

* Le flux 01 d’ajout d’un lot de documents sera assuré par l’interaction « transaction » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP POST.
* Le flux 02 de résultat de la demande d’ajout d’un lot de documents sera assuré par la réponse à la requête HTTP POST.

Les flux 01 et 02 correspondent à la transaction IHE "Provide Document Bundle [ITI-65]". 
La documentation complète est accessible <a href="st_ajout.html">ici</a>


### Mise à jour de documents

<div align="center">
<object data="PDSm-flux3_4.png" type="image/png"></object>
</div>
<br/>

* Le flux 03 de demande de mise à jour des métadonnées de la fiche sera assuré par l’interaction « patch » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP PATCH et le « conditional patch » afin d’effectuer la demande via l’identifiant métier.
* Le flux 04 résultat de la demande de mise à jour des métadonnées de la fiche.

Les flux 03 et 04 se situent hors du périmètre du profil MHD.
La documentation complète est accessible <a href="st_maj.html">ici</a>

### Recherche de lot de documents

<div align="center">
<object data="PDSm-flux5_6.png" type="image/png"></object>
</div>
<br/>

* Le flux 05 de recherche de documents sera assuré par l’interaction « search » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP GET et HTTP POST. On recherche ici un lot de soumission (ressource List).
* Le flux 06 résultat de la recherche de documents sera assuré par la réponse à la requête HTTP.

La recherche de lots de soumission correspond à la transaction IHE "Find Document Lists [ITI-66]".
La documentation complète est accessible <a href="st_recherche_lot.html">ici</a>

### Recherche de fiche

* Le flux 05 de recherche de documents sera assuré par l’interaction « search » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP GET et HTTP POST. On recherche ici une fiche d’un document (ressource DocumentReference).
* Le flux 06 résultat de la recherche de documents sera assuré par la réponse à la requête HTTP.

La recherche de fiches correspond à la transaction IHE "Find Document References [ITI-67]".
La documentation complète est accessible <a href="st_recherche_fiche.html">ici</a>

### Consultation de documents
<div align="center">
<object data="PDSm-flux7_8.png" type="image/png"></object>
</div>
<br/>

* Le flux 07 de demande de consultation de documents repose sur l’interaction « read » de FHIR. Le gestionnaire de partage de documents doit supporter les requêtes HTTP GET.
* Le flux 08 résultat de la demande de consultation de documents sera assuré par la réponse à la requête HTTP GET.
            
Les flux 07 et 08 correspondent aux transactions IHE "Retrieve Document [ITI-68]".
La documentation complète est accessible <a href="st_consultation.html">ici</a>


### Ajout simplifié de document
<div align="center">
<object data="PDSm-flux9_10.png" type="image/png"></object>
</div>
<br/>

* Le flux 09 d’ajout d’un document de manière simplifiée repose sur l'interaction « create » de FHIR. 
* Le flux 10 de résultat de la demande d’ajout simplifié d'un document sera assuré par la réponse à la requête HTTP POST.

La documentation complète est accessible <a href="st_ajout_simplifie.html">ici</a>