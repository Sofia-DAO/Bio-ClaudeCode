# Predict Phenotype

Apply trained machine learning models to predict phenotypes on new samples for biological age estimation, risk stratification, or intervention response prediction.

## Agent Used

This command leverages the **Data Analyst** agent for model application and prediction.

## Description

Applies previously trained machine learning models to new data generating predictions with confidence intervals. Validates data compatibility with training data, preprocesses features consistently, generates predictions, assesses prediction reliability, and provides interpretable results. Essential for deploying aging biomarkers, risk scores, and diagnostic tools developed through model training.

## Usage

```
/predict-phenotype
```

After invoking the command, provide:
- Trained model (from train-classifier)
- New data for prediction
- Feature mapping information
- Desired output format

## Inputs

**Required:**
- Trained model: Model object from training
- Feature data: Same features as training
- Sample identifiers: Unique IDs for predictions

**Optional:**
- Confidence level: For prediction intervals
- Feature transformations: Preprocessing parameters
- Reference ranges: For contextualization
- Batch information: If batch correction needed

## Process

The command performs:

1. **Data validation**: Checks feature compatibility
2. **Preprocessing**: Applies same transformations as training
3. **Prediction generation**: Applies model to new data
4. **Confidence assessment**: Calculates prediction uncertainty
5. **Quality control**: Flags low-confidence predictions
6. **Result formatting**: Organizes predictions clearly
7. **Interpretation**: Provides context for predictions

## Outputs

**Predictions:**
- Predicted values or class labels
- Prediction probabilities for classification
- Confidence intervals or uncertainty estimates
- Sample-level quality flags

**Feature contributions:**
- SHAP values for each prediction
- Key features driving prediction
- Feature value comparison to training distribution
- Outlier feature detection

**Quality assessment:**
- Prediction confidence scores
- Applicability domain checks
- Comparison to training data distribution
- Warnings for extrapolation

**Summary statistics:**
- Distribution of predictions
- Comparison to reference cohorts
- Subgroup summaries if metadata available
- Outlier predictions flagged

**Visualizations:**
- Prediction distributions
- Feature importance for predictions
- Comparison to training cohort
- Individual prediction explanations

## Interpretation Guidelines

The command provides:
- Predicted outcomes for new samples
- Confidence in each prediction
- Factors driving predictions
- Comparison to reference populations

For aging research specifically:
- Biological age estimates
- Disease risk scores
- Intervention response likelihood
- Healthspan predictions

## Example Use Cases

**Biological age estimation:**
Apply trained aging clock to new samples estimating biological age versus chronological age.

**Clinical risk scoring:**
Predict disease risk for patients enabling personalized screening or prevention strategies.

**Trial enrollment:**
Identify individuals most likely to respond to longevity interventions for clinical trial enrichment.

**Monitoring:**
Track longitudinal changes in predicted biological age or risk to assess intervention effects.

## Integration with Other Commands

Results complement:
- `/train-classifier` provides the models to apply
- `/biomarker-discovery-pipeline` uses predictions for validation
- Predictions inform experimental prioritization
- Longitudinal prediction tracking shows aging trajectories

## Best Practices

**Data quality:**
- Ensure feature compatibility with training
- Apply identical preprocessing
- Check for missing values
- Validate measurement platforms match

**Prediction reliability:**
- Report confidence intervals
- Flag extrapolation warnings
- Consider applicability domain
- Validate on similar populations first

**Result interpretation:**
- Provide context from training data
- Report prediction uncertainty honestly
- Explain key driving features
- Consider clinical implications

**Clinical deployment:**
- Validate performance in target population
- Establish decision thresholds carefully
- Monitor ongoing performance
- Update models as needed

## Technical Notes

Ensures consistent preprocessing between training and prediction. Handles missing features through imputation matching training approach. Provides uncertainty quantification through bootstrap, Bayesian methods, or conformal prediction depending on model type.

For aging predictions, recognizes that models may not generalize across populations, platforms, or time periods. Regular validation and recalibration essential for deployed models.

## Prediction Types

**Point predictions:**
Single value for each sample. Simple but does not convey uncertainty.

**Probabilistic predictions:**
Distribution or probability for classification. Captures uncertainty in predictions.

**Prediction intervals:**
Range containing true value with specified confidence. Quantifies regression uncertainty.

**Class probabilities:**
Probability of each class for classification. Enables threshold adjustment based on costs.

## Confidence Assessment

**Applicability domain:**
Checks whether new samples fall within range of training data. Predictions may be unreliable for out-of-domain samples.

**Prediction intervals:**
Statistical ranges expected to contain true value. Width indicates prediction uncertainty.

**Model ensembles:**
Variance across ensemble members indicates prediction uncertainty.

**Distance to training:**
Samples far from training data in feature space may have less reliable predictions.

## Quality Flags

**High confidence:**
Sample within training distribution, model certain, no extrapolation. Trust prediction.

**Medium confidence:**
Some features outside training range or model uncertain. Interpret with caution.

**Low confidence:**
Significant extrapolation or model very uncertain. Prediction unreliable, recommend additional validation.

## Feature Processing

**Scaling:**
Applies same normalization as training (z-score, min-max, robust scaling).

**Encoding:**
Transforms categorical variables consistently with training.

**Imputation:**
Handles missing values using training-derived parameters.

**Transformation:**
Applies log, sqrt, or other transformations matching training.

## Batch Effects

**Batch correction:**
If training applied batch correction, must apply same correction to new samples.

**Platform differences:**
Models trained on one platform may not generalize to another without recalibration.

**Temporal drift:**
Measurements may shift over time requiring periodic model updates.

## Aging-Specific Applications

**Biological age:**
Predicts biological versus chronological age. Positive delta suggests accelerated aging.

**Healthspan prediction:**
Forecasts functional decline or disease onset enabling preventive interventions.

**Intervention response:**
Predicts who will benefit from specific longevity interventions for personalized medicine.

**Mortality risk:**
Estimates short or long-term mortality risk for risk stratification.

## Longitudinal Monitoring

**Trajectory tracking:**
Repeated predictions over time show aging trajectory or intervention effects.

**Change detection:**
Significant changes in predictions may indicate health transitions requiring attention.

**Intervention evaluation:**
Pre-post predictions assess intervention efficacy at individual level.

**Compliance monitoring:**
Deviation from expected trajectory may indicate non-adherence.

## Limitations

- Predictions only as good as training data and model
- Performance may degrade on different populations
- Cannot predict outcomes outside training range
- Uncertainty estimates approximate, not perfect
- Requires careful validation before clinical use

Regular monitoring and updates essential for deployed prediction models.

## Advanced Features

**Conformal prediction:**
Provides statistically valid prediction intervals with guaranteed coverage.

**Bayesian prediction:**
Incorporates prior knowledge and provides full posterior distributions.

**Active learning:**
Identifies samples where model is most uncertain for prioritized validation.

**Model updating:**
Incorporates new data to improve predictions over time.

**Ensemble averaging:**
Combines predictions from multiple models for improved robustness.

## Clinical Decision Support

**Threshold selection:**
Chooses classification thresholds based on clinical costs of false positives versus false negatives.

**Risk stratification:**
Divides predictions into risk categories for clinical decision making.

**Personalized recommendations:**
Links predictions to intervention recommendations based on predicted phenotype.

**Monitoring protocols:**
Defines appropriate follow-up based on prediction results.

## Model Performance Monitoring

**Calibration drift:**
Tracks whether predictions remain well-calibrated over time.

**Performance metrics:**
Monitors accuracy, AUC, or other metrics on accumulating validation data.

**Feature drift:**
Detects shifts in feature distributions that may degrade performance.

**Update triggers:**
Defines thresholds for when model retraining or recalibration needed.

---

This command enables practical deployment of trained aging models for biological age estimation, risk prediction, and personalized medicine applications while maintaining appropriate caution about prediction reliability.