capture log close
log using gus_lipkin_Assignment_3, replace
import delimited "/Users/guslipkin/Documents/Fall2020/QMB 3200 ~ Advanced Quantitative Methods/FloridaCountyData.csv"
clear all

summarize

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

summarize [aw=pop]

gen lnPOP = ln(pop)
gen lnWDEN = ln(wden)
gen lnPCI = ln(pci)
gen lnRW = ln(rw)

cor lnRW lnPCI lnPOP lnWDEN sh65up shlh

scatter lnRW lnPCI
scatter lnRW lnPOP
scatter lnRW lnWDEN
scatter lnRW sh65up
scatter lnRW shlh

scatter lnRW lnPCI [w=pop], msymbol(circle_hollow)
scatter lnRW lnPOP
scatter lnRW lnWDEN [w=pop], msymbol(circle_hollow)
scatter lnRW sh65up [w=pop], msymbol(circle_hollow)
scatter lnRW shlh [w=pop], msymbol(circle_hollow)

scatter lnRW lnPCI [w=pop], msymbol(circle_hollow) title("Wage ratio vs Per capita income weighted by population")
scatter lnRW lnPOP, title("Wage ratio vs Population of adults")
scatter lnRW lnWDEN [w=pop], msymbol(circle_hollow) title("Wage ratio vs Weighted population density weighted by pop")
scatter lnRW sh65up [w=pop], msymbol(circle_hollow) title("Wage ratio vs Share of 65+ adults weighted by population")
scatter lnRW shlh [w=pop], msymbol(circle_hollow) title("Wage ratio vs Hospitality employment weighted by population")

scatter rw pci [w=pop], msymbol(circle_hollow) title("Wage ratio vs Per capita income weighted by population") xscale(log) yscale(log)
scatter rw pop, msymbol(circle_hollow) title("Wage ratio vs Population of adults") xscale(log) yscale(log)
scatter rw wden [w=pop], msymbol(circle_hollow) title("Wage ratio vs Weighted population density weighted by pop") xscale(log) yscale(log)
scatter rw sh65up [w=pop], msymbol(circle_hollow) title("Wage ratio vs Share of 65+ adults weighted by population") xscale(log) yscale(log)
scatter rw shlh [w=pop], msymbol(circle_hollow) title("Wage ratio vs Hospitality employment weighted by population") xscale(log) yscale(log)

gen shortCounty = substr(county, 1, 4)
scatter rw pci [w=pop], msymbol(circle_hollow) title("Wage ratio vs Per capita income") xscale(log) yscale(log) mlabel(shortCounty)
scatter rw pop, title("Wage ratio vs Population of adults") xscale(log) yscale(log) mlabel(shortCounty)
scatter rw wden [w=pop], msymbol(circle_hollow) title("Wage ratio vs Weighted population density") xscale(log) yscale(log) mlabel(shortCounty)
scatter rw sh65up [w=pop], msymbol(circle_hollow) title("Wage ratio vs Share of 65+ adults") xscale(log) yscale(log) mlabel(shortCounty)
scatter rw shlh [w=pop], msymbol(circle_hollow) title("Wage ratio vs Hospitality employment") xscale(log) yscale(log) mlabel(shortCounty)

graph matrix rw shlh, title("Matrix comparing RW and SHLH")
graph matrix pci wden rw, title("Matrix comparing PCI, WDEN, and RW")

log close
