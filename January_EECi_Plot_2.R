# January_EECi_Plot_2.R
# 17/01/2022
#
# Lollipop Chart shoring pre-1930s and post-2000 detached homes' energy intensity.
# Includes shaded region to show +/- 1 SD.
# AP Neto-Bradley

# Load libraries
library(ggplot2)
library(ggtext)
library(tidyverse)


# Wrangle data for north-east

# Select posterior samples from north-east local authorities
nw_post <- E_Post %>% filter(LA %in% c("E08000016",
                                       "E08000032",
                                       "E08000033",
                                       "E07000163",
                                       "E08000017",
                                       "E06000011",
                                       "E07000164",
                                       "E07000165",
                                       "E06000010",
                                       "E08000034",
                                       "E08000035",
                                       "E06000012",
                                       "E06000013",
                                       "E07000166",
                                       "E08000018",
                                       "E07000167",
                                       "E07000168",
                                       "E07000169",
                                       "E08000019",
                                       "E08000036",
                                       "E06000014"
))

# Get information for lolly points (mean values by age)
nw_lolly <- nw_post %>% filter(group %in% c(17,20))  %>% group_by(LA, group) %>% summarise("Mean"=mean(E_POS))

nw_lollystick <- nw_lolly %>% filter(group %in% c(17,20))  %>% group_by(LA) %>% summarise("max"=max(Mean), "min"=min(Mean), "diff"=max(Mean)-min(Mean))

nw_low <- nw_lolly %>% filter(group %in% c(20))  %>% group_by(group) %>% summarise("max"=max(Mean), "min"=min(Mean), "sd"=sd(Mean), "mu" =mean(Mean))
nw_high <- nw_lolly %>% filter(group %in% c(17))  %>% group_by(group) %>% summarise("max"=max(Mean), "min"=min(Mean), "sd"=sd(Mean), "mu" =mean(Mean))


# Create base ggplot
jan2 <- ggplot() +  
  geom_vline(xintercept = nw_low$mu, linetype = "solid", size = 1, alpha = .8, color = met.brewer("Hiroshige",7)[c(6)])+
  #geom_vline(xintercept = nw_low$mu, linetype = "solid", size = 2*nw_low$sd, alpha = .1, color = met.brewer("Hiroshige",7)[c(5)])+
  geom_vline(xintercept = nw_high$mu, linetype = "solid", size = 1, alpha = .8, color = met.brewer("Hiroshige",7)[c(2)])+
  #geom_vline(xintercept = nw_high$mu, linetype = "solid", size = 2*nw_high$sd, alpha = .1, color = met.brewer("Hiroshige",7)[c(2)])+
  
  geom_segment(data = nw_lollystick,
                          aes(x = min, y =reorder(state_lookup[LA],diff),
                              yend = reorder(state_lookup[LA],diff), xend =max), #use the $ operator to fetch data from our "Females" tibble
                          color = met.brewer("Hiroshige",11)[5],
                          size = 4.5, #Note that I sized the segment to fit the points
                          alpha = .5) +
  
  geom_rect(aes(xmin = nw_low$mu-nw_low$sd, xmax = nw_low$mu+nw_low$sd,
                ymin = 0, ymax = 22), fill = met.brewer("Hiroshige",7)[c(5)], alpha = .1)+
  geom_rect(aes(xmin = nw_high$mu-nw_high$sd, xmax = nw_high$mu+nw_high$sd,
                ymin = 0, ymax = 22), fill = met.brewer("Hiroshige",7)[c(2)], alpha = .1)+
  
  
  
  geom_point(data=nw_lolly,aes(y = state_lookup[LA], x = Mean, color = as.factor(group)), size = 5, show.legend = TRUE)+

  #add annotations for mean and standard deviations
  geom_text(aes(x = nw_high$mu+1, y = 0.5), vjust=0, hjust=1,label = "Mean", angle = 270, size = 3, color = met.brewer("Hiroshige",4)[c(1)])+
  geom_text(aes(x = nw_high$mu+nw_high$sd-5, y = 0.5),vjust=0, hjust=1, label = "Standard Deviation", angle = 270, size = 3, color = met.brewer("Hiroshige",4)[c(1)])+  #coord_flip()+
  xlab(bquote('Energy Intensity ('~' kWh/'~m^2~'/year '*')'))+
  scale_color_manual(values=met.brewer("Hiroshige",7)[c(1,7)])+
  theme_minimal()  +
  theme(text = element_text(family = 'Montserrat', color = "black"),
        panel.grid.major.y = element_blank(),
        panel.grid.minor.y = element_blank(),
        panel.grid.major.x = element_blank(),
        panel.grid.minor.x = element_blank(),
        axis.title.y = element_blank(),
        legend.position = "none",
        axis.text.y = element_text(size=10, color="black"),
        axis.ticks.y = element_blank(),
        axis.ticks.x = element_line(),
        #strip.text.y.left  = element_text(angle = 0),
        panel.background = element_rect(fill = "white", color = "white"),
        strip.background = element_rect(fill = "white", color = "white"),
        #strip.text = element_text(color = "#4a4e4d", family = "Segoe UI"),
        plot.background = element_rect(fill = "white", color = "white"),
        #panel.spacing = unit(0, "lines"))
        plot.margin = margin(1,1,0.5,1, "cm")) 


# Add ggtext titles and caption with formatting
jan2+
#add subtitle and caption
labs(title = "Efficiency of new and old homes vary by where you live",
  subtitle = "Energy Intensity of <span style = 'color: #1E466E;'>**post-2000**</span> and <span style = 'color:#E76254;'>**pre-1930s**</span> semi-detached homes<br>",
     caption = "<br>Visualization: Andre Neto-Bradley  .  Data: Modelled based on EPC & NEED datasets")+
     
  #add theming for title, subtitle, caption
  theme(plot.caption = element_markdown(hjust = 1, vjust = 1, lineheight = 1),
        plot.subtitle = element_markdown(size = 12, hjust = -.06),
        plot.title = element_text(size = 16, hjust = -.11, face = "bold"))
