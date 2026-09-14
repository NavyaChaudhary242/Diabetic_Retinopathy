function result = assessQuality(I)
% =========================================================================
% assessQuality  -  Assess the quality of a fundus image
% =========================================================================
% Purpose : Analyse a raw fundus photograph and decide whether it is usable
%           for automated DR screening.
%
% Owner   : Member 1  (data/, preprocessing/, module1_quality/)
%
% Inputs  :
%   I       - (H x W x 3 uint8)  RGB fundus image
%
% Outputs :
%   result  - struct with fields:
%     .status         (string)  "PASS" | "ENHANCE" | "REJECT"
%     .sharpness      (double)  Laplacian-variance focus score
%     .brightnessMean (double)  Mean pixel intensity, green channel [0-255]
%     .brightnessStd  (double)  Std  pixel intensity, green channel
%
% Usage example:
%   q = assessQuality(imread('data/APTOS/sample.png'));
%   if q.status == "REJECT", return; end
%
% Thresholds (to be tuned by owner):
%   sharpness < 50         -> REJECT
%   50 <= sharpness < 100  -> ENHANCE
%   sharpness >= 100       -> PASS  (subject to brightness bounds)
%
% Dependencies : MATLAB Image Processing Toolbox
% =========================================================================

% TODO: Implement quality assessment.
%   1. Convert I to grayscale, compute Laplacian variance for sharpness.
%   2. Extract green channel; compute brightnessMean and brightnessStd.
%   3. Apply threshold logic to set result.status.
%   4. Return populated result struct.

end
