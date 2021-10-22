![Image](wallpaper_timesetries.jpeg)


## APPLICATION OF THE GARCH MODEL ON FINANCIAL TIME SERIES

Wanting to become a DataScientist in the near future, I early began to implement several models on data in order to seek the truth behind those values. In this case, I will be using the Bollerslev GARCH model to see if stock market volatility can be used for risk hedging in portfolio construction.
Feel free to share your opinion on this work, and check also my other projects that are on my [GitHub](https://github.com/Hupperich-Manuel?tab=repositories) repositories.
Enjoy the read!!!

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


![image](https://user-images.githubusercontent.com/67901472/126033576-f8f7c2ba-06ef-4e54-acb9-6b298283359a.png)


Our modelling starts on the financial returns of the studied index. In order to get a correct model, we are required to take the logarithmic returns of this financial time series, so that we get rid of the inconveniencies from the ACF and PACF of the S&P500 index. This process is called differentiation. Observing the return graph (see Fig.:4) we realize that there is a white noise (ε_t) along the series, and we can slightly observe that periods with low changes in its returns are followed by low changes and so with the large changes (volatility).
If we look at the histogram, we can clearly observe how the data is very close to the mean, compared to a normal distribution, leading so to fatter tails and kurtosis. Even if we take a more precise view on the histogram we can see that the distribution in slightly skewed to the right, it is important to consider this view for future calculations (makes sense since it will have more positive than negative returns).

![image](https://user-images.githubusercontent.com/67901472/126033600-abe28db2-7a3d-4631-9a41-10a55d5cedd4.png)![image](https://user-images.githubusercontent.com/67901472/126033607-060e928a-8990-4ebe-90b8-e39a25a9e837.png)


Now that we have the required data to work on we have to estimate an ARIMA model in order to eliminate any linear dependence in the series. As we have seen in the S&P500 Returns graph (Fig.: 4) there is no trend, which means that the returns are stationary (To reaffirm these statements a Dickey-Fuller test could be done for a 1% significance).
As we have no trend the d in the ARIMA model will be 0. Having a look on the Autocorrelations we can observe that several lags hit the significance line, so that we have some possible order combinations. A special attention should be giving to the first five lags (see Fig.:6): since the first one is equal in both graphs, and the following ones which are either significant at both graphs or at one of them. Depending on a certain significance level, there will be some lags which are far more outstanding than the average ones, for example the seventh lag, which could be a random result and as being so far away from the relevant lags it will have no effect on our model.


![image](https://user-images.githubusercontent.com/67901472/126033633-b1f0da63-cdb6-4659-9987-a7f963823dd2.png)
![image](https://user-images.githubusercontent.com/67901472/126033632-9a7ec17c-9217-4b5c-a589-7ab95efc8c2e.png)


But to do it in a quicker and more organized way we will use the auto.arima function which will give us the optimal order for the lowest AIC. 

![image](https://user-images.githubusercontent.com/67901472/126033661-99ba7e73-84ed-43b3-a211-cb5855304b8c.png)![image](https://user-images.githubusercontent.com/67901472/126033665-78fd40fe-f47b-4511-ba1d-d816b9933ed2.png)

Having tried the optimal order, which came up to be (4, 0, 1), and seen that the variables where not significant I went on with the following orders ran by the function (along the AIC order from smaller to bigger). The order which lastly showed to be a good choice was the ARIMA (3, 0, 0) (Table:2). Through the coefficient test, we can observe that the variables are all significant for a 1% significant level. As we noticed significance in the second lag (see Fig.:6) it was convenient to consider the orders ARIMA (2, 0, 0) and (1, 0, 0) to evaluate which would be the best choice. According to the AIC formula AIC=2k-2ln⁡(L) where 2k is the number of parameters and 2ln(L) the maximum likelihood of the model, we are required to choose the lowest possible value which means lower number of parameters. Additionally, a negative AIC indicates less information loss than a positive AIC and therefore a better model (Table: 1).

![image](https://user-images.githubusercontent.com/67901472/126033676-a67aacad-b599-4e2d-acf6-14453e3509fd.png)

Now let’s study the residuals of these series, since we have to get sure that there is white noise.![image](https://user-images.githubusercontent.com/67901472/126033677-a8c1bd2e-b888-434d-9d0b-92da1cc014d3.png)

![image](https://user-images.githubusercontent.com/67901472/126033680-0b310178-b93e-4a82-9161-a713d6edf15b.png)

![image](https://user-images.githubusercontent.com/67901472/126033682-2e9c08cd-dfe8-4e34-8dfd-e0005335cdc9.png)![image](https://user-images.githubusercontent.com/67901472/126033684-5feb6186-812e-4f00-a036-62a39bc18b57.png)

We see that the residuals (Fig.: 7) show us that there is conditional heteroscedasticity. Coming to the ACF and PACF (see Fig.:8), we observe that the lags are not significant (except the random outstanding ones), which means that our (3, 0, 0) seems to be a good adjustment for our time series.
Done this, we are required to make some tests in order to see if there is correlation between the squared errors and we have an ARCH effect on the studied financial series. The a Ljung-Box Test and the Arch Test, give us this information. 

![image](https://user-images.githubusercontent.com/67901472/126033690-f8510d67-b07d-4af5-8ad3-8d251d5573f5.png)![image](https://user-images.githubusercontent.com/67901472/126033692-139e69aa-b574-4b91-b65b-5e16ced401bb.png)

We see that both p-values are below a 1% significant level, that means that we can reject the Null-Hypothesis of No ARCH effect, and we can continue with our analysis.
Having seen this, we are required to build a GARCH model, since the ARIMA by itself is not enough. The Multiplicative Lagrange hypothesis would reaffirm the errors have a significant GARCH effect, but since we have had several affirmations we can go straightforward to the GARCH model estimation and see if there are significant variables.


![image](https://user-images.githubusercontent.com/67901472/126033702-21ab5cfa-bcf4-4e1d-9c19-5d093baedee3.png)

![image](https://user-images.githubusercontent.com/67901472/126033704-a70cc351-b136-481f-a0d9-d50b6491f146.png)

Having a look on the Correlograms (Fig.:10), the lags on the ACF are nearly all significant, and that they are decreasing slightly. On the PACF the lags do also decrease one by one. The takeaway of the observation is that the first lags is very significant on ACF and PACF, which maybe leads us to a GARCH (0, 1)/(1, 1) or similar model. 
To get a good order, we have to do the coefficient test, to test the parameters significance at a 1% level. 


![image](https://user-images.githubusercontent.com/67901472/126033714-a7896b3c-b5a3-4af2-a069-4943956c4ee3.png)

In our favour the GARCH(1, 1) seemed to have its components very significant. Having tried other orders, it turned out that the aforementioned one would allow us to code in most efficient way, shorten the code lines. 
Now we are going to plot the model on the time series to see if the model. It is seen that the conditional variance model “gjrGARCH“ works better for most of the series than the “vanilla” GARCH, that is why it is also used in this one (Explained at the end of the GARCH Modelling part). Then as we had seen in the histogram (see Fig.:6) the returns follow a Skewed T-Student Distribution that is why the distribution model is equal to “sstd”. Finally, the ARMA or mean.model (3,0,0).


 Having fixed the model we realize a back test which is going to show us the performance of the model during the time 2018/02/01 to 2020/05/16, for a 1% VaR limit.  In this case I used a rolling 120-day window that refits every day. To note that if the window is too short, it could possible fail to converge instances which would disallow converting predictions to a data frame.

The analysis is going to return the Expected Exceedance and the Actual Exceedance (the amount of time the blue lines hits the orange one), the optimum would be that Actual<Expected. But the important analysis is done with the Unconditional Coverage of Kupiec and Christoffersen, which are going to show us if we have to reject the Null Hypothesis of Correct Exceedances. We will see that we do not have to reject the Hypothesis, meaning that those are Correct exceedances and that the model would work good for the stated period.
ARIMA(3, 0, 0)-GARCH(1, 1) turned out to be the correct order to model this time series in this time frame, so the formula acquired would be the following:

![image](https://user-images.githubusercontent.com/67901472/126033742-e532ed93-a18b-45f5-be5f-5966cd20d12f.png)

As I said previously, having low amount of data can lead to the inaccurate results, by the time we analyse a longer time series (see later in this work) we will work with more reliable data results.


![image](https://user-images.githubusercontent.com/67901472/126033750-0f998cc3-25f4-41d0-a731-f329d1b1f080.png)![image](https://user-images.githubusercontent.com/67901472/126033755-48ba59b9-1ab8-41ae-9f2c-e083ceb0cc17.png)

![image](https://user-images.githubusercontent.com/67901472/126033759-2b2e70a8-a4b4-4c56-b862-8113a3e0c99c.png)

Having seen that this model has done a good performance during the past, we can now plot an accurate forecast, for the next 10 periods. A wider forecast range increases the probability to fail with the predictions. We observe how the Yellow area, which are the sigma bands (σ), follow a similar pattern to the previous periods has a quite similar length to the previous period deviations. According to our model the extreme time frame from March and April, where we had extreme volatility values, will not occur in the next n=10 periods.

![image](https://user-images.githubusercontent.com/67901472/126033778-b8f188f4-131d-4548-9325-55175909e9a6.png)

## 2.5 Trading Startegy

Having reached this part of the work, means that even you are a volatility enthusiast which has been caught by the idea (thank Mr. Engel and Mr. Bollerslev), to maybe arrive to a point where we can certainly predict the financial market or on the other hand you maybe are a professional or individual investor which skipped the more theoretical part to go straight to the practical section. 
Even if you are one or the other, asking yourself about how to fix this model in a real-life situation, where it is possible to get profitable results, is a very justified question. To get rid of this curiosity, we are about to get deep into the second main part of this study.
The practical application consists in a trading strategy, which makes use of the historical volatility bands (see yellow bands from Fig.:12) and compares them with the Chicago Board Options Exchange Market Volatility Index (VIX). If there are certain volatility conditions fulfilled, we are going to enter actively in a financial derivate or another.
It is important to mention at this point, that if you are a straight supporter of unpredictability, and completely risk averse, it advisable that you skip this part and go directly to the conclusions, without resentment. The reason is that it completely goes against that point of view, and focuses mostly on the mitigation of the impact which we thank the rare events in Extremistan. Additionally, it is advisable to be open-minded, in a sense that the strategy should always be followed by a rational mind, which is able to question it and considers the negative aspects.
If the above-mentioned points are covered, we are ready to plunge into the complex and fascinating world of volatility trading.


_2.5.1. Introduction_

In recent years there have been launched several Exchange Trade Funds (ETF’s) or Exchange Traded Notes (ETN’s) which allowed volatility trading strategies to be accessible to the normal investor or a fund manager without the necessity to access to the future market.
I will present a volatility trading strategy, that is going to allow the individual investor either to include this in its trading system or even for the value investor to hedge its own portfolio.
To understand better the volatility market there are three important facts: stock market volatility is predictable (unlike returns), changes in volatility are negatively correlated with market prices and investors are prepared to pay a premium (Volatility Risk Premium) to take volatility risk from them.
In order to understand the trading strategy, it is important to understand how the volatility is measured. To do so, I introduce the VIX (Chicago Board Options Exchange Market Volatility Index). The VIX is a non-direct tradeable index which measures the market expectations of the average volatility over the next 30 days. These changes in the VIX are negatively correlated with the changes in the S&P500. It tends to be mean reverting which means that extreme values are followed by less extreme values (similar to the GARCH model).
Having now a base point, from where to build up the strategy I will go over this part through four parts:
-The Volatility Risk Premium. Which basically explains, how do I get the profits?
-The Trading Variables. This part explains how the strategy works, in a theoretical way.
-The Risks. As the market is subjective, there will be always risks to be considered. We see the impact and exposures on different risks.
-Trading Strategy with the studied GARCH Model. With a main focus on the actual virus crisis.
-Long-Term Strategy Performance. We are going to model a long-term GJRGARCH order to improve the accuracy of the trading strategy results.
-Finally, the Takeaways. Which is a review of the main important points of the whole analysis.

_2.5.2. Volatility Risk Premium_

The Volatility Risk Premium (VRP) is one of the risks that an investor can take in order to earn higher returns than the basic risk-free rate. VRP is a premium that an investor pays in some assets (in our case the S&P500) to reduce the exposure to the volatility of the future return on an asset.
The VRP can be seen in the Stock index options by those been overpriced (sellers of the options receive the VRP for these higher prices). 
The VIX is a measure of the volatility in these options. But it is a biased estimator, therefore the VIX is higher than it should be, referencing with the future S&P500 volatility (roughly said the overprediction of the VIX compared to the S&P500 volatility futures is the Volatility Risk Premium).


![image](https://user-images.githubusercontent.com/67901472/126033824-4abcea36-19da-435a-93c0-79e0a14c6ca7.png)

Note that there are periods where the S&P500 future volatility exceeds the VIX, returning a negative volatility risk premium. In that case we will have to reverse positions to earn the premium.
An important point in the VIX future market is that if participants predict the VIX to rise, means the VIX is Contango, meanwhile if they predict a fall is known as Backwardation (black swans tend to be backwardation).


![image](https://user-images.githubusercontent.com/67901472/126033836-92de9978-f74c-461e-97ee-6cf9809f32a7.png)

As I have stated previously the VIX is not tradeable, that is why I make use of ETN (Exchange Trade Notes) in order to implement my strategy.
In order to earn profits from the VIX future market we have to consider the roll yield. The roll yield is the difference between the spot VIX and the future price. But we actually do not earn the profit from this differentiation rather than considering that both values will converge while reaching the maturity date. It is important to clearly differentiate these two topics, otherwise this misperception could generate additional risks for the investor. If by the end of the of the maturity the future price increases by 5$ for example the long trader will have won, this difference of 5$ is the Volatility Risk Premium (note that the VIX sourly have increased by some amount, the difference between the new VIX spot and the new future value is the new roll yield). The roll yield tends to be positive in contango (VIX spot < Future Price) and negative in backwardation (VIX spot > Future Price).
For my trading strategy I will the future notes ZIV (Inverse VIX future) and VXZ (VIX future, is highly correlated with the Volatility Index) Medium-Term futures (4, 5, 6, 7 months), both futures are negatively correlated meaning a percentage increase in ZIV leads to a decrease in VXZ (see correlation matrix Table:5). Those generally get less profits than the Short-Term Futures, but I had no. sufficient data available in order to do the analysis with the shorter ones. 

![image](https://user-images.githubusercontent.com/67901472/126033847-7c253680-2405-4eff-8c99-52c0f63cf6a9.png)

_2.5.3. Trading Variables

My trading strategy mainly focuses on the estimation of the Variance Risk Premium. As the VRP is a measure of excess pricing in the market.
I compared two really suitable strategies:
-	The first one is through the GARCH model I estimate, which has been shown to work good in the past.
I deduct the VIX from the GARCH volatility predictions in order to estimate if the VRP is positive or negative expected.
That means that if the difference is negative I go long in ZIV (contango) and if it is positive I go long XVZ (backwarding).
As the backwarding situation mostly comes out in a black swan environment (example: COVID-19 stock crash), it will help the investor to reduce the drawdown, hedging so the portfolio.
-	The second one compares the historical volatility of n=21 labour days minus the Closed VIX.
If the difference is positive we go long in the future exchange note VXZ (backwarding situation where roll yield is negative), and if the difference is negative we go long in ZIV (contango situation where the roll yield is positive).
There are other parameters that could be settled down in order to improve this strategy, but that will depend on the preferences of the investor

_2.5.4. Risks_

As any other investment strategy this one does also cover risks.
First, we need to consider the fact that with higher volatility in daily returns the compounded return will decrease.
Second it is required that this strategy is adjusted to time synchronization so that short term movements from contango to backwardation do not harm the final return.
As we have chosen to go for a kind of strategy which hedges us in times of extreme volatility, we are covered from a massive drawdown or a decrease in returns. When it comes to other strategies like buy and hold, a black swan situation would harm a lot the final outcome, that is why they are not such a good choice. But, our strategy has the negative aspects of failing in entering at the right moment on a long position even on one ETN or the other, resulting so in profit losses and in worst cases, losses.  That is the risk of making a higher number of trades.
Then we have the data risks. It consists in the possibility that the data used for the analysis, mostly the long-term analysis, is not correct and lead to bad results.
Even if we had modelled a significant order for our GARCH, there might be better ones, which return into a better performance in the studied time frame.
We should also include the commission risks, since in my analysis I do not include the respective brokers commission, as it is very different from one to another. Some brokers require a higher rate for ETN, and maybe require to prove yourself to be aware of the risks of these financial instruments.
Another consideration is the liquidity risks, since these ETN are not so highly traded or even known, there might trade at a low volume. This could lead to some sales and buy gaps which could cost the investor important profits.


_2.5.5. Trading Strategy with the studied GARCH Model_

Let’s start with the analysis and the code explanation. A Black Swan is a topic defined by the professional Nassim Taleb, as an unpredictable scenario which even has really good outcomes, or extremely bad ones. In economic terms the best Black Swan scenario could be exemplified by an economic crisis which led to high stock index drawdowns. Ironically, we are now facing the consequences of one of those super rare events, a stock crash because of a global pandemic, caused by the COVID-19. Considered to be the worst downturn from the past century (because of the short time frame), it is also one of the highest measured volatility, with daily closes about -12% and temporary stock exchange closes as virus panic led to huge capital flight. So, it would be interesting to test the conditional volatility model on this data, but, since the strategy works mainly with low amount of data, in order to focus on the effect of a Black Swan environment, the results might be not 100% accurate. For that reason, later on this work, I study the long-term performance of the strategy, considering a new GARCH order, and other adjustment that where required in order to get the most reliable results possible.
In order to start with the strategy, we will have to convert the GARCH predictions into a data frame. Then we get the closing prices of the VIX index, to make the differentiation with the GARCH predictions or the historical SPY volatility.

![image](https://user-images.githubusercontent.com/67901472/126033879-87ccc923-fbbc-4e03-b264-de848a4de348.png)

Remember the sigma bands of the forecast (Fig.:13, head method), we will make use of these values in order to estimate the volatility estimated by the studied heteroskedasticity model. These values will be annualized and multiplied by 100 in order to be at the same scale as the VIX values.!

![image](https://user-images.githubusercontent.com/67901472/126033902-e5f342a0-8895-4109-bd48-1f58ff915afa.png)

Now that we have the correct GARCH predictions, and the VIX values, we are now required to download the financial ETN, which are the ones who are going to be traded. The required notes are, as seen, the mid-term future ETN of ZIV and VXZ (downloaded from yahoo-finance). Done this, we get the closing prices of the abovementioned notes, so that we can see how the strategy had worked historically.

![image](https://user-images.githubusercontent.com/67901472/126033923-d92f4b30-7815-4369-a5d8-cdde968c91f0.png)

![image](https://user-images.githubusercontent.com/67901472/126033924-c60e5692-f310-4bc3-bded-818de83bdbdb.png)

After that we make the differentiation and plot the rule that if the difference is negative we go long on the ZIV ETN as it shows us that our volatility sigma bands are below the VIX value, whereas if the equation returns a positive value it is the signal to go long on the VXZ, as our predicted volatility acquires a higher value than the one of the VIX. Both scenarios can occur on a backwardation or contango market. The results will be returned in the variable garchOut.
What we have done here is basically see how accurate or profitable is to use the estimated GARCH model, while buying the correct financial asset if the closing VIX is above or below the GARCH predictions.
Said this we have to do the same, subtracting the VIX from the SPY historical volatility. 
The historical volatility covers the last 21 days which equals a labour month, which is the one I used for the long-term analysis as well. But even if opted to choose n=10 days historical volatility, the results would differ, in a sense of higher fluctuations (we will get deep into this with the result interpretation). 
With the following functions we get the average of both strategies and we append the three statistics. Then with the stratStrats function we get the comparison of these three, in which we will see several outcome results which will help us in our decision making if these are good strategies or not.

![image](https://user-images.githubusercontent.com/67901472/126033932-649cac25-8ae2-4d9b-af07-e04103115afe.png)

Performance Table:

![image](https://user-images.githubusercontent.com/67901472/126033933-8e09baa8-bc2d-49b7-854a-1713066dfeb8.png)

Downside Risk Table

![image](https://user-images.githubusercontent.com/67901472/126033941-18cbfbb4-43f8-4eb6-a0e0-f0dfe62faf8d.png)

In this table we can see the comparison of the performance of the estimated GJRGARCH Model and the same strategy using the historical volatility of the past 21 days from the S&P500. When analysing the results, we can observe that the GJRGARCH strategy performed highly better than the historical volume one in terms of annualized returns, this can be easily explained because we considered a historical volatility of 21 days meaning that since the markets felt in such a fast way, the strategy failed to enter into the VXZ ETN, remaining so in the ZIV and consequently suffering the huge drawdown (we see that the blue line is very similar to the ZIV graph in Fig.:17). If we had considered a n=10, the graph would be as follows and so a better performance of the histVol investment:

![image](https://user-images.githubusercontent.com/67901472/126033950-4ecabc1c-8faa-427a-a70c-5ffce17f265c.png)

The negative consequence of getting lower volatility days is that it is much more exposed to radical price changes. Notice also the extreme bad performance of a Buy Hold Strategy from the ZIV ETN.
Going back to the table (see Table:7) we observe that despite our fitted model did a worst performance on most of the graph it was able to catch up the huge downturn so that we could mitigate the losses. By the end of 2018, where high volatility days where the day to day at the stock market because of a high uncertainty caused by the trade war between the US and China, we observe a slight downturn from our studied model, basically because it failed to enter long in the VXZ ETN as it was the start point of our data collection. Finally, through 2019 the strategy had a really bad performance, that was because we were long on the ZIV ETN, and as we see on its graph we can observe a lateral or neutral movement. Since it represents a mid-term volatility future contract it was not expected to have high changes in the next months.
The Sharp Ratio turns out to be lower negative for the GJRGARCH, easily understandable because of the negative returns (which were higher than the risk-free ones). This can be explained because of low time window of two years we took in order to focus on the COVID-19 stock crash. In this period, a full exposure on this strategy would not be justified. In the case of being active traders we could have generated positive returns while entering at the right moments.
Despite a considerable drawdown, about 39,66%, by the time of February 2020, which is the “target” time frame where we want to focus, to see if the strategy could hedge the downturn we observe, there is no drawdown. Coming to the Calmar Ratio, which is (like the Sharpe Ratio), a measure of risk-return, has a negative outcome too (-23%), this can also be justified with low annual returns of -9% in this period.
Lastly, The Ulcer Performance Index, is an indicator which shows how long does the investment recover from its drawdowns. Normally a high drawdown leads to a slow recover to the pre-drawdown valuation. In this case the Index shows us a -0,38. Notice that through the alternative strategy (histVol) we would need more than 3 times to recover from the market drop.
As the data covered for these results does not cover a high range of values, many indicators are not really accurate.
So, in order to show the real performance of this volatility trading strategy a higher time frame is required. In the next part of this work we are going to see a summed GARCH modelling, which will end up with the same strategy as explained above.

_2.5.6. Takeaways of the Startegy

Comparing this strategy with others like buying and holding future notes, it turned to be a much more profitable strategy. Even if it might be a more aggressive strategy, that covers much more trades along time, if we would have had this strategy from 2004-2019 we would have got an annualized return of 16,85% with the GARCH model and 17,95% through the historical volatility method (consider that this period includes the financial crisis of 2007), compared to lower buy hold return. Additionally, the essence of using these methods is to reduce the market volatility exposure not adding another sufferer.
The GARCH model allowed us to have a much lower drawdown than any other strategy, which by the time we decide to hedge our portfolio might be the better option. The profitability respect to the risk, does a really good performance, as well; confirming us the hedger-effect this strategy takes with it.
So, considering that it is a high-risk investment way, and that we are not certain about the reliability of the used long-term data (which gives us a better impression of the overall performance), my recommendation is for a given portfolio dedicate 5-15% of the total invested value to a volatility risk premium hedging strategy, depending on the type of portfolio and your risk tolerance. The optimum would be to use the quantitative finance tools, to make an asset allocation, which focused on the correlation between its assets, and combines (according to past returns): shares, government debt, ETF and cash. Then through a rational analyst examination estimate the exposure on the volatility hedger. In the case, you are a swing trader*, your risk tolerance will be in accordance to the stop-loss fit.
Finally, I recommend to invest always with common sense, being aware of the risks that these markets take with them. Since the strategy might have worked in the past I does not ensure positive returns in future, since there can be the possibility that the data used for the long-term testing might not be 100% certain. Surely there are far better trading strategies than this one, but in the end, everyone is looking for a way to maximize its profitability and so this way should not be walked on. 

## 3. LETS LOOK HOW THIS WOULD BE IN R

First lets call the whole cluster of libraries needed for our model:

```R
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
```

Done this, we get the S&P500 Logarithmic returns and see how they perform on ACF/PACF and how they behave on the bell curve, seeking randomness and seek if there is stationarity in the time series:

```R
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
```

Now we are able to implement our General Autoregressive Conditional Heteroscedasticity Model on the series (notice how several ordeers where tested in order to get the best possible outcome):

```R
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
```

The next step is to get the historical values from ZIP and VIX volatility indexes and see how our predicted volatility model performs in predicting high periods of fluctuations. Moreover, the code is going to display a comparison with the benchmark (in this case the S&P500 index), and see how our styrategy performed compared to that index:

```R
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
```

This is all for the code. As you see those are not that numerous lines, but you need the technical knowledge if you do not want to get unreliable results from your studied model.

## 4. CONCLUSION

This work contains a brief explanation of the conditional variance of the time series theory and how can this be turned into a trading strategy.
The studied financial asset time series, showed that its variance changes its significance through time, so that analysing it through the conditional mean models would generate many biases. Unlike the aforementioned models, the conditional variance models are able, to pick up the unstable error term, which results from the conditional mean estimation, leading so to a correct adjustment of the time series.
After the brief theoretical part, we went through several R functions, which enables us to make a correct ARIMA order (3, 0, 0) followed by the correct GARCH (1, 1) order. The orders were established on a real-life example, an ETF that replicates the S&P500 index (world reference index which contains the 500 most valued entities in the US) by the time of 2018 until now. To reiterate that this modelling can be applied on any other financial time series, as seen in the works of Elzbieta Ferenstein and Miroslaw Gasowski in their analysis on Polish stock-returns, or in Cyprian Ondieki Omari, Peter Nyamuhanga Mwita and Anthony Gichuhi Waititu’s work on the Euro Kenyan shilling.
Lastly, we went to the study a volatility trading strategy, where we tried to explain how profitable can an ETN strategy become if we apply the studied heteroscedasticity models. The strategy got implemented on a short-term basis, relying the focus on the COVID-19 effects and a log-term time frame where we wanted to improve the reliability of the results, and see if this could be a good volatility hedger in the so harmful drawdowns.
All in all, it is true that predicting the future price movement basing yourself on a conditional historical variance and the past returns calculated through an “optimized” GARCH model, may be a good additional tool to your investment but it does not guarantee you a 100% prediction accuracy. The future behaviour of a time series is unknown and this model, as any other one, is completely useless in predicting a Black Swan.
As an amazed investor and student, when it comes to the financial market, I am required to state that, not considering the possibility to cluster an error range, would be a misunderstanding of several probability concepts, and maybe led to lot of profit loses. 
From a personal perspective, having to manage a portfolio, requires me to consider a volatility hedger to reduce the recovery time from a downturn. But, the core time should be invested in a reliable value investment strategy, picking long-term valuable stocks among others, since it turned out to be more profitable and secure. If you are sceptical, simply ask, Mr. Buffet.

## 5. REFERENCES

Cooper, T., (2013), Easy Volatility Investing, Double-Digit Numerics.
Iorgulescu, F., (2012), Backtesting value-at-risk: Case study on a Romanian Capital Market, Elsevier, Bucharest.
Davis, C., (2015), The Skewed Generalized T Distribution Tree Package Vignette, cran.r-project.
Ghalanos, A. (2020). Univariate GARCH Models, Version 1.4-2, cran.r-project.
Daróczi, G., (2013), Introduction to R for Quantitative Finance, (Modified in Shishir Shakya economic modeling).
Bollerslev, T. (1986), Generalized Autoregressive Conditional Heteroskedasticity, Journal of Econometrics, 31:307-327.
Engle, R. F., (1982), Autoregressive Conditional Heteroscedasticity with Estimates of the Variance of United Kingdom Inflation, Econometrica, 50(4): 987-1007.
Taleb, N. N. (2010), The Black Swan: The Impact of the Highly Improbable, 2nd Ed, Random House, New York.
Kipnis, I., (2018), GARCH and a rudimentary application to Vol Trading, QuantStrat TradeR.
Sopipan, N., (2017), Trading Gold Future with ARIMA-GARCH model, Thai Journal of Mathematics (2018).
Hilpisch, Y., (2018), Python for Finance Mastering Data-Driven Finance, 2nd Ed, O’Reilly.
Lynch, P., (2000), One up on Wall Street, Simon and Schuster.
Carl, P., and Peterson, B. G., (2020), Performance Analytics Charts and Tables Overview, cran.r-project.
Fuller, W. A., (1976), Introduction to Statistical Time Series, New York: John Willey & Sons Inc.
Er, S., and Fidan, N., (2013), Modeling Istanbul Stock Exchange-100 Daily Stock Returns: A Nonparametric GARCH Approach, Journal of Business, Economics & Finance, Volume: 2, Issue: 1.
Omari, C. O., Mwita, P. N. and Waititu, A. G., (2017), Modeling USD/KES Exchange Rate Volatility Using GARCH Models, Journal of Business, Economics & Finance, Volume: 8, Issue:1.
Graham, B., (2003), The Intelligent Investor, Reprint, HarperBusiness; Ed: 01 (Originally Work Published 1949), United States.

