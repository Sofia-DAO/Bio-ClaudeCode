#!/usr/bin/env python3
"""
Example Data Bridge: DESeq2 Results to Pathway Enrichment Input

Transforms differential expression results with custom gene identifiers
into pathway enrichment format with standard gene symbols.

Usage:
    python3 deseq2_to_pathway.py input/deg_results.csv input/gene_mapping.csv output/pathway_input.csv

Requirements:
    - pandas
"""

import pandas as pd
import sys

def validate_input(deg_df, mapping_df):
    """Validate input dataframes have required columns"""
    
    required_deg_cols = ['gene_symbol', 'log2fc', 'p_value', 'p_adjusted', 'regulation']
    required_mapping_cols = ['gene_id', 'gene_symbol']
    
    missing_deg = set(required_deg_cols) - set(deg_df.columns)
    missing_mapping = set(required_mapping_cols) - set(mapping_df.columns)
    
    if missing_deg:
        raise ValueError(f"DEG file missing columns: {missing_deg}")
    if missing_mapping:
        raise ValueError(f"Mapping file missing columns: {missing_mapping}")
    
    return True

def transform_data(deg_df, mapping_df):
    """Apply gene ID transformation"""
    
    # Merge DEG data with mapping
    transformed_df = deg_df.merge(
        mapping_df[['gene_id', 'gene_symbol']], 
        left_on='gene_symbol', 
        right_on='gene_id',
        how='inner'
    )
    
    # Keep only necessary columns and rename
    transformed_df = transformed_df[['gene_symbol_y', 'log2fc', 'p_value', 'p_adjusted', 'regulation']]
    transformed_df.columns = ['gene_symbol', 'log2fc', 'p_value', 'p_adjusted', 'regulation']
    
    return transformed_df

def calculate_statistics(deg_df, transformed_df):
    """Calculate transformation statistics"""
    
    stats = {
        'input_genes': len(deg_df),
        'output_genes': len(transformed_df),
        'coverage': len(transformed_df) / len(deg_df) * 100,
        'up_regulated': sum(transformed_df['regulation'] == 'UP'),
        'down_regulated': sum(transformed_df['regulation'] == 'DOWN'),
        'lost_genes': len(deg_df) - len(transformed_df)
    }
    
    return stats

def main():
    if len(sys.argv) != 4:
        print("Usage: python3 deseq2_to_pathway.py <deg_file> <mapping_file> <output_file>")
        sys.exit(1)
    
    deg_file = sys.argv[1]
    mapping_file = sys.argv[2]
    output_file = sys.argv[3]
    
    print("=" * 70)
    print("DATA BRIDGE: DESeq2 to Pathway Enrichment")
    print("=" * 70)
    
    # Load data
    print("\nLoading input files...")
    deg_df = pd.read_csv(deg_file)
    mapping_df = pd.read_csv(mapping_file)
    print(f"Loaded {len(deg_df)} DEG genes")
    print(f"Loaded {len(mapping_df)} gene mappings")
    
    # Validate
    print("\nValidating input data...")
    validate_input(deg_df, mapping_df)
    print("Validation passed")
    
    # Transform
    print("\nApplying transformation...")
    transformed_df = transform_data(deg_df, mapping_df)
    
    # Calculate statistics
    stats = calculate_statistics(deg_df, transformed_df)
    
    # Save output
    print("\nSaving transformed data...")
    transformed_df.to_csv(output_file, index=False)
    print(f"Saved to: {output_file}")
    
    # Report
    print("\n" + "=" * 70)
    print("TRANSFORMATION COMPLETE")
    print("=" * 70)
    print(f"\nInput genes: {stats['input_genes']}")
    print(f"Output genes: {stats['output_genes']}")
    print(f"Coverage: {stats['coverage']:.1f}%")
    print(f"UP-regulated: {stats['up_regulated']}")
    print(f"DOWN-regulated: {stats['down_regulated']}")
    print(f"Lost genes: {stats['lost_genes']}")
    
    if stats['coverage'] < 80:
        print("\nWARNING: Coverage below 80% - check gene mapping completeness")
    
    return 0

if __name__ == "__main__":
    sys.exit(main())
