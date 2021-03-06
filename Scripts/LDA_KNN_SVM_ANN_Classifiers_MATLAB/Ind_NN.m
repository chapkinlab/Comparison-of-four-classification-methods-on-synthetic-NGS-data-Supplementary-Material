function [tind, yind]=Ind_NN(FS_TrainFeatureMatrix, TrainLabel, hiddenLayerSize, FS_TestFeatureMatrix, TestLabel)
% NN: Neural Net
% Apr-30-2019

        net=patternnet(hiddenLayerSize);

        % Change learning rate and momentum. Feli
        net.trainFcn = 'traingdx';
        net.trainParam.lr = 0.1;
        net.trainParam.mc = 0.9;
        %view(net)
        
        % Set up division of data for training, validation and testing
        net.divideParam.trainRatio=100/100;
        net.divideParam.valRatio=0;
        net.divideParam.testRatio=0;
        
        % Target matrix
        ttrain=zeros(2,length(TrainLabel));
        ttrain(1,find(TrainLabel==-1))=1;
        ttrain(2,find(TrainLabel~=-1))=1;
        
        % Train
        net.trainParam.showWindow = false;
        net=train(net, FS_TrainFeatureMatrix', ttrain);
        
        % Test
        y=net(FS_TestFeatureMatrix');
        
        % Rounding and get classes
        ttest=zeros(2,length(TestLabel));
        ttest(1,find(TestLabel==-1))=1;
        ttest(2,find(TestLabel~=-1))=1;
        
        tind = vec2ind(ttest);
        yind = vec2ind(y); 

end