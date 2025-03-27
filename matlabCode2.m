%% Portfolio 1: LONG PORTFOLIO
invest = 200000;
m = length(AssetList);
[n,~] = size(ABB);
% EWP: equally weighted portfolio
OWP = 1/m*invest*ones(1,m); % investment amount distributed to each asset
NmbrShares_1 = OWP./Close_Matrix(1,:); % number of shares of each asset
Initial_Portf_Value_1 = NmbrShares_1.*Close_Matrix(1,:); % initial portfolio
value of 200000
Portf_Value_1 = zeros(n,1)
for i=1:n
    Portf_Value_1(i) = sum(NmbrShares_1.*Close_Matrix(i,:));
end
Portf_Ret_1 = price2ret(Portf_Value_1);
Portf_cumRet_1 = cumsum(Portf_Ret_1);
% EWP: equally weighted shares portfolio
NmbrShares_2 = invest/sum(Close_Matrix(1,:)); % number of shares of each asset
Initial_Portf_Value_2 = NmbrShares_2.*Close_Matrix(1,:); % initial portfolio
value of 200000
Portf_Value_2 = zeros(n,1)
for i=1:n
    Portf_Value_2(i) = sum(NmbrShares_2.*Close_Matrix(i,:));
end
Portf_Ret_2 = price2ret(Portf_Value_2);
Portf_cumRet_2 = cumsum(Portf_Ret_2);
% RWP: randomly weighted portfolio
nmbrSim = 20000;
for i=1:nmbrSim
    rndm_weight = rand(1,m); % generate random 1xm matrix
    rndm_weight = rndm_weight./sum(rndm_weight); % sum of weights equal 1
    rndm_Invest = rndm_weight*invest; % random investment amount distributed to each asset
    NmbrShares_3 = rndm_Invest./Close_Matrix(1,:); % number of shares of each asset
    rndm_Portf_Value(i) = NmbrShares_3*Close_Matrix(end,:)';
end
maximum = max(rndm_Portf_Value)
Portf_Value_3 = zeros(n,1)
for i=1:n
    Portf_Value_3(i) = sum(NmbrShares_3.*Close_Matrix(i,:));
end
Portf_Ret_3 = price2ret(Portf_Value_3);
Portf_cumRet_3 = cumsum(Portf_Ret_3);
% Optimal Portfolio Weights
p = Portfolio('AssetList',AssetList);
p = estimateAssetMoments(p,dailyReturns); % estimate mean and variance of
portfolio
p = setDefaultConstraints(p); % this means we cannot short the asset and we
need to invest 100% of the money
sharpeWeight = estimateMaxSharpeRatio(p); % estimate sharpe ratio for best
portfolio
[sharpeRisk,sharpeRet] = estimatePortMoments(p,sharpeWeight)
pwgt = estimateFrontierByRisk(p, [0.05, 0.1, 0.20]);
portf_weight = sharpeWeight'.*invest;
NmbrShares_4 = portf_weight./Close_Matrix(1,:); % number of shares of each
asset
Portf_Value_4 = zeros(n,1)
for i=1:n
Portf_Value_4(i) = sum(NmbrShares_4.*Close_Matrix(i,:));
end
Portf_Ret_4 = price2ret(Portf_Value_4);
Portf_cumRet_4 = cumsum(Portf_Ret_4);
figure(3)
grid on
plot(Date,Portf_Value_1)
hold on
plot(Date,Portf_Value_2)
hold on
plot(Date,Portf_Value_3)
hold on
plot(Date,Portf_Value_4)
hold off
legend("Equally Weighted Investment","Equally Weighted Shares","Randomly
Weighted Shares","Optimal Portfolio Weights",'Location','best')
title("Portfolio Value vs. Timeline")
xlabel("Timeline (years)")
ylabel("Portfolio Value ($)")
figure(4)
grid on
plot(Date(2:end),Portf_cumRet_1)
hold on
plot(Date(2:end),Portf_cumRet_2)
hold on
plot(Date(2:end),Portf_cumRet_3)
hold on
plot(Date(2:end),Portf_cumRet_4)
hold off
legend("Equally Weighted Investment","Equally Weighted Shares","Randomly
Weighted Shares","Optimal Portfolio Weights",'Location','best')
title("Portfolio Cumulative Returns vs. Timeline")
xlabel("Timeline (years)")
ylabel("Portfolio Return ($)")