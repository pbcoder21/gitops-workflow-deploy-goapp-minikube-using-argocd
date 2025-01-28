
{{- define "chart.labels" -}}
app: {{ .Chart.Name }}
chart: {{ .Chart.Name }}-{{ .Chart.Version }}
release: {{ .Release.Name }}
heritage: {{ .Release.Service }}
{{- end -}}

{{- define "chart.fullname" -}}
{{ .Release.Name }}-{{ .Chart.Name }}
{{- end -}}
