variable "cluster_name" {
  description = "GKE Cluster"
}

variable "project" {
  description = "GCP Project"
}

variable "region" {
  description = "GCP Region"
}

variable product_name {
  description = "Digital Product Name"
}

variable "target_gcp_project" {
  description = "Target GCP Project"
}

variable "target_gcp_region" {
  description = "Target GCP Region"
}

variable "bigquery_role" {
  description = "BigQuery role to bind in Service Account"
  default     = "roles/bigquery.admin"
}

variable "topics" {
  description = "Kafka Topics list to syncronize with BigQuery"
  type        = list(string)
}

variable "bigquey_dataset_name" {
  description = "Name of Bigquery dataset that will be created"
  default     = "kafka"
}

variable "bigquery_dataset_location" {
  description = "Location of Bigquery dataset that will be created"
  default     = "EU"
}

variable "kafka_cluster" {
  description = "Kafka Cluster information"
  type = object({
    cluster_id        = string
    bootstrap_servers = list(string)
    sasl_username     = string
    sasl_password     = string
    sasl_mechanism    = string
  })
}

variable "schema_registry_cluster" {
  description = "Schema Registry Cluster information"
  type = object({
    cluster_id = string
    url        = string
  })
}

variable "confluentcloud_environement_id" {
  description = "Confluent Cloud Environment ID, ex: t5058"
}

variable "kafka_connect_topics_config" {
  description = "Kafka Connect internal topics configuration"

  type = object({
    partitions         = number
    replication_factor = number

    config = map(string)
  })

  default = {
    partitions         = 3
    replication_factor = 3

    config = {
      "retention.ms"    = "604800000" # 7 days
      "cleanup.policy"  = "delete"
      "retention.bytes" = "-1"
    }
  }
}

variable "kafka_connect_dlq_topics_config" {
  description = "Kafka Connect Dead Letter Queue topic configuration"

  type = object({
    partitions         = number
    replication_factor = number

    config = map(string)
  })

  default = {
    partitions         = 3
    replication_factor = 3

    config = {
      "retention.ms"    = "604800000" # 7 days
      "cleanup.policy"  = "delete"
      "retention.bytes" = "-1"
    }
  }
}

variable "kafka_connect_image" {
  description = "Kafka Connect Docker image to deploy"
}

variable "workload_project_role" {
  description = "Project Custom IAM role to bind workload service account"
  default = "basicKafkaConnectWorkloadRole" 
}
