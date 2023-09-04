FROM mammdoo/k8s-toolkit:0.4.0

RUN helm repo add grafana https://grafana.github.io/helm-charts && \
    helm repo add elastic https://helm.elastic.co && \
    helm repo add bitnami https://charts.bitnami.com/bitnami && \
    helm repo add opensearch https://opensearch-project.github.io/helm-charts && \
    helm repo add aliyun https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts && \
    helm repo add prometheus https://prometheus-community.github.io/helm-charts && \
    helm repo list

RUN helm repo update

WORKDIR /app/charts

RUN helm pull grafana/loki --version 5.8.8 && \
    helm pull elastic/elasticsearch && \
    helm pull elastic/logstash && \
    helm pull opensearch/opensearch && \
    helm pull opensearch/opensearch-dashboards &&\
    helm pull prometheus/kube-prometheus-stack && \
    helm repo list

WORKDIR /app
ADD . /app

ENTRYPOINT ["/bin/sh"]
