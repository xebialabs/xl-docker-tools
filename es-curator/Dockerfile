FROM alpine:3.8.5

RUN apk --no-cache add python py-setuptools py-pip gcc libffi py-cffi python-dev libffi-dev py-openssl musl-dev linux-headers openssl-dev libssl1.0 && \
    pip install --no-cache-dir elasticsearch-curator==5.6.0 && \
    pip install --no-cache-dir boto3==1.9.59 && \
    pip install --no-cache-dir requests-aws4auth==0.9 && \
    pip install --no-cache-dir cryptography==2.1.3 && \
    apk del py-pip gcc python-dev libffi-dev musl-dev linux-headers openssl-dev && \
    sed -i '/import sys/a urllib3.contrib.pyopenssl.inject_into_urllib3()' /usr/bin/curator && \
    sed -i '/import sys/a import urllib3.contrib.pyopenssl' /usr/bin/curator && \
    sed -i '/import sys/a import urllib3' /usr/bin/curator

COPY config /etc/config/

USER nobody:nobody

ENTRYPOINT ["/usr/bin/curator", "--config", "/etc/config/config.yml", "/etc/config/action_file.yml"]
