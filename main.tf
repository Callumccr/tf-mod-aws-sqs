resource "aws_sqs_queue" "default" {
  count                       = var.enabled && length(var.queue_name) > 0 ? length(var.queue_name) : 0
  name                        = "${format("%s%s%s", module.label.id, var.delimiter, element(var.queue_name, count.index))}"
  visibility_timeout_seconds  = var.visibility_timeout_seconds
  message_retention_seconds   = var.message_retention_seconds
  max_message_size            = var.max_message_size
  delay_seconds               = var.delay_seconds
  receive_wait_time_seconds   = var.receive_wait_time_seconds
  policy                      = length(list(var.policy)) > 0 ? var.policy : null
  redrive_policy              = var.redrive_policy
  fifo_queue                  = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication

  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds

  tags = module.label.tags
}

resource "aws_sqs_queue_policy" "default" {
  count     = var.enabled && length(var.queue_name) > 0 ? length(var.queue_name) : 0
  queue_url = element(aws_sqs_queue.default.*.id, count.index)
  policy    = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "sqspolicy",
  "Statement": [
    {
      "Sid": "First",
      "Effect": "Allow",
      "Principal": "${var.sqs_policy_principal}",
      "Action": "sqs:*",
      "Resource": "${element(aws_sqs_queue.default.*.arn, count.index)}"
    }
  ]
}
POLICY
}
