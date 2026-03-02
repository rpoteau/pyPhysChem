import os
import sys
import subprocess

def setup_environment(ML=False):
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
            repo_name = "pyPhysChem"
            print("📦 Google Colab setup.")
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


import sys
from IPython.display import IFrame, display
from pathlib import Path

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