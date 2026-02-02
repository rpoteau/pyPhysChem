# setup.py
from setuptools import setup, find_packages

setup(
    name="tools4pyPhysChem",
    version="2026.01.25",
    author="Romuald POTEAU",
    author_email="romuald.poteau@utoulouse.fr",
    description="Analysis and visualization tools for Physical Chemistry",
    packages=find_packages(),
    include_package_data=True,
    package_data={
        "tools4pyPhysChem": ["resources/css/*", "resources/svg/*", "resources/img/*"],
    },
    install_requires=[
        "numpy",
        "pandas",
        "matplotlib",
        "scipy",
        "rdkit",
        "mendeleev",
        "ase",
        "py3Dmol",
        "bokeh",
        "requests",
        "tensorflow",
        "ipywidgets",
        "pyyaml",
        "wordcloud",
        "scikit-learn",
        "sentence-transformers",
        "umap-learn",
        "openpyxl"
    ],
    python_requires='>=3.7',
)