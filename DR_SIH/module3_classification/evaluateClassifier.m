function metrics = evaluateClassifier(net, imdsTest)
% =========================================================================
% evaluateClassifier  -  Evaluate DR classification performance on a test set
% =========================================================================
% Purpose : Run the trained classifier over a held-out test imageDatastore,
%           compute per-class and aggregate metrics, and return them in a
%           struct for downstream reporting.
%
% Owner   : Member 3  (module3_classification/)
%
% Inputs  :
%   net       - Trained network (output of trainClassifier)
%   imdsTest  - imageDatastore with Labels for the held-out test set
%
% Outputs :
%   metrics   - struct with fields:
%     .accuracy         (double)        Overall top-1 accuracy
%     .confusionMatrix  (5x5 double)    Absolute counts (rows=true, cols=pred)
%     .classNames       (1x5 cell)      ICDR grade labels
%     .precision        (1x5 double)    Per-class precision
%     .recall           (1x5 double)    Per-class recall (sensitivity)
%     .f1Score          (1x5 double)    Per-class F1 score
%     .kappaScore       (double)        Cohen kappa (ordinal agreement)
%     .rocAUC           (1x5 double)    One-vs-rest AUC per class
%
% Usage example:
%   metrics = evaluateClassifier(net, imdsTest);
%   disp(metrics.confusionMatrix);
%
% Planned approach (owner to implement):
%   1. Run classify(net, imdsTest) to get predicted labels.
%   2. Build confusion matrix (confusionmat).
%   3. Compute precision, recall, F1 per class.
%   4. Compute kappa score and one-vs-rest ROC/AUC.
%
% Dependencies : MATLAB Deep Learning Toolbox, Statistics Toolbox
% =========================================================================

% TODO: Implement classifier evaluation metrics.

end
