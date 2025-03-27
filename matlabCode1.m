%% Data and Stock Prices/Returns plot
% we read all the files
ABB = readtable("ABB.ST.csv","VariableNamingRule","preserve");
ATCO = readtable("ATCO-B.ST.csv","VariableNamingRule","preserve");
AZN = readtable("AZN.ST.csv","VariableNamingRule","preserve");
BORG = readtable("BORG.ST.csv","VariableNamingRule","preserve");
CLAS = readtable("CLAS-B.ST.csv","VariableNamingRule","preserve");
ELUX = readtable("ELUX-A.ST.csv","VariableNamingRule","preserve");
ERIC = readtable("ERIC-A.ST.csv","VariableNamingRule","preserve");
NDA = readtable("NDA-SE.ST.csv","VariableNamingRule","preserve");
SHB = readtable("SHB-A.ST.csv","VariableNamingRule","preserve");
SWED = readtable("SWED-A.ST.csv","VariableNamingRule","preserve");
TELIA = readtable("TELIA.ST.csv","VariableNamingRule","preserve");
VOLV = readtable("VOLV-B.ST.csv","VariableNamingRule","preserve");
% ******* Note that data is from '2012-01-01' to '2022-01-01' (10 years)
AssetList = {'ABB' 'ATCO' 'AZN' 'BORG' 'CLAS' 'ELUX' 'ERIC' 'NDA' 'SHB' 'SWED'
'TELIA' 'VOLV'};
Date = datetime(ABB.Date); % generate time series
Close_Matrix = [ABB.Close ATCO.Close AZN.Close BORG.Close CLAS.Close
ELUX.Close ERIC.Close NDA.Close SHB.Close SWED.Close TELIA.Close VOLV.Close];
dailyReturns = tick2ret(Close_Matrix);
figure(1) % figure contains all stock prices over time
tiledlayout(4,3)
nexttile
plot(Date,ABB.Close)
title('ABB Stock Price')
xlabel('Timeline')
ylabel('ABB')
nexttile
plot(Date,ATCO.Close)
title('ATCO Stock Price')
xlabel('Timeline')
ylabel('ATCO')
nexttile
plot(Date,AZN.Close)
title('AZN Stock Price')
xlabel('Timeline')
ylabel('AZN')
nexttile
plot(Date,BORG.Close)
title('BORG Stock Price')
xlabel('Timeline')
ylabel('BORG')
nexttile
plot(Date,CLAS.Close)
title('CLAS Stock Price')
xlabel('Timeline')
ylabel('CLAS')
nexttile
plot(Date,ELUX.Close)
title('ELUX Stock Price')
xlabel('Timeline')
ylabel('ELUX')
nexttile
plot(Date,ERIC.Close)
title('ERIC Stock Price')
xlabel('Timeline')
ylabel('ERIC')
nexttile
plot(Date,NDA.Close)
title('NDA Stock Price')
xlabel('Timeline')
ylabel('NDA')
nexttile
plot(Date,SHB.Close)
title('SHB Stock Price')
xlabel('Timeline')
ylabel('SHB')
nexttile
plot(Date,SWED.Close)
title('SWED Stock Price')
xlabel('Timeline')
ylabel('SWED')
nexttile
plot(Date,TELIA.Close)
title('TELIA Stock Price')
xlabel('Timeline')
ylabel('TELIA')
nexttile
plot(Date,VOLV.Close)
title('VOLV Stock Price')
xlabel('Timeline')
ylabel('VOLV')
figure(2) % figure contains all stock returns over time
tiledlayout(4,3)
nexttile
plot(Date(2:end),tick2ret(ABB.Close))
title('ABB Stock Returns')
xlabel('Timeline')
ylabel('ABB Returns')
nexttile
plot(Date(2:end),tick2ret(ATCO.Close))
title('ATCO Stock Returns')
xlabel('Timeline')
ylabel('ATCO Returns')
nexttile
plot(Date(2:end),tick2ret(AZN.Close))
title('AZN Stock Returns')
xlabel('Timeline')
ylabel('AZN Returns')
nexttile
plot(Date(2:end),tick2ret(BORG.Close))
title('BORG Stock Returns')
xlabel('Timeline')
ylabel('BORG Returns')
nexttile
plot(Date(2:end),tick2ret(CLAS.Close))
title('CLAS Stock Returns')
xlabel('Timeline')
ylabel('CLAS Returns')
nexttile
plot(Date(2:end),tick2ret(ELUX.Close))
title('ELUX Stock Returns')
xlabel('Timeline')
ylabel('ELUX Returns')
nexttile
plot(Date(2:end),tick2ret(ERIC.Close))
title('ERIC Stock Returns')
xlabel('Timeline')
ylabel('ERIC Returns')
nexttile
plot(Date(2:end),tick2ret(NDA.Close))
title('NDA Stock Returns')
xlabel('Timeline')
ylabel('NDA Returns')
nexttile
plot(Date(2:end),tick2ret(SHB.Close))
title('SHB Stock Returns')
xlabel('Timeline')
ylabel('SHB Returns')
nexttile
plot(Date(2:end),tick2ret(SWED.Close))
title('SWED Stock Returns')
xlabel('Timeline')
ylabel('SWED Returns')
nexttile
plot(Date(2:end),tick2ret(TELIA.Close))
title('TELIA Stock Returns')
xlabel('Timeline')
ylabel('TELIA Returns')
nexttile
plot(Date(2:end),tick2ret(VOLV.Close))
title('VOLV Stock Returns')
xlabel('Timeline')
ylabel('VOLV Returns')