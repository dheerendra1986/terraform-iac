module "bigquery" {
  source                     = "../.."
  dataset_id                 = "ecd-test-date"
  dataset_name               = "ecd-test-date"
  description                = "some description"
  project_id                 = var.project_id
  location                   = "US"
  delete_contents_on_destroy = var.delete_contents_on_destroy
  tables = [
    {
      table_id           = "bar",
      schema             = file("sample_bq_schema.json"),
      time_partitioning  = null,
      range_partitioning = null,
      expiration_time    = 2524604400000, # 2050/01/01
      clustering         = [],
      labels = {
        env      = "test"
        billable = "true"
        owner    = "dheerendra"
      },
    }
  ]
  dataset_labels = {
    env      = "test"
    billable = "true"
    owner    = "dheerendra"
  }
}
