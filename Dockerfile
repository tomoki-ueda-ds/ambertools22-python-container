# ベースをMambaにするだけで劇的に速く、安定します
FROM condaforge/mambaforge:latest

# 必要なOSライブラリ（AmberTools実行用）
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libxext6 \
    libxrender1 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 全パッケージを一括でインストール
# AmberTools, Python, 解析スタックをまとめて解決させるのがコツです
RUN mamba install -y -c conda-forge \
    ambertools=22 \
    python=3.10 \
    numpy scipy pandas \
    matplotlib seaborn \
    mdanalysis mdtraj tqdm ipython \
    && mamba clean -afy

CMD ["/bin/bash"]
