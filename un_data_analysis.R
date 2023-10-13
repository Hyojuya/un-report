#Download package----------------------------------------------------
library(tidyverse)

gapminder_data<-read_csv("data/gapminder_data.csv")

#Summarize--------------------------------------------------------
summarize(gapminder_data,averageLifeExp = mean(lifeExp))


#Pipe operator----------------------------------------------------
#ctrl/-shift-m for pipe operator
#MORE CONCISE CODE
gapminder_data_sumarized<-gapminder_data %>% 
  summarize(averageLifeExp=mean(lifeExp))
  
gapminder_data_sumarized*2

#what is the mean life expectancy for the most recent year

gapminder_data |> 
  summarize(recent_year=max(year))

#what is the max year?

#Filter----------------------------------------------------------
#get max year in filter()
gapminder_data|> 
  filter(year == 2007) |> 
  summarize(avaerage=mean(lifeExp))

#what is the earliest year in the dateset?
gapminder_data |>
  summarize(first_year=min(year))
#summarize average GDP for the earliest year in the dataset
gapminder_data |> 
  filter(year==1952) |> 
  summarize(averave_GDP = mean(gdpPercap))

#Grouping--------------------------------------------------------
#What is the mean life expectancy for each year

gapminder_data |> 
  group_by(year) |> 
  summarize(average=mean(lifeExp))

#What is the mean life expectancy for each continent

gapminder_data |> 
  group_by(continent) |> 
  summarize(avearage_continent=mean(lifeExp))

gapminder_data |> 
  group_by(year, continent) |> 
  summarize(average=mean(lifeExp))

#What is the mean life expectancy AND mean GDP per capita for each continent

gapminder_data |> 
  group_by(continent) |> 
  summarize(
    avg_life_exp=mean(lifeExp), 
    avg_GDP=mean(gdpPercap)
    )

#Mutate-------------------------------------------------------------------------
gapminder_data |> 
  mutate(double_year=year*2, .before=pop)

#what is the GDP (ot per capita)?
#by multiplying pop*gdpPercap

gapminder_data |> 
  mutate(GDP=pop*gdpPercap)

#Make a new column for population in millions
gapminder_data |> 
  mutate(popInMillions=pop/1000000, .before=continent) |> 
  mutate(GDP=pop*gdpPercap)

#glimse rotates the view so it will fit in the consle better
glimse()

mysummary<-gapminder_data |> 
  group_by(country) |> 
  filter(continent=="Asia") |>
  mutate(gdp=pop*gdpPercap) |> 
  summarize(meanGDP=mean(gdp))
  
mysummary<-mysummary |> 
  mutate(meanGDPInMillions=meanGDP/1000000)

#Do not in one tibble
#assign(write) to new tibble object (overwrite)

#Select------------------------------------------------------------------

#select(): choose a subset of columns form a dataset

gapminder_data |> 
  select(pop, year)

gapminder_data |> 
  select(-continent)

#create a tibble with only country, continent, year, lifeExp
gapminder_data |> 
  select(country, continent, year, lifeExp)

gapminder_data |> 
  distinct(continent)
gapminder_data |> 
  count(continent)

#select helper function: start_with() 
#for rows, back to filter
gapminder_data |> 
  select(year, starts_with("C"))

#select coulmns with names dending in "p" 
#using ends_with()

gapminder_data |> 
  select(year, ends_with("p"))

#Reshaping----------------------------------------------------------------
gapminder_data |> 
  select(country, continent, year, lifeExp)

#pivot_wider()

gapminder_data |> 
  select(country, continent, year, lifeExp) |> 
  pivot_wider(names_from = year, 
              values_from =lifeExp,
              names_prefix = "yr")


#Joins-------------------------------------------------------------------

co2_data<- read_csv("data/co2-un-data.csv", skip=1) |> 
  rename(country='...2', year=Year)

joined<-left_join(gapminder_data, co2_data, 
                by=c("country","year"))





#Vector-------------------------------------------------------------------













