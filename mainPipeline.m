function result = mainPipeline(I)
% =========================================================================
% mainPipeline  -  End-to-end DR screening pipeline for a single image
% =========================================================================
% Purpose : Orchestrate all four modules (Quality -> Segmentation ->
%           Classification -> Explainability) for a single fundus image.
%           Short-circuits to REJECT after Module 1 if quality.status is
%           "REJECT", skipping expensive inference steps.
%           Returns a single struct with all intermediate and final results.
%
% Owner   : Member 4  (integration, mainPipeline.m)
%
% Inputs  :
%   I       - (H x W x 3 uint8)  Raw RGB fundus image
%
% Outputs :
%   result  - struct with fields:
%     .image          (H x W x 3 uint8)  The (possibly enhanced) image used
%     .quality        struct              Output of assessQuality()
%     .segmentation   struct | []        Output of runSegmentation()
%                                        ([] if quality.status == "REJECT")
%     .classification (string) | ""      Output of classifyDR()
%                                        ("" if quality.status == "REJECT")
%     .confidence     (double) | NaN     Softmax confidence
%                                        (NaN if quality.status == "REJECT")
%     .heatmap        (H x W x 3) | []  Grad-CAM overlay
%                                        ([] if quality.status == "REJECT")
%     .status         (string)           "COMPLETE" | "REJECT" | "ERROR"
%
% Usage example:
%   I      = imread('data/APTOS/sample.png');
%   result = mainPipeline(I);
%   if result.status == "COMPLETE"
%       imshow(result.heatmap);
%   end
%
% Pipeline flow:
%   [M1] assessQuality  -> REJECT? -> short-circuit, return result
%                       -> ENHANCE? -> enhanceFundus -> continue
%   [M2] runSegmentation
%   [M3] classifyDR
%   [M4] explainPrediction
%        generateReport
% =========================================================================

% TODO: Implement the end-to-end pipeline.
%
%   Step 1 – Quality Assessment (Module 1)
%   quality = assessQuality(I);
%   result.quality = quality;
%
%   Step 2 – Short-circuit on REJECT
%   if quality.status == "REJECT"
%       result.image          = I;
%       result.segmentation   = [];
%       result.classification = "";
%       result.confidence     = NaN;
%       result.heatmap        = [];
%       result.status         = "REJECT";
%       return;
%   end
%
%   Step 3 – Enhancement if needed (Module 1)
%   if quality.status == "ENHANCE"
%       I = enhanceFundus(I);
%   end
%   result.image = I;
%
%   Step 4 – Segmentation (Module 2)
%   result.segmentation = runSegmentation(I);
%
%   Step 5 – Classification (Module 3)
%   [result.classification, result.confidence] = classifyDR(I);
%
%   Step 6 – Explainability + Report (Module 4)
%   result.heatmap = explainPrediction(I, result.classification);
%   generateReport(I, quality, result.segmentation, ...
%                  result.classification, result.confidence, result.heatmap);
%
%   result.status = "COMPLETE";

end
