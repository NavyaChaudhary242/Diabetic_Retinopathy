function segmentation = runSegmentation(I)
% =========================================================================
% runSegmentation  -  Segment retinal vessels and DR lesions in a fundus image
% =========================================================================
% Purpose : Apply a trained deep segmentation model (e.g. U-Net) to detect
%           retinal blood vessels and diabetic retinopathy lesions such as
%           microaneurysms, haemorrhages, and hard exudates.
%
% Owner   : Member 2  (module2_segmentation/)
%
% Inputs  :
%   I             - (H x W x 3 uint8)  Enhanced RGB fundus image.
%                   Should have already passed assessQuality() with "PASS".
%
% Outputs :
%   segmentation  - struct with fields:
%     .vesselMask   (H x W logical)  Binary mask of detected blood vessels
%     .lesionMask   (H x W logical)  Binary mask of all detected lesions
%     .lesionCount  (int)            Total number of distinct lesion regions
%     .dice         (double)         Dice coefficient vs ground-truth
%                                    (NaN when ground-truth unavailable)
%     .iou          (double)         Intersection-over-Union (Jaccard index)
%                                    (NaN when ground-truth unavailable)
%
% Usage example:
%   seg = runSegmentation(enhancedImage);
%   imshow(seg.vesselMask);
%
% Planned approach (owner to implement):
%   1. Load pre-trained U-Net from models/segmentation/.
%   2. Resize I to network input size; normalise.
%   3. Run semantic segmentation (semanticseg).
%   4. Separate vessel and lesion class masks.
%   5. Count lesion connected components (bwconncomp).
%   6. Set dice/iou to NaN if no ground-truth provided.
%
% Dependencies : MATLAB Deep Learning Toolbox, Image Processing Toolbox
% =========================================================================

% TODO: Implement retinal segmentation pipeline.

end
