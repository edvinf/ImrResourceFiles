Description: Mapping between gear descriptions and fleet-descriptions requested in fisheries data calls to WGNSSK. The resource file was made as an example for how gears may be mapped for 2020 COD-, HAD- and POK-fisheries in the North Sea, but was improved before reports to intercatch was generated. The resource file is used by a custom script that generates reports based on logbook-annotated landings (https://github.com/Sea2Data/FDAtools/blob/master/stoxReca/reports/intercatchExport/interCatchExport.R).

Format: Tab separated table, with comments marked with '#'.
Column 'metier' is the fleet code requested by WGNSSK, gearcode is the NS9400 gear code used in landings and logbooks by the Norwegian Directorate of Fisheries. 'meshedGear' is a logical variable (T or F) indicating if the gear in 'gearcode' is to be considered a meshed gear 'lowerMeshSize' is the lower mesh size that should be included in the 'metier'. 'upperMeshSize' is the upper mesh size that should be included in the 'metier'

Who: Edvin Fuglebakk
