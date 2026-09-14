function imds = loadDataset(dataPath)
% =========================================================================
% loadDataset  -  Load a fundus image dataset from disk
% =========================================================================
% Purpose : Create an imageDatastore pointing at the specified dataset
%           folder.  The datastore is used by every downstream module to
%           iterate over images without loading them all into memory at once.
%
% Owner   : Member 1  (data/, preprocessing/, module1_quality/)
%
% Inputs  :
%   dataPath  - (char | string)  Absolute or relative path to the dataset
%               root folder, e.g.  'data/APTOS'
%
% Outputs :
%   imds      - imageDatastore object with all images found under dataPath.
%               Sub-folder names are used as class labels (imds.Labels).
%
% Usage example:
%   imds = loadDataset('data/APTOS');
%
% Dependencies : MATLAB Image Processing Toolbox (imageDatastore)
% =========================================================================

% TODO: Implement dataset loading.
%   - Validate that dataPath exists; throw a clear error if not.
%   - Use imageDatastore() with 'IncludeSubfolders', true and
%     'LabelSource', 'foldernames'.
%   - Filter extensions: {'.png','.jpg','.jpeg','.tif'}.

end
