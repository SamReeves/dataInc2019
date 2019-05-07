-- BACKGROUND --
I live in Burma.  More than anything else, the value of the US Dollar (USD) compared to the value of the local currency, Myanmar Kyat (MMK), dictates my material possibilities.  As this country does not have effective trade relations with any other nation, and it is illegal to take MMK out of the country, all things must be imported with USD.  For this reason, it is said that the "black" economy is as much as 8 times the size of the formal economy.  For importers and Asian banks, knowledge of the exchange rate is extremely important.

-- THE DATA --
The Central Bank of Myanmar each morning releases the exchange rates on a basis that is perhaps not arbitrary, but is totally unknown.  The mint exists on a military base, and there is no known monetary policy.  As the government cannot effectively levy taxes, the money supply changes will-nilly.  Some people believe that the exchange rates and money supply are the direct product of astrological guidance from high-ranking Buddhist monks.

-- THIS PROJECT --
The historical data is offered generously by the Central Bank of Myanmar on their website.
I aim to:
1) scrape this website,
2) clean this data,
3) discover what aspects of the data probably contain useful patterns.

If I am accepted, I would like to use TensorFlow to try to make a predictive model on the data.

-- IMAGE 1 -- TDI.png --
This is the history of each traded currency's Trend Detection Index (blue) and Direction Indicator (red), laid end-to-end.  This could mean that ten to fifteen currencies appear to have highly-visible trends, while the rest of the 38 are probably just white noise.

-- IMAGE 2 -- rates.png -- 
This image shows basically the same story as the first.  There is a basket of dominant currencies which has motion, and a silent majority.  All of the active currencies appear to have very closely linked, yet distinct activity.  These currencies would probably offer the greatest possibilities for machine learning.
