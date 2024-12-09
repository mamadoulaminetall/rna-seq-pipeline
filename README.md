RNA-Seq Pipeline

Ce projet propose un pipeline pour l’analyse RNA-Seq, basé sur Snakemake, Docker, et des outils bioinformatiques tels que FastQC, STAR, et DESeq2.
🚀 Fonctionnalités principales

    Contrôle de qualité des séquences brutes (FastQC).
    Alignement des séquences sur un génome de référence (STAR).
    Quantification des expressions génétiques (featureCounts).
    Analyse différentielle d’expression (DESeq2).
    Structure modulaire et conteneurisée pour une reproductibilité optimale.

📂 Structure du projet

rna-seq-pipeline/
├── config/              # Fichiers de configuration du pipeline
│   └── config.yaml
├── docker-compose.yml   # Configuration Docker Compose
├── Dockerfile           # Dockerfile pour construire l'environnement
├── envs/                # Environnements Conda pour les étapes spécifiques
│   └── fastqc.yaml
├── rules/               # Fichiers Snakemake pour chaque étape
│   ├── quality_control.smk
│   ├── alignment.smk
│   ├── quantification.smk
│   └── analysis.smk
├── scripts/             # Scripts supplémentaires (R, Python, etc.)
│   └── deseq2_analysis.R
├── Snakefile            # Fichier principal pour orchestrer le pipeline
└── structure/           # Répertoires de sortie organisés

🛠️ Prérequis

    Système d’exploitation : Linux ou macOS recommandé.
    Docker : Installez Docker et Docker Compose.
    Snakemake : Installez Snakemake via conda ou pip.
    Git : Clonez ce dépôt sur votre machine locale.

📥 Installation

    Cloner ce dépôt :

git clone https://github.com/mamadoulaminetall/rna-seq-pipeline.git
cd rna-seq-pipeline

Construire l'image Docker :

docker build -t rna-seq-pipeline .

Lancer Docker Compose :

    docker-compose up

⚙️ Utilisation
Étape 1 : Configurer les chemins

Modifiez le fichier config/config.yaml pour définir les chemins des fichiers d’entrée, les références génomiques et les paramètres.

Exemple :

input_dir: "data/raw"
output_dir: "results"
genome_index: "references/genome_index"

Étape 2 : Exécuter le pipeline

Pour exécuter tout le pipeline :

snakemake --use-conda --cores 4

Pour exécuter une étape spécifique :

snakemake <nom_de_la_règle> --use-conda --cores 4

📊 Étapes du pipeline

    Contrôle de qualité (FastQC)
        Description : Analyse de la qualité des fichiers FASTQ bruts.
        Fichier : rules/quality_control.smk
        Commande :

    snakemake fastqc

Alignement (STAR)

    Description : Alignement des lectures sur le génome de référence.
    Fichier : rules/alignment.smk
    Commande :

    snakemake align

Quantification (featureCounts)

    Description : Comptage des lectures alignées par gène.
    Fichier : rules/quantification.smk
    Commande :

    snakemake quantification

Analyse différentielle (DESeq2)

    Description : Identification des gènes différentiellement exprimés.
    Script : scripts/deseq2_analysis.R
    Commande :

        Rscript scripts/deseq2_analysis.R

📁 Résultats

    FastQC : Rapports de qualité (HTML et ZIP) dans results/quality_control/.
    Alignement : Fichiers BAM alignés dans results/alignment/.
    Quantification : Tables de comptage dans results/quantification/.
    Analyse différentielle : Graphiques et tables dans results/analysis/.

🤝 Contribuer

    Forkez ce dépôt.
    Créez une branche pour vos modifications :

    git checkout -b nouvelle-fonctionnalite

    Envoyez vos modifications et ouvrez une pull request.

📜 Auteurs

Mamadou Lamine Tall
GitHub Profile
📄 Licence

Ce projet est sous licence MIT. Consultez le fichier LICENSE pour plus de détails.
