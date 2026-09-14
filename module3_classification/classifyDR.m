function [classification, confidence] = classifyDR(I)
% =========================================================================
% classifyDR  -  Classify diabetic retinopathy grade in a fundus image
% =========================================================================
% Purpose : Apply a trained CNN classifier to assign one of the five
%           International Clinical Diabetic Retinopathy (ICDR) severity
%           grades to the input fundus image.
%
% Owner   : Member 3  (module3_classification/)
%
% Inputs  :
%   I              - (H x W x 3 uint8)  Enhanced RGB fundus image.
%                    Should have passed assessQuality() and (optionally)
%                    runSegmentation() first.
%
% Outputs :
%   classification - (string)  One of:
%                     "No DR" | "Mild" | "Moderate" | "Severe" |
%                     "Proliferative DR"
%   confidence     - (double in [0,1])  Softmax probability of the
%                    predicted class
%
% Usage example:
%   [grade, conf] = classifyDR(enhancedImage);
%   fprintf('Grade: %s (%.1f%%)\n', grade, conf*100);
%
% Planned approach (owner to implement):
%   1. Load pre-trained CNN from models/classification/.
%   2. Resize and normalise I to match network input size.
%   3. Call classify() or predict() on the network.
%   4. Return the top-1 label and its softmax score.
%
% Dependencies : MATLAB Deep Learning Toolbox, Image Processing Toolbox
% =========================================================================

% TODO: Implement DR classification.

end
