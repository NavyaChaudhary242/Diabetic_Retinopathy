function metrics = evaluateSegmentation(pxdsPred, pxdsTest)
% =========================================================================
% evaluateSegmentation  -  Evaluate segmentation quality against ground truth
% =========================================================================
% Purpose : Compute pixel-level segmentation metrics (Dice, IoU, accuracy,
%           sensitivity, specificity) over a full dataset by comparing
%           predicted pixel label datastores with ground-truth datastores.
%
% Owner   : Member 2  (module2_segmentation/)
%
% Inputs  :
%   pxdsPred  - pixelLabelDatastore of model predictions
%   pxdsTest  - pixelLabelDatastore of ground-truth annotations
%               (must have the same number of images and class list)
%
% Outputs :
%   metrics   - struct with fields (one value per class + weighted mean):
%     .classNames   (cell array of strings)
%     .dice         (double array)   Per-class Dice coefficient
%     .iou          (double array)   Per-class IoU (Jaccard index)
%     .accuracy     (double)         Overall pixel accuracy
%     .sensitivity  (double array)   Per-class sensitivity (recall)
%     .specificity  (double array)   Per-class specificity
%     .meanDice     (double)         Weighted-mean Dice across classes
%     .meanIoU      (double)         Weighted-mean IoU across classes
%
% Usage example:
%   metrics = evaluateSegmentation(pxdsPred, pxdsTest);
%   disp(metrics.meanDice);
%
% Planned approach (owner to implement):
%   1. Use evaluateSemanticSegmentation() from Computer Vision Toolbox.
%   2. Extract per-class and mean metrics.
%   3. Package into returned struct.
%
% Dependencies : MATLAB Computer Vision Toolbox, Deep Learning Toolbox
% =========================================================================

% TODO: Implement segmentation evaluation.

end
