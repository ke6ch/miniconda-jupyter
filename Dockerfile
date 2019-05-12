FROM continuumio/miniconda3

ENV PATH $PATH:/opt/conda/bin

RUN conda update conda \
  && conda update --all \
  && conda install jupyter numpy matplotlib scipy -y --quiet \
  && conda clean --all

EXPOSE 8888

CMD mkdir -p /opt/notebooks \
  && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='0.0.0.0' --port=8888 --no-browser --allow-root
