function enhanced = enhanceFundus(I)
% =========================================================================
% enhanceFundus  -  Pre-process a borderline-quality fundus image
% =========================================================================
% Purpose : Apply enhancement steps (CLAHE, green-channel normalisation,
%           background subtraction) to images flagged "ENHANCE" by
%           assessQuality(). Output should pass assessQuality() as "PASS".
%
% Owner   : Member 1  (data/, preprocessing/, module1_quality/)
%
% Inputs  :
%   I        - (H x W x 3 uint8)  RGB fundus image (raw / degraded)
%
% Outputs :
%   enhanced - (H x W x 3 uint8)  Enhanced RGB image, same size as I
%
% Usage example:
%   q = assessQuality(I);
%   if q.status == "ENHANCE"
%       I = enhanceFundus(I);
%   end
%
% Planned steps (owner to implement):
%   1. Subtract background illumination via morphological opening.
%   2. Apply CLAHE (adapthisteq) on L* channel of L*a*b* space.
%   3. Normalise green channel to zero mean / unit std (Ben Graham method).
%   4. Resize to standard canvas (e.g. 512x512) with circular mask padding.
%
% Dependencies : MATLAB Image Processing Toolbox
% =========================================================================

% TODO: Implement fundus image enhancement pipeline.

end
