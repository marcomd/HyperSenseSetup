# Crypto Trading with Indicators

It is said that when a market is moving up, it’s more likely to keep going up. Also when a market is moving down, it’s more likely going to keep going down. There is even a special term for it: "Momentum", and the Momentum strategies are very popular in traditional financial markets and are successfully employed by many leading hedge funds.

Moving averages (MA) are vital for any kind of trader, and work well on any timeframe. Many other indicators are based on Moving Averages.

The Moving Average indicator might be the most important, and most used indicator in any field of trading. Furthermore, these indicators can signal whether to buy or sell a certain asset.


## Moving Averages (MA)

The Moving average (`MA`) is one of the most straightforward tools used in Technical Analysis (TA).
The moving average is the average price over a time period, we often use the 200 days moving average, 50 days moving average, and the 20 days moving average. It can be used for any timeframe.

Moving averages simplify and smoothen price fluctuations, reducing the noise and giving you a better idea of which direction the market is going, and where it might potentially go. Reducing noise from a chart will give you a much clearer picture of what is happening.

While Moving Averages are incredibly useful in providing you insight, you need to be aware that they don’t predict future performance. Rather, they confirm established trends.

MAs with a shorter timeframe react much faster to price changes. There are also different kinds of Moving Averages used, for example, the SMA (simple moving average) or the EMA (exponential moving average). They differentiate in they behave a little bit.

### How a Moving Average is Calculated

MA's are calculated by summing up the previous data points, or candles, which are then divided by the number of points.

- A `20 MA` is derived from summing up the previous 20 periods, divided by 20.
- A `100 MA` is derived from summing up the previous 100 periods, divided by 100.
- etc.

### Types of Moving Averages

There are different ways of interacting with markets. Long-term investing, intermediate trades, or short-term “swing” trading are the three most common ways of trading. 
Because of the slow-moving nature of the traditional Simple Moving Average, analysts started to look for a solution that provides faster signals. This is how the variety in MA's was born.



## Simple Moving Average (SMA)

The Simple Moving Average, or `SMA` line, is calculated based on the closing price of a period. A `period` means a candle. 
For example, the closing price of 3 periods or candles is summed up and then divided by 3. 
Every period in the calculation has the same weight. We will look into what that means once we go over the next types of MA's.

An example: 
- we have 3 periods, $50, $45, and $60.
- The Simple Moving Average formula is: 50 + 45 + 60 = 155 / 3 (the number of periods) = 51.66 as a 3 SMA.
- The Simple Moving Average is very smooth and is at its strongest as a long-term indicator, on any timeframe.

### The 200-Day (simple) Moving Average (SMA)

The 200 SMA represents the average price over the past 200 days. It is mainly used to spot up- and downtrends and also identify support and resistance areas.

Bulb: At the Support level of a Crypto asset, the downtrend should stop or pause for a while. This happens because there is expected that there is a high concentration of buying interest of Crypto Investors.

As a rule of thumb, if the price is above the 200 MA, the trend is up; if it's below, the trend is down.

### The 50-Day Simple Moving Average (SMA)

This moving average is also very popular under technical traders. It is considered the first line of support in uptrend markets and the first line of resistance if the markets are going down.

You may have stumbled across two important terms above: the Death Cross and the Golden Cross. In both turns of trend events, the 200 SMA and the 50 SMA are involved.

A so-called Death Cross happens if 50 SMA is crossing the 200 SMA from up to down. This is often seen that a bear market is coming up. On the other hand, the Golden Cross is when the 50 SMA crosses the 200 SMA from down to up, good times are supposed to happen.

### The 20-Day Simple Moving Average (SMA)

The shorter the timeframe, the faster the Moving Averages are reacting to the price changes in the market. With a shorter period, like the average price of 20 days, you can spot changes in trends faster, but it is also more likely that you get a false alarm because of a bit of breakout.

Moving averages are popular within Crypto Traders and often used with other key indicators for both, exits and entries. Do not forget you can not predict the future from the past, but you can draw some lines in the sand, get some grip, and better understand price developments.

Next will have a look at the relative strength index indicator, which is a momentum indicator.



## Weighted Moving Average (WMA)

The Weighted Moving Average, or `WMA`, gives more weight to the last periods but not exponentially. This makes the indicator a little less fast than the EMA line, but faster than the SMA line. 
The first period in the calculation has the least weight, the middle point has an average weight, and finally, the last period in the calculation has double the weight of the middle point. The more recent a period is, the more weight it carries in the calculation. Let’s take a look at the Weighted Moving Average formula.

In the calculation of the WMA, each period has a weight. 
If we have 3 periods, the first will weigh 1, the second 2, and the last 3. 

For example:
- [(1 x $60) + (2 x $45) + (3 x $50)] = 300.
- The sum of the periods is 1+2+3 = 6. 
- So we have (60 + 90 + 150) / 6 = 50 as a 3 WMA.

This results in a faster-moving WMA, responding faster to the latest price action than a traditional SMA line does.

In traditional trading and crypto, Weighted Moving Average is stronger as a short-term indicator than the SMA, it gives a more dynamic result that works better for intermediate or short-term trades.


## Exponential Moving Average (EMA)

The Exponential Moving Average, or `EMA` indicator, gives exponentially more weight to the recent periods. 
This makes the indicator move much faster, therefore making it better suited for short-term trading. 
The EMA is calculated by using a multiplier. The multiplier is applied for smoothing the indicator and to give more weight to the latest periods.

Calculating the multiplier, or smoothing factor, goes as such: 
- [2 ÷ (number of periods + 1)].
- For a 3-day moving average, the multiplier would be [2/(3+1)]= 0.5.

Then, we get the following Exponential Moving Average formula: 

`Closing price x 0.5 + EMA (previous day) x (1 – 0.5).`

For example: 
- 1 EMA = 60(1) = 60
- 2 EMA = 0.5 * 45 + (1 – 0.5) * 60 = 52.5
- 3 EMA = 0.5 * 50 + (1 – 0.5) * 52.5 = 51.25, is our 3 EMA

In traditional trading and crypto, Exponential Moving Average is strong as a short-term indicator, it gives a more dynamic result that works best for short-term trades and swing trading. You can use the EMA on any timeframe, but it will be stronger on higher timeframes (4H+). More data, which means more time, will give more reliable signals.



## Overview SMA vs WMA vs EMA

As you have noticed, using the same data we have received different yet similar results.

The 3 periods in the example we looked at have a price of $50, $45, and $60 respectively. This is the result.

- The 3 SMA is 51.66
- The 3 WMA is 53.33
- The 3 EMA is 51.25

Let's recap:

- SMA vs. EMA, the EMA will react faster to more recent price movements, and the SMA line reacts slower.
- WMA vs. EMA, the WMA reacts faster than the SMA. And the EMA is even faster than the WMA because it gives weight to the latest periods in an exponential way. To simplify: the most recent periods or candles are given more importance. That means, the most recent price action will be more important, and that is why it moves “faster”.
- A "faster" Moving Average like the WMA or EMA will give a benefit in short-term trading. For long-term trading, an SMA will be smoother and more ideal.
- The differences between the SMA, WMA, and EMA aren’t very significant at first sight but they do give different signals on the chart. Let’s look at what the charts tell us now that we have explained the different types of Moving Averages.




## Relative Strength Index (RSI)

The RSI indicates if a digital asset is overbought or oversold. The Relative Strength Index indicates bullish or bearish price momentum; usually, if the RSI is about 70 %, that means a cryptocurrency is overbought. If the Index is under 30 %, it is oversold. The RSI measures the magnitude of a recent change in the price within a period of time (usually 14 days, 14 hours, etc.). The data are shown on an oscillator between 0 and 100.

Generally speaking, when the RSI goes below the 70 % level, this can be seen as a bearish signal; on the other hand, if it climbs above 30 %, this can be seen as a bullish sign. A momentum indicator like the RSI can give an idea if buyers have the market under control or sellers might take over.

Like all other indicators and financial metrics, the signals can be misleading, so it is best not to use them as a direct sell and buy signals.


## Moving Average Convergence Divergence (MACD)

The MACD is a trend-following momentum indicator. It subtracts the 26-period EMA from the 12-period EMA and measures the relationship between two EMA's.

The Moving Average Convergence Divergence is made up of two lines. There is the MACD line and the signal line. Most charting tools (e.g., Tradingview ) also show a histogram showing the distance between the signal and the MACD line.

Traders can get an insight into the strength of the current trend by looking at the MACD chart.

For example, if the price chart shows higher highs, but the MACD shows lower highs, there is a higher probability that the markets could start going down soon. The price is increasing while the momentum is decreasing.

Momentum is the speed or velocity of an Asset's price change

Both MACD and RSI are used together since both, measure the momentum, but by different factors.


## Bollinger Bands (BB)

Bollinger Bands measure the volatility of the markets and also if the market is overbought and oversold.

BBs consist of three lines:

the middle Band - simple moving average. The standard is usually the 20 SMA

the upper Band (usually two standard deviations from the middle Band)

the lower Band (usually two standard deviations from the middle Band)

A standard deviation is a statistic that measures the dispersion of a dataset relative to its mean.

With the increase in volatility, the distance between bands increases. Smaller volatility is shown with a smaller distance. The closer the price is to the upper Band in general, the more overbought the price; the closer to the lower Band, we are in an oversold market. A breakout of the Band shows extreme market conditions



## Strategies

### How to Use Moving Averages?

Best Moving Average Settings for Crypto Trading
Before you start trading based on MA's, it’s essential to understand that more data will always give a stronger signal. What does this mean?

It means that a Daily chart will give stronger signals than a 15-minute chart.

    1 minute < 5 minutes < 15 minutes < 1 hour < 4 hours < 12 hours < 1 day < 1 week

It also means that a MA will give stronger signals when holding more time.

    3 MA < 10 MA < 20 MA < 50 MA < 100 MA < 200 MA < 500 MA

As a result, the lower MA's will indicate the short-term trend, the higher MA's will indicate the long-term trend.


### Which Moving Average Type is Right

The fast Moving Averages like the EMA and WMA are more often used for short-term trades, for example, trades that take less than one day or even only a few hours.

However, it’s hard to tell which one is the best, because technical analysis has no right or wrong. There are many tools, and trading is possible with every tool available. 
The only way to know which one is best for you is by testing and making paper trades. This means: Create a system and trade it without money! If your system works, and consistently makes good results, your system is valid. One person will find the SMA the best moving average for crypto, but someone else might find the EMA better.

Remember, risk management is the most crucial aspect of trading.

Make sure that you don’t invest what you aren’t willing to lose, and always use a Stop Loss order. When using the Good Crypto app, you can place Stop Loss orders immediately when placing a trade. A Stop Loss order will be your safety exit in case your technical analysis has proven to be invalid. When a Stop Loss order hits, we recommend that it doesn’t cost you more than 1% or 2% of your total portfolio.


### Crypto Trading Strategies

Let's see how to Trade Based on Moving Averages

#### Strategy #1: Trend

The MA gives an immediate idea of the trend. By analyzing the direction of the Moving Average indicator we can easily see if the price is making new highs. 
The tip of the indicator, the outer end, also will show the possible future direction. Trend traders generally accumulate when the price hits significant moving averages. Significant means the ones with the most data, for example, 100 MA or 200 MA, which are rarely touched.

#### Strategy #2: Combining MA's

Many traders enjoy seeing multiple MA's on the same chart. This gives the benefit of seeing the long-term trend and the short-term trend at the same time. Anything is possible, from 2 MA's to a triple MA or even a whole band, or Moving Average Ribbon. As long as you are understand the information, you can read its signals and decide how to trade the market.

One of the most meaningful signals you can trade is a triple moving average Crossover e.g. a chart that combines the 10 MA, 20 MA, 50 MA, 100 MA, and 200 MA

#### Strategy #3: Crossovers

Crossovers are when one MA crosses the other. A lower period MA crossing a higher period MA is considered positive. And the opposite, a higher period MA crossing a lower period MA, is regarded as negative. 
The most significant cross that traders look at is those of the 50 MA, 100 MA, and 200 MA. Usually, traders build their 3 moving average crossover strategy on this combination of MAs.

- A positive crossover of the previously mentioned MA's is called a `Golden Cross`
- A negative crossover of the previously mentioned MA's is called a `Death Cross`

Usually, a cross happens when either selling or buying is exhausted, and the market turns around. It’s a great indication to see a potential reversal in trend.

Crossovers are important when the market has a strong trend. For example, the market has been in an uptrend for weeks or months, and then suddenly a death cross appears, which could mean the uptrend is finished and the market will turn into the other direction.

#### Strategy #4: Support and Resistance

An MA can give you a clear indication of support and resistance in the market.

- A `support` level is a place where buyers are willing to buy or buy more.
- A `resistance` level is a price where there is a lot of selling.

Using Moving Averages as an indication of where to place your Stop Loss is fairly easy, and it is also a great indication of where you could potentially place a Buy order.

#### Strategy #5: Whipsaws

A `Whipsaw` pattern is when the price is in a range, it makes no significant long-term trend either upwards or downwards and this creates a hesitant and continuous crossing of the lower period MA's. This results in a fake indication of the support and resistance or fake crossovers.

Once again:
- More data is stronger.
- Higher timeframes and higher period MA's are more important. Beware of the chaos and many signals you will find in charts with a lower timeframe.
- Lower timeframes and lower period MA's give a lot more signals, and they will also be less significant.

In a typical example of the Whipsaw effect, the price movement of a low timeframe flirts a 10 MA, giving many false signals. 
- To avoid whipsaws, change the settings of the MA to a higher number.

Using the MA's takes practice and observation. Not every Crossover is a signal to buy or sell, and neither when the price touches the Moving Average indicator.



## Conclusion

Trading Moving Averages is incredibly valuable. Understanding how to read Moving Average signals can lead to incredible results.

However, beware of Whipsaws and make sure you are properly protected by your risk management when placing trades. Also, remember that a Moving Average has a lag, because it’s calculated on historical data, and the future can always be different.

Moving Averages are great additions to a chart, and trading becomes stronger when you combine the indicator with others, accumulating your signals is more powerful.