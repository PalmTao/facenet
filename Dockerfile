FROM  registry.cn-shanghai.aliyuncs.com/ketao/py3cv:latest

ADD src /facenet

ADD data /data

ADD requirements.txt ./

RUN pip3 install -r ./requirements.txt && \
    rm ./requirements.txt 

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Jupyter has issues with being run directly:
#   https://github.com/ipython/ipython/issues/7062
# We just add a little wrapper script.
COPY run_jupyter.sh /

# For CUDA profiling, TensorFlow requires CUPTI.
ENV LD_LIBRARY_PATH /usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH

# TensorBoard
EXPOSE 6006
# IPython
EXPOSE 8888

# Copy sample notebooks.
COPY notebooks /notebooks

WORKDIR "/notebooks"

CMD ["/run_jupyter.sh", "--allow-root"]
