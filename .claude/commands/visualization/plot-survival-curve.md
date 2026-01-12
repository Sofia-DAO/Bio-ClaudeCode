# Plot Survival Curve

Generate publication-quality Kaplan-Meier survival curves with rigorous statistical analysis for aging and longevity studies.

## Agent Used

This command leverages the **Data Analyst** agent for survival analysis and visualization.

## Description

Creates comprehensive survival analysis including Kaplan-Meier curve estimation, log-rank tests for group comparisons, hazard ratio calculations, and risk table visualization. Produces publication-ready figures with appropriate statistical annotations and confidence intervals.

## Usage

```
/plot-survival-curve
```

After invoking the command, provide:
- Survival time data (time to event or censoring)
- Event indicator (whether event occurred or was censored)
- Group assignments for comparison
- Optional: Covariates for adjusted analysis

## Inputs

**Required:**
- Time variable: Survival time or age at event/censoring
- Event indicator: Binary variable for event occurrence
- Grouping variable: Categories to compare (treatment, genotype, etc.)

**Optional:**
- Strata variables: Additional grouping factors
- Covariate data: Variables for Cox proportional hazards model
- Time units: Specification of time scale (days, months, years)
- Follow-up information: Median follow-up times per group

## Process

The command performs:

1. **Data validation**: Checks survival data format and completeness
2. **Kaplan-Meier estimation**: Calculates survival probabilities over time
3. **Confidence interval calculation**: Estimates uncertainty bounds
4. **Log-rank test**: Compares survival curves between groups
5. **Hazard ratio estimation**: Quantifies effect sizes with Cox models
6. **Risk table generation**: Shows number at risk at time points
7. **Figure production**: Creates publication-quality visualization

## Outputs

**Survival plot:**
- Kaplan-Meier curves for each group with confidence bands
- Risk table showing numbers at risk over time
- Statistical test results (p-values, hazard ratios)
- Median survival times with confidence intervals
- Censoring marks on curves

**Statistical results:**
- Log-rank test p-value for overall group difference
- Pairwise comparisons if more than two groups
- Hazard ratios with 95% confidence intervals
- Median survival times per group
- Survival probabilities at specific time points

**Quality metrics:**
- Proportion censored per group
- Follow-up time summaries
- Proportional hazards assumption checks

## Interpretation Guidelines

The command provides:
- Visual comparison of survival between groups
- Statistical significance of survival differences
- Effect size quantification through hazard ratios
- Uncertainty estimation via confidence intervals

For aging research specifically:
- Compares lifespan between intervention and control groups
- Evaluates genetic or environmental effects on longevity
- Assesses healthspan through time to functional decline
- Analyzes age at onset for age-related diseases

## Example Use Cases

**Intervention studies:**
Compare survival between dietary restriction and control groups in model organisms.

**Genetic studies:**
Assess lifespan differences between wild-type and long-lived mutants.

**Human cohorts:**
Analyze time to mortality or age-related disease onset across risk groups.

**Healthspan analysis:**
Plot time to functional decline, frailty, or loss of independence.

## Integration with Other Commands

Results complement:
- Cox proportional hazards regression for covariate adjustment
- Competing risks analysis for multiple event types
- Differential expression showing transcriptional correlates of survival differences
- GWAS identifying genetic variants affecting survival

## Best Practices

**Statistical rigor:**
- Report censoring proportions and reasons
- Check proportional hazards assumption
- Include confidence intervals with point estimates
- Use appropriate time scale for biological question

**Visual clarity:**
- Use colorblind-friendly palettes
- Include risk table to show sample sizes
- Mark censoring events clearly
- Provide adequate figure legend

**Biological interpretation:**
- Report both median and maximum survival
- Consider whether survival differences reflect healthspan
- Examine survival at multiple percentiles beyond median
- Validate findings in independent cohorts

## Technical Notes

Implements Kaplan-Meier estimation with Greenwood variance formula for confidence intervals. Applies log-rank test for group comparisons. Calculates hazard ratios using Cox proportional hazards models. Checks proportional hazards assumption using Schoenfeld residuals.

For aging studies, recognizes importance of maximum lifespan alongside median measures. Understands that interventions may extend mean survival through reduced early mortality versus extending maximum lifespan through slowed aging.

## Limitations

- Requires adequate sample size for reliable survival estimation
- Proportional hazards assumption may not hold over entire lifespan
- Censoring patterns can bias survival estimates
- Does not account for time-varying covariates or competing risks

For comprehensive survival analysis, may need extensions including time-dependent covariates, competing risks models, or interval-censored approaches for specific applications.

---

This command enables rigorous survival analysis for aging research while producing publication-quality visualizations meeting statistical and aesthetic standards.