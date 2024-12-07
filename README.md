RNA-Seq Pipeline

Ce projet fournit un pipeline pour l'analyse RNA-Seq, basé sur Snakemake, Docker, et des outils bioinformatiques comme FastQC, STAR, et DESeq2.
Fonctionnalités principales

    Contrôle de qualité des séquences brutes (FastQC).
    Alignement des séquences sur un génome de référence (STAR).
    Quantification des expressions génétiques (featureCounts).
    Analyse différentielle d'expression (DESeq2).
    Structure modulaire et conteneurisée pour une reproductibilité optimale.

Structure du projet

rna-seq-pipeline/
├── config/              # Fichiers de configuration du pipeline
│   └── config.yaml
├── docker-compose.yml   # Configuration Docker Compose pour orchestrer les conteneurs
├── Dockerfile           # Dockerfile pour construire l'environnement
├── envs/                # Environnements conda pour les étapes spécifiques
│   └── fastqc.yaml
├── rules/               # Fichiers Snakemake pour les différentes étapes du pipeline
│   ├── quality_control.smk
│   ├── alignment.smk
│   ├── quantification.smk
│   └── analysis.smk
├── scripts/             # Scripts supplémentaires (R, Python, etc.)
│   └── deseq2_analysis.R
├── Snakefile            # Fichier principal pour orchestrer le pipeline
└── structure/           # Répertoires de sortie organisés

Prérequis

    Système d'exploitation : Linux ou macOS recommandé.
    Docker : Installez Docker et Docker Compose.
    Snakemake : Installez Snakemake via conda ou pip.
    Git : Clonez ce dépôt sur votre machine locale.

Installation
1. Cloner ce dépôt

git clone https://github.com/mamadoulaminetall/rna-seq-pipeline.git
cd rna-seq-pipeline

2. Construire l'image Docker

docker build -t rna-seq-pipeline .

3. Lancer Docker Compose

docker-compose up

Utilisation
Étape 1 : Configurer les chemins

Modifiez config/config.yaml pour indiquer les chemins des fichiers d'entrée, les références génomiques et les paramètres d'analyse.

Exemple :

input_dir: "data/raw"
output_dir: "results"
genome_index: "references/genome_index"

Étape 2 : Exécuter le pipeline

Pour lancer tout le pipeline, exécutez :

snakemake --use-conda --cores 4

Pour exécuter une étape spécifique :

snakemake <nom_de_la_règle> --use-conda --cores 4

Étapes du pipeline
1. Contrôle de qualité (FastQC)

    Description : Analyse de la qualité des fichiers FASTQ bruts.
    Fichier : rules/quality_control.smk
    Commandes :

    snakemake fastqc

2. Alignement (STAR)

    Description : Alignement des lectures sur le génome de référence.
    Fichier : rules/alignment.smk
    Commandes :

    snakemake align

3. Quantification (featureCounts)

    Description : Comptage des lectures alignées par gène.
    Fichier : rules/quantification.smk
    Commandes :

    snakemake quantification

4. Analyse différentielle (DESeq2)

    Description : Identification des gènes différentiellement exprimés.
    Fichier : scripts/deseq2_analysis.R
    Commandes :

    Rscript scripts/deseq2_analysis.R

Résultats

    FastQC : Rapports de qualité au format HTML et ZIP dans results/quality_control/.
    Alignement : Fichiers BAM alignés dans results/alignment/.
    Quantification : Tables de comptage dans results/quantification/.
    Analyse différentielle : Graphiques et tables de résultats dans results/analysis/.

Contribuer

    Forkez ce dépôt.
    Créez une branche pour vos modifications :

    git checkout -b nouvelle-fonctionnalite

    Poussez vos modifications et ouvrez une pull request.

Auteurs

Mamadou Lamine Tall
GitHub Profile
Licence

Ce projet est sous licence MIT.

