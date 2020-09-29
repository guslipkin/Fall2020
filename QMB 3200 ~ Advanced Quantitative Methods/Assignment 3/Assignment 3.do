capture log close
log using gus_lipkin_Assignment_3, replace
import delimited "/Users/guslipkin/Documents/Fall2020/QMB 3200 ~ Advanced Quantitative Methods/Assignment 3/FloridaCountyData.csv"
clear all

* Main assignment

* Problem 1
summarize

* Problem 2
graph box rw
graph box pci
graph box pop
graph box wden
graph box sh65up
graph box shlh

hist rw
hist pci
hist pop
hist wden
hist sh65up
hist shlh

* Problem 3
summarize [aw=pop]

* Problem 4
gen lnPOP = ln(pop)
gen lnWDEN = ln(wden)
gen lnPCI = ln(pci)
gen lnRW = ln(rw)

* Problem 5
cor lnRW lnPCI lnPOP lnWDEN sh65up shlh

* Problem 6
scatter lnRW lnPCI
scatter lnRW lnPOP
scatter lnRW lnWDEN
scatter lnRW sh65up
scatter lnRW shlh

* Extra Credit a
scatter lnRW lnPCI [w=pop], msymbol(circle_hollow)
scatter lnRW lnPOP
scatter lnRW lnWDEN [w=pop], msymbol(circle_hollow)
scatter lnRW sh65up [w=pop], msymbol(circle_hollow)
scatter lnRW shlh [w=pop], msymbol(circle_hollow)

* Extra Credit b
scatter lnRW lnPCI [w=pop], msymbol(circle_hollow) title("Wage ratio vs Per capita income weighted by population")
scatter lnRW lnPOP, title("Wage ratio vs Population of adults")
scatter lnRW lnWDEN [w=pop], msymbol(circle_hollow) title("Wage ratio vs Weighted population density weighted by pop")
scatter lnRW sh65up [w=pop], msymbol(circle_hollow) title("Wage ratio vs Share of 65+ adults weighted by population")
scatter lnRW shlh [w=pop], msymbol(circle_hollow) title("Wage ratio vs Hospitality employment weighted by population")

* Extra Credit c
scatter rw pci [w=pop], msymbol(circle_hollow) title("Wage ratio vs Per capita income weighted by population") xscale(log) yscale(log)
scatter rw pop, msymbol(circle_hollow) title("Wage ratio vs Population of adults") xscale(log) yscale(log)
scatter rw wden [w=pop], msymbol(circle_hollow) title("Wage ratio vs Weighted population density weighted by pop") xscale(log) yscale(log)
scatter rw sh65up [w=pop], msymbol(circle_hollow) title("Wage ratio vs Share of 65+ adults weighted by population") xscale(log) yscale(log)
scatter rw shlh [w=pop], msymbol(circle_hollow) title("Wage ratio vs Hospitality employment weighted by population") xscale(log) yscale(log)

* Extra Credit d
gen shortCounty = substr(county, 1, 4)
scatter rw pci [w=pop], msymbol(circle_hollow) title("Wage ratio vs Per capita income") xscale(log) yscale(log) mlabel(shortCounty)
scatter rw pop, title("Wage ratio vs Population of adults") xscale(log) yscale(log) mlabel(shortCounty)
scatter rw wden [w=pop], msymbol(circle_hollow) title("Wage ratio vs Weighted population density") xscale(log) yscale(log) mlabel(shortCounty)
scatter rw sh65up [w=pop], msymbol(circle_hollow) title("Wage ratio vs Share of 65+ adults") xscale(log) yscale(log) mlabel(shortCounty)
scatter rw shlh [w=pop], msymbol(circle_hollow) title("Wage ratio vs Hospitality employment") xscale(log) yscale(log) mlabel(shortCounty)

* Extra Credit e
graph matrix pop wden, title("Matrix comparing POP and WDEN")
graph matrix rw shlh, title("Matrix comparing RW and SHLH")
graph matrix pci wden rw, title("Matrix comparing PCI, WDEN, and RW")

log close
