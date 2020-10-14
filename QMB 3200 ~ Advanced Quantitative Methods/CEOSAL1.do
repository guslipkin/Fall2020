cd "/Users/guslipkin/Documents/Fall2020/QMB 3200 ~ Advanced Quantitative Methods"
import CEOSAL.DTA
regress salary roe
scatter salary roe

gen sal = salary * 1000
