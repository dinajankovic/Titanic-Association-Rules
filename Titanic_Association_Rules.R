install.packages("arules")
library(arules)

any(is.na(titanic.raw))
apply(titanic.raw, 2, typeof)



install.packages("ggplot2")
library(ggplot2)

attach(titanic.raw)


ggplot(data=titanic.raw, aes(x=factor(Sex))) +
  geom_bar(stat="count", color="blue", fill="indianred") +
  theme_dark()

ggplot(data=titanic.raw, aes(x=factor(Age))) +
  geom_bar(stat="count", color="blue", fill="indianred") +
  theme_dark()

ggplot(data=titanic.raw, aes(x=factor(Class))) +
  geom_bar(stat="count", color="blue", fill="indianred") +
  theme_dark()

ggplot(data=titanic.raw, aes(x=factor(Survived))) +
  geom_bar(stat="count", color="blue", fill="indianred") +
  theme_dark()

titanic2 = titanic.raw
apply(titanic2, 2, factor)
rules = apriori(titanic2, parameter = list(support = 0.01, conf = 0.7))
rules = sort(rules, by = 'confidence', decreasing = TRUE)

rules2 = apriori(titanic2, parameter=list(supp=0.1,conf = 0.7),
               appearance = list(default="lhs",rhs="Survived=No"),
               control = list(verbose=F))
rules2 = sort(rules2, by='lift', decreasing = TRUE)
inspect(rules2)

plot(rules[1:10], method = "graph")
