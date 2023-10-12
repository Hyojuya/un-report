library(tidyverse)

#The next line reads in the gapminder_1997.csvfile
gapminder_1997 <- read_csv(file="gapminder_1997.csv")
read.csv()
Sys.Date() #prints the data and time
getwd() #prints the current working directory
sum(5,6)

?round
round(3.553,2)

#Which of these lines gives you an output of 3.55? A: A and C
#A
round(x=3.553)
#B
round(x=3.553, digits=2)
#C
round(digits=2, x=3.553)
#D
round(2, 3.553)



result<-2+2
result

name<-"Hyoju"
name

number1<-3
number1

read_csv(
  file,
  col_names = TRUE,
  col_types = NULL,
  col_select = NULL,
  id = NULL,
  locale = default_locale(),
  na = c("", "NA"),
  quoted_na = TRUE,
  quote = "\"",
  comment = "",
  trim_ws = TRUE,
  skip = 0,
  n_max = Inf,
  guess_max = min(1000, n_max),
  name_repair = "unique",
  num_threads = readr_threads(),
  progress = show_progress(),
  show_col_types = should_show_types(),
  skip_empty_rows = TRUE,
  lazy = should_read_lazy()
)

##############################Plotting##########################################
ggplot(data=gapminder_1997) + #plot generating
  aes(x = gdpPercap, y = lifeExp, 
      color = continent,size = pop/1000000 ) + #read and make plot x axis
  labs(x = "GDP Per Capita",
       title = "Do people in wealthy countries live longer?",
       size = "Population (in million)")+
  geom_point()+
  scale_color_brewer(palette = "Set2") 
#YOU CAN USE OTHER COLOR PALETTE CODE FROM GOOGLE































  


