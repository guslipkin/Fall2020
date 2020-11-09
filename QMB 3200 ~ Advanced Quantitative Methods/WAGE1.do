regress wage educ
* every year of education increases the wage by 54 cents

gen logWage = log(wage)
regress logWage educ
* every year of education increases the wage by 8%

hist wage, frequency normal
* not normal, right skewed
hist logWage, frequency normal
* more or less normal
