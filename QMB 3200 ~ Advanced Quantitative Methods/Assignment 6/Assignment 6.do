*1
tabulate female supplement, summarize(days)
tabulate female supplement, summarize(cold)

*2a
*prtest cold==supplement
*2b
*prtest cold==supplement if female==0
*prtest cold==supplement if female==1
*2c
*prtest cold==female
*2d
*prtest cold==female if supplement==0
*prtest cold==female if supplement==1

*2a
prtest cold, by(supplement)
*2b
by female, sort : prtest cold == supplement
*2c
prtest cold, by(female)
*2d
by supplement, sort : prtest cold == female

*3a
ttest days if cold==1, by(supplement)
*3b
by female, sort : ttest days if cold==1, by(supplement)
*3c
ttest days if cold==1, by(female)
*3d
by supplement, sort : ttest days if cold==1, by(female)
