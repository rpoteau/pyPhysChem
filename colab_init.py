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
            ml_dict = {"keras": "keras", "tensorflow": "tensorflow", "sklearn": "scikit-learn", "shap": "shap"}
            to_install = []
            for imp_name, ins_name in ml_dict.items():
                try:
                    __import__(imp_name)
                except ImportError:
                    to_install.append(ins_name)
            
            if to_install:
                print(f"🧠 Installing ML packages ({', '.join(to_install)})... ", end="", flush=True)
                subprocess.check_call([sys.executable, "-m", "pip", "install", "-q"] + to_install)
                print("Done! ✅")
            else:
                print("✅ ML packages already available.")

        # 3. Colab specific
        # On utilise une méthode plus sûre pour détecter Colab sans get_ipython() qui peut bugger
        if 'google.colab' in sys.modules:
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
        return True # On confirme que tout s'est bien passé

    except Exception as e:
        print(f"\n❌ Setup Error: {e}")
        return False