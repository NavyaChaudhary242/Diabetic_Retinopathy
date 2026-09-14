function net = trainClassifier(imdsTrain, imdsValidation)
% =========================================================================
% trainClassifier  -  Fine-tune a CNN for DR severity classification
% =========================================================================
% Purpose : Fine-tune (transfer-learn) a pre-trained CNN (e.g. ResNet-50 or
%           EfficientNet) on labelled fundus images to classify diabetic
%           retinopathy into five ICDR severity grades.
%
% Owner   : Member 3  (module3_classification/)
%
% Inputs  :
%   imdsTrain      - imageDatastore of training images with Labels
%   imdsValidation - imageDatastore of validation images with Labels
%
% Outputs :
%   net            - Trained SeriesNetwork or dlnetwork object.
%                    Saved to models/classification/drClassifier.mat.
%
% Usage example:
%   net = trainClassifier(imdsTrain, imdsVal);
%
% Planned approach (owner to implement):
%   1. Load base network (resnet50 or efficientnetb0).
%   2. Replace final fully-connected + softmax layers for 5-class output.
%   3. Define trainingOptions (adam, cosine LR decay, class weights).
%   4. Apply augmentation (random flip, rotation, colour jitter).
%   5. Call trainNetwork(); save net to models/classification/.
%
% Dependencies : MATLAB Deep Learning Toolbox, Image Processing Toolbox
% =========================================================================

% TODO: Implement transfer learning training pipeline.

end
