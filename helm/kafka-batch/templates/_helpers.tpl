# templates/_helpers.tpl
{{- define "kafka-batch.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "kafka-batch.fullname" -}}
{{- $name := include "kafka-batch.name" . -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{- define "kafka-batch.labels" -}}
app.kubernetes.io/name:       {{ include "kafka-batch.name" . }}
helm.sh/chart:                {{ printf "%s-%s" .Chart.Name .Chart.Version }}
app.kubernetes.io/instance:   {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
