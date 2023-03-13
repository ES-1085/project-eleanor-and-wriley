#Data Dictionary for datafiles used for our presentation

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
  
##gull_pop_distribution_2022

Data on gull nest distributions across the island up until 2022.

`YEAR` : year of survey
`East` : number of nests on the east side of the south end colony
`West`: number of nests on the east side of the south end colony
`Extension`: Number of nests in the northwest extension of the south end colony
`Point` : number of nests in the point stretch of the north end colony
`Cabin` : number of nests in the cabin stretch of the north end colony
`Hell` : number of the nests in the "hell" stretch of the north end colony
`Borofsky`: Number of nests in the Borofsky (northeast) colony
`Little Point` : Number of nests in the little point colony
`Total North`:  Total nests on the northwest side of the island
`Cabin + Hell` : Total nests in the cabin and hell stretches combined
`COA Property` : Total nests on COA's property (south end + boathouse)

  