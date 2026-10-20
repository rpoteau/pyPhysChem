import os
import sys
import subprocess
from IPython.display import IFrame, HTML, display
from pathlib import Path


import requests

def setup_environment(ML=False, clone_repo=True):
    try:
        # 1. pyphyschemtools
        try:
            import pyphyschemtools
            print("✅ pyphyschemtools is already installed.")
        except ImportError:
            print("📦 Installing pyphyschemtools... ", end="", flush=True)
            subprocess.check_call([sys.executable, "-m", "pip", "install", "-q", "pyphyschemtools"])
            print("Done! ✅")

        # 2. Machine Learning
        if ML:
            ml_dict = {"tensorflow": "tensorflow",
                       "keras": "keras",
                       "sklearn": "scikit-learn",
                       "pandas": "pandas",
                       "seaborn": "seaborn",
                       "shap": "shap",
                      }
            to_install = []
            for imp_name, ins_name in ml_dict.items():
                try:
                    __import__(imp_name)
                except ImportError:
                    to_install.append(ins_name)
            print(f"{to_install=}")
            if to_install:
                print(f"🧠 Installing ML Packages ({', '.join(to_install)})... ", end="", flush=True)
                subprocess.check_call([sys.executable, "-m", "pip", "install", "-q"] + to_install)
                print("Done! ✅")
            else:
                print("✅ ML packages already available.")

        # 3. Colab specific
        if 'google.colab' in sys.modules:
            print("📦 Google Colab setup.")
            if clone_repo:
                repo_name = "pyPhysChem"
                if os.path.basename(os.getcwd()) != repo_name:
                    if not os.path.exists(repo_name):
                        print(f"☁️ Fetching {repo_name} repository... ", end="", flush=True)
                        subprocess.check_call(["git", "clone", "--depth", "1", f"https://github.com/rpoteau/{repo_name}.git"])
                        print("Done! ✅")
                    os.chdir(repo_name)
                if os.getcwd() not in sys.path:
                    sys.path.append(os.getcwd())

        print("🚀 Environment is ready.")
        return True

    except Exception as e:
        print(f"\n❌ Setup Error: {e}")
        return False



def display_pdf(filename, folder="DS4B-Slides", width=1000, height=800):
    """
    Displays a PDF file in a Jupyter environment. 
    Automatically detects if running in Google Colab or locally.
    
    Parameters:
    - filename (str): Name of the PDF file (e.g., 'intro.pdf').
    - folder (str): The subfolder containing the PDF.
    - width/height (int): Dimensions of the IFrame.
    """
    
    # 1. Define paths
    local_path = Path() / folder / filename
    repo_url = f"https://raw.githubusercontent.com/rpoteau/pyPhysChem/main/{folder}/{filename}"
    
    # 2. Environment Detection
    if 'google.colab' in sys.modules:
        # Google Colab requires a web-accessible URL and usually a viewer to bypass security
        # We use the Google Docs Viewer to render the GitHub Raw PDF reliably
        print(f"🌐 Colab detected: Fetching {filename} from GitHub...")
        google_viewer_url = f"https://docs.google.com/viewer?url={repo_url}&embedded=true"
        display(IFrame(google_viewer_url, width=width, height=height))
        
    else:
        # Local environments can render physical files directly
        if local_path.exists():
            print(f"💻 Local detected: Rendering {local_path}")
            display(IFrame(local_path, width=width, height=height))
        else:
            # Fallback to GitHub URL if local file is missing but internet is available
            print(f"⚠️ Local file not found. Trying remote GitHub version...")
            display(IFrame(repo_url, width=width, height=height))

# Example usage in your notebook:
# display_pdf("intro.pdf")

def display_image(filename, folder="MiscImages", width=1000, center=True, caption=None):
    """
    Displays an image, locally or on Colab.
    - Local: relative path to the file.
    - Colab: raw GitHub URL (no filesystem access for markdown rendering).

    Parameters:
    - filename (str): image file name (e.g. 'logo_univ_reunion_DigitalChem.png')
    - folder (str): subfolder containing the image
    - width (int): width in pixels
    - center (bool): center the image
    - caption (str, optional): caption displayed below the image
    """
    local_path = Path() / folder / filename
    repo_url = f"https://raw.githubusercontent.com/rpoteau/pyPhysChem/main/{folder}/{filename}"

    if 'google.colab' in sys.modules:
        src = repo_url
    else:
        src = str(local_path) if local_path.exists() else repo_url

    style = "text-align:center" if center else ""

    if caption:
        html = (
            f'<figure style="{style}">'
            f'<img src="{src}" width="{width}">'
            f'<figcaption style="font-style:italic; margin-top:4px;">{caption}</figcaption>'
            f'</figure>'
        )
    else:
        html = f'<div style="{style}"><img src="{src}" width="{width}"></div>'

    display(HTML(html))

# Example usage:
# display_image("logo_univ_reunion_DigitalChem.png", width=1000)
# display_image("logo_univ_reunion_DigitalChem.png", width=1000,
#                caption="Fig. 1 — Logo de l'université de la Réunion")

def get_data(file: str, repo: str = "pyPhysChem", branch: str = "main",
             source: str = "auto", force: bool = False) -> Path:
    """
    Retrieves a data file, from (in order of priority):
    - a local copy, if it already exists (unless force=True)
    - an upload prompt (Colab only), if source="upload"
    - GitHub, otherwise (source="auto" or "github")

    Args:
        file (str): path of the file, relative to the repo root,
                    e.g. "ML-data/Titration/Titration_KMnO4.xlsx"
                    or "Molecules-data/anisole.mol"
        repo (str): GitHub repo name (default: "pyPhysChem")
        branch (str): branch name (default: "main")
        source (str): "auto" (local then GitHub), "github" (force GitHub),
                      or "upload" (prompt the student to upload the file,
                      Colab only — raises an error elsewhere)
        force (bool): ignore any existing local copy and re-fetch/re-upload

    Returns:
        Path: local path to the file
    """
    local_path = Path(file)

    if local_path.exists() and not force:
        return local_path

    if source == "upload":
        if 'google.colab' in sys.modules:
            from google.colab import files
            print(f"📤 Please upload the file: {file}")
            uploaded = files.upload()
            if not uploaded:
                raise FileNotFoundError("No file uploaded.")
            uploaded_name = next(iter(uploaded))
            local_path.parent.mkdir(parents=True, exist_ok=True)
            local_path.write_bytes(uploaded[uploaded_name])
            return local_path
        else:
            raise RuntimeError(
                "source='upload' is only available on Google Colab. "
                "Run this locally by placing the file at "
                f"'{local_path}', or call get_data(..., source='auto') instead."
            )

    url = f"https://raw.githubusercontent.com/rpoteau/{repo}/{branch}/{file}"
    local_path.parent.mkdir(parents=True, exist_ok=True)

    print(f"☁️ Fetching {file}... ", end="", flush=True)
    r = requests.get(url, timeout=10)
    r.raise_for_status()
    local_path.write_bytes(r.content)
    print("Done! ✅")

    return local_path