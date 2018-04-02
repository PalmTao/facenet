FROM  registry.cn-shanghai.aliyuncs.com/ketao/py3cv:latest

ADD src /facenet

ADD data /data

ADD requirements.txt ./

RUN pip3 install -r ./requirements.txt && \
    rm ./requirements.txt 
