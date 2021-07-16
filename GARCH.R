library(quantmod) 
library(dygraphs) 
library(tseries)
library(zoo)
library(forecast)
library(FinTS)
library(rugarch)
library(stats)
require(TTR) 
require(PerformanceAnalytics) 
require(downloader)
library(FinTS)
library(lmtest)
par(mfrow=c(1,1))

ticker <- c("SPY")
sector <- c("SP500")
symbols <- getSymbols('SPY',from='2018-02-01', to='2020-06-01')
SP500_prices <- do.call(merge, lapply(symbols, function(x) Cl(get(x)))) 
plot(SP500_prices)
acf=acf(SP500_prices$SPY.Close,main='ACF SPY',lag.max=20) 
pacf=pacf(SP500_prices$SPY.Close,main='PACF SPY',lag.max=20)
spyRetsClose <- na.omit(Return.calculate(Cl(SPY)) ,method=c('log'))
plot(spyRetsClose, main = "Compound Returns", xlab = "Date", ylab = "Return in percent") 
acf=acf(spyRetsClose,main='ACF SPY Returns',lag.max=20) 
pacf=pacf(spyRetsClose,main='PACF SPY Returns',lag.max=20)
h <- hist(spyRetsClose, breaks=100) xfit<-seq(min(spyRetsClose), max(spyRetsClose), length=90)

yfit<-dnorm(xfit, mean=mean(spyRetsClose, sd=sd(spyRetsClose))) 
yfit<-yfit*diff(h$mids[1:2]*length(spyRetsClose))
lines(xfit, yfit)
fit1 <- auto.arima(spyRetsClose, trace=TRUE, test="kpss", ic="bic") 
x<-arima(spyRetsClose, order = c(3, 0, 0),include.mean = FALSE) 
coeftest(x)
arima100 <- arima(spyRetsClose,c(1,0,0),include.mean = FALSE) 
arima200 <- arima(spyRetsClose,c(2,0,0),include.mean = FALSE) 
arima300 <- arima(spyRetsClose,c(3,0,0),include.mean = FALSE) 
MeanModel <-c('arima100','arima200','arima300')
AICValue <-c(arima100$aic,arima200$aic,arima300$aic) 
Table <-data.frame(MeanModel,AICValue) 
subset(Table,AICValue ==min(Table$AICValue)) 
head(ModeloMedia_TablaComparacion)

res.ar=x$residuals
plot(res.ar, main = "Residuals", xlab = "Date", ylab = "Return in percent") 
acf(res.ar,main='ACF Residuals',lag.max=20)
pacf(res.ar,main='PACF Residuals',lag.max=20)
res.ar2=res.ar^2
plot(res.ar2)
acf.res2=acf(res.ar2,main='ACF Squared Residuals',lag.max=20) 
pacf.res2=pacf(res.ar2,main='PACF Squared Residuals',lag.max=20)
Box.test(x$residuals^2,lag=12, type="Ljung-Box") 
ArchTest(residuals(x), lag=5)
garch11 <- garch(x$residuals,order=c(1,1),trace=TRUE) 
coeftest(garch11)
gjrGARCH_spec <- ugarchspec(mean.model = list(armaOrder = c(3,0)),variance.model = list(model = "gjrGARCH",variance.targeting = TRUE),distribution.model = "sstd")
gjrGARCH_fit <- ugarchfit(spec = gjrGARCH_spec, data = spyRetsClose) 
ctrl = list(tol = 1e-7, delta = 1e-9)
gjrGARCH_roll <- ugarchroll(gjrGARCH_spec, spyRetsClose, n.start = 120, refit.every = 1, refit.window = "moving", solver = "hybrid", calculate.VaR = TRUE, VaR.alpha = 0.01, keep.coef = TRUE, solver.control = ctrl, fit.control = list(scale = 1))
report(gjrGARCH_roll, type = "VaR", VaR.alpha = 0.01, conf.level = 0.99)

plot(gjrGARCH_fit)
gjrGARCH_fcst <- ugarchforecast(gjrGARCH_fit, n.ahead = 10)
plot(gjrGARCH_fcst)
garchroll = as.data.frame(gjrGARCH_roll)
getSymbols('^VIX',from='2018-02-01')
plot(VIX$VIX.Close)
garchPreds = xts(garchroll$Sigma * sqrt(252)*100, order.by=as.Date(rownames(garchroll))) 
diff = garchPreds - Cl(VIX)
ziv=getSymbols('ZIV',from='2018-02-01')
etf_ziv <- do.call(merge, lapply(ziv, function(x) Cl(get(x))))
plot(etf_ziv)
vxz=getSymbols('VXZ',from='2018-02-01')
etf_vxz <- do.call(merge, lapply(vxz, function(x) Cl(get(x))))
plot(etf_vxz)
zivRets = na.omit(Return.calculate(Cl(ZIV)) ,method=c('log'))
vxzRets = na.omit(Return.calculate(Cl(VXZ)) ,method=c('log'))
zivSig = diff < 0
vxzSig = diff > 0
garchOut = lag(zivSig, 2) * zivRets + lag(vxzSig, 2) * vxzRets
histSpy = runSD(spyRetsClose, n = 21, sample = FALSE) * sqrt(252) * 100
spyDiff = histSpy - Cl(VIX)
zivSig = spyDiff < 0
vxzSig = spyDiff > 0
spyOut = lag(zivSig, 2) * zivRets + lag(vxzSig, 2) * vxzRets
avg = (garchOut + spyOut)/2
compare = na.omit(cbind(garchOut, spyOut, avg))
colnames(compare) = c("gjrGARCH", "histVol", "avg")
stratStats <- function(rets) {
  stats <- rbind(table.AnnualizedReturns(rets), maxDrawdown(rets)) 
  stats[5,] <- stats[1,]/stats[4,] 
  stats[6,] <- stats[1,]/UlcerIndex(rets) 
  rownames(stats)[4] <- "Worst Drawdown"
  rownames(stats)[5] <- "Calmar Ratio"
  rownames(stats)[6] <- "Ulcer Performance Index"
  return(stats)
}
charts.PerformanceSummary(compare,colorset=rich6equal) 
table.DownsideRisk(compare,Rf=.03/12) stratStats(compare)
