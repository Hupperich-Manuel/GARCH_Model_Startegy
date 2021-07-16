# GARCH_Model_Startegy
This code returns the performance of a statistical GARCH model trading strategy

## 1. INTRODUCTION

To properly introduce this work, I have to mention one of my life references, Nassim Taleb’s point of view about financial markets, basically, if you think that you can handle it or even predict it, you have lost. The Gaussian bell curve, represented by a normal distribution, does not consider the events in Extremistan1, and this is the main and most mistaken assumption in the financial environment. When it comes to portfolio hedging this misinterpretation takes with it a lot of risk and could end up with high capital losses. There are numerous theories which imply this assumption, a good example could be the Nobel Prize winner William Forsyth Sharpe (1990). Together with other economists, they developed a ratio where he made use of the Gaussian curve to predict the future volatility of a certain series (a risk-return ratio, which worked on the same basis, got included in Markowitz’s Modern Portfolio Theory 1952). Unfortunately, by the time of 2007 any portfolio model based on this ratio failed because of the appearance of an unpredictable event, a Black Swan2. Even by considering this event as “predictable”, as the default risk could have been identified through a rational way (turning the Black Swan into a Grey Swan), no ratio did foresee that.

Another false assumption is done trying to estimate the Value at Risk through a Monte Carlo generator, where the series are considered to be normally distributed, and it returns the lowest possible price value that the series can reach in a certain time window. But it is a huge mistake to assume the returns are normally distributed, as it implies that the rare events can be estimated. A perfect bell curve does not exist in this environment.
As hypocrite as it sounds, this work would not be the optimal solution for Mr. Taleb, since we are going to forecast a future outcome basing ourselves on a past event, same as our Nobel Prize counterparts. But, the complex models studied in this work, consider a conditional volatility and conditional returns, which has shown to make certain sense. Periods with high participation and radical movements in the financial markets are followed by similar periods, and vice versa. This is quite reasonable if you remember high volatility in the markets have been historically relevant, mostly in the way of downturns. Furthermore, we erase the assumption of a normal standard distribution, proving so our lower ignorance. So, as having mitigated these misperceptions we are able to take advantage of the results to even hedge your portfolio, or even taking advantage of the radical market volatility to earn considerable returns in the form of a trading strategy.

The inspiration I got to get here is basically thanks to my track record. During the past 6 years I have gotten deeply involved with the financial markets. I started in this system focusing merely on trading (speculating) the forex market, it allowed me to study most of the technical analysis strategies which are based on statistical probabilities. As I got further in my bachelor degree, I started to course: Statistics, Forecasting Methods and Econometrics, which gave me a quick view about the fundamentals of the statistical environment.
Having red several books from Nassim Nicholas Taleb and other professionals I realized the great profitability that the statistical models could generate inside of a trading strategy and how false statistical/logical assumptions have harmed firms, funds, governments and individuals. Later on, I became aware of the importance of software in order to manage much more information to get more accurate results leading so to higher profits through a trading system. That is why I started to tech myself, with several resources, the so complex coding languages (for this work I needed to learn a whole coding language from zero).

This work focuses on the usage of the conditional variance models on a financial time series, where it is very common to observe that this variable suffers significant changes over a time frame. The models used, known as ARCH and GARCH (Autoregressive and General Autoregressive Conditional Heteroscedasticity Models), are able to pick up the unstable error term, which results from the conditional mean estimation (ARIMA), leading so to a correct adjustment of the time series.

With the outcomes acquired from the R code, we will enable to extrapolate the information obtained from the model and implement it into a functioning investment system. This strategy will have its core point in buying or selling mid-term volatility ETNs, through the accomplishment of stated conditions of our studied heteroscedasticity models.

The main message to be transmitted through the whole work is to show the importance of a volatility hedger in any kind of investment purpose, since it is the principal driver of huge losses of investment funds, traders and individual investors. Additionally, I want to raise awareness about the inability to forecast the financial markets, and that it relies on a logical mind to consider the numerous risks.

## 2. GARCH MODEL AND ITS TAKEAWAYS
### 2.1 The ARCH and GARCH Models
_2.1.1. How the Heteroscedasticity variance works, and how such models can be implemented in the time series modelling_

Let’s start with a brief introduction to understand how the heteroscedasticity variance works, and how can we implement such models on a time series.

Most of the financial time series, as shares, interest rates, exchange rates have certain characteristics in common, which are not considered by the conventional classical lineal models such as AR or ARMA.

One of the main watermarks of these series is the conditional heteroscedasticity, that means, a conditional variance which varies through the series. To get rid of these problems the Autoregressive Conditional Heteroscedasticity Models where created.

The ARCH Model dates back to Engel (1982), where the conditional variance can be explained by the standardized squared errors. Bollerslev (1989) works with the GARCH Model.
The GARCH Model from Bollerslev (1986), which explains the conditional variance through the squared errors and the past conditional variances.

Later on, models such as EGARCH, TGARCH, IGARCH, GJRGARCH were derived from these two.

## 2.2. ARCH(q): Definition and Properties
_2.2.1. Properties of the ARCH(q)_
The Autoregressive Conditional Heteroscedasticity Models help us to model financial time series, as the returns on a financial asset.

The returns on a financial asset can be formulated as follows:

![image](https://user-images.githubusercontent.com/67901472/125917890-91545b65-3754-4eff-b234-d2694728ac24.png)

The core ARCH formula, which allows us to predict future returns is:
𝜀" is the process of White noise formed by random variables normally distributed with mean=0 and variance =1 and 𝜎" is the volatility factor, both are stationary processes and independent beyond them.
The independence of the aforementioned variables allows the returns mean to be zero, that there is no autocorrelation and enables the generation of White Noise. This can be seen in the following formula:
𝑟 =log' " +=log(𝑃)−log(𝑃 ) " 𝑃 " ")*
  So, the conditional mean:
𝐸(𝑟 ) = 𝐸(𝜎 𝜀 ) = 𝐸(𝜎 )𝐸(𝜀 ) = 0 """""
𝐸(334 ) = 𝐸7384 9𝐸(𝜀") = 0 456 456
")*
𝑟=𝜎𝜀 """

