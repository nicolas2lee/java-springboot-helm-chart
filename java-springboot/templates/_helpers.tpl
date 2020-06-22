{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "javaspringboot.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "javaspringboot.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "javaspringboot.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "javaspringboot.labels" -}}
helm.sh/chart: {{ include "javaspringboot.chart" . }}
{{ include "javaspringboot.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: backend
app: {{ .Release.Name | trimSuffix "-canary" | trimSuffix "-stable" }}
chart: {{ .Chart.Name }}-{{ .Chart.Version}}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
appcode: {{ .Values.labels.appcode }}
env: {{ .Values.labels.env }}
tier: {{ .Values.labels.tier }}
opscontact: {{ .Values.labels.opscontact }}
component: {{ .Values.labels.component }}
function: {{ .Values.labels.function }}
version: {{ .Values.labels.version }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "javaspringboot.selectorLabels" -}}
app.kubernetes.io/name: {{ include "javaspringboot.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "javaspringboot.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "javaspringboot.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
