<div align="center">

# 👁️ DR-Screen
### Explainable AI for Diabetic Retinopathy Screening in Rural India

[![SIH 2024](https://img.shields.io/badge/Smart%20India%20Hackathon-2024-orange?style=for-the-badge)](https://www.sih.gov.in/)
[![PS ID](https://img.shields.io/badge/PS%20ID-26038-blue?style=for-the-badge)]()
[![MATLAB](https://img.shields.io/badge/MATLAB-R2023b%2B-red?style=for-the-badge&logo=mathworks)](https://www.mathworks.com/)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)]()

*Automated fundus screening · Grad-CAM explainability · Offline-capable · Rural clinic ready*

</div>

---

## 🔍 The Problem

India has **over 77 million diabetic patients** — the world's second-largest diabetic population. Diabetic Retinopathy (DR) is the leading cause of preventable blindness among working-age adults. Yet:

- Most rural primary health centres have **no ophthalmologist on site**
- Patients travel 50–200 km to reach specialist care, often **too late**
- Even when a fundus camera is available, **no local expertise exists** to interpret the image
- Existing AI tools are black boxes — clinicians cannot trust or explain the decision

**DR-Screen** puts a five-grade AI screener directly in the hands of an ASHA worker or nurse. It tells them *what* it found and *where* on the retina it found it — in a printable report they can hand to the patient for referral.

---

## 🏗️ System Architecture

```
 ┌──────────────────────────────────────────────────────────────────┐
 │                        DR-Screen Pipeline                        │
 └──────────────────────────────────────────────────────────────────┘

   📷 Fundus Camera Input
          │
          ▼
   ┌──────────────┐   sharpness/brightness
   │  Module 1    │   thresholds fail?
   │  Quality     ├─────── REJECT ──────▶  ⛔ Skip + Log
   │  Assessment  │
   └──────┬───────┘
          │ borderline → CLAHE enhance → re-assess
          │ PASS
          ▼
   ┌──────────────┐
   │  Module 2    │   U-Net semantic segmentation
   │  Vessel &    │   · retinal vessel mask
   │  Lesion Seg  │   · lesion mask (MAs, HEs, EXs)
   └──────┬───────┘   · lesion count, Dice, IoU
          │
          ▼
   ┌──────────────┐
   │  Module 3    │   Fine-tuned ResNet-50 / EfficientNet
   │  DR Grading  │   5-class ICDR severity
   │  Classifier  │   + softmax confidence score
   └──────┬───────┘
          │
          ▼
   ┌──────────────┐   Grad-CAM on last conv layer
   │  Module 4    │   jet heatmap blended on original
   │  Grad-CAM &  ├──────────────────────────────────┐
   │  PDF Report  │                                  │
   └──────┬───────┘                                  ▼
          │                              ┌─────────────────────┐
          ▼                              │  SimEvents Model    │
   📄 results/<id>_report.pdf            │  Clinic queue sim   │
      · original + heatmap              │  (throughput study) │
      · vessel / lesion masks           └─────────────────────┘
      · grade, confidence, referral rec
```

---

## 🩺 DR Grading Scale (ICDR)

| Grade | Label | Referral Action |
|-------|-------|----------------|
| 0 | **No DR** | Routine — rescreen in 2 years |
| 1 | **Mild NPDR** | Lifestyle counselling — rescreen in 1 year |
| 2 | **Moderate NPDR** | Refer to ophthalmologist within **4 weeks** |
| 3 | **Severe NPDR** | Refer within **1 week** |
| 4 | **Proliferative DR** | **URGENT** — same-day referral |

---

## 📂 Repository Structure

```
├── preprocessing/
│   └── loadDataset.m           # imageDatastore builder for all supported datasets
│
├── module1_quality/            # Image quality gate
│   ├── assessQuality.m         # Laplacian sharpness + green-channel brightness
│   └── enhanceFundus.m         # CLAHE + Ben Graham normalisation
│
├── module2_segmentation/       # Vessel & lesion segmentation
│   ├── runSegmentation.m       # U-Net inference → vesselMask, lesionMask
│   └── evaluateSegmentation.m  # Dice / IoU over full test datastore
│
├── module3_classification/     # DR severity classification
│   ├── classifyDR.m            # CNN inference → grade + confidence
│   ├── trainClassifier.m       # Transfer learning (ResNet-50 fine-tune)
│   └── evaluateClassifier.m    # Confusion matrix, kappa, AUC
│
├── module4_explainability/     # Clinical explainability
│   ├── explainPrediction.m     # Grad-CAM heatmap generation
│   └── generateReport.m        # PDF report (image + heatmap + metrics)
│
├── simulink/                   # SimEvents clinic throughput model
├── app/                        # MATLAB App Designer screening UI
├── data/                       # Dataset drop-points (contents gitignored)
│   ├── APTOS/  IDRiD/  DRIVE/  STARE/  Messidor/
├── models/                     # Trained .mat weights (gitignored)
├── tests/                      # Per-module smoke tests (no dataset required)
├── results/                    # Generated reports (gitignored)
├── main.m                      # Quick-start driver script
└── mainPipeline.m              # Full end-to-end pipeline function
```

---

## ⚡ Quick Start

```bash
git clone https://github.com/404prateek/Diabetic_Retinopathy.git
cd Diabetic_Retinopathy
```

**In MATLAB:**
```matlab
% 1. Add everything to path
addpath(genpath(pwd));

% 2. Point at your dataset (APTOS shown; use IDRiD, DRIVE, etc. the same way)
%    Folder structure: data/APTOS/0/, data/APTOS/1/, ... data/APTOS/4/
%    (sub-folder name = ICDR grade)

% 3. Run the full pipeline on one image
main

% 4. Smoke-test individual modules (no dataset needed — uses synthetic images)
run('tests/test_module1.m')
run('tests/test_module2.m')
run('tests/test_module3.m')
run('tests/test_module4.m')
```

---

## 🗄️ Supported Datasets

| Dataset | Images | Task | Where to get it |
|---------|--------|------|----------------|
| **APTOS 2019** | 3,662 | 5-class DR grading | [Kaggle](https://www.kaggle.com/c/aptos2019-blindness-detection) |
| **IDRiD** | 516 | Indian fundus + pixel lesion masks | [IEEE DataPort](https://ieee-dataport.org/open-access/indian-diabetic-retinopathy-image-dataset-idrid) |
| **DRIVE** | 40 | Vessel segmentation ground truth | [Grand Challenge](https://drive.grand-challenge.org/) |
| **STARE** | 397 | Vessel + pathology | [Clemson](http://cecas.clemson.edu/~ahoover/stare/) |
| **Messidor** | 1,200 | DR grading (French hospitals) | [ADCIS](https://www.adcis.net/en/third-party/messidor/) |

> Download files → place under `data/<DatasetName>/` → they are gitignored automatically.

---

## 🛠️ Required MATLAB Toolboxes

| Toolbox | Used in |
|---------|---------|
| Image Processing Toolbox | All modules |
| Deep Learning Toolbox | Classification, Grad-CAM |
| Computer Vision Toolbox | Segmentation evaluation |
| Statistics & Machine Learning Toolbox | Classifier metrics (kappa, AUC) |
| SimEvents | Clinic queue simulation |
| MATLAB Report Generator | PDF report output |

Minimum MATLAB version: **R2023b**

---

## 👥 Team Meraki — Ownership Map

| Member | Files Owned | Deliverable |
|--------|-------------|-------------|
| Member 1 | `data/`, `preprocessing/`, `module1_quality/` | Quality gate + enhancement |
| Member 2 | `module2_segmentation/` | U-Net vessel & lesion masks |
| Member 3 | `module3_classification/` | Trained classifier + evaluation |
| Member 4 | `module4_explainability/`, `app/`, `simulink/`, `mainPipeline.m` | Grad-CAM, PDF report, App UI, integration |

**Branching convention:** `feature/<name>-<module>` → PR requires review from Member 4.  
**Rule:** Never change a function signature — other modules depend on the contract.

---

## 🎯 Target Metrics

| Module | Metric | Target |
|--------|--------|--------|
| Quality gate | Sensitivity for unusable images | > 90 % |
| Vessel segmentation | Dice coefficient (DRIVE) | > 0.82 |
| Lesion segmentation | Dice coefficient (IDRiD) | > 0.70 |
| DR classifier | Quadratic-weighted kappa (APTOS) | > 0.85 |
| DR classifier | Sensitivity for Severe + PDR | > 0.95 |
| End-to-end | Inference time per image (CPU) | < 10 s |

---

## ⚠️ Disclaimer

> This system is a **decision-support research prototype**, not a certified medical device.
> It must not be used as a standalone diagnostic tool.
> All outputs must be reviewed by a qualified ophthalmologist before clinical action is taken.

---

<div align="center">
<i>Built for Smart India Hackathon 2024 · PS ID 26038 · Team Meraki</i>
</div>
