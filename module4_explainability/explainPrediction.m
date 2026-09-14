function heatmap = explainPrediction(I, classification)
% =========================================================================
% explainPrediction  -  Generate a Grad-CAM saliency heatmap
% =========================================================================
% Purpose : Produce a Gradient-weighted Class Activation Map (Grad-CAM)
%           overlay that highlights the retinal regions most responsible
%           for the classifier's decision.  The heatmap is the primary
%           explainability artefact shown to the clinician in the App
%           Designer UI and in the generated PDF report.
%
% Owner   : Member 4  (module4_explainability/, simulink/, app/, integration)
%
% Inputs  :
%   I              - (H x W x 3 uint8)  The same image passed to classifyDR()
%   classification - (string)  Grade string returned by classifyDR(), e.g.
%                   "Moderate"  (used to select the target class for Grad-CAM)
%
% Outputs :
%   heatmap        - (H x W x 3 uint8)  Jet-colourmap Grad-CAM overlay
%                    blended with the original image at alpha = 0.5
%
% Usage example:
%   [grade, conf]  = classifyDR(I);
%   hmap           = explainPrediction(I, grade);
%   imshow(hmap);
%
% Planned approach (owner to implement):
%   1. Load the same network used by classifyDR().
%   2. Identify the last convolutional layer name.
%   3. Call gradCAM(net, I, targetClass) from Deep Learning Toolbox.
%   4. Resize the activation map to H x W using imresize.
%   5. Apply jet colourmap; blend with original image.
%   6. Return as uint8 RGB.
%
% Dependencies : MATLAB Deep Learning Toolbox (gradCAM), Image Processing Toolbox
% =========================================================================

% TODO: Implement Grad-CAM explainability.

end
