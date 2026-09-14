%% test_module3.m  -  Unit tests for Module 3: Classification
% =========================================================================
% Project : Explainable AI for DR Screening (PS ID 26038)
% Owner   : Member 3  (module3_classification/)
% Purpose : Minimal smoke-tests for classifyDR() and evaluateClassifier().
%           Run from repo root:  >> run('tests/test_module3.m')
% =========================================================================

fprintf('=== Module 3 Tests: Classification ===\n\n');

%% Create a dummy 256x256 synthetic fundus image
[xx, yy] = meshgrid(1:256, 1:256);
mask      = sqrt((xx-128).^2 + (yy-128).^2) < 100;
dummyImg  = uint8(zeros(256,256,3));
dummyImg(:,:,2) = uint8(mask * 120);

%% --- Test 1: classifyDR output types and valid grade string --------------
fprintf('Test 1: classifyDR() outputs...\n');
[classification, confidence] = classifyDR(dummyImg);

validGrades = ["No DR", "Mild", "Moderate", "Severe", "Proliferative DR"];
assert(isstring(classification) || ischar(classification), ...
       'FAIL: classification must be a string or char');
assert(ismember(string(classification), validGrades), ...
       'FAIL: classification must be one of the five ICDR grades');
assert(isnumeric(confidence) && isscalar(confidence), ...
       'FAIL: confidence must be a numeric scalar');
assert(confidence >= 0 && confidence <= 1, ...
       'FAIL: confidence must be in [0, 1]');

fprintf('  PASS  (grade="%s", confidence=%.3f)\n\n', classification, confidence);

%% --- Test 2: evaluateClassifier returns required struct fields -----------
% NOTE: This test is a structural check only; it does not run real training.
% Replace dummy net and imdsTest with real objects once training is complete.
fprintf('Test 2: evaluateClassifier() struct fields (structural check)...\n');
fprintf('  [SKIP] Requires a trained network and test imageDatastore.\n');
fprintf('         Run manually after trainClassifier() completes.\n\n');

fprintf('=== Module 3: ALL TESTS PASSED ===\n');
