# Train Classifier

Train machine learning models for phenotype prediction, classification, and biomarker development in aging research.

## Agent Used

This command leverages the **Data Analyst** agent for machine learning model training.

## Description

Trains supervised machine learning models to predict phenotypes from omics or clinical data. Implements feature selection, model training with cross-validation, hyperparameter optimization, performance evaluation, and model interpretation. Essential for developing predictive biomarkers of aging, healthspan, intervention response, or disease risk.

## Usage

```
/train-classifier
```

After invoking the command, provide:
- Feature data (omics measurements, clinical variables)
- Outcome labels (age, disease status, response)
- Model type preferences
- Validation strategy

## Inputs

**Required:**
- Feature matrix: Predictors (samples x features)
- Outcome variable: Binary, multi-class, or continuous
- Sample identifiers: Unique sample names

**Optional:**
- Feature annotations: Gene names, pathways, data types
- Sample metadata: Batches, covariates
- External validation set: Independent test data
- Class weights: For imbalanced outcomes

## Process

The command performs:

1. **Data preprocessing**: Handles missing values, outliers
2. **Feature selection**: Identifies informative features
3. **Model selection**: Chooses appropriate algorithm
4. **Hyperparameter tuning**: Optimizes model parameters
5. **Cross-validation**: Assesses generalization
6. **Model training**: Fits final model on full training data
7. **Performance evaluation**: Calculates accuracy metrics
8. **Model interpretation**: Identifies important features

## Outputs

**Trained model:**
- Model object with fitted parameters
- Feature importance scores
- Selected features list
- Training parameters and metadata

**Performance metrics:**
- Accuracy, precision, recall, F1-score
- ROC curves and AUC
- Calibration plots
- Confusion matrices
- Cross-validation performance

**Feature importance:**
- Top predictive features
- Feature importance plots
- SHAP values for interpretation
- Contribution to predictions

**Validation results:**
- Internal CV performance
- External validation if available
- Subgroup performance
- Error analysis

**Model diagnostics:**
- Learning curves
- Residual plots
- Prediction distributions
- Reliability analysis

## Interpretation Guidelines

The command provides:
- Predictive models for outcomes
- Most informative features
- Model performance and reliability
- Applicability domain

For aging research specifically:
- Biological age predictors
- Healthspan classifiers
- Intervention response models
- Disease risk scores

## Example Use Cases

**Biological age clocks:**
Train models predicting chronological age from omics data to assess biological aging.

**Frailty prediction:**
Develop classifiers identifying high-risk individuals for frailty or functional decline.

**Intervention response:**
Build models predicting who will benefit from longevity interventions.

**Disease risk:**
Create risk scores for age-related diseases from molecular biomarkers.

## Integration with Other Commands

Results complement:
- `/biomarker-discovery-pipeline` provides systematic workflow
- `/predict-phenotype` applies trained models
- Feature selection uses results from differential analysis
- Model features from any omics command

## Best Practices

**Feature engineering:**
- Transform features appropriately
- Create meaningful derived features
- Handle collinearity
- Consider domain knowledge

**Model selection:**
- Try multiple algorithms
- Balance complexity and interpretability
- Consider sample size
- Match algorithm to problem

**Validation rigor:**
- Use nested cross-validation
- Report multiple metrics
- Test on independent data
- Assess calibration not just discrimination

**Interpretation:**
- Identify key predictive features
- Validate biological plausibility
- Consider mechanistic relationships
- Document limitations clearly

## Technical Notes

Implements scikit-learn compatible workflows with proper train-test splitting, cross-validation, and hyperparameter tuning. Handles imbalanced classes through resampling or weighted loss functions. Provides model interpretation through SHAP, permutation importance, or built-in feature importance.

For aging prediction, recognizes that chronological age is strong confounder requiring careful handling. Biological age models should predict outcomes independent of chronological age or mortality/healthspan rather than just age itself.

## Model Types

**Linear models:**
Logistic regression, elastic net. Interpretable, fast, work well with high-dimensional data. May miss non-linear relationships.

**Tree-based:**
Random forest, gradient boosting (XGBoost, LightGBM). Handle non-linearity and interactions. Less interpretable but often high performance.

**Support vector machines:**
Effective in high dimensions with kernel methods. Good for smaller sample sizes. Less interpretable.

**Neural networks:**
Deep learning for very large datasets or image data. Highest potential performance but requires substantial data. Black-box models.

## Feature Selection

**Filter methods:**
Rank features by correlation or statistical tests. Fast but ignores feature interactions.

**Wrapper methods:**
Select features based on model performance. Computationally expensive but considers interactions.

**Embedded methods:**
Feature selection during model training (L1 regularization). Efficient and accounts for interactions.

**Domain knowledge:**
Incorporates biological knowledge to select mechanistically relevant features.

## Hyperparameter Optimization

**Grid search:**
Exhaustive search over parameter grid. Thorough but computationally expensive.

**Random search:**
Samples parameter space randomly. More efficient for high-dimensional spaces.

**Bayesian optimization:**
Guided search using Gaussian processes. Most efficient for expensive objective functions.

**Nested cross-validation:**
Optimizes hyperparameters within CV to avoid overfitting and provide unbiased performance estimates.

## Performance Metrics

**Classification:**
- Accuracy: Overall correctness
- Precision: Positive predictive value
- Recall: Sensitivity
- F1-score: Harmonic mean of precision and recall
- AUC-ROC: Discriminative ability across thresholds
- Calibration: Agreement between predicted probabilities and observed rates

**Regression:**
- RMSE: Root mean squared error
- MAE: Mean absolute error
- R²: Variance explained
- Correlation: Predicted versus observed

## Model Interpretation

**Feature importance:**
Global measure of feature contribution averaged across all predictions.

**SHAP values:**
Local explanations showing feature contributions to individual predictions. Satisfies desirable theoretical properties.

**Partial dependence:**
Shows marginal effect of features on predictions holding others constant.

**Individual predictions:**
Explains why specific samples received particular predictions.

## Validation Strategies

**Cross-validation:**
K-fold or stratified splitting for internal validation. Provides unbiased performance estimate on training data.

**Hold-out validation:**
Reserves portion of data for final testing. Simpler but less efficient use of data.

**External validation:**
Tests on completely independent dataset. Gold standard for assessing generalization.

**Temporal validation:**
Tests on data from later time period. Critical for longitudinal aging studies.

## Imbalanced Classes

**Resampling:**
Oversample minority or undersample majority class to balance training data.

**Class weights:**
Penalize misclassification of minority class more heavily during training.

**Alternative metrics:**
Use precision-recall curves instead of ROC for severe imbalance.

**Threshold adjustment:**
Choose classification threshold based on cost-benefit rather than default 0.5.

## Aging-Specific Considerations

**Chronological age:**
Strong predictor that may dominate models. Consider regressing out or using age-adjusted outcomes.

**Heterogeneous aging:**
Individual variation in aging rates means models should capture heterogeneity not just mean trends.

**Longitudinal data:**
Repeated measures require appropriate handling to avoid overfitting on individuals.

**Survivor bias:**
Elderly cohorts exclude early deaths potentially biasing models.

## Limitations

- Requires adequate sample size for reliable training
- Performance may degrade on data from different populations
- Correlation does not prove causation
- Black-box models lack mechanistic insight
- Overfitting risk with high-dimensional features

External validation essential before clinical application. Model performance should be assessed in intended use population.

## Advanced Features

**Ensemble models:**
Combines multiple models to improve robustness and performance.

**Multi-task learning:**
Jointly trains models for related tasks sharing information.

**Transfer learning:**
Leverages models trained on related tasks or species.

**Uncertainty quantification:**
Provides confidence intervals or prediction intervals for predictions.

**Fairness assessment:**
Evaluates whether models perform equitably across demographic groups.

---

This command enables development of predictive models for aging research while maintaining statistical rigor and providing interpretable, validated results for clinical translation.