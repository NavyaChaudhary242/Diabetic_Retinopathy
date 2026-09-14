# Explainable AI for Diabetic Retinopathy Screening in Rural India

**Smart India Hackathon 2024  |  PS ID: 26038**

> Develop an explainable AI system that screens fundus photographs for
> diabetic retinopathy severity, generating Grad-CAM visual explanations
> and structured reports to support clinical decision-making in resource-
> limited rural Indian settings.

---

> ⚠️ **Disclaimer**: This is a decision-support prototype, not a diagnostic
> device. All AI outputs must be reviewed by a qualified ophthalmologist or
> licensed medical professional before any clinical action is taken.

---

## Pipeline Overview

```
 Raw Fundus Image
       │
       ▼
┌─────────────────┐   REJECT   ┌──────────────┐
│  Module 1       │──────────▶│   STOP /     │
│  Quality Check  │            │   Log & Skip │
│  assessQuality()│            └──────────────┘
│  enhanceFundus()│
└────────┬────────┘
         │ PASS / ENHANCE (→ enhance → PASS)
         ▼
┌─────────────────┐
│  Module 2       │
│  Segmentation   │
│  runSegmentation│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Module 3       │
│  Classification │
│  classifyDR()   │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Module 4       │
│  Explainability │
│  explainPredic- │
│  tion()         │
│  generateReport │
└────────┬────────┘
         │
         ▼
┌─────────────────┐        ┌────────────────────────────┐
│  PDF Report     │        │  SimEvents Clinic Model     │
│  results/*.pdf  │        │  simulink/DRClinic.slx      │
└─────────────────┘        │  Queue → AI Server →        │
                           │  Referral Handling          │
                           └────────────────────────────┘
```

---

## Folder Structure

```
DR_SIH/
├── data/                      # Dataset root (contents gitignored)
│   ├── APTOS/                 # Kaggle APTOS 2019 Blindness Detection
│   ├── IDRiD/                 # Indian Diabetic Retinopathy Image Dataset
│   ├── DRIVE/                 # Digital Retinal Images for Vessel Extraction
│   ├── STARE/                 # STructured Analysis of the REtina
│   └── Messidor/              # MESSIDOR / MESSIDOR-2
├── models/                    # Saved trained network weights (gitignored)
│   ├── quality/
│   ├── segmentation/
│   └── classification/
├── preprocessing/
│   └── loadDataset.m          # Create imageDatastore from a dataset folder
├── module1_quality/           # Owner: Member 1
│   ├── assessQuality.m
│   └── enhanceFundus.m
├── module2_segmentation/      # Owner: Member 2
│   ├── runSegmentation.m
│   └── evaluateSegmentation.m
├── module3_classification/    # Owner: Member 3
│   ├── classifyDR.m
│   ├── trainClassifier.m
│   └── evaluateClassifier.m
├── module4_explainability/    # Owner: Member 4
│   ├── explainPrediction.m
│   └── generateReport.m
├── simulink/                  # Owner: Member 4
│   └── README.md
├── app/                       # Owner: Member 4
│   └── README.md
├── results/                   # Generated reports & images (gitignored)
├── tests/                     # Smoke tests for each module
│   ├── test_module1.m
│   ├── test_module2.m
│   ├── test_module3.m
│   └── test_module4.m
├── main.m                     # Top-level driver script
├── mainPipeline.m             # End-to-end pipeline function
├── README.md
└── .gitignore
```

---

## Team & Ownership

| Member | Responsible For |
|--------|----------------|
| **Member 1** | `data/`, `preprocessing/loadDataset.m`, `module1_quality/` (assessQuality, enhanceFundus) |
| **Member 2** | `module2_segmentation/` (runSegmentation, evaluateSegmentation) |
| **Member 3** | `module3_classification/` (classifyDR, trainClassifier, evaluateClassifier) |
| **Member 4** | `module4_explainability/`, `simulink/`, `app/`, `mainPipeline.m`, integration |

Each member owns their module end-to-end: implementation, unit test
(`tests/test_moduleN.m`), and trained model saved under `models/<module>/`.

---

## Datasets

| Dataset | Focus | License |
|---------|-------|---------|
| [APTOS 2019](https://www.kaggle.com/c/aptos2019-blindness-detection) | 5-class DR grading | Kaggle competition |
| [IDRiD](https://ieee-dataport.org/open-access/indian-diabetic-retinopathy-image-dataset-idrid) | Indian fundus, pixel-level lesions | CC BY 4.0 |
| [DRIVE](https://drive.grand-challenge.org/) | Vessel segmentation | Research use |
| [STARE](http://cecas.clemson.edu/~ahoover/stare/) | Vessel & pathology | Research use |
| [Messidor](https://www.adcis.net/en/third-party/messidor/) | DR grading | Research use |

---

## Getting Started

### 1. Clone the repository
```bash
git clone <repo-url>
cd DR_SIH
```

### 2. Add your dataset files
Place your downloaded images inside the appropriate sub-folder.
Example for APTOS:
```
data/APTOS/
    0/   ← "No DR" images
    1/   ← "Mild" images
    2/   ← "Moderate" images
    3/   ← "Severe" images
    4/   ← "Proliferative DR" images
```
> Dataset files are **gitignored** — never commit raw images.

### 3. Open MATLAB and add repo to path
```matlab
addpath(genpath('C:/path/to/DR_SIH'));
```

### 4. Run the driver script
```matlab
main
```

### 5. Run module smoke tests
```matlab
run('tests/test_module1.m')
run('tests/test_module2.m')
run('tests/test_module3.m')
run('tests/test_module4.m')
```

---

## MATLAB Toolbox Requirements

| Toolbox | Required By |
|---------|------------|
| Image Processing Toolbox | All modules |
| Deep Learning Toolbox | Modules 3, 4 |
| Computer Vision Toolbox | Module 2 (evaluateSegmentation) |
| Statistics and Machine Learning Toolbox | Module 3 (evaluateClassifier) |
| SimEvents | simulink/ model |
| MATLAB Report Generator | generateReport() |

---

## Contributing

1. Create a branch named `feature/<your-name>-<module>`.
2. Implement only the functions you own (see Team & Ownership above).
3. Make sure `tests/test_moduleN.m` passes before raising a PR.
4. Do **not** modify function signatures — other modules depend on them.
5. PR merges require review from Member 4 (integration owner).

---

*PS ID 26038  |  Smart India Hackathon  |  Team Meraki*
