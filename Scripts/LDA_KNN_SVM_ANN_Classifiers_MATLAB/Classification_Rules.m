function [LDAcp, KNNcp, SVMcp, NN]=Classification_Rules(TrainFeature, Train_Label, K, hiddenLayerSize, TestFeature, Test_Label)
    %rng(iter);

    %%%%%%%%%%% Training %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LDA
    LDAModel = fitcdiscr(TrainFeature,Train_Label);
    % KNN
    KNNModel = fitcknn(TrainFeature,Train_Label,'NumNeighbors',K);%'NumNeighbors',5); %'OptimizeHyperparameters','auto');  
    % SVM
    SVMModel = fitcsvm(TrainFeature,Train_Label,'KernelFunction','RBF','KernelScale','auto');%'OptimizeHyperparameters','auto');
    
    %%%%%%%%%%% Prediction %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % LDA
    LDAPredicted_Label = predict(LDAModel,TestFeature);
    % KNN
    KNNPredicted_Label = predict(KNNModel,TestFeature);
    % SVM
    [SVMPredicted_Label,SVMScore] = predict(SVMModel,TestFeature);
   
    %%%%%%%%%%% Neural Net %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    [tind, yind]=Ind_NN(TrainFeature, Train_Label, hiddenLayerSize, TestFeature, Test_Label);
    [NN.ER, NN.ConfMat, NN.NPV, NN.PPV, NN.Sensitivity, NN.Specificity, NN.F1]...
            =CPE(tind,yind);
  
    % Evaluate classifier performance
    LDAcp = classperf(Test_Label>0,LDAPredicted_Label>0);
    KNNcp = classperf(Test_Label>0,KNNPredicted_Label>0);
    SVMcp = classperf(Test_Label>0,SVMPredicted_Label>0);
   
%     % Error rate (ER): the ratio of the number of incorrectly classified samples divided by the total number of classified samples.
%     conf=[LDAcp.DiagnosticTable,KNNcp.DiagnosticTable,SVMcp.DiagnosticTable, NN.ConfMat];
%     ER=[LDAcp.ErrorRate,KNNcp.ErrorRate,SVMcp.ErrorRate, DTcp.ErrorRate, NBcp.ErrorRate, NN.ER];
%     PPV=[LDAcp.PositivePredictiveValue, KNNcp.PositivePredictiveValue, SVMcp.PositivePredictiveValue, DTcp.PositivePredictiveValue, NBcp.PositivePredictiveValue, NN.PPV];
%     NPV=[LDAcp.NegativePredictiveValue, KNNcp.NegativePredictiveValue, SVMcp.NegativePredictiveValue, DTcp.NegativePredictiveValue, NBcp.NegativePredictiveValue, NN.NPV];
%     Sensitivity=[LDAcp.Sensitivity, KNNcp.Sensitivity, SVMcp.Sensitivity, DTcp.Sensitivity, NBcp.Sensitivity, NN.Sensitivity];
%     Specificity=[LDAcp.Specificity, KNNcp.Specificity, SVMcp.Specificity, DTcp.Specificity, NBcp.Specificity, NN.Specificity];
%     
end
