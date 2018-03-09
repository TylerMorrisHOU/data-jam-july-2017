library('ggplot2')
library('dplyr')

obs <- read.csv('tidy_merged4.csv')
pos <- read.csv('localized_pos.csv')

data <- merge(x = obs, y = pos, by.x = 'Sol', by.y = 'sol')
data <- data[grep('CC_BT', data$Target_Name, invert = TRUE),]

mars <- group_by(.data = data, Sol) %>% summarise(SiO2 = mean(Silicon_Oxide.SiO2.),
                                                  TiO2 = mean(Titanium_Oxide.TiO2.),
                                                  AI2O3 = mean(Aluminum_Oxide.AI2O3.),
                                                  FeOT = mean(Iron_Oxides_Total.FeOT.),
                                                  MgO = mean(Magnesium_Oxide.MgO.),
                                                  CaO = mean(Calcium_Oxide.CaO.),
                                                  Na2O = mean(Sodium_Oxide.Na2O.),
                                                  K2O = mean(Potassium_Oxide.K2O.),
                                                  northing = mean(northing),
                                                  easting = mean(easting))



qplot(mars$easting, mars$northing, color = mars$SiO2) + scale_color_gradient(low = 'black', high = 'red')
qplot(mars$easting, mars$northing, color = mars$TiO2) + scale_color_gradient(low = 'black', high = 'red')
qplot(mars$easting, mars$northing, color = mars$AI2O3) + scale_color_gradient(low = 'black', high = 'red')
qplot(mars$easting, mars$northing, color = mars$FeOT) + scale_color_gradient(low = 'black', high = 'red')
qplot(mars$easting, mars$northing, color = mars$MgO) + scale_color_gradient(low = 'black', high = 'red')
qplot(mars$easting, mars$northing, color = mars$CaO) + scale_color_gradient(low = 'black', high = 'red')
qplot(mars$easting, mars$northing, color = mars$Na2O) + scale_color_gradient(low = 'black', high = 'red')
qplot(mars$easting, mars$northing, color = mars$K2O) + scale_color_gradient(low = 'black', high = 'red')