library(psych)
library(GPArotation)
library(npmv)

details.par <- fa.parallel(details, fa = "both",
                           n.iter = 100)

details.pc <- principal(details, nfactors = 5, 
                        rotate = "varimax", scores = TRUE)
details.promax <- fa(details, nfactors = 7,
                     fm = "ml", score = TRUE)

# Значимость межгрупповых различий
kruskal.test(pc1 ~ gender, survey.data)

# Выявление достоверно различающихся групп
details.gender <- nonpartest(pc2 | pc5 ~ as.character(gender),
                             survey.data, permtest = TRUE,
                             permreps = 1000, plots = FALSE)
details.gender$twogroupreleffects
# details.device$releffects (если больше двух групп)

