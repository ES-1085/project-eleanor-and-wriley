
##Data Dictionary

##towerclean

`date` : Date of species observation in yyyy-mm-dd format
`species`: species or species group for observation. Including species are:
  - herg (Herring Gull)
  - gbbg (Great Black-backed Gull)
  - coei_ad (Common Eider (adult))
  - coei_ju (Common Eider (chick))
  - blgu (Black Guillemot)
  - puffin (Atlantic Puffin)
  - dcco (Double-crested Cormorant)
  - ternsp (arctic tern or common tern)
  - razo (razorbill)
  - lagu (laughing gull)
  - comu (Common Murre)
  - baea (Bald Eagle)
  - noga (Northern Gannet)
  - corvid (crow or raven (still has issues adding observations of both from the same day))
  - peepsp (species of sandpiper or other shorebird, often spotted sandpipers or willets)
  - seals (gray or harbor seals)
  - colo (Common Loon)
  - cago (Canada Goose)
  - porpoise (Harbor Porpoise)
  - raptor (non-eagle raptor, often peregrine falcon or turkey vulture)
  - gbhe (great blue heron)
  - scoter (Surf scoter or Black Scoter)
  - shearwater 
  - wisp (Wilson's Storm-Petrel)
  - lbbg (Little Black-backed gull)
  
  `count` : Number of individuals of that species seen on that day
  `notes`: notes preserved from that day's observations from the original data sheets
  `year` : year of observation in an easier format for faceting. 
  
##Updating the App

To update the datafile used in the app, replace the csv file in the data file with a new csv file in the exact same format. If new species are added to be detected, they will automatically be added to the species list used to generate checkboxes, but they won't automatically be labeled with their common name, so that name must be added to the case_when string. 

This app relies on unpublished and potentially sensitive data. Please be thoughtful before distributing this app. For more information, contact Eleanor Gnam (egnam23@coa.edu) or Wriley Hodge (whodge24@coa.edu).