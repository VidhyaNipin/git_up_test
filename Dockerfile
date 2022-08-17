FROM continuumio/miniconda3:4.8.2


# Create Conda environment from the YAML file
COPY environment.yml .
RUN conda env create -f environment.yml



RUN useradd --shell /bin/bash my_user
USER my_user



WORKDIR /app
COPY . /app



# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["python", "samplefile.py"]
