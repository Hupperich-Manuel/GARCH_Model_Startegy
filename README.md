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

### 2.2. ARCH(q): Definition and Properties
_2.2.1. Properties of the ARCH(q)_
The Autoregressive Conditional Heteroscedasticity Models help us to model financial time series, as the returns on a financial asset.

The returns on a financial asset can be formulated as follows:

![image](https://user-images.githubusercontent.com/67901472/125917890-91545b65-3754-4eff-b234-d2694728ac24.png)

The core ARCH formula, which allows us to predict future returns is:

![image](https://user-images.githubusercontent.com/67901472/125918098-074a9444-59be-459b-9fe3-a3eeb0297561.png)

ε_t is the process of White noise formed by random variables normally distributed with mean=0 and variance =1 and 𝜎_t is the volatility factor, both are stationary processes and independent beyond them.

The independence of the aforementioned variables allows the returns mean to be zero, that there is no autocorrelation and enables the generation of White Noise. This can be seen in the following formula:

![image](https://user-images.githubusercontent.com/67901472/125918310-ed702c46-3842-4971-9fdf-089065241f4e.png)

So, the conditional mean:

![image](https://user-images.githubusercontent.com/67901472/125918404-ce774ac9-f305-4c1d-9ae3-eb0ca03206d7.png)

As the returns (r_t) are a stationary process, we become a constant marginal σ^2. But as stated before the differentiation starts here, with the implementation of a condition on this constant marginal variance, turning into conditional variance.

Marginal Variance: ![image](https://user-images.githubusercontent.com/67901472/125918478-243caba0-3297-4704-bf69-49ffae7272cf.png)

Conditional Variance:![image](https://user-images.githubusercontent.com/67901472/125918531-8790db65-db7b-48aa-8f10-890d22e6add2.png)

The volatility represents the conditional variance of the time series at a specific point in time, which varies depending on the series structure.

_2.2.2. Model Estimation ARCH(p)_

Said this, we can state that the we will start from a return series with a mean equal to 0, and a non-constant conditional variance (σ_(t/(t-p))^2), which depends on the past returns. 
But first, in order to become an unbiased estimator of σ_(t/(t-p))^2, we square the returns:
![image](https://user-images.githubusercontent.com/67901472/125920069-dbc115f2-ec6b-4da1-a160-cb5a514bd9a4.png)
![image](https://user-images.githubusercontent.com/67901472/125920095-ecf170f7-8120-43d4-b160-836660a49329.png)
![image](https://user-images.githubusercontent.com/67901472/125920123-0f2ad07a-fac8-4b7d-a545-8b045855b209.png)


- Where:
  - α_0 lowest observed value of the conditional variance and α_i is a necessary condition to prove the existence of an unconditional and conditional variance (variance is always positive). Both are constants
  - ε_t is a white noise process mean = 0, variance = 1 and covariance j=0. 
  - With random and independent variables beyond them and with past periods, poor stationarity of an ARCH(p) has white noise and allows a conditional variance which varies through the series.

The above-mentioned model explains though that the periods with high volatility will depend on the values of p past periods, so we get:

![image](https://user-images.githubusercontent.com/67901472/125920208-65efbc8b-50f0-42a9-a570-2798bc239c20.png)

From this formula if we isolate the marginal variance we obtain:

![image](https://user-images.githubusercontent.com/67901472/125920230-bd7cad28-d3cf-46a9-87b6-28c969ff1c70.png)

This ends up with the unconditional constant variance:

![image](https://user-images.githubusercontent.com/67901472/125920291-de06eb6e-9f93-4d9c-83c3-ad656788fc77.png) with positive values of the constants and below 1.
 

Now let’s take an observed value ϵ_t  which represents a non-correlated series with a mean equal to 0 and also non-correlated with the past returns. This observed value is the deduction of the squared returns minus the conditional variance. If we isolate and substitute we obtain:

![image](https://user-images.githubusercontent.com/67901472/125920327-54c52a3e-af3d-4d3e-8759-a87a4734e824.png)

![image](https://user-images.githubusercontent.com/67901472/125920358-9b48f921-6465-4ab5-8d72-9af76ea6a11f.png)

![image](https://user-images.githubusercontent.com/67901472/125920402-8059b74b-491b-4451-bdaf-70c4726b3c9a.png)

In an ARCH model, if its standardized errors follow a normal distribution, its corresponding stationary distribution 0<α_i<1 will have fat tails, meaning that its Kurtosis is higher than 0. 
The ARCH has a Kurtosis above 3, means it is Leptokurtic, that means a higher concentration of data near by the distribution mean (equal to 0), leaving the intermediate areas with respect to the concentrated ones, less filled, generating so fatter tails and a sharper peak with respect to a normal standard distribution. (see Fig.:1).
 

To sum up the main takeaways from this model, it is important to consider that the conditional mean of the returns is equal to 0; the marginal variance is constant, rather than the conditional variance which depends on the squared returns of past periods. The process of white noise is independent and has no common distribution.

![image](https://user-images.githubusercontent.com/67901472/125918995-93466f1d-8772-4481-b46c-642e9b766d5f.png)

To sum up the main takeaways from this model, it is important to consider that the conditional mean of the returns is equal to 0; the marginal variance is constant, rather than the conditional variance which depends on the squared returns of past periods. The process of white noise is independent and has no common distribution.

### 2.3. Generalizet ARCH Model: GARCH(p,q)
_2.3.1. Properties of the GARCH(p,q)_

The ARCH Model take some inefficiencies with it. In order get rid of them, the General ARCH Model was settled. The GARCH Model basically considers, besides the past returns r_(t-p), it now adds the past volatility values σ_(t-q). Finally, considering the white noise (error term), we get the following formula 〖r_t=σ〗_t ε_t.

In order to present correctly the dynamic of the variance and the implementation of a fixed delay, the ARCH model required a lot of autoregressive parameters. Bollerslev proposed the GARCH models in order to smooth these restrictions.

_2.3.2. Model Estimation GARCH (p,q)

Bollerslev stated that the conditional variance σ_(t/(t-q))^2 depends on its own previous values and the previous values of the returns.

![image](https://user-images.githubusercontent.com/67901472/125919325-090d6c7e-3580-42b0-a9b5-32839967cc7b.png)

![image](https://user-images.githubusercontent.com/67901472/125919359-d38eca58-1a0f-4126-b8c8-e119847a2579.png)

Notice that we basically add another constant β_j≥0 the other constants α_0>0 and α_i≥0 from the ARCH(p) model. Being β_q σ_(t-q)^2 the previous volatility value, so that the GARCH model considers that the returns distribution at one point will have similar volatility as in  r_(t+q).
In case of the GARCH (1, 1) which is supposed to be the order for which most of the time series can be fitted, basically considers the return at r_(t-1) and the volatility σ_(t-1).
GARCH (1, 1): 
![image](https://user-images.githubusercontent.com/67901472/125919445-6a8af3aa-7387-450d-aaaa-b335bbdd1090.png)

This model GARCH (p, q), is basically the seen ARCH(q) when p=0. Bollerslev establishes several conditions of stationarity in this model, proving r_t to be slightly stationary:

![image](https://user-images.githubusercontent.com/67901472/125919549-2d40e038-49b0-4066-8a92-0d6aa4bca926.png)
![image](https://user-images.githubusercontent.com/67901472/125919525-491dfbf4-5ac3-468c-8d0d-e041a9f1256e.png)
![image](https://user-images.githubusercontent.com/67901472/125919581-7512bb0d-5107-442d-a56b-b05a429f97e3.png)
![image](https://user-images.githubusercontent.com/67901472/125919620-4c880916-33e4-4e0d-baa9-25322440a6df.png)

From the standard GARCH (p, q) other models are obtained. This work will use the alternative model GJRGARCH. The Glosten-Jagannathan-Runkle GARCH model assumes a specific parametric form for this conditional heteroscedasticity, which basically means that it will get the leverage effect of the stylized facts of financial returns (for example: the returns are not normally distributed), which makes the added features more relevant (a correct estimation of the order will be sufficient to beat the standard GARCH) and on the other hand the GJRGARCH model will allow more precision than the standard one. Additionally, the updated model will not work worse than the normal one (Vanilla GARCH), so it is more efficient to make use of it.


### 2.4. Implementation of the ARCH and GARCH Models

While trying to estimate a correct ARCH and GARCH model it is required to eliminate most of the atypical values that are in the series, since it will allow us to see if the conditional variance models are required or not. In theory the maximum likelihood methodology is used in order to estimate the right models, which are formed by the product of conditional densities, under several assumptions.
In our case we will use the statistical software R, which contains several packages which enables us to get in deep with the time series analysis and realize a consistent and reliable conditional heteroskedasticity model estimation.
To do this analysis there was required to run several libraries which entail the necessary packages.
As a principal data to work on, the ETF from the S&P500 financial time series got chosen. This ETF replicates exactly the global reference index. The financial data is downloaded from yahoo-finance data source (see Fig.: 2), and the time window goes from February 2018 until now, so that we are able to see how the COVID-19 downturn affects our model. Said this, it is also interesting to see the Autocorrelation and the Partial Autocorrelation from this unedited time series, there we observe that the series is non-stationary in its regular part. Both present the same structure as with nearly any other graph, which show us that we can start working on it, and get the ARIMA-ARCH modulation.

![image](https://user-images.githubusercontent.com/67901472/125919803-13e34f71-1bbc-41c6-a964-db274964d28d.png)

![image](https://user-images.githubusercontent.com/67901472/125919816-33692590-96bc-4c73-99e8-fe7a8969ce62.png)




