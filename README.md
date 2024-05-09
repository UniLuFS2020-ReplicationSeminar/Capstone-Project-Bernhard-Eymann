# Capstone-Project-Bernhard-Eymann

## Project Description
This project is part of the Data Mining with R course of University of Lucerne in the spring semester 2024. My goals are: 
- realize a full data analysis flow (scrape -> preprocess -> analyze -> report)
- using R and RStudio und github
- using the open data API of the canton Basel-Stadt

## Background
I am currently a legal clerk working at the canton and I am also part of the broad digitalization initiative of the canton Basel-Stadt. I am interested in the expectations of the citizens of Basel-Stadt regarding the digitalization of the canton. I would like to know, whether legislation in the canton is en accord with the expectations of the citizens regarding digitization.

## Hypotheses
My two hypotheses are:
- Citizens of the canton expect a progress of digitization in the canton.
- The legislation on digitization reflects a progress of digitization in the canton.

## Data
I will use the following data sources:
- Dataset of a public query on the digitization of the canton
  https://data.bs.ch/explore/dataset/100083/table/?disjunctive.altersgruppe&disjunctive.partei&disjunctive.bildung&sort=bast7_3&dataChart=eyJxdWVyaWVzIjpbeyJjaGFydHMiOlt7InR5cGUiOiJjb2x1bW4iLCJmdW5jIjoiQ09VTlQiLCJ5QXhpcyI6Imdld2RlZiIsInNjaWVudGlmaWNEaXNwbGF5Ijp0cnVlLCJjb2xvciI6InJhbmdlLVBhaXJlZCIsInBvc2l0aW9uIjoiY2VudGVyIn1dLCJ4QXhpcyI6ImJhc3QzIiwibWF4cG9pbnRzIjpudWxsLCJzb3J0IjoiIiwic2VyaWVzQnJlYWtkb3duIjoiYmFzdDdfMyIsInNlcmllc0JyZWFrZG93blRpbWVzY2FsZSI6IiIsInN0YWNrZWQiOiJwZXJjZW50IiwiY29uZmlnIjp7ImRhdGFzZXQiOiIxMDAwODMiLCJvcHRpb25zIjp7ImRpc2p1bmN0aXZlLmFsdGVyc2dydXBwZSI6dHJ1ZSwiZGlzanVuY3RpdmUucGFydGVpIjp0cnVlLCJkaXNqdW5jdGl2ZS5iaWxkdW5nIjp0cnVlfX19XSwidGltZXNjYWxlIjoiIiwiZGlzcGxheUxlZ2VuZCI6dHJ1ZSwiYWxpZ25Nb250aCI6dHJ1ZX0%3D
- Dataset of the complete legislative project of the parliament in Basel-Stadt
https://data.bs.ch/explore/dataset/100311/api/?disjunctive.signatur_ges&disjunctive.status_ges&disjunctive.departement_ges&disjunctive.ga_rr_gr&disjunctive.anrede_urheber&disjunctive.gremientyp_urheber&disjunctive.name_vorname_urheber&disjunctive.partei_kname_urheber&disjunctive.nr_urheber&disjunctive.anrede_miturheber&disjunctive.gremientyp_miturheber&disjunctive.name_vorname_miturheber&disjunctive.partei_kname_miturheber&disjunctive.nr_miturheber