module "data-streamnig-kafka2bigquery" {
  source  = "app.terraform.io/adeo-data-streaming-platform/dsp-bigquery/dsp"

  product_name = var.product_name
  topics       = var.topics

  cluster_name = var.cluster_name

  project = var.project
  region  = var.region

  target_gcp_project = var.target_gcp_project
  target_gcp_region  = var.target_gcp_region

  bigquery_role             = var.bigquery_role
  bigquey_dataset_name      = var.bigquey_dataset_name
  bigquery_dataset_location = var.bigquery_dataset_location

  kafka_cluster           = var.kafka_cluster
  schema_registry_cluster = var.schema_registry_cluster

  confluentcloud_environement_id = var.confluentcloud_environement_id

  kafka_connect_topics_config     = var.kafka_connect_topics_config
  kafka_connect_dlq_topics_config = var.kafka_connect_dlq_topics_config

  kafka_connect_image = var.kafka_connect_image

  workload_project_role = var.workload_project_role
}